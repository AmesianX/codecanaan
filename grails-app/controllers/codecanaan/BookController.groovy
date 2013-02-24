package codecanaan

import groovy.json.JsonSlurper

class BookController {

    def index() {
        redirect action: 'list'
    }

    /**
     * 書目查詢
     */
    def list() {
        params.max = params.max?:100
        params.sort = 'publishDate'
        params.order = 'desc'

        [
            books: Book.list(params),
            bookCount: Book.count()
        ]
    }

    /**
     * 詳細檢視
     */
    def show(Long id) {

        def book

        if (id) {
            book = Book.get(id)
        }
        else if (params.isbn) {
            book = Book.findByIsbn(params.isbn)
        }

        [
            book: book
        ]
    }

    def syncTaazeApi() {
   
        def num = params.num?:100

        def json_url = "http://m.taaze.tw/api/data/GetProductByCat.ashx?startNum=0&endNum=${num}"

        def json_text = new URL(json_url).text

        def slurper = new JsonSlurper()

        def result = slurper.parseText(json_text)
       
        /*
[author:陶利軍, title:昂貴專線再見：用免費OpenVPN建立更安全的公網虛擬通道, coverUrl:http://media.taaze.tw/showLargeImage.html?sc=11100645895, listPrice:680, pageUrl:http://www.taaze.tw/sing.html?pid=11100645895, isbn:9789865908812, salePrice:537, publishDate:2013-01-25, intro:隨著網際網路的發展和電腦技術的普及，在網路中傳輸的資料的安全也尤為重要，因此在很多地方都使用了虛擬私有網路，也就是我們所說的VPN。透過使用VPN，在兩個連接在公網的點上建構一條虛擬通道，這樣，傳輸在此通道中的資料將被視為是安全的資料。在實現VPN 的技術中，有Cisco 提供的專用裝置，由硬體實現，還有其他透過軟體實..., publisher:佳魁資訊股份有限公司]
        */

        def total = result.bookList?.size()
        def ok = 0

        result.bookList?.each { b->
            try {
                def isbn = b.isbn?.replaceAll('-', '')
                def book = Book.findOrCreateByIsbn(isbn)
                book.author = b.author
                book.title = b.title
                book.description = b.intro
                book.coverUrl = b.coverUrl
                book.publisher = b.publisher
                book.listPrice = b.listPrice?.isFloat()?b.listPrice.toFloat():0
                book.salePrice = b.salePrice?.isFloat()?b.salePrice.toFloat():0
                book.linkUrl = b.pageUrl
                book.publishDate = Date.parse('yyyy-MM-dd', b.publishDate)

                if (book.save(flush: true)) {
                    ok++
                }
            }
            catch (e) {
                log.error e.message
            } 
        }

        render(contentType: 'application/json') {[
            success: true,
            total: total,
            ok: ok
        ]}
    }
}
