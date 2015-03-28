<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>Салон 1 - The Mall / Салон 2 - Стрелбище</h1>
        </div>
    </div>
    <div class="row horizontal-separator">
        <div id="gallery">
            <ul>
                <li><img src="../assets/images/1.jpg" /></li>
                <li><img src="../assets/images/2.jpg" /></li>
                <li><img src="../assets/images/3.jpg" /></li>
                <li><img src="../assets/images/4.jpg" /></li>
                <li><img src="../assets/images/1.jpg" /></li>
                <li><img src="../assets/images/2.jpg" /></li>
                <li><img src="../assets/images/3.jpg" /></li>
                <li><img src="../assets/images/4.jpg" /></li>
                <li><img src="../assets/images/1.jpg" /></li>
                <li><img src="../assets/images/2.jpg" /></li>
                <li><img src="../assets/images/3.jpg" /></li>
                <li><img src="../assets/images/4.jpg" /></li>
            </ul>
        </div>
    </div>
    <div class="row horizontal-separator">
        <div class="columns eight">
            <div class="row">
                <h2 class="saloon">описание</h2>
                <p>Suspendisse tempor nulla nulla, id gravida metus interdum vel. Praesent accumsan lorem blandit fermentum feugiat. Nam at mattis eros. Nulla facilisi. Curabitur consectetur accumsan libero quis molestie. Aenean tristique tellus rhoncus porttitor semper. Vivamus sit amet accumsan est. Maecenas fermentum porttitor vehicula. Sed tellus quam, hendrerit sit amet orci non, condimentum condimentum libero. Maecenas pellentesque vehicula tempus. Nulla maximus ipsum felis. Mauris ut lectus sed est accumsan cursus nec vel magna.</p>
                <p>Nunc porttitor dictum nibh, ut aliquet libero condimentum ac. Quisque semper rutrum condimentum. Sed tincidunt ultricies erat id maximus. Duis fermentum velit vel gravida porttitor. Etiam tempor, odio vel lacinia gravida, purus metus pretium eros, at fringilla magna sapien a ante. Sed lacinia pulvinar sapien vitae varius. Phasellus ornare molestie justo, in pharetra sem congue pharetra. Vestibulum suscipit maximus lorem et viverra. Etiam dolor lorem, bibendum ultrices leo a, lobortis pellentesque tellus. Praesent aliquam placerat nisi et facilisis.</p>
                <p>Aenean at rutrum est, vel pretium purus. Nulla aliquet, sapien nec sagittis commodo, diam nisi ullamcorper leo, quis porta felis leo eget ex. In fringilla justo accumsan urna luctus ornare. Nunc dapibus enim ut ligula tincidunt, et mattis nunc blandit. Donec velit ex, commodo et faucibus et, efficitur quis nisl. Vestibulum justo nisi, eleifend ac rutrum non, pellentesque sed elit. Sed ipsum sem, fringilla ac arcu id, venenatis mattis quam. Curabitur feugiat, lectus nec accumsan lacinia, elit lorem eleifend felis, et aliquam lorem neque vitae massa. Cras eget ante sodales, fringilla odio nec, commodo nisl.</p>
                <h2 class="saloon">предлагани услуги</h2>
                <p>Suspendisse tempor nulla nulla, id gravida metus interdum vel. Praesent accumsan lorem blandit fermentum feugiat. Nam at mattis eros. Nulla facilisi. Curabitur consectetur accumsan libero quis molestie. Aenean tristique tellus rhoncus porttitor semper. Vivamus sit amet accumsan est. Maecenas fermentum porttitor vehicula. Sed tellus quam, hendrerit sit amet orci non, condimentum condimentum libero. Maecenas pellentesque vehicula tempus. Nulla maximus ipsum felis. Mauris ut lectus sed est accumsan cursus nec vel magna.</p>
            </div>
        </div>
        <div class="columns four">
            <h2 class="saloon">персонал на салона</h2>
            <div class="row">
                <article class="team saloon">
                     <div class="portrait columns two v-middle">
                         <img src="${pageContext.request.contextPath}/assets/img/personal-image.jpg" width="100%"/>
                     </div>
                     <header class=" columns nine saloon-personal-name">Цоло Цветков</header>
                </article>
            </div>
            <div class="row">
                <article class="team saloon">
                     <div class="portrait columns two v-middle">
                         <img src="${pageContext.request.contextPath}/assets/img/personal-image.jpg" width="100%"/>
                     </div>
                     <header class="columns nine saloon-personal-name">Цоло Цветков</header>
                </article>
            </div>


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
    </div>
</div>

<script language="javascript">
    $(document).ready(function(){
        $("#gallery").tiksluscarousel({nav:'thumbnails', autoplayInterval:20000});  //called with all default values
    });
    function initialize() {
        var mapCanvas = document.getElementById('map-canvas');
        /* TODO set good center */
        var mapCenter = new google.maps.LatLng(42.660573,23.383137);
        /* TODO use custom marker */
        var baseIconDir = '${pageContext.request.contextPath}/assets/img/';

        var mapOptions = {
            center: mapCenter,
            zoom: 12,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions);

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(25, 43),
            map: map
        });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>