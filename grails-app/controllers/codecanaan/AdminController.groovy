package codecanaan

import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.web.mapping.LinkGenerator

@Secured(['ROLE_ADMIN'])
class AdminController {

    LinkGenerator grailsLinkGenerator

    def index() {
    	
    }

    def courseTemplate() {
        def sc = Course.findByName('system')
        def tl = Lesson.findByCourseAndName(sc, 'template')

        if (!tl) {
            response.sendError 404
            return
        }

        redirect controller: 'lesson', action: 'show', id: tl.id
    }

    def userList(Integer max) {
        def statistics = [:]

        def users = []
        def userCount = 0

        params.max = Math.min(max ?: 10, 100)

        if (params.keyword) {
            def query = "from User as u where u.username like :keyword or u.fullName like :keyword or u.email like :keyword"
            users = User.findAll(query, [keyword: "%${params.keyword}%"])
        }
        else {
            users = User.list(params)
            userCount = User.count()
        }

        Role.list().each {
            role->
            statistics[role.authority] = UserRole.countByRole(role)
        }

    	[
            users: users,
            userCount: userCount,
            offset: params.offset?params.offset.toLong():0,
            statistics: statistics
        ]
    }

    def userEdit(Long id) {
        [
            user: User.get(id),
            roles: Role.list()
        ]
    }

    def userEditSave(Long id) {

        if (!params.password) {
            params.remove('password')
        }

        def roles = params.list('roles')

        params.remove('roles')

        def user = User.get(id)

        user.properties = params

        // if(!user)

        //create UserRole link
        roles.each {
            authority->

            def role = Role.findByAuthority(authority)

            if (role) {
                def link = UserRole.findByUserAndRole(user, role)

                if (!link) {
                    UserRole.create(user, role)
                }
            }
        }
        UserRole.findAllByUser(user).each {
            link->
            if (!roles.contains(link.role.authority)) {
                link.delete(flush: true)
            }
        }

        if (!user.save(flush: true)) {
            render(view: 'userEdit', model: [user: user])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label'), "${user.fullName}(${user.username})"])

        redirect action: 'userList'
    }

    def userAdd() {
    	def user = new User()

    	[user: user]
    }

    def userAddSave() {
    	def user = new User(params)

    	if (!user.save(flush: true)) {
            render(view: 'userAdd', model: [user: user])
            return
        }

    	flash.message = message(code: 'default.created.message', args: [message(code: 'user.label'), user.username])
        flash.messageType = 'success'

        redirect action: 'userList'
    }

    /**
     * 刪除使用者（危險！）
     */
    def userDelete(Long id) {
        def user = User.get(id)

        if (user) {

            UserRole.findAllByUser(user).each {
                link ->
                link.delete(flush: true)
            }

            FacebookUser.findAllByUser(user).each {
                link ->
                link.delete(flush: true)
            }

            user.delete(flush: true)
        }

        redirect action: 'userList'
    }

    /**
     *
     */
    def memoryUsage() {
        [beans: java.lang.management.ManagementFactory.memoryPoolMXBeans]
    }

    /**
     * 序號管理
     */
    def couponList(Integer max) {

        if (params.delete) {
            int ok = 0
            params.list('selected').each {
                id->

                def coupon = Coupon.get(id)
                if (coupon) {
                    coupon.delete(flush: true)
                    ok++
                }
            }
            flash.message = "已刪除 ${ok} 筆序號"
            redirect action: 'couponList'
        }


        //使用 Session 記錄分頁狀態
        if (!session[controllerName]) {
            session[controllerName] = [:]
        }

        params.prefix = session[controllerName].prefix = params.prefix ?: session[controllerName].prefix
        params.offset = session[controllerName].offset = params.int('offset') >= 0 ? params.int('offset') : session[controllerName].offset ?: 0
        params.max = session[controllerName].max = Math.min((params.int('max') ?: session[controllerName].max) ?: 10, 100)

        def couponCount //計算總數量
        def coupons     //查詢結果

        if (params.prefix) {
            def c = Coupon.createCriteria()

            couponCount = c.count {
                like "serialCode", "${params.prefix}%"
            }

            coupons = Coupon.withCriteria {
                like "serialCode", "${params.prefix}%"

                firstResult params.offset
                maxResults params.max

                order "dateCreated", "asc"
            }
        }
        else {
            couponCount = Coupon.count()
            coupons = Coupon.list(params)
        }


        [
            coupons: coupons,
            couponCount: couponCount
        ]
    }

    /**
     * 序號編輯
     */
    def couponEdit(Integer id) {
        [coupon: Coupon.get(id)]
    }

    /**
     * 序號資料更新
     */
    def couponUpdate(Integer id) {
        def coupon = Coupon.get(id)

        coupon.properties = params

        coupon.save(flush: true)

        redirect action: 'couponList'
    }

    /**
     * 序號產生
     */
    def couponCreate() {
        []
    }

    /**
     * 執行序號產生處理
     */
    def couponCreateAction() {
        //課程
        def course = Course.get(params.course?.id)

        //學習進度
        def schedule = Schedule.get(params.schedule?.id)

        //取得有效天數（整數）
        int validDays = params.int('validDays')

        //產生資料筆數
        int size = params.int('size')

        //前置代碼
        def prefix = params.prefix

        //先存一份到樣板（Coupon Template）
        CouponTemplate.create(
            prefix,
            params.organization,
            validDays,
            course
        )

        def history = []

        def coupons = []

        int ok = 0

        for (def i=0; i<size; i++) {
            
            def code

            //產生序號
            def serialCode = "${prefix}${gencode()}"
            while (history.contains(serialCode) || Coupon.countBySerialCode(serialCode)>0) {
                //避免重複
                serialCode = "${prefix}${gencode()}"
            }

            def coupon = new Coupon(
                course: course,
                schedule: schedule,
                serialCode: serialCode,
                organization: params.organization,
                validDays: validDays,
                memo: params.memo
            )

            if (coupon.save(flush: true)) {
                ok++
                coupons << coupon
            }
        }

        flash.message = "共產生 ${ok} 筆序號"
        render(view: 'couponResult', model: [coupons: coupons])
    }

    private gencode() {
        def random = new Random()
        def md5code = "${new Date().time}${random.nextInt(10000)}".encodeAsMD5()
        def code = new StringBuffer()
        (1..5).each { i->
            code << md5code[i]
        }
        return "${code}".toUpperCase()
    }
}
