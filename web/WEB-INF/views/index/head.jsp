<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
%>


<header class="header-area">

    <div class="top-header">
        <div class="container">
            <div class="row align-items-center">

                <div class="col-lg-4">
                    <div class="header-right-content">
                        <ul>
                            <c:if test="${student != null}">
                                <li>
                                    <a >欢迎学生：${student.nickname}</a>
                                </li>
                                <li>
                                    <a style="color: blue" href="toLoginOutAct">退出登录</a>
                                </li>
                            </c:if>

                            <c:if test="${student == null}">
                                <li>
                                    <a  href="toRegister">去注册</a>
                                </li>
                                <li>
                                    <a style="color: blue"  href="toLoginOutAct">去登陆</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="middle-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3">
                    <div class="logo">
                        <a href="toIndex" style="font-size: 30px;">
                            校园二手物品交易平台
                        </a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <form class="search-box" action="toSearchIndex">
                        <input type="text" name="key" value="${key}" placeholder="输入名称" class="form-control">
                        <button type="submit" class="search-btn">
                            <i class="ri-search-line"></i>
                            查询
                        </button>
                    </form>
                </div>
                <div class="col-lg-4">
                    <ul class="wish-cart">
                        <li>
                            <span class="cart" data-bs-toggle="modal" data-bs-target="#exampleModal-cart">
                            <span class="wish-icon">
                            <i class="ri-shopping-cart-line"></i>
                            <span class="count">${totalNums}</span>
                            </span>
                            <span class="favorite">我的购物车:</span>
                            $${totalMoney}
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="navbar-area only-home-one-sticky">
        <div class="mobile-responsive-nav">
            <div class="container">
                <div class="mobile-responsive-menu">
                    <div class="navbar-category">
                        <button type="button" id="categoryButton-1" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="ri-menu-line"></i>
                        </button>
                        <div class="navbar-category-dropdown dropdown-menu" aria-labelledby="categoryButton">
                            <ul>
                                <c:forEach items="${categoryList}" var="data">
                                    <li>
                                        <a href="toSearchIndex?type=${data.name}">${data.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="logo">
                        <a href="index.html">
                            <img src="<%=path%>/resource/index/static/picture/logo.png" alt="logo">
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <div class="desktop-nav">
            <div class="container">
                <nav class="navbar navbar-expand-md navbar-light">
                    <div class="navbar-category">
                        <button type="button" id="categoryButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="ri-menu-line"></i>
                           所有分类
                            <i class="arrow-down ri-arrow-down-s-line"></i>
                        </button>
                        <div class="navbar-category-dropdown dropdown-menu" aria-labelledby="categoryButton">
                            <ul>
                                <c:forEach items="${categoryList}" var="data">
                                    <li>
                                        <a href="toSearchIndex?type=${data.name}">${data.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item float-end">
                                <a href="toIndex" class="nav-link <c:if test="${url == 'toIndex'}">active</c:if>  ">主页面</a>
                            </li>
                            <li class="nav-item float-end">
                                <a href="toSearchIndex" class="nav-link <c:if test="${url == 'toSearchIndex'}">active</c:if>  ">购物大厅</a>
                            </li>
                            <li class="nav-item float-end">
                                <a href="toSearchProduct" class="nav-link <c:if test="${url == 'toSearchProduct'}">active</c:if>  ">失物大厅</a>
                            </li>
                            <li class="nav-item float-end">
                                <a href="toBoard" class="nav-link <c:if test="${url == 'toBoard'}">active</c:if>  ">通知公告</a>
                            </li>

                            <c:if test="${student != null}">
                                <li class="nav-item float-end">
                                    <a href="toCart" class="nav-link <c:if test="${url == 'toCart'}">active</c:if>  ">我的购物车</a>
                                </li>
                            <li class="nav-item float-end">
                                <a href="toMine" class="nav-link <c:if test="${url == 'toMine'}">active</c:if>  ">个人信息</a>
                            </li>
                                <li class="nav-item float-end">
                                    <a href="toOrder" class="nav-link <c:if test="${url == 'toOrder'}">active</c:if>  ">我的订单</a>
                                </li>
                                <li class="nav-item float-end">
                                    <a href="toIndexAddGoods" class="nav-link <c:if test="${url == 'toIndexAddGoods'}">active</c:if>  ">发布物品</a>
                                </li>
                                <li class="nav-item float-end">
                                    <a href="toIndexAddProduct" class="nav-link <c:if test="${url == 'toIndexAddProduct'}">active</c:if>  ">发布失物</a>
                                </li>
                            </c:if>

                        </ul>
                    </div>
                </nav>
            </div>
        </div>



    </div>


</header>

<div class="modal fade cart-shit" id="exampleModal-cart" tabindex="-1" aria-hidden="true">
    <div class="cart-shit-wrap">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close-btn" data-bs-dismiss="modal">
                        <i class="ri-close-fill"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <ul class="cart-list">
                        <c:forEach items="${cartList}" var="data">
                            <li>
                            <img src="/images/${data.goods.photo}" style="width: 50px;height: 50px;" alt="Image">
                            <a href="" style="width: 250px;">
                                    ${data.goods.name}
                            </a>
                            <span>元 ${data.goods.price} x ${data.quantity}</span>

                        </li>
                            <br>
                        </c:forEach>

                    </ul>
                    <ul class="payable">
                        <li>
                           合计
                        </li>
                        <li class="total">
                            <span>${totalMoney}元</span>
                        </li>
                    </ul>
                    <ul class="cart-check-btn">
                        <li>
                            <a href="toCart" class="default-btn">
                                我的购物车
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>