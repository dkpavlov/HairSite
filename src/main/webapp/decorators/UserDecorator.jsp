<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/responsivemobilemenu.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/smart-grid.css" >
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/hair_spot.css">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open Sans">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery.bxslider.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery.shadow.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bottom.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/responsivemobilemenu.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.shadow.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/google.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.jcarousel.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.pikachoose.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.touchwipe.min.js"></script>
        <link href="${pageContext.request.contextPath}/assets/css/tiksluscarousel.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/assets/js/tiksluscarousel.js"></script>
        <title>Hair Spot - Valentin Tsvetkov</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    </head>

    <body>
    <header class="columns twelve">
        <div class="container upper-header columns twelve">
            <div class="row">
                <div class="columns twelve">
                    <div class="columns two offset-two mt8">
                        <a href="#" class="columns two social-links facebook">
                        </a>
                        <a href="#" class="columns two social-links google-plus">
                        </a>
                        <a href="#" class="columns two social-links linkedin">
                        </a>
                        <a href="#" class="columns six social-links you-tube">
                        </a>
                    </div>
                    <div class="columns three offset-five mt8">
                        <form>
                            <input type="text" placeholder="Търси" class="global-search"/>
                            <a class="global-search" href="#">
                            </a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container lower-header">
            <div class="row normal-menu">
                <div class="columns four w468">
                    <nav class="main-menu normal-nav">
                        <div class="columns three">
                            <a href="${pageContext.request.contextPath}/salons">Салони</a>
                        <span class="scissors">
                        </span>
                        </div>
                        <div class="columns three">
                            <a href="${pageContext.request.contextPath}/gallery">Галерия</a>
                        <span class="scissors">
                        </span>
                        </div>
                        <div class="columns three">
                            <a href="${pageContext.request.contextPath}/news">Новини</a>
                        <span class="scissors">
                        </span>
                        </div>
                        <div class="columns three">
                            <a href="${pageContext.request.contextPath}/team">Екип</a>
                        <span class="scissors">
                        </span>
                        </div>
                    </nav>
                </div>
                <div class="columns four logo">
                    <a href="#">
                        <img src="../assets/img/logo.png">
                    </a>
                </div>
                <div class="columns four w468">
                    <nav class="main-menu  normal-nav">
                        <div class="columns three">
                            <a href="${pageContext.request.contextPath}/service">Услуги</a>
                        </div>
                        <div class="columns three">
                            <a href="${pageContext.request.contextPath}/product">Продукти</a>
                        </div>
                        <div class="columns three">
                            <a href="${pageContext.request.contextPath}/offers">Оферти</a>
                        </div>
                        <div class="columns three">
                            <a href="${pageContext.request.contextPath}/contacts">Контакти</a>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="row rmm">
                <ul>
                    <li><a href='${pageContext.request.contextPath}/salons'>Салони</a></li>
                    <li><a href='${pageContext.request.contextPath}/gallery'>Галерия</a></li>
                    <li><a href='${pageContext.request.contextPath}/news'>Новини</a></li>
                    <li><a href='${pageContext.request.contextPath}/team'>Екип</a></li>
                    <li><a href='${pageContext.request.contextPath}/service'>Услуги</a></li>
                    <li><a href='${pageContext.request.contextPath}/product'>Продукти</a></li>
                    <li><a href='${pageContext.request.contextPath}/offers'>Оферти</a></li>
                    <li><a href='${pageContext.request.contextPath}/contacts'>Контакти</a></li>
                </ul>
            </div>
        </div>
    </header>
        <decorator:body/>
    <footer>
        <div class="container">
            <div class="row">
                <div class="columns eleven mt8 lower-menu">
                    <!-- <div class="columns two offset-two"> -->
                    <a href="${pageContext.request.contextPath}/salons">салони</a>
                    <!--  </div>
                      <div class="columns two"> -->
                    <a href="${pageContext.request.contextPath}/team">персонал</a>
                    <!--  </div>
                      <div class="columns two"> -->
                    <a href="${pageContext.request.contextPath}/news">блог</a>
                    <!--  </div>
                      <div class="columns two"> -->
                    <a href="#">карта на сайта</a>
                    <!--  </div>
                      <div class="columns two"> -->
                    <a href="${pageContext.request.contextPath}/contacts">контакти</a>
                    <!--  </div> -->
                </div>
            </div>
            <div class="row">
                <div class="columns twelve">
                    <div class="columns eleven mt8 lower-social-links">
                        <a href="#" class="columns two social-links facebook"></a>
                        <a href="#" class="columns two social-links google-plus"></a>
                        <a href="#" class="columns two social-links linkedin"></a>
                        <a href="#" class="columns six social-links you-tube"></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <div class="row lower-footer">
        <div class="columns twelve mt8">
            Hair Spot Valentin Tsvetkov - 2014
        </div>
    </div>
    </body>
</html>