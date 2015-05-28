<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example with a side menu that hides on mobile, just like the Pure website.">
    <title>Hair Spot CMS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/pure-min.css">
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

    <div id="main">
        <decorator:body/>
    </div>
</div>
</body>
</html>
