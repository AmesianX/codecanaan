package codecanaan


/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */

class UnitTestProcessTests {
	
	def testIndex=0
	
	void setUp(){		
		println "setup"
		testIndex++
		println "testIndex " +testIndex
	}
	
    void testVoidOne() {
		testIndex++
		println "testIndex " +testIndex
	
    }
	
	void testVoidTwo() {
		testIndex++
		println "testIndex " +testIndex

	}
}
