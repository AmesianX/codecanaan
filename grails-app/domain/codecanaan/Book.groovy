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

    /**
     * 建立日期
     */
    Date dateCreated
    
    /**
     * 修改日期
     */
    Date lastUpdated

    static constraints = {
        isbn        nullable: false, blank: false
        description nullable: true, blank: true, maxSize: 1024*1024
    }
}
