import codecanaan.*

class CourseBootStrap {

    def init = { servletContext ->

        //建立：系統層級課程
        def sc = Course.findByName('system')
        if (!sc) {
            sc = new Course(
                name: 'system',
                title: 'Content Management System',
                description: '內容管理系統'
            )
            if (!sc.save(flush: true)) {
                sc.errors.each {
                    log.error it
                }
            }
        }

        //建立：課程範本
        def tl = Lesson.findByCourseAndName(sc, 'template')
        if (!tl) {
            tl = new Lesson(
                name: 'template',
                title: 'Course Templates',
                description: '課程範本內容',
                course: sc
            )
            if (!tl.save(flush: true)) {
                tl.errors.each {
                    log.error it
                }
            }
        }

        //建立：講義範本
        def c1 = Content.findByLessonAndType(tl, ContentType.TUTORIAL)
        if (!c1) {
            c1 = new Content(
                type: ContentType.TUTORIAL,
                title: '講義',
                description: '講義內容範本',
                level: 1,
                lesson: tl
            )
            if (!c1.save(flush: true)) {
                c1.errors.each {
                    log.error it
                }
            }
        }

        //建立：簡報範本
        def c2 = Content.findByLessonAndType(tl, ContentType.SLIDE)
        if (!c2) {
            c2 = new Content(
                type: ContentType.SLIDE,
                title: '簡報',
                description: '簡報內容範本',
                level: 1,
                lesson: tl
            )
            if (!c2.save(flush: true)) {
                c2.errors.each {
                    log.error it
                }
            }
        }

        //建立：測驗題（簡答）範本
        def c3_1 = Content.findByLessonAndTypeAndQuizType(tl, ContentType.QUIZ, QuizType.SHORT_ANSWER)
        if (!c3_1) {
            c3_1 = new Content(
                type: ContentType.QUIZ,
                title: '測驗題（簡答）', 
                description: '請回答 print "abc" 的執行結果？',
                level: 2,
                quizType: QuizType.SHORT_ANSWER,
                quizOption: '',
                answer: 'abc',
                lesson: tl
            )
            if (!c3_1.save(flush: true)) {
                c3_1.errors.each {
                    log.error it
                }
            }
        }


        //建立：測驗題（重構函式）
        def _create_quiz = {
            qtype, props ->
            
            def _new_quiz = Content.findByLessonAndTypeAndQuizType(tl, ContentType.QUIZ, qtype)
            if (!_new_quiz) {
                _new_quiz = new Content(props)
                if (!_new_quiz.save(flush: true)) {
                    _new_quiz.errors.each {
                        log.error it
                    }
                }
            }
        }

        //建立：測驗題（單選）範本
        _create_quiz(QuizType.SINGLE_CHOICE, [
            type: ContentType.QUIZ,
            title: '測驗題（單選）', 
            description: '請問 print "b" 的執行結果？',
            level: 2,
            quizType: QuizType.SINGLE_CHOICE,
            quizOption: 'a\nb\nc',
            answer: 'b',
            lesson: tl
        ])
        
        //建立：測驗題（多選）範本
        def c3_3 = Content.findByLessonAndTypeAndQuizType(tl, ContentType.QUIZ, QuizType.MULTIPLE_CHOICE)
        if (!c3_3) {
            c3_3 = new Content(
                type: ContentType.QUIZ,
                title: '測驗題（多選）', 
                description: '請問 Array("b", "c") 陣列包含哪些字串？',
                level: 2,
                quizType: QuizType.MULTIPLE_CHOICE,
                quizOption: 'a\nb\nc',
                answer: 'b\nc',
                lesson: tl
            )
            if (!c3_3.save(flush: true)) {
                c3_3.errors.each {
                    log.error it
                }
            }
        }
        
        def c3_4 = Content.findByLessonAndTypeAndQuizType(tl, ContentType.QUIZ, QuizType.TRUE_FALSE)
        if (!c3_4) {
            c3_4 = new Content(
                type: ContentType.QUIZ,
                title: '測驗題（是非）', 
                description: '試問在 C 語言程式中，「i = i + 1;」是否與「i++;」執行結果相同？',
                level: 2,
                quizType: QuizType.TRUE_FALSE,
                quizOption: '',
                answer: 'True',
                lesson: tl
            )
            if (!c3_4.save(flush: true)) {
                c3_4.errors.each {
                    log.error it
                }
            }
        }

        def c4_1 = Content.findByLessonAndTypeAndSourceType(tl, ContentType.CODE, SourceType.JAVA)
        if (!c4_1) {
            c4_1 = new Content(
                type: ContentType.CODE,
                title: '實作題 Java',
                description: '程式執行結果為「Hello World」',
                level: 3,
                sourceType: SourceType.JAVA,
                sourceCode: "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n    }\n}\n",
                sourcePath: "Main.java",
                partialCode: "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"__________\");\n    }\n}\n",
                output: "Hello World",
                lesson: tl
            )
            if (!c4_1.save(flush: true)) {
                c4_1.errors.each {
                    log.error it
                }
            }
        }
    
        def c4_2 = Content.findByLessonAndTypeAndSourceType(tl, ContentType.CODE, SourceType.C)
        if (!c4_2) {
            c4_2 = new Content(
                type: ContentType.CODE,
                title: '實作題 C',
                description: '程式執行結果為「Hello World」',
                level: 3,
                sourceType: SourceType.C,
                sourceCode: "#include <stdio.h>\n\nint main(void) {\n    printf(\"Hello World\");\n    return 0;\n}\n",
                sourcePath: "main.c",
                partialCode: "#include <stdio.h>\n\nint main(void) {\n    printf(\"__________\");\n    return 0;\n}\n",
                output: "Hello World",
                lesson: tl
            )
            if (!c4_2.save(flush: true)) {
                c4_2.errors.each {
                    log.error it
                }
            }
        }
        
        def c4_3 = Content.findByLessonAndTypeAndSourceType(tl, ContentType.CODE, SourceType.CPP)
        if (!c4_3) {
            c4_3 = new Content(
                type: ContentType.CODE,
                title: '實作題 C++',
                description: '程式執行結果為「Hello World」',
                level: 3,
                sourceType: SourceType.CPP,
                sourceCode: "#include <iostream.h>\n\nmain() {\n    cout << \"Hello World!\" << endl;\n    return 0;\n}\n",
                sourcePath: "main.cpp",
                partialCode: "#include <iostream.h>\n\nmain() {\n    cout << \"__________\" << endl;\n    return 0;\n}\n",
                output: "Hello World",
                lesson: tl
            )
            if (!c4_3.save(flush: true)) {
                c4_3.errors.each {
                    log.error it
                }
            }
        }

        def c4_4 = Content.findByLessonAndTypeAndSourceType(tl, ContentType.CODE, SourceType.SCHEME)
        if (!c4_4) {
            c4_4 = new Content(
                type: ContentType.CODE,
                title: '實作題 Scheme',
                description: '程式執行結果為「Hello World」',
                level: 3,
                sourceType: SourceType.SCHEME,
                sourceCode: "(display \"Hello World\")(newline)",
                sourcePath: "main.scm",
                partialCode: "(display \"__________\")(newline)",
                output: "Hello World",
                lesson: tl
            )
            if (!c4_4.save(flush: true)) {
                c4_4.errors.each {
                    log.error it
                }
            }
        }

        def c4_5 = Content.findByLessonAndTypeAndSourceType(tl, ContentType.CODE, SourceType.HTML)
        if (!c4_5) {
            c4_5 = new Content(
                type: ContentType.CODE,
                title: '實作題 HTML',
                description: '請參考網頁顯示結果',
                level: 3,
                sourceType: SourceType.HTML,
                sourceCode: "<html>\n<head>\n<title>title</title>\n</head>\n<body>\n</body>\n</html>",
                sourcePath: "index.html",
                partialCode: "<html>\n<head>\n</head>\n<body>\n</body>\n</html>",
                output: "",
                lesson: tl
            )
            if (!c4_5.save(flush: true)) {
                c4_5.errors.each {
                    log.error it
                }
            }
        }
    }

    def destroy = {
    }
}
