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
                <li class="active">购物大厅</li>
            </ul>
        </div>
    </div>
</div>


<section class="best-seller-area ptb-54">
    <div class="container">
        <div class="section-title text-center">
            <h2>最畅销</h2>
        </div>
        <div class="row justify-content-center">

            <c:forEach items="${pageInfo.list}" var="data">

            <div class="col-xl-3 col-sm-6">
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



            </div>
            </c:forEach>


            <div class="col-12">
                <div class="pagination-area text-center">

                    <a class="page-numbers " href="toSearchIndex?currentPage=1">首页</a>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <a  class="page-numbers" href="toSearchIndex?currentPage=${pageInfo.pageNum-1}">&lt;&lt;</a>
                    </c:if>

                    <c:forEach begin="${pageInfo.pageNum  }"  end="${pageInfo.pages }" var="i">
                        <a  class="page-numbers  <c:if test="${pageInfo.pageNum == i }">current </c:if> " href="toSearchIndex?currentPage=${i }"     >${i }</a>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <a  class="page-numbers" href="toSearchIndex?currentPage=${pageInfo.pageNum+1}">&gt;&gt;</a>
                    </c:if>
                    <a class="page-numbers " href="toSearchIndex?currentPage=${pageInfo.pages}">尾页</a>

                  <%--  <span class="page-numbers current" aria-current="page">1</span>
                    <a href="" class="page-numbers">2</a>
                    <a href="" class="page-numbers">3</a>
                    <a href="" class="next page-numbers">
                        <i class="ri-arrow-right-line"></i>
                    </a>--%>
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
    function addCart(id){
        $.ajax({
            url:"addCart",
            data:{"g_id": id,"quantity":1},
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