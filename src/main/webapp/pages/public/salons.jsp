<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>${salon.name}</h1>
        </div>
    </div>
    <div class="row horizontal-separator">
        <div id="gallery">
            <ul>
                <c:forEach items="${salon.images}" var="image">
                    <li><img src="${pageContext.request.contextPath}/storage/${image.fileName}" /></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="row horizontal-separator">

        <div class="columns eight">
            <div class="row">
                <h2 class="saloon">описание</h2>
                <p>${salon.information}</p>
                <h2 class="saloon">предлагани услуги</h2>
                <p>${salon.providedServices}</p>
            </div>
        </div>

        <div class="columns four">
            <h2 class="saloon">персонал на салона</h2>
            <c:forEach items="${salon.employees}" var="employee">
                <c:if test="${employee.status eq 'ACTIVE'}">
                    <div class="row">
                        <article class="team saloon">
                            <div class="portrait columns two v-middle">
                                <img src="${pageContext.request.contextPath}/storage/${employee.image.fileName}" width="100%"/>
                            </div>
                            <header class=" columns nine saloon-personal-name">${employee.name}</header>
                        </article>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <div class="row">
        <div class="columns twelve content">
            <div id="map-canvas"></div>
        </div>
    </div>
    <div class="row">
        <div class="columns six saloon-contacts no-separator">
            <article>
                <header>${salon.contact.name}</header>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Адрес:
                        </label>
                    </div>
                    <div class="columns eight">
                        ${salon.contact.address}
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Телефон:
                        </label>
                    </div>
                    <div class="columns eight">
                        ${salon.contact.phoneNumber}
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Мобилен:
                        </label>
                    </div>
                    <div class="columns eight">
                        ${salon.contact.mobileNumber}
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            E-Mail:
                        </label>
                    </div>
                    <div class="columns eight">
                        ${salon.contact.email}
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Skype:
                        </label>
                    </div>
                    <div class="columns eight">
                        ${salon.contact.skype}
                    </div>
                </div>
            </article>
        </div>
    </div>
</div>

<script language="javascript">
    $(document).ready(function(){
        $("#gallery").tiksluscarousel({nav:'thumbnails', autoplayInterval:20000});  //called with all default values
    });
    function initialize() {
        var mapCanvas = document.getElementById('map-canvas');
        /* TODO set good center */
        <c:if test="${not empty salon.contact}">
            var mapCenter = new google.maps.LatLng(${salon.contact.latitude}, ${salon.contact.longitude});
        </c:if>
        <c:if test="${empty salon.contact}">
            var mapCenter = new google.maps.LatLng(42.660573,23.383137);
        </c:if>
        /* TODO use custom marker */
        var baseIconDir = '${pageContext.request.contextPath}/assets/img/';

        var color = "#291400";

        var mapOptions = {
            center: mapCenter,
            zoom: 12,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions);

        <c:if test="${not empty salon.contact}">
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(${salon.contact.latitude}, ${salon.contact.longitude}),
                map: map,
                icon: baseIconDir + 'pointer_saloons.png'
            });
        </c:if>

        var bounds = new google.maps.LatLngBounds(
                new google.maps.LatLng(-84.999999, -179.999999),
                new google.maps.LatLng(84.999999, 179.999999));

        var rect = new google.maps.Rectangle({
            bounds: bounds,
            fillColor: color,
            fillOpacity: 0.5,
            strokeWeight: 0,
            map: map
        });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>