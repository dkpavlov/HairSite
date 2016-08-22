<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A layout example with a side menu that hides on mobile, just like the Pure website.">
        <title>Hair Spot CMS</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/pure-min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/grids-responsive-min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/custom.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/images.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery-ui.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery.Jcrop.css">
        <!--[if lte IE 8]>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/side-menu-old-ie.css">
        <![endif]-->
        <!--[if gt IE 8]><!-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/side-menu.css">
        <!--<![endif]-->

        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.Jcrop.js"></script>

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
                            <a href="${pageContext.request.contextPath}/admin/carousel" class="pure-menu-link">Карусел</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/salon" class="pure-menu-link">Салони</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/gallery" class="pure-menu-link">Галерия</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/galleryLink" class="pure-menu-link">Линк Галерия</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/news" class="pure-menu-link">Новини</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/employee" class="pure-menu-link">Екип</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/service" class="pure-menu-link">Услуги</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/product" class="pure-menu-link">Продукти</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/offers" class="pure-menu-link">Оферти</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/contact" class="pure-menu-link">Контакти</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/messages" class="pure-menu-link">Съобщения</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/users" class="pure-menu-link">Потребители</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/serviceItems" class="pure-menu-link">Системни услуги</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/serviceProducts" class="pure-menu-link">Системни продукти</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/serviceMaterials" class="pure-menu-link">Системни материали</a>
                        </li>
                        <li class="pure-menu-item">
                            <a href="${pageContext.request.contextPath}/admin/report" class="pure-menu-link">Отчет</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div id="main">
                <decorator:body/>
                <a class="custom-link" href="${pageContext.request.contextPath}/">Публична част</a>
                <a class="custom-link" href="${pageContext.request.contextPath}/admin/settings">Настройки</a>
                <a class="custom-link" href="${pageContext.request.contextPath}/admin/logout">Излез</a>
            </div>
            <script src="/assets/js/ui.js"></script>
        </div>
    </body>
</html>
