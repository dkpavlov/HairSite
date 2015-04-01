<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <div id="map-canvas"></div>
        </div>
    </div>
    <div class="row">
        <c:forEach items="${contacts}" var="contact">
            <div class="columns six saloon-contacts">
                <article>
                    <header>${contact.name}</header>
                    <div class="row">
                        <div class="columns two">
                            <label class="pointer">
                                Адрес:
                            </label>
                        </div>
                        <div class="columns eight">
                            ${contact.address}
                        </div>
                    </div>
                    <div class="row">
                        <div class="columns two">
                            <label class="pointer">
                                Телефон:
                            </label>
                        </div>
                        <div class="columns eight">
                            ${contact.phoneNumber}
                        </div>
                    </div>
                    <div class="row">
                        <div class="columns two">
                            <label class="pointer">
                                Мобилен:
                            </label>
                        </div>
                        <div class="columns eight">
                            ${contact.mobileNumber}
                        </div>
                    </div>
                    <div class="row">
                        <div class="columns two">
                            <label class="pointer">
                                E-Mail:
                            </label>
                        </div>
                        <div class="columns eight">
                            ${contact.email}
                        </div>
                    </div>
                    <div class="row">
                        <div class="columns two">
                            <label class="pointer">
                                Skype:
                            </label>
                        </div>
                        <div class="columns eight">
                            ${contact.skype}
                        </div>
                    </div>
                </article>
            </div>
        </c:forEach>
    </div>
    <div class="row">
        <div class="columns twelve">
            <h1>напиши ни съобщение</h1>
        </div>
    </div>
    <form:form modelAttribute="message">
        <div class="row form">
            <div class="columns six">
                <form:input path="name" type="text" placeholder="Име" class="name error" maxlength="225"/>
            </div>
            <div class="columns six">
                <form:input path="email" type="email" placeholder="Email" class="email" maxlength="225"/>
            </div>
        </div>
        <div class="row form">
            <div class="columns twelve">
                <form:textarea path="text" class="message" placeholder="Съобщение" maxlength="2048"/>
            </div>
        </div>
        <div class="row">
            <div class="columns twelve ta-right">
                <input type="submit" value="ИЗПРАТИ"/>
            </div>
        </div>
    </form:form>
</div>

<script>
    function initialize() {
        var mapCanvas = document.getElementById('map-canvas');
        /* TODO set good center */
        var mapCenter = new google.maps.LatLng(42.660573,23.383137);
        /* TODO use custom marker */
        var baseIconDir = '${pageContext.request.contextPath}/assets/img/';

        var color = "#291400";

        var mapOptions = {
            center: mapCenter,
            zoom: 12,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions);

        <c:forEach items="${contacts}" var="contact">
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(${contact.latitude}, ${contact.longitude}),
                map: map,
                icon: baseIconDir + 'pointer_saloons.png'
            });
        </c:forEach>

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