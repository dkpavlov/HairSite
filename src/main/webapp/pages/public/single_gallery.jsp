<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1 class="single-gallery"><a href="">галерия </a><span class="clich"></span> ${gallery.name} </h1>
        </div>
    </div>
    <div class="row">
        <div id="gallery">
            <ul>
                <c:forEach items="${gallery.images}" var="image">
                    <li><img src="${pageContext.request.contextPath}/storage/${image.fileName}" /></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<script language="javascript">
    $(document).ready(function(){
        $("#gallery").tiksluscarousel({nav:'thumbnails', autoplayInterval:20000});  //called with all default values
    });
</script>