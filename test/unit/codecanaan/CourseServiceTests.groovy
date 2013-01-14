package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(CourseService)
@Mock([User, Course, Lesson, Content, Record, UserCourse])
class CourseServiceTests {
	def user=null
	def newCourse =null
	def newLession =null
	def content1 =null
	def content2 =null
	
	void setUp(){
		user= new User(username: 'admin', password: 'admin').save();
		newCourse=new Course(
			name: 'tqc-plus-java6',
			title: 'TQC+ Java 物件導向程式語言',
			description: 'course-1 desc',
			creator: user
		).save()
		UserCourse.create(user,newCourse,RegType.AUTHOR,true)
		
		content1=new Content(
			type: ContentType.TUTORIAL,
			title: 'title1',
			source: "### this is contents\n\ndescriptions",
			question: 'question1',
			answer: 'ans1',
			partial: 'partial1',
			description: "description1"
		).save()
		
		content2=new Content(
			type: ContentType.TUTORIAL,
			title: 'title2',
			source: "### this is contents\n\ndescriptions",
			question: 'question2',
			answer: 'ans2',
			partial: 'partial2',
			description: "description1"
		).save()
		
		
		newLession = new Lesson(
			name: 'lesson-1',
			title: '基本認識',
			description: 'lesson-1 desc'
		)
		.addToContents(content1)
		.addToContents(content2)
		.save()
		

		
	}
    void testIsAuthor() {
		def cs= new CourseService()
		assert cs.isAuthor(newCourse, user)==true
		
    }
	
	void testGetLessonStats(){
		new Record(user: user, content: content1, passed:true).save()
		new Record(user: user, content: content2, passed:false).save()
		
		def cs= new CourseService()
		def stat = cs.getLessonStats(newLession, user)
		
		assert stat.empty==0
		assert stat.ok==1
		assert stat.error==1

	}
}
