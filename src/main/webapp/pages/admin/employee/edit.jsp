<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Екип</h1>
    <c:if test="${not empty employee.id}">
        <h2>Редактиране на ${employee.name}</h2>
    </c:if>
    <c:if test="${empty employee.id}">
        <h2>Нов служител</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="employee" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>
            <div class="pure-control-group">
                <label for="title">Име</label>
                <form:input path="name" id="title" type="text" placeholder="Име"/>
            </div>

            <c:if test="${empty employee.id}">
                <div class="pure-control-group">
                    <label for="image">Снимка</label>
                    <input type="file" name="file" id="image" placeholder="Снимка"/>
                </div>
            </c:if>

            <c:if test="${not empty employee.id}">
                <c:if test="${not empty employee.image}">
                    <div class="pure-control-group">
                            <%-- TODO fix lable position--%>
                        <label for="old-image">Снимка</label>
                        <img src="${pageContext.request.contextPath}/storage/${employee.image.fileName}" height="200" width="200" id="old-image">
                    </div>
                </c:if>
                <div class="pure-control-group">
                    <label for="image">Нов снимка</label>
                    <input type="file" name="file" id="image" placeholder="Нов снимка"/>
                </div>
            </c:if>

            <div class="pure-control-group">
                <label for="title">Длъжност</label>
                <form:input path="description" id="title" type="text" placeholder="Длъжност"/>
            </div>

            <div class="pure-control-group">
                <label for="title">Опит</label>
                <form:input path="experience" id="title" type="text" placeholder="Опит"/>
            </div>

            <div class="pure-control-group">
                <label for="text">Салон</label>
                <form:select path="salon.id">
                    <option></option>
                    <c:forEach items="${salons}" var="salon">
                        <form:option value="${salon.id}">${salon.name}</form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="pure-control-group">
                <label for="text">Дейност</label>
                <form:textarea path="activity" id="text" type="text" rows="7" cols="70" placeholder="Дейност"/>
            </div>

            <div class="pure-control-group">
                <label for="title">E-Mail</label>
                <form:input path="email" id="title" type="text" placeholder="E-Mail"/>
            </div>

            <div class="pure-control-group">
                <label for="title">Телефон</label>
                <form:input path="phoneNumber" id="title" type="text" placeholder="Телефон"/>
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
</div>