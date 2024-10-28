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

    <title>Ehay - Tools Store HTML Template</title>
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
                <li class="active">失物大厅</li>
            </ul>
        </div>
    </div>
</div>


<section class="product-details-area ptb-54">
    <div class="container">
        <div class="row align-items-center">
            <div class="product-view-one">
                <div class="modal-content p-0">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="product-view-one-image">
                                <div id="big" class="owl-carousel owl-theme">
                                    <div class="item">
                                        <img src="/images/${product.photo}" alt="Image">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-content ml-15">
                                <h3>
                                    ${product.goodsname}
                                </h3>
                                <div class="product-review">

                                    <a href="#reviews" class="rating-count">类型（${product.type}）</a>
                                </div>
                                <div class="price">
                                    <span class="new-price">捡到/丢失日期:${product.create_date} </span>
                                </div>
                                <ul class="product-info">
                                    <li>
                                        <span>发布人:</span>
                                        <p>${product.publisher}</p>
                                    </li>
                                    <li>
                                        <span>联系电话:</span>
                                        ${product.phone}
                                    </li>
                                      <li>
                                        <span>发生地点:</span>
                                        ${product.spot}
                                    </li>

                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12">
                <div id="reviews" class="tab products-details-tab">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <ul class="tabs">
                                <li>
                                    描述
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="tab_content">
                                <div class="tabs_item">
                                    <div class="products-details-tab-content">
                                        ${product.detail}
                                    </div>
                                </div>

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
        <p>Copyright &copy; 2021.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
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
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At magnam ad reprehenderit fuga nam, non odit necessitatibus facilis beatae temporibus</p>
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
    function addCart(id){
        let quantity = $("#quantity").val();
        $.ajax({
            url:"addCart",
            data:{"g_id": id,"quantity":quantity},
            type:"post",
            dataType:"json",
            success:function (data) {
                if (data) {
                    alert("加入成功！");
                    document.location.reload();//当前页面
                }else{
                    alert("加入失败，库存不足！");
                }
            }
        });
    }
</script>
</body>
</html>