<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link rel="icon" href="<%=path%>/resource/static/favicon.ico">
    <link rel="stylesheet" href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/resource/static/admin/css/login.css">
    <script src="<%=path%>/resource/static/js/vue.min.js"></script>
    <script src="<%=path%>/resource/static/js/jquery-3.3.1.min.js"></script>
    <script src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js"></script>
</head>
<body>
<div class="login" style="height: 50%">
    <form id="saveForm">
        <h2>校园二手物品交易平台登录</h2>
        <div class="form-group">
            <label>手机号|用户名</label>
            <input type="text" v-model="username" name="username" id="username" class="form-control form-control-lg">
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="password" v-model="password" name ="password" id="password" class="form-control form-control-lg" id="pwd">
        </div>
        <div class="form-group form-check">
           <input type="radio" class="form-check-input" name="type" value="1" id="exampleCheck2" checked>
            <label class="form-check-label" for="exampleCheck2">管理员</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" class="form-check-input" name="type" value="2" id="exampleCheck1" >
            <label class="form-check-label" for="exampleCheck1">学生</label>
            
        </div> 

        <button type="button" id="login" class="btn btn-primary btn-lg  btn-block">

            立即登录
        </button>
        <button type="button" onclick="location.href='toIndex'"  class="btn btn-success btn-lg  btn-block">

          返回
        </button>
        <p>小提示：学生使用手机号登录、管理员使用用户名登录</p>
    </form>
</div>

<script>
	    $("#login").click(function(){
	    	var username = $("#username").val();
	    	var password = $("#password").val();
	    	if(username == null || username == ""){
	    		alert("请填写用户名");
	    		return false;
	    	}if(password == null || password == ""){
	    		alert("请填写密码");
	    		return false;
	    	}
			//执行添加的操作ajax
			$.ajax({
				cache:true,
				type:"post",
				url:"login",
				data:$("#saveForm").serialize(),
				async:false,
				success:function(e){
					if(e == 'ok'){
						alert("登录成功");
						 window.parent.location.href="toMain";
					}else if(e == 'toIndex'){
                        alert("登录成功");
                        window.parent.location.href="toIndex";
                    }else{
						alert("登录失败，账号或密码错误");
					}
				}
			})
		});
		   
</script>

</body>
</html>
