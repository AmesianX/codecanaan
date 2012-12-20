package codecanaan

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.web.mapping.LinkGenerator

@Secured(['ROLE_ADMIN'])
class AdminController {

    LinkGenerator grailsLinkGenerator

    def index() {
    	
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

    	flash.message = message(code: 'default.created.message', args: [message(code: 'user.label'), user.id])
        redirect action: 'userAdd'
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

        params.max = Math.min(max ?: 10, 100)

        [coupons: Coupon.list(params), couponCount: Coupon.count()]
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

        if(params.generate) {
            def course = Course.get(params.course?.id)

            def schedule = Schedule.get(params.schedule?.id)

            def couponList = []

            int size = params.int('size')

            def prefix = params.prefix

            def history = []

            int ok = 0

            for (def i=0; i<size; i++) {
                
                def code

                //避免重複
                while (history.contains(code = gencode())) {
                    //none
                }

                def serialCode = "${prefix}-${code}"

                def coupon = new Coupon(
                    course: course,
                    schedule: schedule,
                    serialCode: serialCode,
                    organization: params.organization,
                    memo: params.memo
                )

                if (coupon.save(flush: true)) {
                    ok++
                }
            }

            flash.message = "共產生 ${ok} 筆序號"

            redirect action: 'couponList'
        }

        []
    }

    private gencode() {
        def random = new Random()
        def md5code = "${new Date().time}${random.nextInt(10000)}".encodeAsMD5()
        def code = new StringBuffer()
        (1..5).each { i->
            code << md5code[i]
        }
        return code
    }
}
