<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table>
    <tr>
        <th>From</th>
        <th>Email</th>
        <th>Message</th>
    </tr>
    <c:forEach items="${messagesPage.content}" var="message">
        <tr>
            <th>${message.name}</th>
            <th>${message.email}</th>
            <th>${message.shortText}</th>
        </tr>
    </c:forEach>
</table>