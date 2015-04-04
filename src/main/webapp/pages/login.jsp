<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
    <h1>Login</h1>
</div>
<br/><br/>
<div class="content" style="max-width: 500px">
    <form name="login" class="pure-form pure-form-aligned" action="<c:url value='/j_spring_security_check' />" method="POST">
        <div class="pure-control-group">
            <label>Password</label>
            <input type="text" name="username"/>
        </div>
        <div class="pure-control-group">
            <label>Username</label>
            <input type="password" name="password"/>
        </div>
        <c:if test="${not empty error}">
            <div style="color: red">
                ${error}
            </div>
        </c:if>
        <div class="pure-controls">
            <input type="submit" class="pure-button pure-button-primary" value="Login"/>
        </div>
    </form>
</div>
