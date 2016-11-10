<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="header">
    <h1>Сметка #${receipt.id}</h1>
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
                <tr rev="${item.id}">
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

    <label class="title">Продукти</label>
    <br/><br/>
    <table class="pure-table pure-table-bordered">
        <thead>
        <tr>
            <th>Продукти</th>
            <th>Единична цена</th>
            <th>Количество</th>
            <th>Цена</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${receipt.products}" var="item">
            <tr>
                <td>${item.item.name}</td>
                <td>${item.item.salonPrice}</td>
                <td>${item.quantity}</td>
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
    <div class="pure-control-group">
        <label for="payment-method">Метод на плащане</label>
        <c:if test="${receipt.paymentMethod == 'CASH'}">
            <label id="payment-method">Брой</label>
        </c:if>
        <c:if test="${receipt.paymentMethod == 'CARD'}">
            <label id="payment-method">Карта</label>
        </c:if>
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