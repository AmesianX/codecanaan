package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Book)
class BookTests {

    void "test create a book"() {
        def b = new Book(
            title: "Hadoop技術手冊（第三版）",
            author: "Tom White",
            description: "準備好釋放潛藏在您資料中的力量了嗎？透過這本綜合技術大全，您將學會如何用Apache Hadoop來打造並維運一個可靠而具擴充性的分散式系統。無論是想瞭解如何分析各種大小資料集的程式設計師，或者想要設定與運行Hadoop叢集的系統管理員，都合適閱讀本書。您將在本書中發現許多耀眼的應用案例，用以說明Hadoop是如何被用...",
            isbn: "9789862766682",
            coverUrl: "http://media.taaze.tw/showLargeImage.html?sc=11100646075",
            linkUrl: "http://www.taaze.tw/sing.html?pid=11100646075",
            publisher: "美商歐萊禮股份有限公司台灣分公司",
            publishDate: new Date(),
            listPrice: 880,
            salePrice: 818
        )

        assertNotNull b.save()
    }
}
