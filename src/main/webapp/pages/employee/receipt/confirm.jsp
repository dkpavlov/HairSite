<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Receipts</h1>
    <h2>Потвърди receipt</h2>
</div>
<br/>
<div class="content">
    <form class="pure-form pure-form-aligned" action="/employee/receipts/${receipt.id}/confirm" method="POST">
        <fieldset>

            <label class="title">Услуги</label>
            <br/><br/>
            <table class="pure-table pure-table-bordered">
                <thead>
                    <tr>
                        <th>Услуга</th>
                        <th>Единична цена</th>
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
                            <td>${item.totalPrice}</td>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${receipt.customItems}" var="item">
                        <tr>
                            <td>${item.name}</td>
                            <td>${item.singlePrice}</td>
                            <td>${item.quantity}</td>
                            <td>${item.totalPrice}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br/><br/>

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
            <div class="pure-control-group">
                <label for="full-price">Общо</label>
                <label id="full-price">${receipt.totalAmount}</label>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Потвърди</button>
            </div>

            <script>
                $(document).ready(function() {

                });
            </script>

        </fieldset>
    </form>
</div>