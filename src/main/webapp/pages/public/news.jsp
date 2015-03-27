<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="custom" uri="/jsps/custom.tld" %>

<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>новини</h1>
        </div>
    </div>

    <c:forEach items="${page.content}" var="news">
        <div class="row single-news">
        <div class="columns three">
            <a href="" class="news-image"><img src="${pageContext.request.contextPath}/storage/${news.image.fileName}" width="100%"/></a>
        </div>
        <div class="columns nine news-container">
            <article class="news">
                <header>${news.title}</header>
                <p class="date"><fmt:formatDate pattern="dd.MM.yyyy" value="${news.dateCreated}"/></p>
                <p class="news-description"><custom:shortText text="${news.text}" charecters="116"/></p>
                <div class="whole-news hide">
                    <p>${news.text}</p>
                    <p class="close">
                        <a class="link" href="">Затвори</a>
                    </p>
                </div>
            </article>
        </div>
    </div>
    </c:forEach>

    <%
        String url = "";
        if (request.getQueryString() != null) {
            url = "?" + request.getQueryString().split("page")[0];

            if (url.endsWith("&")) {
                url = url.substring(0, url.length() - 1);
            }
        }
    %>
    <c:set var="current" value="<%=url%>" />
    <c:set var="base" value="<%= request.getContextPath().toString().substring(0)%>"/>
    <util:pagination maxPages="${page.totalPages}" page="${page.number}" size="${page.size}" url="${current}" base="${base}"/>

</div>

<script>
    $(function(){
        $('.news-image').click(function(){
           $(this).parent().next().find('p.news-description').addClass('hide');
           $(this).parent().next().find('div.whole-news').removeClass('hide');
            return false;
        });
        $('p.close a.link').click(function(){
            $(this).parent().parent().addClass('hide');
            $(this).parent().parent().parent().find('p.news-description').removeClass('hide');
            return false;
        })
    })
</script>