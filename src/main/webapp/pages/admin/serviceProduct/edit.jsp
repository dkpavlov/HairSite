<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Новини</h1>
    <c:if test="${not empty serviceProduct.id}">
        <h2>Редактиране на ${serviceProduct.name}</h2>
    </c:if>
    <c:if test="${empty serviceProduct.id}">
        <h2>Нова системна продукт</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="serviceProduct" class="pure-form pure-form-aligned">
        <fieldset>
            <div class="pure-control-group">
                <label for="name">Име</label>
                <form:input path="name" id="name" type="text" placeholder="Име" maxlength="225"/>
                <form:errors path="name" cssClass="error" />
            </div>

            <div class="pure-control-group">
                <label for="salonPrice">Цена</label>
                <form:input path="salonPrice" id="salonPrice" type="text" placeholder="Цена(12.99)" maxlength="225"/>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Запис</button>
            </div>

            <script>
                $(document).ready(function() {
                    $("#cb").change(function() {
                        if(this.checked) {
                            $("#new-price").prop('disabled', false);
                        } else {
                            $("#new-price").prop('disabled', true);
                        }
                    });

                    <c:if test="${not empty product.id and product.promoted}">
                    $("#new-price").prop('disabled', false);
                    </c:if>
                });
            </script>

        </fieldset>
    </form:form>
</div>