<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Екип</h1>
    <c:if test="${not empty gallery.id}">
        <h2>Редактиране на ${gallery.name}</h2>
    </c:if>
    <c:if test="${empty gallery.id}">
        <h2>Нова галерия</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="gallery" class="pure-form pure-form-aligned" enctype="multipart/form-data">
        <fieldset>
            <div class="pure-control-group">
                <label for="title">Име</label>
                <form:input path="name" id="title" type="text" placeholder="Име"/>
            </div>

            <c:if test="${empty gallery.id}">
                <div class="pure-control-group">
                    <label for="image">Главно изображение</label>
                    <input type="file" name="file" id="image" placeholder="Снимка"/>
                </div>
            </c:if>

            <c:if test="${not empty gallery.id}">
                <c:if test="${not empty gallery.mainImage}">
                    <div class="pure-control-group">
                            <%-- TODO fix lable position--%>
                        <label for="old-image">Главно изображение</label>
                        <div style="height: 200px; width: 200px; display: inline-block">
                            <img style="max-width: 100%; max-height: 100%;" src="${pageContext.request.contextPath}/storage/${gallery.mainImage.fileName}" id="old-image">
                        </div>
                    </div>
                </c:if>
                <div class="pure-control-group">
                    <label for="image">Нов снимка</label>
                    <input type="file" name="file" id="image" placeholder="Ново главно изображение"/>
                </div>
            </c:if>

            <div class="pure-control-group">
                <label for="image">Изображение</label>
                <input type="file" name="files" class="image" placeholder="Снимка"/>
            </div>

            <div class="pure-control-group">
                <label for="image">Добави изображение</label>
                <input type="button" class="pure-button pure-button-primary" id="add-file" value="Добави"/>
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
    <script>
        $(document).ready(function() {
            $('#add-file').click(function(){
                $(this).parent().before(
                        '<div class="pure-control-group">' +
                            '<label for="image">Изображение</label>' +
                            '<input type="file" name="files" class="image" placeholder="Снимка"/>' +
                        '</div>');
            });
        });
    </script>
</div>