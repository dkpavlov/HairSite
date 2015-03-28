<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Продукти</h1>
    <c:if test="${not empty product.id}">
        <h2>Редактиране на ${product.name}</h2>
    </c:if>
    <c:if test="${empty product.id}">
        <h2>Нова продукт</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="product" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>
            <div class="pure-control-group">
                <label for="title">Име</label>
                <form:input path="name" id="name" type="text" placeholder="Име"/>
            </div>

            <c:if test="${empty product.id}">
                <div class="pure-control-group">
                    <label for="image">Изображение</label>
                    <input type="file" name="file" id="image" placeholder="Изображение"/>
                </div>
            </c:if>

            <c:if test="${not empty product.id}">
                <c:if test="${not empty product.image}">
                    <div class="pure-control-group">
                            <%-- TODO fix lable position--%>
                        <label for="old-image">Изображение</label>
                        <div class="image-container">
                            <div class="image-div">
                                <img src="${pageContext.request.contextPath}/storage/${product.image.fileName}" class="base">
                            </div>
                        </div>
                    </div>
                </c:if>
                <div class="pure-control-group">
                    <label for="image">Нов изображение</label>
                    <input type="file" name="file" id="image" placeholder="Изображение"/>
                </div>
            </c:if>

            <div class="pure-control-group">
                <label for="title">Цена</label>
                <form:input path="price" id="title" type="text" placeholder="Цена(12.99)"/>
            </div>

            <div class="pure-control-group">
                <label for="cb">Промоция</label>
                <form:checkbox path="promoted" id="cb" />
            </div>

            <div class="pure-control-group">
                <label for="new-price">Нова цена</label>
                <form:input path="newPrice" disabled="true" id="new-price" type="text" placeholder="Цена(12.99)"/>
            </div>

            <div class="pure-control-group">
                <label for="text">Описание</label>
                <form:textarea path="description" id="text" type="text" rows="7" cols="70" placeholder="Описание"/>
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