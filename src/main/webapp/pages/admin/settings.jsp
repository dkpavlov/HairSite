<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
    <h1>Настройки</h1>
    <h2>Смяна на паролата</h2>
</div>
<br/>
<div class="content">
    <form class="pure-form pure-form-aligned" id="change-password">
        <fieldset>


            <div class="pure-control-group">
                <label for="old-password">Стара парола</label>
                <input type="password" id="old-password" name="oldPassword"/>
            </div>
            <div class="pure-control-group">
                <label for="old-password">Нова парола</label>
                <input type="password" id="new-password" name="newPassword"/>
            </div>
            <div class="pure-control-group">
                <label for="old-password">Нова парола (пак)</label>
                <input type="password" id="validate-password" name="validatePassword"/>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Запис</button>
            </div>

        </fieldset>
    </form>

    <script>
        $(document).ready(function() {
            $('#change-password').submit(function( event ) {
                event.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/admin/settings",
                    data: $("#change-password").serialize(),
                    success: function(data)
                    {
                        if(data == "SUCCESS"){
                            alert("Паролата беше подменена успешно!");
                            $("#old-password").val("");
                            $("#new-password").val("");
                            $("#validate-password").val("");
                        } else {
                            alert("Невалидна заявка!");
                        }

                    }
                });
                return false;
            });
        });
    </script>
</div>