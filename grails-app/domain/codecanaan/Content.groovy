package codecanaan

/**
 * 內容類型
 */
public enum ContentType {
    TUTORIAL,   //講義
    SLIDE,      //簡報
    QUIZ,       //測驗題（學科）
    CODE;       //實作題（術科）
}

/**
 * 原始碼語言類型
 */
public enum SourceType {
    JAVA,       // Java
    C,          // C
    CPP,        // C++
    SCHEME;     // Scheme
}

/**
 * 學習內容
 */
class Content {

    //---------- 基本欄位 ----------
 
    /**
     * 內容類型
     */
    ContentType type    //內容類型

    /**
     * 標題
     */
    String title
    
    /**
     * 副標題
     */
    String subtitle     //副標題

    /**
     * 作者（允許內容設定不同作者）
     */
    String authors

    /**
     * 主要內容敘述（以 Markdown 原始格式保存）
     */
    String description

    /**
     * 內容別名（如有設定可顯示友善網址）
     */
    String alias

    //---------- 測驗題專用欄位 ----------

    //TODO Options 預設選項, AnswertType 測驗類型（單選、多選、）

    /**
     * 選項（以換行分隔多個選項）
     */
    String options

    /**
     * 標準答案
     */
    String answer


    //---------- 實作題專用欄位 ----------

    /**
     * 原始程式碼（作者設計的程式碼）
     */
    String sourceCode

    /**
     * 程式碼語言類型（e.g. JAVA）
     */
    SourceType sourceType

    /**
     * 程式碼檔案路徑（e.g. Main.java）
     */
    String sourcePath
    
    /**
     * 部分解答程式碼
     */
    String partialCode

    /**
     * 執行結果（標準輸出）
     */
    String output

    //---------- 顯示設定欄位 ----------

    /**
     * 排序編號
     */
    int priority = 0
    
    /**
     * 點擊次數
     */
    int hits = 0

    /**
     * 內容建立者
     */
    User creator

    //---------- 系統欄位 ----------

    /**
     * 建立日期
     */
    Date dateCreated

    /**
     * 修改日期
     */
    Date lastUpdated
   
    /**
     * Content 必須關聯到 Lesson
     */
    static belongsTo = [
        lesson: Lesson
    ]

    static constraints = {
        //基本欄位
        title blank: false
        subtitle nullable: true, blank: true
        authors nullable: true, blank: true
        description blank: true, maxSize: 1024*1024
        alias nullable: true

        //測驗題
        options nullable: true, empty: true, maxSize: 1024
        answer  nullable: true, empty: true, maxSize: 255

        //實作題
        sourceCode  nullable: true, empty: true, maxSize: 1024*1024
        sourceType  nullable: true, empty: true
        sourcePath  nullable: true, empty: true, maxSize: 128
        partialCode nullable: true, empty: true, maxSize: 1024*1024
        output      nullable: true, empty: true, maxSize: 1024*1024

        //TODO: 不允許 Lesson 為空值
        lesson  nullable: true

        creator nullable: true
    }
}
