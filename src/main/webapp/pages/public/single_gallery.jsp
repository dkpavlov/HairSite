<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1 class="single-gallery"><a href="">галерия </a><span class="clich"></span> ${gallery.name} </h1>
        </div>
    </div>
    <div class="row">
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
</div>
<script language="javascript">
    $(document).ready(function(){
        $("#gallery").tiksluscarousel({nav:'thumbnails', autoplayInterval:20000});  //called with all default values
    });
</script>