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
                <li class="active">个人信息</li>
            </ul>
        </div>
    </div>
</div>


<section class="checkout-area ptb-54">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-12">
                <div class="log-in-coupon-code">
                    <p>个人信息</p>
                </div>
                <form id="saveForm">
                    <div class="billing-details">
                        <h3 class="title">我的信息</h3>
                        <div class="row">
                            <input type="hidden" name="id" value="${student.id }">

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>昵称</label> <input type="text" name="nickname" value="${student.nickname }"
                                        class="form-control">
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>班级</label> <input type="text" name="bj" value="${student.bj }"
                                                             class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>密码</label> <input type="password" name="pwd" value="${student.pwd }"
                                                         class="form-control">
                            </div>

                            <div class="form-group">
                                <label>手机号</label> <input type="text" name="phone" value="${student.phone }"
                                                          class="form-control">
                            </div>

                            <div class="form-group">
                                <label>收货地址</label> <input type="text" name="address" value="${student.address }"
                                                           class="form-control">
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>性别 </label>
                                    <div class="select-box">
                                        <select name="sex" class="form-control">
                                            <option value="男"  <c:if test="${student.sex == '男'}">selected</c:if>>男</option>
                                            <option value="女"  <c:if test="${student.sex == '女'}">selected</c:if>>女</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="photo" class="photo" value="${student.photo }">
                            <div class="form-group">
                                <label>图片:</label>
                                <div class="layui-upload">
                                    <div class="layui-upload-list">
                                        <img class="layui-upload-img" src="/images/${student.photo}" style="width:200px;height:100px;" id="demo1">
                                        <button type="button" class="btn btn-primary" id="test1">+</button>
                                        <p id="demoText"></p>
                                    </div>

                                </div>
                            </div>

                            <div class="submit-box">
                                <button type="button" id="save" class="btn btn-primary">确定修改</button>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-4 col-md-12">

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
<script src="<%=path%>/resource/layui/layui.js"></script>

<script>
    $("#save").click(function() {
        $.ajax({
            cache : true,
            type : "post",
            url : "updateStudent",
            data : $("#saveForm").serialize(),
            async : false,
            success : function(e) {
                if (e) {
                    alert("修改成功！");
                    window.parent.location.href = "toMine";
                } else {
                    alert("修改失败！");
                }
            }
        })
    });
</script>


<script>

    layui.use([ 'form','jquery','layer','laydate','upload' ], function() {
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate,
            upload = layui.upload,
            $= layui.jquery;
        form.render();//这句一定要加，占坑

        /*   laydate.render({
          elem: '#schoolTime'
        });
          laydate.render({
          elem: '#day'
        });  */


        var uploadInst = upload.render({
            elem: '#test1'
            ,url: 'upload'
            ,accept:'images'
            ,size:50000
            ,before: function(obj){

                obj.preview(function(index, file, result){

                    $('#demo1').attr('src', result);
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                var demoText = $('#demoText');
                demoText.html('<span style="color: #4cae4c;">上传成功</span>');

                var fileupload = $(".photo");
                fileupload.attr("value",res.data.src);
                console.log(fileupload.attr("value"));
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });



    });


</script>
</body>
</html>