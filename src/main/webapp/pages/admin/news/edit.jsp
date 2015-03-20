<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Новини</h1>
    <c:if test="${not empty news.id}">
        <h2>Редактиране на ${news.title}</h2>
    </c:if>
    <c:if test="${empty news.id}">
        <h2>Нова новини</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="news" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>
            <div class="pure-control-group">
                <label for="title">Заглавие</label>
                <form:input path="title" id="title" type="text" placeholder="Заглавие"/>
            </div>

            <c:if test="${empty news.id}">
                <div class="pure-control-group">
                    <label for="image">Изображение</label>
                    <input type="file" name="file" id="image" placeholder="Изображение"/>
                </div>
            </c:if>

            <c:if test="${not empty news.id}">
                <c:if test="${not empty news.image}">
                    <div class="pure-control-group">
                        <%-- TODO fix lable position--%>
                        <label for="old-image">Изображение</label>
                        <img src="${pageContext.request.contextPath}/storage/${news.image.fileName}" height="200" width="200" id="old-image">
                    </div>
                </c:if>
                <div class="pure-control-group">
                    <label for="image">Нов изображение</label>
                    <input type="file" name="file" id="image" placeholder="Изображение"/>
                </div>
            </c:if>

            <div class="pure-control-group">
                <label for="text">Текст</label>
                <form:textarea path="text" id="text" type="text" rows="7" cols="70" placeholder="Текст"/>
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