<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="header">
    <h1>Съобщения</h1>
    <h2>Преглед на съобщение от:</h2>
    <h2>${message.name} Дата: <fmt:formatDate pattern="HH:mm dd-MM-yyyy" value="${message.dateCreated}"/> </h2>
</div>
<br/><br/>
<div class="content">
    <div class="pure-form-aligned">
        <fieldset>
            <div class="pure-control-group">
                <label for="name">Име</label>
                <label id="name">${message.name}</label>
            </div>
            <div class="pure-control-group">
                <label for="date">Дата</label>
                <label id="date"><fmt:formatDate pattern="HH:mm dd-MM-yyyy" value="${message.dateCreated}"/></label>
            </div>
            <div class="pure-control-group">
                <label for="email">Е-mail</label>
                <label id="email">${message.email}</label>
            </div>
            <div class="pure-control-group">
                <label for="text">Текст</label>
                <label id="text">${message.text}</label>
                <%-- TODO check with long text--%>
            </div>
        </fieldset>
    </div>
    <br/><br/>
    <a class="pure-button pure-button-primary" href="/admin/messages/${message.id}/delete">Изтрий</a>
</div>
