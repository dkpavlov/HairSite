<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Receipts</h1>
    <h2>Нова receipt</h2>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="receipt" class="pure-form pure-form-aligned">
        <fieldset>
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
                    <c:forEach items="${serviceItemList}" var="serviceItem" varStatus="status">
                        <tr>
                            <td>${serviceItem.name}</td>
                            <td id="${serviceItem.id}-salon-price">${serviceItem.salonPrice}</td>
                            <td>
                                <form:hidden path="items[${status.index}].item.id" value="${serviceItem.id}"/>
                                <form:input path="items[${status.index}].quantity" type="text" value="0" maxlength="225" rev="${serviceItem.id}" class="quantity"/>
                            </td>
                            <td id="${serviceItem.id}-total-price" class="total-price">0.00</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <br/><br/>
            <div class="pure-control-group total">
                <label for="full-price">Общо</label>
                <label id="full-price">0.0</label>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Запис</button>
            </div>

            <script>
                $(document).ready(function() {
                    $(".quantity").keyup(function(){
                        var serviceItemId = $(this).attr("rev");
                        var quantity = $(this).val();
                        var singlePrice = $("#"+serviceItemId+"-salon-price").html();
                        $("#"+serviceItemId+"-total-price").html((quantity * singlePrice).toFixed(2));

                        var fullPrice = 0.0;
                        var prices = $(".total-price")
                        for(var i = 0; i < prices.length; i++){
                            fullPrice += parseFloat(prices[i].innerHTML);
                        }

                        $("#full-price").text(fullPrice.toFixed(2));
                    })
                });
            </script>

        </fieldset>
    </form:form>
</div>