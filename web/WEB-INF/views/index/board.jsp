<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
%>
<!doctype html>
<html lang="zxx">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="<%=path%>/resource/index/static/css/bootstrap.min.css">

    <link rel="stylesheet" href="<%=path%>/resource/index/static/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="<%=path%>/resource/index/static/css/owl.carousel.min.css">

    <link rel="stylesheet" href="<%=path%>/resource/index/static/css/remixicon.css">

    <link rel="stylesheet" href="<%=path%>/resource/index/static/css/meanmenu.min.css">

    <link rel="stylesheet" href="<%=path%>/resource/index/static/css/animate.min.css">

    <link rel="stylesheet" href="<%=path%>/resource/index/static/css/style.css">

    <link rel="stylesheet" href="<%=path%>/resource/index/static/css/responsive.css">

    <title>公告列表</title>
</head>
<body>

<div class="preloader">
    <div class="content">
        <div class="box"></div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/index/head.jsp" />


<div class="page-title-area">
    <div class="container">
        <div class="page-title-content">
            <ul>
                <li>
                    <a href="toIndex">
                        主页面
                    </a>
                </li>
                <li class="active">公告详情</li>
            </ul>
        </div>
    </div>
</div>


<section class="blog-post-area ptb-54">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="blog-details-content mr-15">

                    <div class="blog-top-content">
                        <div class="blog-content">
                            <ul class="admin">
                                <li>
                                    ${board.create_time}
                                </li>
                            </ul>
                            <h3> ${board.title}</h3>
                            <p>${board.content}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="widget-sidebar ml-15">
                    <div class="sidebar-widget search">
                        <form class="search-form" action="toBoard">
                            <input class="form-control" name="search" value="${search}" placeholder="Search..." type="text">
                            <button class="search-button" type="submit">
                                <i class="ri-search-line"></i>
                            </button>
                        </form>
                    </div>


                    <div class="sidebar-widget recent-post">
                        <ul>
                            <li class="pl-0">
                                <h3>最新公告</h3>
                            </li>
                            <c:forEach items="${boardList}" var="data">
                            <li style="padding-left: 40px;">
                                <a href="toBoard?bid=${data.id}">
                                        ${data.title}
                                </a>

                                <span>  ${board.create_time}</span>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>


<div class="copy-right-area">
    <div class="container">
        <p>2022-校园二手物品大厅</p>
    </div>
</div>


<div class="go-top">
    <i class="ri-arrow-up-s-fill"></i>
    <i class="ri-arrow-up-s-fill"></i>
</div>


<script src="<%=path%>/resource/index/static/js/jquery.min.js"></script>

<script src="<%=path%>/resource/index/static/js/bootstrap.bundle.min.js"></script>

<script src="<%=path%>/resource/index/static/js/meanmenu.min.js"></script>

<script src="<%=path%>/resource/index/static/js/owl.carousel.min.js"></script>

<script src="<%=path%>/resource/index/static/js/wow.min.js"></script>

<script src="<%=path%>/resource/index/static/js/range-slider.min.js"></script>

<script src="<%=path%>/resource/index/static/js/form-validator.min.js"></script>

<script src="<%=path%>/resource/index/static/js/contact-form-script.js"></script>

<script src="<%=path%>/resource/index/static/js/ajaxchimp.min.js"></script>

<script src="<%=path%>/resource/index/static/js/custom.js"></script>
</body>
</html>