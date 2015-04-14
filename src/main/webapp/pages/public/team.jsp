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
                        <%--<a href="mailto:">${employee.email}</a>
                            ${employee.phoneNumber}--%>
                    </p>
                    <p class="secondary-info">
                        <label>Длъжност: </label>${employee.description}
                    </p>
                    <p class="secondary-info">
                        <label>Салон: </label><c:if test="${not empty employee.salon}"><a href="${pageContext.request.contextPath}/salons/${employee.salon.id}">${employee.salon.name}</a></c:if>
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
    </div>

</div>
<script type="text/javascript">
    var setHeight = function (){
        var max = -1;
        $('article.team').each(function() {
            $(this).height('auto');
            var h = $(this).height();
            max = h > max ? h : max;
        });

        $('article.team').each(function(){
            $(this).height(max);
        });
    };

    $(function(){
        setHeight();
    })

    window.onresize = setHeight;
</script>