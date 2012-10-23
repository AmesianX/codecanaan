import codecanaan.*

class BootStrap {

    def init = { servletContext ->
        //基本權限

        environments {
            development {
                def role1 = new Role(authority: 'ROLE_USER').save(failOnError: true, flush: true)
                def role2 = new Role(authority: 'ROLE_FACEBOOK').save(failOnError: true, flush: true)

                def user1 = new User(username: 'admin', password: 'admin', enabled: true).save(failOnError: true, flush: true)

                UserRole.create(user1, role1)

                def content1 = new Content(
                    type: ContentType.TUTORIAL,
                    title: '講義內容範例',
                    description: "### this is contents\n\ndescriptions",
                    answer: 'YES',
                    creator: user1
                ).save(failOnError: true, flush: true)

                def content2 = new Content(
                    type: ContentType.CODE,
                    title: '實作題範例',
                    description: "### this is contents 2\n\ndescriptions",
                    sourceCode: "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n    }\n}\n",
                    sourceType: SourceType.JAVA,
                    sourcePath: 'Main.java',
                    partialCode: "public class Main {\n    public static void main(String[] args) {\n    }\n}\n",
                    answer: "Hello World\n",
                    creator: user1
                ).save(failOnError: true, flush: true)

                def lesson = new Lesson(
                    name: 'lesson-1',
                    title: '基本認識',
                    description: 'lesson-1 desc',
                    creator: user1
                )
                lesson
                    .addToContents(content1)
                    .addToContents(content2)
                    .save(failOnError: true, flush: true)

                def course1 = new Course(
                    name: 'course-1',
                    title: 'TQC+ Java 物件導向程式語言',
                    description: 'course-1 desc',
                    creator: user1)
                course1
                    .addToLessons(lesson)
                    .save(failOnError: true, flush: true)

                UserCourse.create(user1, course1, true)
            }
        }
    }
    def destroy = {
    }
}
