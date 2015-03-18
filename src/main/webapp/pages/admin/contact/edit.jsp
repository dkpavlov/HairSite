<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Контакти</h1>
    <c:if test="${not empty contact.id}">
    <h2>Редактиране на ${contact.name}</h2>
    </c:if>
    <c:if test="${empty contact.id}">
    <h2>Нов контакт</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="contact" class="pure-form pure-form-aligned">
        <fieldset>
            <div class="pure-control-group">
                <label for="name">Име</label>
                <form:input path="name" id="name" type="text" placeholder="Име"/>
            </div>

            <div class="pure-control-group">
                <label for="address">Адрес</label>
                <form:textarea path="address" id="address" type="text" rows="4" cols="50" placeholder="Адрес"/>
            </div>

            <div class="pure-control-group">
                <label for="phoneNumber">Телефон</label>
                <form:input path="phoneNumber" id="phoneNumber" type="tel" placeholder="Телефон"/>
            </div>

            <div class="pure-control-group">
                <label for="mobileNumber">Мобилен</label>
                <form:input path="mobileNumber" id="mobileNumber" type="tel" placeholder="Мобилен"/>
            </div>

            <div class="pure-control-group">
                <label for="email">E-Mail</label>
                <form:input path="email" id="email" type="email" placeholder="E-Mail"/>
            </div>

            <div class="pure-control-group">
                <label for="skype">Skype</label>
                <form:input path="skype" id="skype" type="text" placeholder="Skype"/>
            </div>

            <div class="pure-control-group">
                <label>Координати</label>
                <form:input path="latitude" placeholder="Latitude"/>
                <form:input path="longitude" placeholder="Longitude"/>
            </div>

            <div class="pure-control-group">
                <label for="status">Статус</label>
                <form:select path="status" id="status">
                    <c:forEach items="${statuses}" var="status">
                        <form:option value="${status}"/>
                    </c:forEach>
                </form:select>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Запис</button>
            </div>
        </fieldset>
    </form:form>
</div>