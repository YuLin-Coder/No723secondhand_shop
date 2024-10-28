<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
	<title>校园二手物品交易平台</title>
	<link rel="icon" href="favicon.ico" type="image/ico">
	<meta name="keywords" content="后台管理系统HTML模板">
	<meta name="description" content="基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
	<meta name="author" content="yinqi">
	<link href="<%=path%>/resource/boot/css/bootstrap.min.css"
		  rel="stylesheet">
	<link rel="icon" href="<%=path%>/resource/static/favicon.ico">
	<link rel="stylesheet"
		  href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet"
		  href="<%=path%>/resource/static/admin/css/index.css">
	<link rel="stylesheet"
		  href="<%=path%>/resource/static/admin/css/main.css">
	<link rel="stylesheet"
		  href="<%=path%>/resource/static/admin/css/html.css">
	<script src="<%=path%>/resource/static/js/vue.min.js"></script>
	<script src="<%=path%>/resource/static/js/jquery-3.3.1.min.js"></script>
	<script src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="<%=path%>/resource/static/admin/js/config.js"></script>
	<script src="<%=path%>/resource/static/admin/js/script.js"></script>
	<script type="text/javascript"
			src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
	<script>
		$(function() {
			const hrefArr = window.location.href.split('/');
			const name = hrefArr[hrefArr.length - 1];
			$('.menu a[href=\'' + name + '\']').addClass('active');
		});
	</script>
	<style>
		.main {
			overflow-y: auto;
		}

		.info .card {
			min-height: 330px;
		}

		.user .card {
			min-height: 500px;
		}

		.card h5 {
			margin-bottom: 20px;
		}

		.main ul li {
			margin-bottom: 3px;
		}
	</style>
</head>
<nav>
	<div class="logo">
		<h4>校园二手物品交易</h4>
	</div>
	<ul class="menu">
		<li><a href="toMain"><i class="iconfont mr-1">&#xe6a2;</i>首页</a></li>
		<c:if test="${admin !=null }">

			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6e0;</i>学生管理<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="StudentList">学生列表</a></li>
					<li><a href="toAddStudent">添加学生</a></li>
				</ul></li>
			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe69d;</i>公告管理<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="BoardList">公告列表</a></li>
					<li><a href="toAddBoard">去新增公告记录</a></li>
				</ul></li>
			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe69d;</i>分类管理<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="CategoryList">分类列表</a></li>
					<li><a href="toAddCategory">去新分类记录</a></li>
				</ul></li>

			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6ad;</i>物品管理<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="GoodsList">物品列表</a></li>
					<li><a href="toAddGoods">去新增物品记录</a></li>
				</ul></li>

			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6ad;</i>失物管理<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="ProductList">失物列表</a></li>
					<li><a href="toAddProduct">去新增失物</a></li>
				</ul></li>

			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6ad;</i>订单管理<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="OrdersList">订单列表</a></li>
				</ul></li>
			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6ad;</i>评论管理<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="CommentsList">评论列表</a></li>
				</ul></li>

			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6d4;</i>系统设置<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="toUpdateAdminPassword">修改密码</a></li>
				</ul></li>


			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6d4;</i>数据统计<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="toEcharts">数据统计</a></li>
				</ul></li>




		</c:if>



		<li><a href="toLoginOutAct"><i class="iconfont mr-1">&#xe68c;</i>退出登录</a>
		</li>
	</ul>
</nav>