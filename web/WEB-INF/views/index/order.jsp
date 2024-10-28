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

    <title>我的订单</title>
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
                <li class="active">我的订单</li>
            </ul>
        </div>
    </div>
</div>


<section class="dashboard-area ptb-54">
    <div class="container">
        <div class="row">

            <div class="col-lg-12">
                <div class="cart-area recent-order">
                    <h3>我的订单</h3>
                    <form class="cart-controller mb-0">
                        <div class="cart-table table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th scope="col">商品</th>
                                    <th scope="col"></th>
                                    <th scope="col">订单编号</th>
                                    <th scope="col">支付方式</th>
                                    <th scope="col">下单数量</th>
                                    <th scope="col">折扣</th>
                                    <th scope="col">总价</th>
                                    <th scope="col">下单时间</th>
                                    <th scope="col">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${itemsList}" var="data">
                                <tr>
                                    <td class="product-thumbnail">
                                        <a href="toDetail?gid=${data.goods.id}">
                                            <img src="/images/${data.goods.photo}" style="width: 50px;height: 50px;" alt="Image">
                                        </a>
                                    </td>
                                    <td class="product-name">
                                        <a href="toDetail?gid=${data.goods.id}">${data.goods.name}</a>
                                    </td>
                                    <td class="product-price">
                                        <span class="unit-amount">${data.orders.order_no}</span>
                                    </td>
                                    <td class="product-price">
                                        <span class="unit-amount">${data.orders.pay_way}</span>
                                    </td>
                                    <td class="product-subtotal">
                                        <span class="subtotal-amount">${data.quantity}</span>
                                    </td>
                                    <td class="product-subtotal">
                                        <span class="subtotal-amount">${data.goods.discount}折</span>
                                    </td>
                                    <td class="product-subtotal">
                                        <span class="subtotal-amount">$${data.quantity * data.goods.price * data.goods.discount/10 }</span>
                                    </td>
                                       <td class="product-subtotal">
                                        <span class="subtotal-amount">${data.orders.create_time }</span>
                                    </td>
                                    <td class="product-subtotal">
                                        <a href="toDetail?gid=${data.goods.id}&com=1" style="color: blue">去评论</a>
                                    </td>

                                </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>



<div class="copy-right-area">
    <div class="container">
        <p>2022-校园二手物品交易平台</p>
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