<section id="compatible">
    <div class="page-header">
        <h1>相容性檢查</h1>
    </div>
    <table class="table">
        <thead>
            <tr>
                <th width="180">軟體名稱</th>
                <th>建議版本</th>
                <th>目前版本</th>
                <th width="250">說明</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>瀏覽器（Browser）</td>
                <td>Google Chrome</td>
                <td>
                    <browser:choice>
                        <browser:isIE6>Upgrade to IE 8+</browser:isIE6>
                        <browser:isIE7>Upgrade to IE 8+</browser:isIE7>
                        <browser:isiPhone>Mobile</browser:isiPhone>
                        <browser:isiPad>Mobile</browser:isiPad>
                        <browser:otherwise>Supported</browser:otherwise>
                    </browser:choice>
                </td>
                <td>安裝 <a href="http://www.google.com/chrome" target="_blank">Chrome</a> 瀏覽器</td>
            </tr>
            <tr>
                <td>User-Agent</td>
                <td colspan="3"><small>${request.getHeader("User-Agent")}</small></td>
            </tr>
            <tr>
                <td>Java Runtime</td>
                <td>1.6 或 1.7</td>
                <td><span id="jre-version"></span></td>
                <td><a href="#" onclick="deployJava.installLatestJRE()">Install Java</a> 下載並安裝 <a href="http://www.java.com/" target="_blank">Java</a> 軟體</td>
            </tr>
            <tr>
                <td>Java Web Start</td>
                <td>與 Java Runtime 相同</td>
                <td><span id="jws-version"></span></td>
                <td>請正確安裝 Java 軟體</td>
            </tr>
            <tr>
                <td>Java 開發工具（JDK）</td>
                <td>1.6 以上</td>
                <td><span id="jdk-version">無法辨別</span></td>
                <td>安裝 <a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank">JDK</a> 軟體</td>
            </tr>
        </tbody>
    </table>
</section>

