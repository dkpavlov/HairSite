<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Новини</h1>
    <c:if test="${not empty user.id}">
        <h2>Редактиране на ${user.username}</h2>
    </c:if>
    <c:if test="${empty user.id}">
        <h2>Нова потребител</h2>
    </c:if>
</div>
<br/>
<div class="content">
    <form:form modelAttribute="user" class="pure-form pure-form-aligned">
        <fieldset>
            <div class="pure-control-group">
                <label for="username">Потребителско име</label>
                <form:input path="username" id="username" type="text" placeholder="Потребителско име" maxlength="225"/>
            </div>

            <div class="pure-control-group">
                <label for="password1">Парола</label>
                <form:password path="password1" id="password1" maxlength="225"/>
            </div>

            <div class="pure-control-group">
                <label for="password2">Потвърди парола</label>
                <form:password path="password2" id="password2" maxlength="225"/>
            </div>

            <div class="pure-control-group">
                <label for="role">Статус</label>
                <form:select path="role" id="role">
                    <form:option value="ADMINISTRATOR">Администратор</form:option>
                    <form:option value="EMPLOYEE">Служител</form:option>
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