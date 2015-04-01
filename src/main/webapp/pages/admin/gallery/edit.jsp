<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Галерия</h1>
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
                <form:input path="name" id="title" type="text" placeholder="Име" maxlength="225"/>
            </div>

            <c:if test="${empty gallery.id}">
                <div class="pure-control-group">
                    <label for="image">Главно изображение</label>
                    <input type="file" name="file" placeholder="Снимка"/>
                </div>
            </c:if>

            <c:if test="${not empty gallery.id}">
                <c:if test="${not empty gallery.mainImage}">
                    <div class="pure-control-group">
                        <label for="old-image">Главно изображение</label>
                        <div class="image-container">
                            <div class="image-div">
                                <img src="${pageContext.request.contextPath}/storage/${gallery.mainImage.fileName}" class="base">
                            </div>
                        </div>
                    </div>
                </c:if>
                <div class="pure-control-group">
                    <label for="image">Нов снимка</label>
                    <input type="file" name="file" id="image" placeholder="Ново главно изображение"/>
                </div>
                <c:if test="${not empty gallery.images}">
                    <div class="pure-control-group">
                        <label>Изображения</label>
                        <div class="image-container">
                            <c:forEach items="${gallery.images}" var="image">
                                <div class="image-div">
                                    <img src="${pageContext.request.contextPath}/storage/${image.fileName}" class="base">
                                    <img src="${pageContext.request.contextPath}/assets/img/remove.png" class="remove">
                                    <input type="hidden" value="${image.id}" name="oldImages"/>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
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
                /*TODO add confirm*/
                $(this).parent().remove();
            });
        });
    </script>
</div>