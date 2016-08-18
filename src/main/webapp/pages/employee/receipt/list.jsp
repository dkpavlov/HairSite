<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="header">
    <h1>Receipts</h1>
    <h2>Всички мой receipts</h2>
</div>

<div class="content">
    <br/><br/>
    <a class="pure-button pure-button-primary" href="${pageContext.request.contextPath}/employee/receipts/new">Нов receipt</a>
    <br/><br/>
    <table class="pure-table pure-table-bordered">
        <thead>
        <tr>
            <th>Дата</th>
            <th>Стойност</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="receipt">
            <tr>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${receipt.createdAt}"/></td>
                <td>${receipt.totalAmount}</td>
                <td><a class="pure-button" href="${pageContext.request.contextPath}/employee/receipts/${receipt.id}/preview">Преглед</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/><br/>

    <%-- TODO fix paging--%>
    <%--<div class="paginator">
        <a href="/?page=9" class="paginator-previous">Previous</a>
        <a href="/?page=8" class="paginator-page paginator-page-first">8</a>
        <a href="/?page=9" class="paginator-page">9</a>
        <a href="/?page=10" class="paginator-current">10</a>
        <a href="/?page=11" class="paginator-page">11</a>
        <a href="/?page=12" class="paginator-page paginator-page-last">12</a>
        <a href="/?page=11" class="paginator-next">Next</a>
    </div>--%>

</div>