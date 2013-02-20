<%@ page import="codecanaan.*" %>
<section>
    <!--標題-->
    <div class="page-header">
        <h1>${content.title}</h1>
        <g:if test="${content.subtitle}">
            <p><small>${content.subtitle}</small></p> 
        </g:if>
        <g:if test="${content.authors}">
            <p><small>作者：
                ${content.authors}
            </small></p> 
        </g:if>
        <g:if test="${content.level}">
            <p><small>難易度：
                <g:each in="${1..content.level}"><i class="icon icon-star"></i></g:each><g:each in="${1..5-content.level}"><i class="icon icon-star-empty"></i></g:each>
            </small></p> 
        </g:if>
    </div>

    <!--內容-->
    <g:if test="${content.description}">
        <div class="markdown-source font-resizable">${content.description?.encodeAsHTML()}</div>
    </g:if>

    <!--提示-->
    <g:if test="${content.hint}">
        <h2>提示</h2>
        <div class="markdown-source">${content.hint?.encodeAsHTML()}</div>
    </g:if>
    
    <!--教案-->
    <g:if test="${content.material}">
        <h2>教案</h2>
        <div class="markdown-source">${content.material?.encodeAsHTML()}</div>
    </g:if>

</section>

<sec:ifLoggedIn>
    <!--隨堂測驗-->

    <g:if test="${content.quizType==QuizType.SHORT_ANSWER}">
        <!--簡答題-->
        <p>請在方框內填寫你的答案。</p>
        <div class="margin-around">
            <g:textArea name="myanswer" value="${record?.answer?.trim()?:content.quizOption?.trim()}" class="input input-xlarge" rows="5" /><br/>
        </div>
    </g:if>
    <g:elseif test="${content.quizType==QuizType.SINGLE_CHOICE}">
        <p>請選擇合適的答案（單選）。</p>
        <div class="margin-around">
            <g:radioGroup name="myanswer" labels="${content.quizOption?.trim()?.split('\n')?.collect{it?.trim()}}" values="${content.quizOption?.trim()?.split('\n')?.collect{it?.trim()}}" value="${record?.answer?.trim()}" >
                <label>${it.radio} ${it.label}</label>
            </g:radioGroup>
        </div>
    </g:elseif>
    <g:elseif test="${content.quizType==QuizType.MULTIPLE_CHOICE}">
        <p>請選擇合適的答案（多選題）。</p>
        <div class="margin-around">
            <g:set var="stdAnswers" value="${content?.answer?.trim()?.split('\n').collect{it?.trim()}}" />
            <g:set var="lastAnswers" value="${record?.answer?.trim()?.split('\n').collect{it?.trim()}}" />
            <g:each in="${content.quizOption?.trim()?.split('\n')?.collect{it?.trim()}}" var="label" status="i">
                <label><g:checkBox name="myanswer" value="${label}" checked="${lastAnswers?.contains(label)}" data-answer="${stdAnswers?.contains(label)}" /> ${label}</label>
            </g:each>
        </div>
    </g:elseif>
    <g:elseif test="${content.quizType==QuizType.TRUE_FALSE}">
        <p>是非題。</p>
        <div class="margin-around">
            <g:radioGroup name="myanswer" labels="['True', 'False']" values="['TRUE', 'FALSE']" value="${record?.answer?.trim()?.toUpperCase()}" >
                <label>${it.radio} ${it.label}</label>
            </g:radioGroup>
        </div>
    </g:elseif>

    <button id="cmdSubmit" data-type="${content.quizType}" class="btn btn-primary">回答</button>
</sec:ifLoggedIn>
