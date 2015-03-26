<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Новини</h1>
    <c:if test="${not empty service.id}">
        <h2>Редактиране на ${service.name}</h2>
    </c:if>
    <c:if test="${empty service.id}">
        <h2>Нова услуга</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="service" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>
            <div class="pure-control-group">
                <label for="title">Име</label>
                <form:input path="name" id="name" type="text" placeholder="Име"/>
            </div>

            <c:if test="${empty service.id}">
                <div class="pure-control-group">
                    <label for="image">Изображение</label>
                    <input type="file" name="file" id="image" placeholder="Изображение"/>
                </div>
            </c:if>

            <c:if test="${not empty service.id}">
                <c:if test="${not empty service.mainImage}">
                    <div class="pure-control-group">
                            <%-- TODO fix lable position--%>
                        <label for="old-image">Изображение</label>
                        <img src="${pageContext.request.contextPath}/storage/${service.mainImage.fileName}" height="200" width="200" id="old-image">
                    </div>
                </c:if>
                <div class="pure-control-group">
                    <label for="image">Нов изображение</label>
                    <input type="file" name="file" id="image" placeholder="Изображение"/>
                </div>
            </c:if>

            <div class="pure-control-group">
                <label for="title">Цена</label>
                <form:input path="price" id="title" type="text" placeholder="Цена(12,99)"/>
            </div>

            <div class="pure-control-group">
                <label for="text">Описание</label>
                <form:textarea path="description" id="text" type="text" rows="7" cols="70" placeholder="Описание"/>
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