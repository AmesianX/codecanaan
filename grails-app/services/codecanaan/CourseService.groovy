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
        if (SpringSecurityUtils?.hasProperty('ifAllGranted') && SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
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
}
