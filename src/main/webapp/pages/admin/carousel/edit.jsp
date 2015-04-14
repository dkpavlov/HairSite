<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Карусел</h1>
    <c:if test="${not empty carousel.id}">
        <h2>Редактиране на ${carousel.name}</h2>
    </c:if>
    <c:if test="${empty carousel.id}">
        <h2>Ново изображение</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="carousel" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>
            <div class="pure-control-group">
                <label for="title">Име</label>
                <form:input path="name" id="title" type="text" placeholder="Име" maxlength="225"/>
            </div>

            <div class="pure-control-group">
                <label for="link">Линк</label>
                <form:input path="href" id="link" type="text" placeholder="Линк" maxlength="225"/>
            </div>

            <c:if test="${empty carousel.id}">
                <div class="pure-control-group">
                    <label for="image">Снимка</label>
                    <input type="file" name="file" id="image" placeholder="Снимка"/>
                </div>
                <div class="pure-control-group">
                    <label for="image-hint"></label>
                    <label id="image-hint">(1600 х 1200)</label>
                </div>
            </c:if>

            <c:if test="${not empty carousel.id}">
                <c:if test="${not empty carousel.image}">
                    <div class="pure-control-group">
                            <%-- TODO fix lable position--%>
                        <label for="old-image">Снимка</label>
                        <img src="${pageContext.request.contextPath}/storage/${carousel.image.fileName}" height="200" width="200" id="old-image">
                    </div>
                </c:if>
                <div class="pure-control-group">
                    <label for="image">Нов снимка</label>
                    <input type="file" name="file" id="image" placeholder="Нов снимка"/>
                </div>
                <div class="pure-control-group">
                    <label for="image-hint"></label>
                    <label id="image-hint">(1600 х 1200)</label>
                </div>
            </c:if>

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
</div>