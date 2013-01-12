<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap_iframe">
<title>${content.title} Attachments</title>
</head>
<body>
<g:form action="attachmentSave" id="${content.id}" method="post" enctype="multipart/form-data" >  
<input type='file' name='files.1' /><br/>
<input type='file' name='files.2' /><br/>
<input type='file' name='files.3' /><br/>
<button type="submit" class="btn">上傳附件</button>
</g:form>

<g:form action="attachmentDelete" id="${content.id}" method="post">
    <p>
        <g:each in="${files}" var="file" status="i">
            <g:checkBox name="selected" value="${file.path}" checked="false" />
            <g:link action="attachment" id="${content.id}" params="[file: file.name]" target="_blank">${file.name}</g:link>
            <br/>
            <g:if test="${['.jpg','.jpeg','.JPG','.JPEG','.gif','.GIF','.png','.PNG'].any{file.name.endsWith(it)}}">
                <pre>![${file.name}](${createLink(action:'attachment', id:content.id, params: [file: file.name])} "Optional title")</pre>
            </g:if>
            <br/>
        </g:each>
    </p>
    <button name="delete" class="btn btn-danger" onclick="return confirm('Are you sure???');">移除已選項目</button>
</g:form>

<button onclick="location.reload();" class="btn">Reload</button>
</body>
</html>
