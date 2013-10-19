<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap_iframe">
<title>${content.title} Attachments</title>
</head>
<body>

<div class="main">
    <div class="container">

        <!--
        <button onclick="location.reload();" class="btn btn-default pull-right">Reload</button>
        -->

        <g:if test="${files}">

            <g:form action="attachmentDelete" id="${content.id}" method="post" role="form">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>
                                File Name
                            </th>
                            <th>
                                Op
                            </th>
                            <th>
                                Size
                            </th>
                            <th>
                                <i class="icon-check-empty"></i>
                            </th>    
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${files}" var="file" status="i">
                            <tr>
                                <td>${i+1}</td>
                                <td>
                                    <g:link action="attachment" id="${content.id}" params="[file: file.name]" target="_blank">
                                        ${file.name}
                                    </g:link>
                                </td>
                                <td>
                                    <g:if test="${['.jpg','.jpeg','.gif','.png','.svg','.tiff','.bmp'].any{file.name?.toLowerCase().endsWith(it)}}">
                                        <button class="btn btn-default button-copy-code" data-code="![${file.name}](${createLink(action:'attachment', id:content.id, params: [file: file.name])})">
                                            Markdown Syntax
                                        </button>
                                    </g:if>
                                </td>
                                <td>
                                    <g:prettyFileSize size="${file.size}" />
                                </td>
                                <td>
                                    <g:checkBox name="selected" value="${file.path}" checked="false" />
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5" class="text-right">
                                <button name="delete" class="btn btn-danger" onclick="return confirm('Are you sure???');">移除已選項目</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </g:form>

        </g:if>

        <!-- Upload -->
        <div class="page-header">
            <h3>Upload New File(s)</h3>
        </div>

        <g:form action="attachmentSave" id="${content.id}" method="post" enctype="multipart/form-data"  role="form">
            <div class="form-group">
                <label>File 1</label>
                <input type="file" name="files.1" />
            </div>
            <div class="form-group">
                <label>File 2</label>
                <input type="file" name="files.2" />
            </div>
            <div class="form-group">
                <label>File 3</label>
                <input type="file" name="files.3" />
            </div>
            <button type="submit" class="btn btn-default">上傳附件</button>
        </g:form>

    </div>
</div>

<r:script>
$(function() {

    $('.button-copy-code').click(function() {
        bootbox.alert(
            '<p>Press <code> Ctrl + C </code> to copy text.</p><textarea id="selected-text" readonly="readonly" class="form-control code-font" style="font-size:10pt;width:100%;height:100px">'+$(this).data('code')+'</textarea>'
        );
        setTimeout(function() {
            $('#selected-text').focus().select();
            console.log($('#selected-text'));
        }, 500);
        return false;
    });

});
</r:script>

</body>
</html>
