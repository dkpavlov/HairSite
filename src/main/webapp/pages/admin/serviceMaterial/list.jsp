<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="header">
    <h1>Системни материали</h1>
    <h2>Всички системни материали</h2>
</div>

<div class="content">
    <br/><br/>
    <a class="pure-button pure-button-primary" href="${pageContext.request.contextPath}/admin/serviceMaterials/new">Нова системен материал</a>
    <br/><br/>
    <table class="pure-table pure-table-bordered">
        <thead>
        <tr>
            <th>Име</th>
            <th>Цена за грам</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${serviceMaterialList}" var="serviceMaterial">
            <tr>
                <td>${serviceMaterial.name}</td>
                <td>${serviceMaterial.price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>