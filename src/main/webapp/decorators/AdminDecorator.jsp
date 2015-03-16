<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="/assets/css/admin/main.css">
        <link rel="stylesheet" type="text/css" href="/assets/css/admin/base.css">
        <link rel="stylesheet" type="text/css" href="/assets/css/admin/table.css">
        <link rel="stylesheet" type="text/css" href="/assets/css/admin/form.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
        <script type="text/javascript" src="/assets/js/responsivemobilemenu.js"></script>
        <script type="text/javascript" src="/assets/js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="/assets/js/jquery.shadow.js"></script>
        <title>Hair Spot - Valentin Tsvetkov</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    </head>
    <body>
        <div id="main">
            <div class="container">
                <nav id="nav-main">
                    <ul>
                        <li><a href="/admin/services">Услуги</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="">Gallery</a></li>
                        <li><a href="">Tutorials</a></li>
                        <li><a href="">Contact</a></li>
                        <li><a href="/admin/messages">Съобщения</a></li>
                    </ul>
                </nav>
                <div id="nav-trigger">
                    <span>Menu</span>
                </div>
                <nav id="nav-mobile"></nav>

                <decorator:body/>

            </div>
        </div>
    </body>
</html>

<script>
    $(document).ready(function(){
        $("#nav-mobile").html($("#nav-main").html());
        $("#nav-trigger span").click(function(){
            if ($("nav#nav-mobile ul").hasClass("expanded")) {
                $("nav#nav-mobile ul.expanded").removeClass("expanded").slideUp(250);
                $(this).removeClass("open");
            } else {
                $("nav#nav-mobile ul").addClass("expanded").slideDown(250);
                $(this).addClass("open");
            }
        });
    });
</script>