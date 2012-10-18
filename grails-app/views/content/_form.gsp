<%@ page import="codecanaan.Content" %>

<div class="control-group">
	<label class="control-label" for="lesson">單元</label>
    <div class="controls">
	    <g:hiddenField name="lesson.id" value="${content?.lesson?.id}" />
    	<g:link controller="lesson" action="show" id="${content?.lesson?.id}">${content?.lesson?.name}</g:link>
    </div>
</div>

<div class="control-group ${hasErrors(bean: content, field: 'title', 'error')} ">
	<label class="control-label" for="title">
		<g:message code="content.title.label" default="Title" />
	</label>
	<div class="controls">
		<g:textField name="title" value="${content?.title}" class="input-xlarge" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: content, field: 'type', 'error')} required">
	<label class="control-label" for="type">
		<g:message code="content.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:select name="type" from="${codecanaan.ContentType?.values()}" keys="${codecanaan.ContentType.values()*.name()}" required="" value="${content?.type?.name()}"/>
	</div>
</div>

<!--content.description-->
<div class="control-group ${hasErrors(bean: content, field: 'source', 'error')} ">
	<label class="control-label" for="source">
		<g:message code="content.description.label" default="Source" />		
	</label>
	<div class="controls">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab-editor" data-toggle="tab">編輯器</a></li>
			<li><a href="#tab-preview" data-toggle="tab">預覽</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab-editor">
				<div class="wmd-panel">
					<div id="wmd-button-bar"></div>
					<g:textArea name="source" cols="40" rows="5" maxlength="1048576" value="${content?.source}" class="wmd-input input-xlarge" id="wmd-input" />
				</div>
			</div>
			<div class="tab-pane" id="tab-preview">
				<div id="wmd-preview" class="wmd-panel wmd-preview"></div>
			</div>
		</div>
	</div>
</div>
<r:script>
(function () {
    var converter1 = Markdown.getSanitizingConverter();
    var editor1 = new Markdown.Editor(converter1);
    editor1.run();
})();
</r:script>

<div class="control-group ${hasErrors(bean: content, field: 'output', 'error')}">
	<label class="control-label" for="output">
		<g:message code="content.output.label" default="Output" />
	</label>
	<div class="controls">
		<g:textArea name="output" cols="40" rows="5" maxlength="1024" value="${content?.output}" class="input-xlarge" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: content, field: 'question', 'error')} ">
	<label class="control-label" for="question">
		<g:message code="content.question.label" default="Question" />
	</label>
	<div class="controls">
		<g:textArea name="question" cols="40" rows="5" maxlength="1024" value="${content?.question}" class="input-xlarge"/>
	</div>
</div>

<div class="control-group ${hasErrors(bean: content, field: 'partial', 'error')} ">
	<label class="control-label" for="partial">
		<g:message code="content.partial.label" default="Partial" />
	</label>
	<div class="controls">
		<g:textArea name="partial" cols="40" rows="5" maxlength="1024" value="${content?.partial}" class="input-xlarge" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: content, field: 'answer', 'error')} ">
	<label class="control-label" for="answer">
		<g:message code="content.answer.label" default="Answer" />
	</label>
	<div class="controls">
		<g:textField name="answer" value="${content?.answer}" class="input-xlarge" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: content, field: 'priority', 'error')} required">
	<label class="control-label" for="priority">
		<g:message code="content.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:field name="priority" type="number" value="${content.priority}" required="" class="input-small" />
	</div>
</div>
