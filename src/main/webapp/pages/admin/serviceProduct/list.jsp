<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="header">
    <h1>Системни продукти</h1>
    <h2>Всички системни продукти</h2>
</div>

<div class="content">
    <br/><br/>
    <a class="pure-button pure-button-primary" href="${pageContext.request.contextPath}/admin/serviceProducts/new">Нова системни продукт</a>
    <br/><br/>
    <table class="pure-table pure-table-bordered">
        <thead>
        <tr>
            <th>Име</th>
            <th>Цена</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="serviceProduct">
            <tr>
                <td>${serviceProduct.name}</td>
                <td>${serviceProduct.salonPrice}</td>
                <td><a class="pure-button" href="${pageContext.request.contextPath}/admin/serviceProducts/${serviceProduct.id}/edit">Редактирай</a></td>
                <td><button class="pure-button delete" var="${serviceProduct.id}">Изтрий</button></td>
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
                    url: '${pageContext.request.contextPath}/admin/serviceProducts/'+contactId,
                    type: 'DELETE',
                    success: function(data) {
                        /*TODO check if it works*/
                        location.reload();
                    }
                });
            });
        });
    </script>

</div>