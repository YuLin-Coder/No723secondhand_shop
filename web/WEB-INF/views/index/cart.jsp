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

    <title>购物车</title>
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
                <li class="active">购物车</li>
            </ul>
        </div>
    </div>
</div>


<section class="cart-area ptb-54">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <form class="cart-controller">
                    <div class="cart-table table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">商品名称</th>
                                <th scope="col"></th>
                                <th scope="col">单价</th>
                                <th scope="col">数量</th>
                                <th scope="col">总价</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${cartList}" var="data">

                            <tr>
                                <td class="product-thumbnail">
                                    <a href="toDetail?gid=${data.goods.id}">
                                        <img src="/images/${data.goods.photo}" style="width: 60px;height: 60px" alt="Image">
                                    </a>
                                </td>
                                <td class="product-name">
                                    <a href="product-details.html">${data.goods.name}</a>
                                </td>
                                <td class="product-price">
                                    <span class="unit-amount">$${data.goods.price}</span>
                                </td>
                                <td class="product-quantity">
                                    <div class="input-counter">

                                        <input type="text" value="${data.quantity}" readonly>

                                    </div>
                                </td>
                                <td class="product-subtotal">
                                    <span class="subtotal-amount">${data.quantity * data.goods.price}元</span>
                                </td>
                                <td class="trash">
                                    <a type="button" onclick="deleteCart(${data.id})" class="remove">
                                        <i class="ri-close-fill"></i>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="coupon-cart">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                            <div class="form-group mb-0">
                                <select id="pay_way" name="pay_way" class="form-control">
                                    <option value="微信支付">微信支付</option>
                                    <option value="支付宝">支付宝</option>
                                </select>
                                <button class="default-btn" id="save">
                                   提交订单
                                </button>
                            </div>
                        </div>

                    </div>
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
<script>

    $("#save").click(function() {
        let pay_way = $("#pay_way").val();
        $.ajax({
            cache : true,
            type : "post",
            url : "addOrders",
            data : {"pay_way":pay_way},
            async : false,
            success : function(e) {
                if (e) {
                    alert("下单成功！");
                    document.location.reload();//当前页面
                } else {
                    alert("下单失败！");
                }
            }
        })
    });

    function deleteCart(id){
        if(confirm("确定删除吗?")){
            $.ajax({
                url:"deleteCart",
                data:{"id": id},
                type:"post",
                dataType:"json",
                success:function (data) {
                    if (data) {
                        alert("删除成功！");
                        document.location.reload();//当前页面
                    }else{
                        alert("删除失败！");
                    }
                }
            });
        }
    }
</script>
</body>
</html>