<div class="alert alert-${record?'success':'error'}">
	<button type="button" class="close" data-dismiss="alert">×</button>
	<strong>伺服器回應（<g:formatDate format="HH:mm:ss" date="${new Date()}"/>）</strong>
	<g:if test="${record}">
	記錄儲存成功
	</g:if>
	<g:else>
	記錄儲存失敗
	</g:else>
</div>
