<%@ page import="com.site.models.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                    <p class="news-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec facilisis diam porttitor ex tempus, quis cursus diam ...</p>
                    <div class="whole-news hide">
                        <p>Donec porta porttitor est vitae aliquam. In elit neque, tempus placerat ligula a, aliquet pulvinar enim. Aliquam erat volutpat. Etiam molestie enim ac turpis accumsan molestie. Aliquam eros metus, cursus ac nunc non, faucibus congue ligula. Sed scelerisque tempus ultrices. Donec malesuada eget velit in malesuada. Sed sit amet pulvinar urna, maximus convallis dolor. Ut ultrices ultricies purus a tristique. Proin quis elit ultricies, fringilla purus ac, laoreet diam. Pellentesque sed pellentesque odio, ut rutrum risus. Cras bibendum ornare facilisis. Curabitur aliquam fermentum tristique.</p>
                        <p>Donec porta porttitor est vitae aliquam. In elit neque, tempus placerat ligula a, aliquet pulvinar enim. Aliquam erat volutpat. Etiam molestie enim ac turpis accumsan molestie. Aliquam eros metus, cursus ac nunc non, faucibus congue ligula. Sed scelerisque tempus ultrices. Donec malesuada eget velit in malesuada. Sed sit amet pulvinar urna, maximus convallis dolor. Ut ultrices ultricies purus a tristique. Proin quis elit ultricies, fringilla purus ac, laoreet diam. Pellentesque sed pellentesque odio, ut rutrum risus. Cras bibendum ornare facilisis. Curabitur aliquam fermentum tristique.</p>
                        <p>Donec porta porttitor est vitae aliquam. In elit neque, tempus placerat ligula a, aliquet pulvinar enim. Aliquam erat volutpat. Etiam molestie enim ac turpis accumsan molestie. Aliquam eros metus, cursus ac nunc non, faucibus congue ligula. Sed scelerisque tempus ultrices. Donec malesuada eget velit in malesuada. Sed sit amet pulvinar urna, maximus convallis dolor. Ut ultrices ultricies purus a tristique. Proin quis elit ultricies, fringilla purus ac, laoreet diam. Pellentesque sed pellentesque odio, ut rutrum risus. Cras bibendum ornare facilisis. Curabitur aliquam fermentum tristique.</p>
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
                <img src="../../assets/img/pagination-prev.png" />
            </a>
            <a href="">1</a>
            <a href="">2</a>
            <a href="" class="active">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href="">
                <img src="../../assets/img/pagination-next.png"/>
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