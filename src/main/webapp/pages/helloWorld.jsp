<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="custom" uri="/jsps/custom.tld" %>

<main>
    <!-- carousel -->
    <div class="row">
        <div class="columns twelve">
            <div class="row box sides-hz-1">
               <ul class="bxslider">
                   <!-- изображенията трябва да са в съотношение 4:3 (1600 х 1200 препоръчителна резолюция) -->
                   <c:forEach items="${carousel}" var="image">
                       <c:if test="${not empty image.image}">
                           <c:if test="${not empty image.href}">
                               <li><a href="${image.href}" target="_blank"><img src="${pageContext.request.contextPath}/storage/${image.image.fileName}" /></a></li>
                           </c:if>
                           <c:if test="${empty image.href}">
                               <li><a href="#"><img src="${pageContext.request.contextPath}/storage/${image.image.fileName}" /></a></li>
                           </c:if>
                       </c:if>
                   </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!-- summary -->
    <div class="row">
        <div class="columns twelve summary">
            <section class="columns four">
                <header>галерия</header>
                <div class="row">
                    <c:forEach items="${galleryLinks}" var="link">
                        <div class="columns two">
                            <a href="${link.href}">
                                <img src="${pageContext.request.contextPath}/storage/${link.image.fileName}" width="73%" alt="Прическа 2"/>
                            </a>
                        </div>
                    </c:forEach>
                    <%--<div class="columns two offset-two">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/storage/${link.image.fileName}"  alt="Прическа 1"/>
                        </a>
                    </div>--%>
                    <%--<div class="columns two">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/assets/img/gal_2.jpg" width="68%" alt="Прическа 2"/>
                        </a>
                    </div>
                    <div class="columns two">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/assets/img/gal_3.jpg" width="65%" alt="Прическа 3"/>
                        </a>
                    </div>
                    <div class="columns two">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/assets/img/gal_4.jpg" width="73%" alt="Прическа 4"/>
                        </a>
                    </div>
                    <div class="columns two">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/assets/img/gal_5.jpg" width="65%" alt="Прическа 5"/>
                        </a>
                    </div>--%>
                </div>
            </section>
            <section class="columns four">
                <header>салони</header>
                <div class="row">
                    <div class="columns twelve">
                        <div class="columns four saloon">
                            <a href="${pageContext.request.contextPath}/salons/${salonOne.id}">${salonOne.name}</a>
                                <span class="sub-saloon">салон 1</span>
                        </div>
                        <div class="columns four pointer">
                            <img src="${pageContext.request.contextPath}/assets/img/pointer_saloons.png" alt="Указател на местоположение"/>
                        </div>
                        <div class="columns four saloon">
                            <a href="${pageContext.request.contextPath}/salons/${salonTwo.id}">${salonTwo.name}</a>
                                <span class="sub-saloon">салон 2</span>

                        </div>
                    </div>
                </div>
            </section>
            <section class="columns four">
                <header>новини</header>
                <div class="row">
                    <div class="columns twelve">
                        <article class="news">
                            <c:if test="${not empty latestNews}">
                                <header><a href="#">${latestNews.title}</a></header>
                                <p class="date"><fmt:formatDate pattern="dd.MM.yyyy" value="${latestNews.dateCreated}"/></p>
                                <p class="news"><custom:shortText text="${latestNews.text}" charecters="116"/></p>
                            </c:if>
                        </article>
                    </div>
                </div>
            </section>
        </div>
    </div>
</main>

<script>
    $(function(){
        $('.bxslider').bxSlider({
            mode: 'fade',
            auto: true
        });
        $('.box.sides-hz-1').shadow({type:'sides', sides:'hz-1'});
    })
</script>
