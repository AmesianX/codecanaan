package codecanaan

/**
 * 課程服務
 */
class CourseService {

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
        content.title       = "填寫內容標題"
        content.description = """請撰寫教學內容（以下格式僅供參考）。

### 內容子標題 ###

* 項目1
* 項目2
* 項目3
"""

        //實作題
        if (content.type == ContentType.CODE) {
            if (!content.sourceType || content.sourceType == SourceType.JAVA) {
                content.sourceType = SourceType.JAVA
                content.sourceCode = "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n    }\n}\n"
                content.sourcePath = "Main.java"
                content.partialCode = "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"__________\");\n    }\n}\n"
                content.output = "Hello World"
            }
            else if (content.sourceType == SourceType.C) {
                content.sourceCode = "#include <stdio.h>\n\nint main(void) {\n    printf(\"Hello World\");\n    return 0;\n}\n"
                content.sourcePath = "main.c"
                content.partialCode = "#include <stdio.h>\n\nint main(void) {\n    printf(\"__________\");\n    return 0;\n}\n"
                content.output = "Hello World"
            }
            else if (content.sourceType == SourceType.CPP) {
                content.sourceCode = "#include <iostream.h>\n\nmain() {\n    cout << \"Hello World!\" << endl;\n    return 0;\n}\n"
                content.sourcePath = "main.cpp"
                content.partialCode = "#include <iostream.h>\n\nmain() {\n    cout << \"__________\" << endl;\n    return 0;\n}\n"
                content.output = "Hello World"
            }
            else if (content.sourceType == SourceType.SCHEME) {
                content.sourceCode = "(display \"Hello World\")(newline)"
                content.sourcePath = "main.scm"
                content.partialCode = "(display \"__________\")(newline)"
                content.output = "Hello World"
            }
        }
    }

    /**
     * 檢查使用者是否有作者（編輯）權限
     */
    def isAuthor(Course course, User user) {
        
        //課程和使用者不存在就跳過檢查
    	if (!course || !user) return false
        
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
