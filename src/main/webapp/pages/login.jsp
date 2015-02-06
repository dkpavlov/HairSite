<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <link href="assets/css/style.css" rel="stylesheet"></link>
    </head>
    <body>
        <form name="login" action="<c:url value='/j_spring_security_check' />" method="POST">
            <div>
                <label><spring:message code="username"/></label>
                <input type="text" name="username"/>
            </div>
            <div>
                <label><spring:message code="password"/></label>
                <input type="password" name="password"/>
            </div>
            <c:if test="${not empty error}">
                <div style="color: red">
                    ${error}
                </div>
            </c:if>
            <input type="submit" class="submit"/>
        </form>
    </body>
</html>
