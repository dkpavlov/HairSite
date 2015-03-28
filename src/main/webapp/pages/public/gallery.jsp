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
        var maxHeight = Math.max.apply(null, $("div.gallery").map(function ()
        {
            return $(this).height();
        }).get());

        $('div.gallery').each(function(){
            $(this).css('height', maxHeight);
        });
    };

    $(function(){
        setHeight();
        window.resize = setHeight();
    })
</script>