import codecanaan.*

class BootStrap {

    def init = { servletContext ->
        //基本權限
        new Role(authority: 'ROLE_USER').save(failOnError: true, flush: true)
        new Role(authority: 'ROLE_FACEBOOK').save(failOnError: true, flush: true)

        environments {
            development {                
                def content1 = new Content(
                    type: ContentType.TUTORIAL,
                    title: '講義內容範例',
                    description: "### this is contents\n\ndescriptions",
                    answer: 'YES'
                ).save(failOnError: true, flush: true)

                def content2 = new Content(
                    type: ContentType.CODE,
                    title: '實作題範例',
                    description: "### this is contents 2\n\ndescriptions",
                    sourceCode: "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n    }\n}\n",
                    sourceType: SourceType.JAVA,
                    sourcePath: 'Main.java',
                    partialCode: "public class Main {\n    public static void main(String[] args) {\n    }\n}\n",
                    answer: "Hello World\n"
                ).save(failOnError: true, flush: true)

                def lesson = new Lesson(name: 'lesson-1', title: '基本認識', description: 'lesson-1 desc')
                lesson
                    .addToContents(content1)
                    .addToContents(content2)
                    .save(failOnError: true, flush: true)

                def course = new Course(name: 'course-1', title: 'TQC+ Java 物件導向程式語言', description: 'course-1 desc')
                course
                    .addToLessons(lesson)
                    .save(failOnError: true, flush: true)
            }
        }
    }
    def destroy = {
    }
}
