<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="header">
    <h1>Сметки</h1>
    <h2>Всички мой сметки</h2>
</div>

<div class="content">
    <br/><br/>
    <a class="pure-button pure-button-primary" href="${pageContext.request.contextPath}/employee/receipts/new">Нов сметка</a>
    <br/><br/>
    <table class="pure-table pure-table-bordered">
        <thead>
        <tr>
            <th>Дата</th>
            <th>Стойност</th>
            <th>Дял</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="receipt">
            <tr>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${receipt.createdAt}"/></td>
                <td>${receipt.totalAmount}</td>
                <td>${receipt.sellerAmount}</td>
                <td><a class="pure-button" href="${pageContext.request.contextPath}/employee/receipts/${receipt.id}/preview">Преглед</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/><br/>

    <div class="paginator">
        <c:if test="${not empty page}">
            <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
            <a href="${url}&page=0" class="paginator-previous"><<</a>
            <a href="${url}&page=${page.number - 1}" class="paginator-page paginator-page-first"><</a>
            <a href="/?page=10" class="paginator-current" onclick="return false;">${page.number}</a>
            <a href="${url}&page=${page.number + 1}" class="paginator-page paginator-page-last">></a>
            <a href="${url}&page=${page.totalPages - 1}" class="paginator-next">>></a>
            <br/>
            Страница ${page.number} от ${page.totalPages - 1}
        </c:if>
    </div>

</div>