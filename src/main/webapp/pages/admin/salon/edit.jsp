<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Салони</h1>
    <c:if test="${not empty salon.id}">
        <h2>Редактиране на ${salon.name}</h2>
    </c:if>
    <c:if test="${empty salon.id}">
        <h2>Нова салон</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="salon" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>
            <div class="pure-control-group">
                <label for="title">Име</label>
                <form:input path="name" id="title" type="text" placeholder="Име"/>
            </div>
            <c:if test="${not empty salon.images}">
                <div class="pure-control-group">
                    <label>Изображения</label>
                    <div class="image-container">
                        <c:forEach items="${salon.images}" var="image">
                            <div class="image-div">
                                <img src="${pageContext.request.contextPath}/storage/${image.fileName}" class="base">
                                <img src="${pageContext.request.contextPath}/assets/img/remove.png" class="remove">
                                <input type="hidden" value="${image.id}" name="oldImages"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <div class="pure-control-group">
                <label for="image">Изображение</label>
                <input type="file" name="files" class="image" id="image" placeholder="Изображение"/>
            </div>

            <div class="pure-control-group">
                <label for="add-file">Добави изображение</label>
                <input type="button" class="pure-button pure-button-primary" id="add-file" value="Добави"/>
            </div>

            <div class="pure-control-group">
                <label for="text">Описание</label>
                <form:textarea path="information" id="text" type="text" rows="7" cols="70" placeholder="Описание"/>
            </div>

            <div class="pure-control-group">
                <label for="text">Предлагани услуги</label>
                <form:textarea path="providedServices" id="text" type="text" rows="7" cols="70" placeholder="Предлагани услуги"/>
            </div>

            <div class="pure-control-group">
                <label for="text">Контакти</label>
                <form:select path="contact.id">
                    <c:forEach items="${contacts}" var="contact">
                        <form:option value="${contact.id}">${contact.name}</form:option>
                    </c:forEach>
                </form:select>
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
        $(document).ready(function() {
            $('#add-file').click(function(){
                $(this).parent().before(
                        '<div class="pure-control-group">' +
                                '<label for="image">Изображение</label>' +
                                '<input type="file" name="files" class="image" placeholder="Снимка"/>' +
                                '</div>');
            });

            $('.remove').click(function(){
                $(this).parent().remove();
            });
        });
    </script>
</div>