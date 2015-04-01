<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                </div>
            </div>
        </div>
        <div class="container lower-header">
            <div class="row normal-menu">
                <div class="columns four w468">
                    <nav class="main-menu normal-nav">
                        <ul>
                            <li class="columns three has-sub">
                                <a class="sub">Салони</a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/salons">THE MALL</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/salons">СТРЕЛБИЩЕ</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="columns three">
                                 <a href="${pageContext.request.contextPath}/gallery">Галерия</a>
                            </li>
                            <li class="columns three">
                                <a href="${pageContext.request.contextPath}/news">Новини</a>
                            </li>
                            <li  class="columns three">
                                <a href="${pageContext.request.contextPath}/team">Екип</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="columns four logo">
                    <a href="${pageContext.request.contextPath}/">
                        <img src="${pageContext.request.contextPath}/assets/img/logo.png">
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
                    <li><a class="sub rmm-closed">Салони</a>
                        <ul>
                            <c:forEach items="${salons}" var="salon">
                                <li><a href="${pageContext.request.contextPath}/salons/${salon.id}">${salon.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
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
    <script>
        $(function(){
            var normal_menu_sub_open = false;
            $('li.has-sub a.sub').click(function(){
                if (!normal_menu_sub_open) {
                    $(this).next('ul').stop().show(300);
                    $(this).css("background", 'url("../img/main-nav-bg-hover.png")');
                    $(this).css("border-radius", 2 +'px');
                    normal_menu_sub_open = true;
                }
                else {
                    $(this).next('ul').first().stop().hide(300);
                    normal_menu_sub_open = false;
                }
            });
        })
    </script>
    </body>
</html>