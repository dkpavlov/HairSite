<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Системни материали</h1>
    <h2>Нов системн материал</h2>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="serviceMaterial" class="pure-form pure-form-aligned">
        <fieldset>
            <div class="pure-control-group">
                <label for="name">Име</label>
                <form:input path="name" id="name" type="text" placeholder="Име" maxlength="225"/>
            </div>

            <div class="pure-control-group">
                <label for="salonPrice">Цена за гр./мл.</label>
                <form:input path="price" id="salonPrice" type="text" placeholder="Цена(12.99)" maxlength="225"/>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Запис</button>
            </div>
        </fieldset>
    </form:form>
</div>