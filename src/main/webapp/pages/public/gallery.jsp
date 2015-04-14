<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>галерия</h1>
        </div>
    </div>
    <div class="row">

        <c:forEach items="${list}" var="gallery">
            <div class="columns three gallery">
                <a href="${pageContext.request.contextPath}/gallery/${gallery.id}">
                    <div class="gallery-image">
                        <img src="${pageContext.request.contextPath}/storage/${gallery.mainImage.fileName}" width="100%"/>
                        <div class="gallery-hover"></div>
                    </div>
                    <h2>${gallery.name}</h2>
                </a>
                <label class="gallery-content">
                    ${gallery.gallerySize} снимки
                </label>
            </div>
        </c:forEach>

    </div>
</div>

<script>
    var setHeight = function (){
        var max = -1;
        $('div.gallery').each(function() {
            $(this).height('auto');
            var h = $(this).height();
            max = h > max ? h : max;
        });

        $('div.gallery').each(function(){
            $(this).height(max);
        });
    };

    var setHoverHeight = function(){
        $('gallery-hover').each(function(){
            $(this).height('auto');
            var hover_h = $(this).parent().find('img').height();
            $(this).height(hover_h);
        })
    };

    $(function(){
        setHeight();
        setHoverHeight()
    })

    window.onresize = function (){
        setHeight();
        setHoverHeight();
    }
</script>