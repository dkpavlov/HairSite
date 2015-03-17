<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header">
    <h1>Контакти</h1>
    <h2>Всички контакти</h2>
</div>

<div class="content">
    <table class="pure-table pure-table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Make</th>
                <th>Model</th>
                <th>Year</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${page.content}" var="contact">
                <tr>
                    <td>1</td>
                    <td>Honda</td>
                    <td>Accord</td>
                    <td>2009</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>