<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Оферти</h1>
    <c:if test="${not empty product.id}">
        <h2>Редактиране на ${product.title}</h2>
    </c:if>
    <c:if test="${empty product.id}">
        <h2>Нова оферта</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="offer" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>

            <c:if test="${not empty offer.product}">
                <div class="pure-form-aligned">
                    <fieldset>
                        <div class="pure-control-group">
                            <label for="name">Продукт</label>
                            <label id="name">${offer.product.name}</label>
                        </div>
                        <div class="pure-control-group">
                            <label for="date">Цена на продукта</label>
                            <c:if test="${offer.product.promoted}">
                                <label id="date">${offer.product.newPrice}</label>
                            </c:if>
                            <c:if test="${not offer.product.promoted}">
                                <label id="date">${offer.product.price}</label>
                            </c:if>

                        </div>
                    </fieldset>
                </div>
            </c:if>

            <c:if test="${not empty offer.service}">
                <div class="pure-form-aligned">
                    <fieldset>
                        <div class="pure-control-group">
                            <label for="name">Услуга</label>
                            <label id="name">${offer.service.name}</label>
                        </div>
                        <div class="pure-control-group">
                            <label for="date">Цена на услуга</label>
                            <c:if test="${offer.service.promoted}">
                                <label id="date">${offer.service.newPrice}</label>
                            </c:if>
                            <c:if test="${not offer.service.promoted}">
                                <label id="date">${offer.service.price}</label>
                            </c:if>

                        </div>
                    </fieldset>
                </div>
            </c:if>

            <div class="pure-control-group">
                <label for="name">Име</label>
                <form:input path="name" id="name" type="text" placeholder="Име" maxlength="225"/>
            </div>
            <div class="pure-control-group">
                <label for="price">Цена</label>
                <form:input path="price" id="price" type="text" placeholder="Цена(12.99)" maxlength="225"/>
            </div>
            <div class="pure-control-group">
                <label for="from">Валидност от</label>
                <form:input path="fromAsString" id="from" type="text" placeholder="Валидност от" maxlength="225"/>
            </div>
            <div class="pure-control-group">
                <label for="to">Валидност до</label>
                <form:input path="toAsString" id="to" type="text" placeholder="Валидност до" maxlength="225"/>
            </div>
            <div class="pure-control-group">
                <label for="status">Статус</label>
                <form:select path="status" id="status">
                    <c:forEach items="${statuses}" var="status">
                        <form:option value="${status}">${status.name}</form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Запис</button>
            </div>

        </fieldset>
    </form:form>

    <script>
        $(function() {
            $( "#from" ).datepicker({ dateFormat: 'dd/mm/yy' });
            $( "#to" ).datepicker({ dateFormat: 'dd/mm/yy' });
        });
    </script>
</div>