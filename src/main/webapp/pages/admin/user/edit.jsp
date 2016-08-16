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
                <form:errors path="username" cssClass="error" />
            </div>

            <div class="pure-control-group">
                <label for="password1">Парола</label>
                <form:password path="password1" id="password1" maxlength="225"/>
                <form:errors path="password1" cssClass="error" />
            </div>

            <div class="pure-control-group">
                <label for="password2">Потвърди парола</label>
                <form:password path="password2" id="password2" maxlength="225"/>
                <form:errors path="password2" cssClass="error" />
            </div>

            <div class="pure-control-group">
                <label for="role">Статус</label>
                <form:select path="role" id="role">
                    <form:option value="ADMINISTRATOR">Администратор</form:option>
                    <form:option value="EMPLOYEE">Служител</form:option>
                </form:select>
            </div>
            <c:if test="${empty user.id}">
                <table class="pure-table pure-table-bordered">
                    <thead>
                        <tr>
                            <th>Услуга</th>
                            <th>Цена</th>
                            <th>Цена за служител</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${serviceItemList}" var="serviceItem" varStatus="status">
                            <tr>
                                <td>${serviceItem.name}</td>
                                <td>${serviceItem.salonPrice}</td>
                                <td>
                                    <form:hidden path="prices[${status.index}].serviceItem.id" value="${serviceItem.id}"/>
                                    <form:input path="prices[${status.index}].userPrice" type="text" value="0" maxlength="225"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${not empty user.id}">
                            <table class="pure-table pure-table-bordered">
                                <thead>
                                    <tr>
                                        <th>Услуга</th>
                                        <th>Цена</th>
                                        <th>Цена за служител</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${user.prices}" var="serviceItem" varStatus="status">
                                        <tr>
                                            <td>${serviceItem.serviceItem.name}</td>
                                            <td>${serviceItem.serviceItem.salonPrice}</td>
                                            <td>
                                                <form:hidden path="prices[${status.index}].serviceItem.id" value="${serviceItem.serviceItem.id}"/>
                                                <form:input path="prices[${status.index}].userPrice" type="text" value="${serviceItem.userPrice}" maxlength="225"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
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