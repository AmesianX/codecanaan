import codecanaan.*

class BootStrap {

    def init = { servletContext ->
        //基本權限

        environments {

            def role1 = Role.findOrSaveByAuthority('ROLE_USER')
            def role2 = Role.findOrSaveByAuthority('ROLE_FACEBOOK')
            def role3 = Role.findOrSaveByAuthority('ROLE_ADMIN')
            def role4 = Role.findOrSaveByAuthority('ROLE_AUTHOR')
            
            //create administrator
            def user1 = User.findByUsername('admin')
            if (!user1) {
                user1 = new User(username: 'admin', password: 'admin', enabled: true).save(failOnError: true, flush: true)
                
                //join roles
                UserRole.create(user1, role1)
                UserRole.create(user1, role3)
                UserRole.create(user1, role4)
            }
                
            production {
                //empty
            }
            development {

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
