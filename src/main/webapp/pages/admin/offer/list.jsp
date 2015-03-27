<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="header">
    <h1>Оферти</h1>
    <h2>Всички оферти</h2>
</div>

<div class="content">
    <br/><br/>
    <table class="pure-table pure-table-bordered">
        <thead>
        <tr>
            <th>Дата</th>
            <th>Тип</th>
            <th>За</th>
            <th>Статус</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="offer">
            <tr>
                <td><fmt:formatDate pattern="HH:mm dd-MM-yyyy" value="${offer.dateCreated}"/></td>
                <c:if test="${not empty offer.product}">
                    <td>Продукт</td>
                    <td>${offer.product.name}</td>
                </c:if>
                <c:if test="${empty offer.product}">
                    <td>Услуга</td>
                    <td>${offer.service.name}</td>
                </c:if>
                <td>${offer.status.name}</td>
                <td><a class="pure-button" href="${pageContext.request.contextPath}/cms/offer/preview/${offer.id}">Преглед</a></td>
                <td><a class="pure-button" href="${pageContext.request.contextPath}/admin/offer/${offer.id}/edit">Редактирай</a></td>
                <td><button class="pure-button delete" var="${offer.id}">Изтрий</button></td>
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

    <script>
        $(document).ready(function() {
            $('.delete').click(function(){
                var contactId = $(this).attr('var');
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/offer/'+contactId+'/status',
                    type: 'PUT',
                    data: "status=ARCHIVED",
                    success: function(data) {
                        location.reload();
                    }
                });
            });
        });
    </script>

</div>