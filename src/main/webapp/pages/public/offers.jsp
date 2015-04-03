<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" uri="/jsps/custom.tld" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>оферти</h1>
        </div>
    </div>

    <c:forEach items="${page.content}" var="offer">
        <c:if test="${not empty offer.product}">
            <div class="row single-news">
                <div class="columns three">
                    <img src="${pageContext.request.contextPath}/storage/${offer.product.image.fileName}" width="100%"/>
                </div>
                <div class="columns nine news-container">
                    <article class="news offers">
                        <header>${offer.name}</header>
                        <p class="price">
                            <custom:doubleFormat number="${offer.price}" part="i"/>.<sup><custom:doubleFormat number="${offer.price}" part="f"/></sup><small>лева</small>
                        </p>
                        <p>
                            <label>Валидна до: </label> <fmt:formatDate pattern="dd.MM.yyyy" value="${offer.to}"/>
                        </p>
                        <p>
                            <label>Включени продукти: </label> ${offer.product.name}
                        </p>
                        <p>
                            <label>Описание: </label>  ${offer.product.description}

                        </p>
                    </article>
                </div>
            </div>
        </c:if>
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