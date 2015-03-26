<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" uri="/jsps/custom.tld" %>

<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>продукти</h1>
        </div>
    </div>

    <c:forEach items="${page.content}" var="product">
        <div class="row single-news">
            <div class="columns three">
                <a href="" class="news-image"><img src="${pageContext.request.contextPath}/storage/${product.image.fileName}" width="100%"/></a>
            </div>
            <div class="columns nine news-container">
                <article class="news">
                    <header>${product.name}</header>
                    <p class="price"><custom:doubleFormat number="${product.price}" part="i"/>.<sup><custom:doubleFormat number="${product.price}" part="f"/></sup> <small>лева</small></p>
                    <p class="news-description"><custom:shortText text="${product.description}" charecters="116"/></p>
                    <div class="whole-news hide">
                        <%-- TODO open and hide this --%>
                        <p>${product.description}</p>
                        <p class="close">
                            <a class="link" href="">Затвори</a>
                        </p>
                    </div>
                </article>
            </div>
        </div>
    </c:forEach>

    <div class="row pagination">
        <div class="columns twelve">
            <a href="">
                <img src="${pageContext.request.contextPath}/assets/img/pagination-prev.png" />
            </a>
            <a href="">1</a>
            <a href="">2</a>
            <a href="" class="active">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href="">
                <img src="${pageContext.request.contextPath}/assets/img/pagination-next.png"/>
            </a>
        </div>
    </div>
</div>

<script>
    $(function(){
        $('.news-image').click(function(){
            $(this).parent().next().find('p.news-description').addClass('hide');
            $(this).parent().next().find('div.whole-news').removeClass('hide');
            return false;
        });
        $('p.close a.link').click(function(){
            $(this).parent().parent().addClass('hide');
            $(this).parent().parent().parent().find('p.news-description').removeClass('hide');
            return false;
        })
    })
</script>