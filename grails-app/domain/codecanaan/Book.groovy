package codecanaan

class Book {

    /**
     * 標題
     */
    String title

    /**
     * 作者
     */
    String author

    /**
     * 封面圖片
     */
    String coverUrl

    /**
     * 簡介
     */
    String description

    /**
     * ISBN
     */
    String isbn

    /**
     * 定價
     */
    float listPrice

    /**
     * 售價
     */
    float salePrice

    /**
     * 出版社
     */
    String publisher

    /**
     * 出版日期
     */
    Date publishDate

    /**
     * 書籍頁面連結
     */
    String linkUrl

    /*
    {"author":"Tom White","coverUrl":"http:\/\/media.taaze.tw\/showLargeImage.html?sc=11100646075","intro":"準備好釋放潛藏在您資料中的力量了嗎？透過這本綜合技術大全，您將學會如何用Apache Hadoop來打造並維運一個可靠而具擴充性的分散式系統。無論是想瞭解如何分析各種大小資料集的程式設計師，或者想要設定與運行Hadoop叢集的系統管理員，都合適閱讀本書。您將在本書中發現許多耀眼的應用案例，用以說明Hadoop是如何被用...","isbn":"9789862766682","listPrice":"880","pageUrl":"http:\/\/www.taaze.tw\/sing.html?pid=11100646075","publishDate":"2013-02-02","publisher":"美商歐萊禮股份有限公司台灣分公司","salePrice":"818","title":"Hadoop技術手冊（第三版）"}
    */

    static constraints = {
        isbn        nullable: false, blank: false
        description nullable: true, blank: true, maxSize: 1024*1024
    }
}
