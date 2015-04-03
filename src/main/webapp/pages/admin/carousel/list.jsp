<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header">
    <h1>Карусел</h1>
    <h2>Всички изображения</h2>
</div>

<div class="content">
    <br/><br/>
    <a class="pure-button pure-button-primary" href="${pageContext.request.contextPath}/admin/carousel/new">Ново изображение</a>
    <br/><br/>
    <table class="pure-table pure-table-bordered">
        <thead>
        <tr>
            <th>Име</th>
            <th>Статус</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="carousel">
            <tr>
                <td>${carousel.name}</td>
                <td>${carousel.status.name}</td>
                <td><a class="pure-button" href="${pageContext.request.contextPath}/cms/preview/carousel/${carousel.id}">Преглед</a></td>
                <td><a class="pure-button" href="${pageContext.request.contextPath}/admin/carousel/${carousel.id}/edit">Редактирай</a></td>
                <td><button class="pure-button delete" var="${carousel.id}">Изтрий</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/><br/>

    <script>
        $(document).ready(function() {
            $('.delete').click(function(){
                var contactId = $(this).attr('var');
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/carousel/'+contactId+'/status',
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