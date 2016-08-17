<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="header">
    <h1>Отчет</h1>
</div>

<div class="content">

    <form class="pure-form pure-form-stacked">
        <fieldset>
            <legend>Филтър</legend>
            <div class="pure-g">
                <div class="pure-u-1 pure-u-md-1-3">
                    <label for="from-date">От дата</label>
                    <input id="from-date" class="pure-u-23-24" type="text">
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label for="to-date">До дата</label>
                    <input id="to-date" class="pure-u-23-24" type="text">
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label for="employee">Служител</label>
                    <select id="employee" class="pure-input-1-2">
                        <c:forEach items="${userList}" var="user">
                            <option value="${user.id}">${user.username}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <br/>
            <button type="submit" class="pure-button pure-button-primary">Submit</button>
            <button type="button" class="pure-button pure-button-primary">Експорт</button>
        </fieldset>
    </form>

    <br/><br/>
    <table class="pure-table pure-table-bordered">
        <thead>
            <tr>
                <th>Дата</th>
                <th>Служител</th>
                <th>Обща сума</th>
                <th>Дял за служител</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${page.content}" var="receipt">
                <tr>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${receipt.createdAt}"/></td>
                    <td>${receipt.seller.username}</td>
                    <td>${receipt.totalAmount}</td>
                    <td>${receipt.sellerAmount}</td>
                    <td><a class="pure-button" href="${pageContext.request.contextPath}/admin/receipt/${receipt.id}">Преглед</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br/><br/>

    <%-- TODO fix paging--%>
    <%--<div class="paginator">
        <a href="/?page=9" class="paginator-previous">Previous</a>
        <a href="/?page=8" class="paginator-page paginator-page-first">8</a>
        <a href="/?page=9" class="paginator-page">9</a>
        <a href="/?page=10" class="paginator-current">10</a>
        <a href="/?page=11" class="paginator-page">11</a>
        <a href="/?page=12" class="paginator-page paginator-page-last">12</a>
        <a href="/?page=11" class="paginator-next">Next</a>
    </div>--%>

    <script>
        $(function() {
            $("#from-date").datepicker({ dateFormat: 'yy-mm-dd' });
            $("#to-date").datepicker({ dateFormat: 'yy-mm-dd' });
        });
    </script>

</div>