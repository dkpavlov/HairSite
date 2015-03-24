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
    <form:form modelAttribute="offering" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>

            <%-- TODO display review of product/service --%>

            <div class="pure-control-group">
                <label for="price">Цена</label>
                <form:input path="price" id="price" type="text" placeholder="Цена(12.99)"/>
            </div>
            <div class="pure-control-group">
                <label for="from">Валидност от</label>
                <form:input path="fromAsString" id="from" type="text" placeholder="Валидност от"/>
            </div>
            <div class="pure-control-group">
                <label for="to">Валидност до</label>
                <form:input path="toAsString" id="to" type="text" placeholder="Валидност до"/>
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