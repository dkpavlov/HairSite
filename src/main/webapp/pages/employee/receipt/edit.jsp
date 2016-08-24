<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Сметка</h1>
    <h2>Нова сметка</h2>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="receipt" class="pure-form pure-form-aligned">
        <fieldset>

            <label class="title">Услуги</label>
            <br/><br/>
            <table class="pure-table pure-table-bordered" id="receipt-items-table">
                <thead>
                    <tr>
                        <th>Услуга</th>
                        <th>Единична цена</th>
                        <th>Количество</th>
                        <th></th>
                        <th></th>
                        <th>Материал</th>
                        <th>Количество материал</th>
                        <th></th>
                        <th></th>
                        <th>Цена</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${serviceItemPrice}" var="price" varStatus="status">
                        <tr>
                            <td>${price.serviceItem.name}</td>
                            <td id="${price.serviceItem.id}-salon-price" rev="${price.userPrice}">${price.serviceItem.salonPrice}</td>
                            <td>
                                <form:hidden path="items[${status.index}].item.id" value="${price.serviceItem.id}"/>
                                <form:input path="items[${status.index}].quantity" type="text" value="0" maxlength="225" rev="${price.serviceItem.id}" class="quantity service-quantity" id="${price.serviceItem.id}-quantity"/>
                            </td>
                            <td>
                                <button type="button" class="pure-button pure-button-active quantity-button quantity-add" rev="${price.serviceItem.id}">+</button>
                            </td>
                            <td>
                                <button type="button" class="pure-button pure-button-active quantity-button quantity-subtract" rev="${price.serviceItem.id}">-</button>
                            </td>
                            <td>
                                <form:select path="items[${status.index}].material.id" id="m-${status.index}" class="material-select">
                                    <form:option value=""></form:option>
                                    <c:forEach items="${materialList}" var="material">
                                        <form:option value="${material.id}">${material.name}</form:option>
                                    </c:forEach>
                                </form:select>
                            </td>
                            <td><form:input path="items[${status.index}].materialQuantity" type="text" value="30" maxlength="225" id="m-${status.index}-quantity" class="material-quantity"/></td>
                            <td>
                                <button type="button" class="pure-button pure-button-active quantity-button quantity-add-material" rev="m-${status.index}">+</button>
                            </td>
                            <td>
                                <button type="button" class="pure-button pure-button-active quantity-button quantity-subtract-material" rev="m-${status.index}">-</button>
                            </td>
                            <td id="${price.serviceItem.id}-total-price" class="total-price">0.00</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td><form:input path="customItems[0].name" type="text" maxlength="225"/></td>
                        <td>
                            <form:input path="customItems[0].singlePrice" value="0.0" type="text" maxlength="225" id="c0-salon-price" class="custom-price"/>
                        </td>
                        <td>
                            <form:input path="customItems[0].quantity" type="text" value="0" maxlength="225" rev="c0" class="quantity"/>
                        </td>
                        <td></td>
                        <td></td>
                        <td id="c0-total-price" class="total-price">0.00</td>
                    </tr>
                </tbody>
            </table>

            <br/>
            <div class="pure-control-group total">
                <input type="button" value="Добави услуга" class="pure-button pure-button-primary" id="add-custom-service"/>
            </div>


            <br/><br/>

            <label class="title">Продукти</label>
            <br/><br/>
            <table class="pure-table pure-table-bordered" id="receipt-product-items-table">
                <thead>
                <tr>
                    <th>Продукт</th>
                    <th>Единична цена</th>
                    <th>Количество</th>
                    <th></th>
                    <th></th>
                    <th>Цена</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${serviceProductList}" var="productItem" varStatus="status">
                    <tr>
                        <td>${productItem.name}</td>
                        <td id="p${productItem.id}-salon-price">${productItem.salonPrice}</td>
                        <td>
                            <form:hidden path="products[${status.index}].item.id" value="${productItem.id}"/>
                            <form:input path="products[${status.index}].quantity" type="text" value="0" maxlength="225" rev="p${productItem.id}" class="quantity" id="p${productItem.id}-quantity"/>
                        </td>
                        <td>
                            <button type="button" class="pure-button pure-button-active quantity-button quantity-add" rev="p${productItem.id}">+</button>
                        </td>
                        <td>
                            <button type="button" class="pure-button pure-button-active quantity-button quantity-subtract" rev="p${productItem.id}">-</button>
                        </td>
                        <td id="p${productItem.id}-total-price" class="total-price">0.00</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>



            <br/><br/>
            <div class="pure-control-group total">
                <label for="full-price">Общо</label>
                <label id="full-price">0.0</label>
                <br/>
                <label for="full-price-еmployee">Част служител</label>
                <label id="full-price-еmployee">0.0</label>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Запис</button>
            </div>

            <script>
                $(document).ready(function() {
                    var customItemIndex = 1;

                    $(".quantity-add-material").click(function(){
                        var itemId = $(this).attr("rev");
                        var quantity = parseFloat($("#"+itemId+"-quantity").val());
                        quantity += 5;
                        $("#"+itemId+"-quantity").val(quantity);

                    });

                    $(".quantity-subtract-material").click(function(){
                        var itemId = $(this).attr("rev");
                        var quantity = parseFloat($("#"+itemId+"-quantity").val());
                        if(quantity != 0){
                            quantity -= 5;
                            $("#"+itemId+"-quantity").val(quantity);
                        }
                    });

                    $(".quantity-add").click(function(){
                        var itemId = $(this).attr("rev");
                        var quantity = $("#"+itemId+"-quantity").val();
                        quantity++;
                        $("#"+itemId+"-quantity").val(quantity);
                        $("#"+itemId+"-quantity").change();

                    });

                    $(".quantity-subtract").click(function(){
                        var itemId = $(this).attr("rev");
                        var quantity = $("#"+itemId+"-quantity").val();
                        if(quantity != 0){
                            quantity--;
                            $("#"+itemId+"-quantity").val(quantity);
                            $("#"+itemId+"-quantity").change();
                        }
                    });

                    $(".quantity").on("change paste keyup", function(){
                        var serviceItemId = $(this).attr("rev");
                        var quantity = $(this).val();
                        var singlePrice = $("#"+serviceItemId+"-salon-price").html();
                        var employeePrice = $("#"+serviceItemId+"-salon-price").attr("rev");
                        if(!singlePrice){
                            singlePrice = $("#"+serviceItemId+"-salon-price").val();
                        }
                        if(employeePrice){
                            var serviceQuantity = $(".service-quantity");
                            var fullPriceEmployee = 0.0;
                            for(var i = 0; i < serviceQuantity.length; i++){
                                var id = serviceQuantity[i].getAttribute("rev");
                                var qu = serviceQuantity[i].value;
                                var ep = $("#" + id + "-salon-price").attr("rev");
                                fullPriceEmployee += parseFloat(qu * ep);
                            }
                            $("#full-price-еmployee").html((fullPriceEmployee).toFixed(2));

                        }
                        $("#"+serviceItemId+"-total-price").html((quantity * singlePrice).toFixed(2));

                        var fullPrice = 0.0;
                        var prices = $(".total-price");
                        for(var i = 0; i < prices.length; i++){
                            fullPrice += parseFloat(prices[i].innerHTML);
                        }

                        $("#full-price").text(fullPrice.toFixed(2));
                    });

                    $("#add-custom-service").click(function() {
                        $("#receipt-items-table tr:last").after(
                            '<tr>' +
                                '<td><input name="customItems[' + customItemIndex + '].name" type="text" maxlength="225"/></td>' +
                                '<td>' +
                                    '<input name="customItems[' + customItemIndex + '].singlePrice" value="0.0" type="text" maxlength="225" class="custom-price" id="c' + customItemIndex + '-salon-price"/>' +
                                '</td>' +
                                '<td>' +
                                    '<input name="customItems[' + customItemIndex + '].quantity" type="text" value="0" maxlength="225" rev="c' + customItemIndex + '" class="quantity"/>' +
                                '</td>' +
                                '<td></td><td></td>' +
                                '<td id="c' + customItemIndex + '-total-price" class="total-price">0.00</td>' +
                            '</tr>');
                        customItemIndex++;

                        $(".quantity").on("change paste keyup", function(){
                            var serviceItemId = $(this).attr("rev");
                            var quantity = $(this).val();
                            var singlePrice = $("#"+serviceItemId+"-salon-price").html();
                            if(!singlePrice){
                                singlePrice = $("#"+serviceItemId+"-salon-price").val();
                            }
                            $("#"+serviceItemId+"-total-price").html((quantity * singlePrice).toFixed(2));

                            var fullPrice = 0.0;
                            var prices = $(".total-price")
                            for(var i = 0; i < prices.length; i++){
                                fullPrice += parseFloat(prices[i].innerHTML);
                            }

                            $("#full-price").text(fullPrice.toFixed(2));
                        });
                    });
                });
            </script>

        </fieldset>
    </form:form>
</div>