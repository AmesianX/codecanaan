package codecanaan

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

/**
 * 課程服務
 */
class CourseService {

    def springSecurityService

    /**
     * 從範本建立新課程
     */
    def createCourseFromTemplate(Course course = null) {
        
        //未傳入課程就先建立一個
        if (!course) {
            course = new Course()
        }

        course.name = "course-${Course.count()+1}"
        course.title = "填寫課程標題名稱"
        course.description = """請撰寫此課程的介紹（以下格式僅供參考）。

## 課程子標題 ##

請編寫一段文字內容介紹此課程。

* 說明教學目標
* 訂定教學大綱
* 介紹此課程的特色
""" 
    }

    /**
     * 從範本建立新單元
     */
    def createLessonFromTemplate(Lesson lesson = null) {

        //未建立單元就先建立一個
        if (!lesson) {
            lesson = new Lesson()
        }
        
        //套用預設值
        def seq = Lesson.countByCourse(lesson.course)

        lesson.priority = seq
        lesson.name = "lesson-${seq+1}"
        lesson.title = "填寫單元標題"
        lesson.description = """請撰寫此單元的介紹（以下格式僅供參考）。

## 單元子標題 ##

請編寫一段文字內容介紹此單元。

* 說明教學目標
* 訂定教學大綱
* 介紹此單元的特色
"""
    }

    /**
     * 從範本建立內容
     */
    def createContentFromTemplate(Content content = null) {
        
        //如果未傳入內容物件就先產生一個
        if (!content) {
            content = new Content()
        }

        //計算流水號
        def seq = Content.countByLesson(content.lesson)

        content.priority    = seq
        content.alias       = "content-${seq+1}"

        // 預設值
        if (!content.type) {
            content.type = ContentType.TUTORIAL
        }
        if (!content.quizType) {
            content.quizType = QuizType.SINGLE_CHOICE
        }
        if (!content.sourceType) {
            content.sourceType = SourceType.JAVA
        }

        def sc = Course.findByName('system')
        def tl = Lesson.findByCourseAndName(sc, 'template')

        def _t = new Content()

        // 從系統範本讀取內容
        if (content.type == ContentType.TUTORIAL) {
            _t = Content.findByLessonAndType(tl, ContentType.TUTORIAL)
        }
        else if (content.type == ContentType.SLIDE) {
            _t = Content.findByLessonAndType(tl, ContentType.SLIDE)
        }
        else if (content.type == ContentType.QUIZ) {
            _t = Content.findByLessonAndTypeAndQuizType(tl, ContentType.QUIZ, content.quizType)
        }
        else if (content.type == ContentType.CODE) {
            _t = Content.findByLessonAndTypeAndSourceType(tl, ContentType.CODE, content.sourceType)
        }
        
        content.title       = _t.title
        content.subtitle    = _t.subtitle
        content.description = _t.description

        if (content.type == ContentType.QUIZ) {
            content.quizOption  = _t.quizOption
            content.answer      = _t.answer
        }

        if (content.type == ContentType.CODE) {
            content.sourceCode  = _t.sourceCode
            content.sourcePath  = _t.sourcePath
            content.partialCode = _t.partialCode
            content.output      = _t.output
        }
    }

    /**
     * 檢查使用者是否有作者（編輯）權限
     */
    def isAuthor(Course course, User user) {
        
        // 課程和使用者不存在就跳過檢查
    	if (!course || !user) {
    	    return false
        }

        // 使用者是管理員就給予權限
        // 先檢查服務函式是否存在避免 Null 錯誤
        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
            return true
        }

        def link = UserCourse.get(user, course)
        
        (link && link.regType == RegType.AUTHOR)
    }
    
    /**
     * 取得某個單元下所有練習的統計
     */
    def getLessonStats(Lesson lesson, User user) {
        def stats = [:]
        
        stats.empty = 0 //未練習
        stats.ok = 0 //已完成
        stats.error = 0 //練習中

        if (lesson && user) {
            lesson.contents?.each {
                content->
                      
                def record = Record.findByUserAndContent(user, content)
                if (record) {
                    if (record.passed) {
                        stats.ok ++
                    }
                    else {
                        stats.error ++
                    }
                }
                else {
                    stats.empty ++
                }
            }
        }
        else {
            stats.empty = lesson.contents?.size()
        }
        
        return stats
    }

    /**
     * 取得單元下每題的練習記錄
     */
    def getLessonRecords(Lesson lesson, User user) {
        def result = [:]

        lesson.contents.each {
            content->

            result[content] = Record.findByContentAndUser(content, user)
        }

        return result
    }

    /**
     * 從 PLWeb 資料庫匯入課程資料
     * 
     * @param cid 課程代碼
     * @param lang 語言代碼（java, c, scm）
     */
    def importFromPlweb(Course course, String cid, String lang) {
        log.info "正在從 PLWeb (course_id = ${cid}) 匯入資料至 ${course.title}"

        def sql = groovy.sql.Sql.newInstance('jdbc:mysql://oradb2.plweb.org/plweb?useUnicode=true&characterEncoding=UTF8&zeroDateTimeBehavior=convertToNull', 'sta', 'stastasta', 'com.mysql.jdbc.Driver')

        try {
            sql.eachRow("select TEXT_XML from COURSE_FILE where COURSE_ID=? and VISIBLED='y' order by SEQNUM", [cid]) {
                row1 ->

                log.info "處理 XML 資料（${row1.TEXT_XML?.size()} bytes）"

                def xml = new XmlParser().parseText(row1.TEXT_XML)

                def title = xml.title[0].value()[0]

                log.info "單元：${title}"

                def tasks = xml.task

                log.info "包含 ${tasks.size()} 項內容"

                def lesson = new Lesson(
                    course: course
                )

                createLessonFromTemplate(lesson)

                lesson.title = title

                lesson.save()

                tasks.each {
                    task ->
                    def task_title = task.title[0].text()

                    log.info "匯入內容：${task_title}"

                    def ExName = tasks.property.find {it.key.text()=='ExName'}.value.text()

                    def file_main = "${ExName}.${lang}" //主程式碼
                    def file_part = "${ExName}.part" //部分程式碼
                    def file_cond = "${ExName}.cond" //標準輸出
                    def file_html = "${ExName}.html" //說明

                    def file_main_e = xml.file.find {it.path.text()==file_main}?.content?.text()
                    def file_part_e = xml.file.find {it.path.text()==file_part}?.content?.text()
                    def file_cond_e = xml.file.find {it.path.text()==file_cond}?.content?.text()
                    def file_html_e = xml.file.find {it.path.text()==file_html}?.content?.text()

                    def file_main_c = new String(file_main_e?.bytes.decodeBase64())
                    def file_part_c = file_part_e?new String(file_part_e.bytes.decodeBase64()):''
                    def file_cond_c = new String(file_cond_e?.bytes.decodeBase64(), "MS950")
                    def file_html_c = new String(file_html_e?.bytes.decodeBase64())

                    int body_s = file_html_c.indexOf('<body>') + 6
                    int body_e = file_html_c.indexOf('</body>')

                    if (body_s >= 0 && body_e >= 0) {
                        file_html_c = file_html_c.substring(body_s, body_e)
                    }

                    file_cond_c = "${file_cond_c}".replace('請按任意鍵繼續 . . .', '').trim()
                   
                    def sourceType = SourceType.JAVA

                    if (lang=='java') {
                        sourceType = SourceType.JAVA
                    }
                    else if (lang=='c') {
                        sourceType = SourceType.C
                    }
                    else if (lang=='scm') {
                        sourceType = SourceType.SCHEME
                    }

                    def content = new Content(
                        lesson: lesson,
                        title: task_title,
                        description: file_html_c,
                        type: ContentType.CODE,
                        sourcePath: "${ExName}.${lang}",
                        sourceType: sourceType,
                        sourceCode: file_main_c,
                        partialCode: file_part_c,
                        output: file_cond_c
                    )

                    if (content.save(flush: true)) {
                        log.info "${content.title} 儲存成功"
                    }
                }
            }
        }
        catch (e) {
            log.error e.message
        }

        sql.close()


    }
}
