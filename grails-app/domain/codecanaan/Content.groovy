package codecanaan

public enum ContentType {
    TUTORIAL,
    SLIDE,
    QUIZ,
    CODE;
}

public enum SourceType {
    JAVA,
    C,
    CPP;
}

class Content {
    ContentType type    //內容類型

    //基本欄位
    String title        //標題
    String subtitle     //副標題
    String authors      //作者（允許自行變更）
    String description  //原始內容
    String alias        //別名（非必要）

    //程式碼專用欄位
    String sourceCode       //程式碼內容
    SourceType sourceType   //程式類型（e.g. JAVA)
    String sourcePath       //程式路徑（e.g. Main.java）
    String partialCode      //部分解答程式碼

    String answer           //解答

    int priority = 0    //排序

    User creator        //建立者

    Date dateCreated    //建立日期
    Date lastUpdated    //修改日期
    
    int hits = 0        //點擊次數

    static belongsTo = [lesson: Lesson]

    static constraints = {
        alias nullable: true
        title blank: false
        subtitle nullable: true, blank: true
        authors nullable: true, blank: true
        description blank: true, maxSize: 1024*1024

        sourceCode  nullable: true, empty: true, maxSize: 1024*1024
        sourceType  nullable: true, empty: true, maxSize: 16
        sourcePath  nullable: true, empty: true, maxSize: 96
        partialCode nullable: true, empty: true, maxSize: 1024*1024

        answer nullable: true, empty: true, maxSize: 1024*1024

        lesson nullable: true
        creator nullable: true
    }
}
