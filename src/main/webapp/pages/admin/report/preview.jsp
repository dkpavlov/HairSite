<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="header">
    <h1>Receipts</h1>
    <h2>Преглед на receipt</h2>
</div>
<br/>
<div class="content">
    <table class="pure-table pure-table-bordered">
        <thead>
            <tr>
                <th>Услуга</th>
                <th>Единична цена</th>
                <th>Количество</th>
                <th>Матерял</th>
                <th>Количество</th>
                <th>Цена</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${receipt.items}" var="item">
                <tr>
                    <td>${item.item.name}</td>
                    <td>${item.item.salonPrice}</td>
                    <td>${item.quantity}</td>
                    <td>
                        <c:if test="${not empty item.material}">
                            ${item.material.name}
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${not empty item.material}">
                            ${item.materialQuantity}
                        </c:if>
                    </td>
                    <td>${item.totalPrice}</td>
                </tr>
            </c:forEach>
            <c:forEach items="${receipt.customItems}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.singlePrice}</td>
                    <td>${item.quantity}</td>
                    <td>-</td>
                    <td>-</td>
                    <td>${item.totalPrice}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <br/><br/>
    <div class="pure-control-group total">
        <label for="employee">Служител</label>
        <label id="employee">${receipt.seller.username}</label>
     </div>
     <br/>
     <div class="pure-control-group total">
        <label for="created-аt">Дата</label>
        <label id="created-аt"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${receipt.createdAt}"/></label>
    </div>
    <br/>
    <div class="pure-control-group total">
        <label for="full-price">Общо</label>
        <label id="full-price">${receipt.totalAmount}</label>
    </div>

    <script>
        $(document).ready(function() {

        });
    </script>
</div>