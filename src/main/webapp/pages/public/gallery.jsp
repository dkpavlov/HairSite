<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>галерия</h1>
        </div>
    </div>
    <div class="row">
        <div class="columns three gallery">
            <div class="gallery-image">
                <img src="../../assets/img/news-image.jpg" width="100%"/>
                <div class="gallery-hover"></div>
            </div>
            <h2><a href="">Заглавие на първата галерия</a></h2>
            <label class="gallery-content">
                18 снимки
            </label>
        </div>

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