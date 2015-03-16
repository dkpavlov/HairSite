<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="text-align:center;">
    <table class="flat-table">
        <tr>
            <th>From</th>
            <th>Email</th>
            <th>Message</th>
            <th></th>
        </tr>
        <c:forEach items="${messagesPage.content}" var="message">
            <tr>
                <td>${message.name}</td>
                <td>${message.email}</td>
                <td>${message.shortText}</td>
                <td><a href="/admin/messages/${message.id}">Преглед</a></td>
            </tr>
        </c:forEach>
    </table>
</div>