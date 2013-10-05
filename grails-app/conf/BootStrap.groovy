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
                user1 = new User(fullName: 'Administrator', email: 'admin@codecanaan.com', username: 'admin', password: 'admin', enabled: true, works: true).save(failOnError: true, flush: true)
                
                //join roles
                UserRole.create(user1, role1)
                //UserRole.create(user1, role2)
                UserRole.create(user1, role3)
                UserRole.create(user1, role4)
                UserRole.create(user1, role5)
                UserRole.create(user1, role6)
            }

            production {
                //empty
            }
            
            development {

                def user2 = new User(fullName: 'Student', email: 'student@codecanaan.com', username: 'student', password: 'student', enabled: true).save(failOnError: true, flush: true)
                def user3 = new User(fullName: 'Teacher', email: 'teacher@codecanaan.com', username: 'teacher', password: 'teacher', enabled: true).save(failOnError: true, flush: true)
                def user4 = new User(fullName: 'Guest', email: 'guest@codecanaan.com', username: 'guest', password: 'guest', enabled: true).save(failOnError: true, flush: true)
                def user5 = new User(fullName: 'Author', email: 'author@codecanaan.com', username: 'author', password: 'author', enabled: true).save(failOnError: true, flush: true)

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
                
                //產生測試使用者
                (1..100).each {
                    def userN = new User(fullName: "User No.${it}", email: "user${it}@codecanaan.com", username: "user${it}", password: "password${it}", enabled: true).save(failOnError: true, flush: true)
                    UserRole.create(userN, role1)
                }

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

                //建立使用手冊
                def course0 = new Course(
                    name: 'system-help',
                    title: '教學系統使用手冊',
                    description: '系統說明',
                    creator: user1
                ).save(failOnError: true, flush: true)
                
                //Admin擁有使用手冊
                UserCourse.create(user1, course0, RegType.AUTHOR, true)

                //建立測試課程
                def course1 = new Course(
                    name: 'tqc-plus-java6',
                    title: 'TQC+ Java 物件導向程式語言',
                    description: 'course-1 desc',
                    creator: user1
                )

                course1
                    .addToLessons(lesson)
                    .save(failOnError: true, flush: true)
                    
                //將測試課程加入開放式課程清單
                OpenCourse.openTheCourse(course1)

                UserCourse.create(user1, course1, RegType.AUTHOR, true)
                UserCourse.create(user2, course1, RegType.USER, true)
                UserCourse.create(user3, course1, RegType.USER, true)
                UserCourse.create(user5, course1, RegType.AUTHOR, true)


                // Fade Data: Announce posts
                // 自動產生文章 read rss from google news
                try {
                    def rnd = new Random()
                    def url = 'https://news.google.com/news/feeds?pz=1&cf=all&ned=tw&hl=zh-TW&output=rss'
                    def xml = new XmlParser().parse(url)
                    def i = 0
                    xml.channel[0].item.each {
                        item->
                        
                        def p = new Post(
                            name: "post-${i++}",
                            title: item.title[0].value().first(),
                            content: item.description[0].value().first().replaceAll("<(.|\n)*?>", ''),
                            type: PostType.ANNOUNCE,
                            tag: 'tag1, tag2',
                            creator: user1
                        ).save()

                        p.dateCreated = new Date() - rnd.nextInt(50)
                        p.lastUpdated = new Date() - rnd.nextInt(50)
                        p.save()
                    }
                }
                catch (e) {
                    //no network
                    log.warn "Can't fetch data from google new."
                }
            }
        }
    }
    def destroy = {
    }
}
