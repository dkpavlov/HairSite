<main class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <div id="map-canvas"></div>
        </div>
    </div>
    <div class="row">
        <div class="columns six saloon-contacts">
            <article>
                <header>салон 1 - the mall</header>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Адрес:
                        </label>
                    </div>
                    <div class="columns eight">
                        1175 София, бул. Цариградско Шосе 85, The Mall, етаж 2
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Телефон:
                        </label>
                    </div>
                    <div class="columns eight">
                        +359 2 975 15 75
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Мобилен:
                        </label>
                    </div>
                    <div class="columns eight">
                        +359 88 555 03 51
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            E-Mail:
                        </label>
                    </div>
                    <div class="columns eight">
                        salon_the_mall@hairspot.bg
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Skype:
                        </label>
                    </div>
                    <div class="columns eight">
                        hairspot.eu
                    </div>
                </div>
            </article>
        </div>
        <div class="columns six saloon-contacts">
            <article>
                <header>салон 2 - стрелбище</header>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Адрес:
                        </label>
                    </div>
                    <div class="columns eight">
                        1000 София, ж.к. Стрелбище,
                        ул. Майор Първан Тошев 18-20
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Телефон:
                        </label>
                    </div>
                    <div class="columns eight">
                        +359 2 975 15 75
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Мобилен:
                        </label>
                    </div>
                    <div class="columns eight">
                        +359 88 555 03 51
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            E-Mail:
                        </label>
                    </div>
                    <div class="columns eight">
                        salon_the_mall@hairspot.bg
                    </div>
                </div>
                <div class="row">
                    <div class="columns two">
                        <label class="pointer">
                            Skype:
                        </label>
                    </div>
                    <div class="columns eight">
                        hairspot.eu
                    </div>
                </div>
            </article>
        </div>
    </div>
</main>


<!------    TO DO Da vidia istoriata s markerite      -->

<script>
    function initialize() {
        var mapCanvas = document.getElementById('map-canvas');

        var mapOptions = {
            center: new google.maps.LatLng(42.660573,23.383137),
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions);
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(42.660573,23.383137),
            map: mapCanvas,
            title:"Hello World!"
        });
        marker.setMap(mapCanvas);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>