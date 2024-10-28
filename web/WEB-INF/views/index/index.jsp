<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>校园二手物品交易平台</title>
    </head>
    <body>
        <div class="preloader">
            <div class="content">
                <div class="box"></div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/index/head.jsp"/>
        <%--<section class="hero-slider-area">
            <div class="container">
                <div class="row justify-content-end">
                    <div class="col-lg-9">
                        <div class="hero-slider owl-carousel owl-theme">
                            <div class="slider-item bg-1">
                                <div class="d-table">
                                    <div class="d-table-cell">
                                        <div class="hero-slider-content">
                                            <span>特价</span>
                                            <h1>高品质产品在这里准备就绪</h1>
                                            <p>免费送货和产品折扣 40%</p>
                                            <div class="hero-slider-btn">
                                                <a href="toSearchIndex" class="default-btn">
                                                    <i class="ri-shopping-cart-line"></i>
                                                    点击查看
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slider-item bg-2" style="width: 100%">
                                <div class="d-table">
                                    <div class="d-table-cell">
                                        <div class="hero-slider-content">
                                            <span>特价</span>
                                            <h1>2021 年最佳家居装饰系列</h1>
                                            <p>免费送货和产品折扣 40%</p>
                                            <div class="banner-btn">
                                                <a href="toSearchIndex" class="default-btn">
                                                    <i class="ri-shopping-cart-line"></i>
                                                    点击查看
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="slider-item bg-3">
                                <div class="d-table">
                                    <div class="d-table-cell">
                                        <div class="hero-slider-content">
                                            <span>特价</span>
                                            <h1>所有类型的优质商品</h1>
                                            <p>免费送货和产品折扣 40%</p>
                                            <div class="banner-btn">
                                                <a href="toSearchIndex" class="default-btn">
                                                    <i class="ri-shopping-cart-line"></i>
                                                    点击查看
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>
        <%--
        
        <section class="services-area ptb-30">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-sm-6">
                        <div class="single-services">
                            <div class="icon">
                                <img src="<%=path%>/resource/index/static/picture/support.png" alt="Image">
                            </div>
                            <h3>客户支持</h3>
                            <p>24/7 我们是客户服务的最佳支持</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="single-services">
                            <div class="icon">
                                <img src="<%=path%>/resource/index/static/picture/payment.png" alt="Image">
                            </div>
                            <h3>安全支付</h3>
                            <p>使用世界顶级支付方式支付</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="single-services">
                            <div class="icon">
                                <img src="<%=path%>/resource/index/static/picture/network.png" alt="Image">
                            </div>
                            <h3>全球交付</h3>
                            <p>你想要什么，送到你想要的地方</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>
        <br>
        <section class="best-seller-area pb-30">
            <div class="container">
                <div class="section-title">
                    <h2>热销物品</h2>
                </div>
                <div class="best-product-slider owl-carousel owl-theme">
                    <c:forEach items="${goodsList}" var="data">
                        <div class="single-products">
                            <div class="product-img">
                                <a href="toDetail?gid=${data.id}">
                                    <img src="/images/${data.photo}" style="width: 300px;height: 350px;" alt="Image">
                                </a>
                            </div>
                            <div class="product-content">
                                <a href="toDetail?gid=${data.id}" class="title">
                                        ${data.name}
                                </a>
                                <ul class="products-rating">
                                    <li>
                                        <i class="ri-star-fill"></i>
                                    </li>
                                    <li>
                                        <i class="ri-star-fill"></i>
                                    </li>
                                    <li>
                                        <i class="ri-star-fill"></i>
                                    </li>
                                    <li>
                                        <i class="ri-star-fill"></i>
                                    </li>
                                    <li>
                                        <i class="ri-star-fill"></i>
                                    </li>
                                    <li>
                                        <a>
                                            (库存：${data.stock})
                                        </a>
                                    </li>
                                </ul>
                                <ul class="products-price">
                                    <li>
                                            ${data.price}元
                                    </li>
                                </ul>
                                <ul class="products-cart-wish-view">
                                    <li>
                                        <a type="button" onclick="addCart(${data.id})" class="default-btn">
                                            <i class="ri-shopping-cart-line"></i>
                                            加入购物车
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <%--
        <div class="partner-area pb-54">
            <div class="container">
                <div class="partner-wrap">
                    <div class="partner-slider owl-carousel owl-theme">
                        <div class="partner-item">
                            <img src="<%=path%>/resource/index/static/picture/partner-1.png" alt="Image">
                        </div>
                        <div class="partner-item">
                            <img src="<%=path%>/resource/index/static/picture/partner-2.png" alt="Image">
                        </div>
                        <div class="partner-item">
                            <img src="<%=path%>/resource/index/static/picture/partner-3.png" alt="Image">
                        </div>
                        <div class="partner-item">
                            <img src="<%=path%>/resource/index/static/picture/partner-4.png" alt="Image">
                        </div>
                        <div class="partner-item">
                            <img src="<%=path%>/resource/index/static/picture/partner-5.png" alt="Image">
                        </div>
                        <div class="partner-item">
                            <img src="<%=path%>/resource/index/static/picture/partner-6.png" alt="Image">
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="copy-right-area">
            <div class="container">
                <p>2022-校园二手物品交易平台</p>
            </div>
        </div>
        <div class="modal fade product-view-one" id="exampleModal">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <button type="button" class="close" data-bs-dismiss="modal">
<span aria-hidden="true">
<i class="ri-close-line"></i>
</span>
                    </button>
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="product-view-one-image">
                                <div id="big" class="owl-carousel owl-theme">
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-1.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-2.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-3.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-4.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-5.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-6.jpg" alt="Image">
                                    </div>
                                </div>
                                <div id="thumbs" class="owl-carousel owl-theme">
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-1.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-2.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-3.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-4.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-5.jpg" alt="Image">
                                    </div>
                                    <div class="item">
                                        <img src="<%=path%>/resource/index/static/picture/product-6.jpg" alt="Image">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-content">
                                <h3>
                                    Cordless Drill Professional Combo Drill And Screwdriver
                                </h3>
                                <div class="product-review">
                                    <div class="rating">
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                    </div>
                                    <a href="#" class="rating-count">4 Reviews</a>
                                </div>
                                <div class="price">
                                    <span class="new-price">$119.0 <del>$219.0</del></span>
                                    <span class="in-stock">In Stock (8 Items)</span>
                                </div>
                                <ul class="product-info">
                                    <li>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At magnam ad
                                            reprehenderit fuga nam, non odit necessitatibus facilis beatae
                                            temporibus</p>
                                    </li>
                                    <li>
                                        <span>SKU:</span>
                                        001
                                    </li>
                                    <li>
                                        <span>Availability:</span>
                                        Available
                                    </li>
                                    <li>
                                        <span>Brand:</span>
                                        Ehay
                                    </li>
                                    <li>
                                        <span>Categories:</span>
                                        <a href="products.html">Power Drill</a>
                                    </li>
                                </ul>
                                <div class="product-color-switch">
                                    <ul>
                                        <li>
                                            <span>Color:</span>
                                        </li>
                                        <li>
                                            <button title="Black" class="color-black"></button>
                                        </li>
                                        <li>
                                            <button title="White" class="color-white"></button>
                                        </li>
                                        <li class="active">
                                            <button title="Green" class="color-green"></button>
                                        </li>
                                        <li>
                                            <button title="Yellow Green" class="color-yellowgreen"></button>
                                        </li>
                                        <li>
                                            <button title="Teal" class="color-teal"></button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="product-add-to-cart">
                                    <div class="input-counter">
<span class="minus-btn">
<i class="ri-subtract-line"></i>
</span>
                                        <input type="text" value="1">
                                        <span class="plus-btn">
<i class="ri-add-line"></i>
</span>
                                    </div>
                                    <a href="javascript:;" class="default-btn">
                                        <i class="ri-shopping-cart-line"></i>
                                        Add To Cart
                                    </a>
                                </div>
                                <div class="wishlist-btn">
                                    <a href="wishlist.html" class="default-btn">
                                        <i class="ri-heart-line"></i>
                                        Wishlist
                                    </a>
                                </div>
                                <div class="share-this-product">
                                    <ul>
                                        <li>
                                            <span>Share</span>
                                        </li>
                                        <li>
                                            <a href="javascript:;" target="_blank">
                                                <i class="ri-facebook-fill"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;" target="_blank">
                                                <i class="ri-instagram-line"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;" target="_blank">
                                                <i class="ri-linkedin-fill"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;" target="_blank">
                                                <i class="ri-twitter-fill"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="go-top">
            <i class="ri-arrow-up-s-fill"></i>
            <i class="ri-arrow-up-s-fill"></i>
        </div>
        <script>
            function addCart(id) {
                $.ajax({
                    url: "addCart",
                    data: {"g_id": id, "quantity": 1},
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("加入成功！");
                            document.location.reload();//当前页面
                        } else {
                            alert("加入失败，库存不足！");
                        }
                    }
                });
            }
        </script>
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