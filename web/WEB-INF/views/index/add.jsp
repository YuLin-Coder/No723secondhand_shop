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
                <li class="active">发布物品</li>
            </ul>
        </div>
    </div>
</div>



<section class="checkout-area ptb-54">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-12">
                <div class="log-in-coupon-code">
                    <p>发布物品</p>
                </div>
                <form id="saveForm">
                    <div class="billing-details">
                        <h3 class="title">填写物品信息</h3>
                        <div class="row">

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>物品名称</label> <input type="text" name="name"
                                                             class="form-control">
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>分类</label> <select name="cname" class="form-control">
                                    <c:forEach items="${categoryList}" var="data">
                                        <option value="${data.name}">${data.name}</option>
                                    </c:forEach>

                                </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>库存</label> <input type="number" name="stock"
                                                         class="form-control">
                            </div>

                            <div class="form-group">
                                <label>价格</label> <input type="number" name="price"
                                                          class="form-control">
                            </div>

                            <div class="form-group">
                                <label>物品简介</label> <input type="text" name="note"
                                                           class="form-control">
                            </div>


                            <div class="form-group">
                                <label>折扣</label> <select name="discount" class="form-control">
                                <option value="9">9折扣</option>
                                <option value="8">8折扣</option>
                                <option value="7">7折扣</option>
                                <option value="6">6折扣</option>
                                <option value="5">5折扣</option>
                            </select>
                            </div>


                            <input type="hidden" name="photo" class="photo" >
                            <div class="form-group">
                                <label>图片:</label>
                                <div class="layui-upload">
                                    <div class="layui-upload-list">
                                        <img class="layui-upload-img" src="" style="width:200px;height:100px;" id="demo1">
                                        <button type="button" class="btn btn-primary" id="test1">+</button>
                                        <p id="demoText"></p>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <label>物品内容</label>
                                <script id="container" name="detail" type="text/plain"></script>
                                <small class="form-text text-muted"></small>
                            </div>

                            <div class="submit-box">
                                <button type="button" id="save" class="btn btn-primary">立即发布</button>
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
        <p>Copyright &copy; 2021.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
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


<script src="<%=path %>/resource/js/ueditor/ueditor.config.js"></script>
<script src="<%=path %>/resource/js/ueditor/ueditor.all.min.js"></script>
<script src="<%=path %>/resource/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var ue = UE.getEditor('container',{
        initialFrameWidth:800,
        //   initialFrameHeight:400,
    });
</script>

<script>
    $("#save").click(function() {
        $.ajax({
            cache : true,
            type : "post",
            url : "addGoods",
            data : $("#saveForm").serialize(),
            async : false,
            success : function(e) {
                if (e) {
                    alert("发布成功！");
                    window.parent.location.href = "toSearchIndex";
                } else {
                    alert("发布失败！");
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