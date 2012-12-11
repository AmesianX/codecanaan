import codecanaan.*

class BootStrap {

    def init = { servletContext ->
        //基本權限

        environments {

            def role1 = Role.findOrSaveByAuthority('ROLE_USER')
            def role2 = Role.findOrSaveByAuthority('ROLE_FACEBOOK')
            def role3 = Role.findOrSaveByAuthority('ROLE_ADMIN')
            def role4 = Role.findOrSaveByAuthority('ROLE_AUTHOR')
            def role5 = Role.findOrSaveByAuthority('ROLE_STUDENT')
            def role6 = Role.findOrSaveByAuthority('ROLE_TEACHER')
            
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

                def user2 = new User(username: 'student', password: 'student', enabled: true).save(failOnError: true, flush: true)
                def user3 = new User(username: 'teacher', password: 'teacher', enabled: true).save(failOnError: true, flush: true)
                def user4 = new User(username: 'guest', password: 'guest', enabled: true).save(failOnError: true, flush: true)
                def user5 = new User(username: 'author', password: 'author', enabled: true).save(failOnError: true, flush: true)

                //USER, STUDENT
                UserRole.create(user2, role1)
                UserRole.create(user2, role5)
                
                //USER, TEACHER
                UserRole.create(user3, role1)
                UserRole.create(user3, role6)
                
                //USER, GUEST
                UserRole.create(user4, role1)

                //USER, AUTHOR
                UserRole.create(user5, role1)
                UserRole.create(user5, role4)
                
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
                    creator: user1
                )

                course1
                    .addToLessons(lesson)
                    .save(failOnError: true, flush: true)

                UserCourse.create(user1, course1, RegType.AUTHOR, true)
                UserCourse.create(user2, course1, RegType.USER, true)
                UserCourse.create(user3, course1, RegType.USER, true)
                UserCourse.create(user5, course1, RegType.AUTHOR, true)
            }
        }
    }
    def destroy = {
    }
}
