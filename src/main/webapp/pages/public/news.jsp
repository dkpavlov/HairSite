<div class="inner-page">
    <div class="row first-row">
        <div class="columns twelve content">
            <h1>новини</h1>
        </div>
    </div>
    <div class="row single-news">
        <div class="columns three">
            <a href="" class="news-image"><img src="../../assets/img/news-image.jpg" width="100%"/></a>
        </div>
        <div class="columns nine news-container">
            <article class="news">
                <header>заглавие на първата новина</header>
                <p class="date">10.05.2014</p>
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
    <div class="row single-news">
        <div class="columns three">
            <a href="" class="news-image"><img src="../../assets/img/news-image.jpg" width="100%"/></a>
        </div>
        <div class="columns nine news-container">
            <article class="news">
                <header>заглавие на първата новина</header>
                <p class="date">10.05.2014</p>
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