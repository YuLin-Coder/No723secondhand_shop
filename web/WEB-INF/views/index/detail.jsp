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

    <title>详情页</title>
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
                <li class="active">购物大厅</li>
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
                                        <img src="/images/${goods.photo}" alt="Image">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-content ml-15">
                                <h3>
                                    ${goods.name}
                                </h3>
                                <div class="product-review">
                                    <div class="rating">
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                    </div>
                                    <a href="#reviews" class="rating-count">库存（${goods.stock}）</a>
                                </div>
                                <div class="price">
                                    <span class="new-price">${goods.price} 元</span>
                                </div>
                                <ul class="product-info">
                                    <li>
                                        <p>${goods.note}</p>
                                    </li>
                                    <li>
                                        <span>类型:</span>
                                        ${goods.cname}
                                    </li>

                                </ul>

                                <div class="product-add-to-cart">
                                    <div class="input-counter">
                                    <span class="minus-btn">
                                   <i class="ri-subtract-line"></i>
                                    </span>
                                        <input type="text" id="quantity" value="1">
                                        <span class="plus-btn">
                                          <i class="ri-add-line"></i>
                                        </span>
                                        <br>
                                        <a   type="button" onclick="addCart(${goods.id})" class="default-btn">
                                            <i class="ri-shopping-cart-line"></i>
                                            加入购物车
                                        </a>
                                    </div>


                                </div>
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
                                <li>
                                    评论
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="tab_content">
                                <div class="tabs_item">
                                    <div class="products-details-tab-content">
                                        ${goods.detail}
                                    </div>
                                </div>





                                <div class="tabs_item">
                                    <div class="products-details-tab-content">
                                        <div class="product-review-form">
                                            <h3>评论区</h3>
                                         <div class="review-comments">
                                             <c:forEach items="${commentsList}" var="data">

                                             <div class="review-item">
                                                    <span> 评论人：<strong>${data.student.nickname}</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        评论时间： <strong>${data.create_time}</strong> &nbsp;&nbsp;&nbsp;&nbsp;

                                                    满意度： <strong>${data.myd}</strong>
                                                   </span>
                                                    <p>${data.content}</p>
                                                </div>
                                             </c:forEach>
                                            </div>
                                            <c:if test="${com != null && com != ''}">
                                                <div class="review-form">
                                                    <h3>发表评论</h3>
                                                    <form id="saveForm">
                                                        <input type="hidden" value="${goods.id}" name="gid">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12">
                                                                <div class="form-group">
                                                                    <label>满意度</label>
                                                                    <select name="myd" class="form-control">
                                                                        <option value="满意">满意</option>
                                                                        <option value="不满意">不满意</option>
                                                                        <option value="一般">一般</option>
                                                                    </select>                                                                 </div>
                                                            </div>
                                                            <div class="col-lg-12 col-md-12">
                                                                <div class="form-group">
                                                                    <label>请填写你宝贵的意见</label>
                                                                    <textarea name="content" id="review-body" cols="30" rows="8" class="form-control"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-12 col-md-12">
                                                                <button type="button" id ="save" class="btn default-btn">提交评论</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
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
        <p>2022-校园二手物品交易平台</a></p>
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

    $("#save").click(function() {
        $.ajax({
            cache : true,
            type : "post",
            url : "addComments",
            data : $("#saveForm").serialize(),
            async : false,
            success : function(e) {
                if (e) {
                    alert("发布成功！");
                    window.location.reload();
                } else {
                    alert("发布失败！");
                }
            }
        })
    });

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