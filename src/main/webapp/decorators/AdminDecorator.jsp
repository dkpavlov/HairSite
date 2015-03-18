<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A layout example with a side menu that hides on mobile, just like the Pure website.">
        <title>Responsive Side Menu &ndash; Layout Examples &ndash; Pure</title>

        <%-- TODO downloade css --%>
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
        <!--[if lte IE 8]>
        <link rel="stylesheet" href="/assets/css/admin/side-menu-old-ie.css">
        <![endif]-->
        <!--[if gt IE 8]><!-->
        <link rel="stylesheet" href="/assets/css/admin/side-menu.css">
        <!--<![endif]-->

        <script type="text/javascript" src="../assets/js/jquery.min.js"></script>

    </head>
    <body>
        <div id="layout">
            <!-- Menu toggle -->
            <a href="#menu" id="menuLink" class="menu-link">
                <!-- Hamburger icon -->
                <span></span>
            </a>

            <div id="menu">
                <div class="pure-menu">
                    <a class="pure-menu-heading" href="#">CMS</a>
                    <ul class="pure-menu-list">
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/services" class="pure-menu-link">Услуги</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/product" class="pure-menu-link">Продукти</a>
                        </li>
                        <li class="pure-menu-item"><a href="" class="pure-menu-link">About</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="" class="pure-menu-link">Gallery</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="" class="pure-menu-link">Tutorials</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/contact" class="pure-menu-link">Контакти</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/messages" class="pure-menu-link">Съобщения</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div id="main">
                <decorator:body/>
            </div>
            <script src="/assets/js/ui.js"></script>
        </div>
    </body>
</html>
