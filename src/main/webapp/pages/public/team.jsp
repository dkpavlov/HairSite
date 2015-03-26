<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" uri="/jsps/custom.tld" %>

<div class="inner-page team">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>екип</h1>
        </div>
    </div>
    <div class="row">
        <c:forEach items="${page.content}" var="employee">
            <div class="columns four">
                <article class="team">
                    <div class="portrait">
                        <img src="${pageContext.request.contextPath}/storage/${employee.image.fileName}" width="100%"/>
                    </div>
                    <header class="centered-text">${employee.name}</header>
                    <p class="centered-text primary-info">
                        <a href="mailto:">${employee.email}</a>
                            ${employee.phoneNumber}
                    </p>
                    <p class="secondary-info">
                        <label>Длъжност: </label>${employee.description}
                    </p>
                    <p class="secondary-info">
                        <label>Салон: </label>The Mall  <%-- TODO --%>
                    </p>
                    <p class="secondary-info">
                        <label>Опит: </label>${employee.experience}
                    </p>
                    <p class="secondary-info">
                        <label>Дейност: </label>${employee.activity}
                    </p>
                </article>

            </div>
        </c:forEach>
        <%--

        <div class="columns four">
                <article class="team">
                    <div class="portrait">
                        <img src="../../assets/img/personal-image.jpg" width="100%"/>
                    </div>
                    <header class="centered-text">цоло цветков</header>
                    <p class="centered-text primary-info">
                        <a href="mailto:">t.tsvetkov@hairspot.bg</a>
                        088 123 456 82
                    </p>
                    <p class="secondary-info">
                        <label>Длъжност: </label>Главен фризьор
                    </p>
                    <p class="secondary-info">
                        <label>Салон: </label>The Mall
                    </p>
                    <p class="secondary-info">
                        <label>Опит: </label>8 години
                    </p>
                    <p class="secondary-info">
                        <label>Дейност: </label>Мъжко подстригване, дамско подстригване, боядисване, специални прически
                    </p>
                </article>
            </div>

        --%>
    </div>

</div>
<script>
    var setHeight = function (){
        var maxHeight = Math.max.apply(null, $("article.team").map(function ()
        {
            return $(this).height();
        }).get());

        $('article.team').each(function(){
            $(this).css('height', maxHeight);
        });
    };

    $(function(){
        setHeight();
        window.resize = setHeight();
    })
</script>