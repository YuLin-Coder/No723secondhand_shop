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
	content="width=device-width, student-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>添加失物</title>
<link rel="icon" href="<%=path%>/resource/static/favicon.ico">
<link rel="stylesheet"
	href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/index.css">
<link rel="stylesheet"
	href="<%=path%>/layui/css/layui.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/main.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/html.css">
<script src="<%=path%>/resource/static/js/vue.min.js"></script>
<script src="<%=path%>/resource/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js"></script>
<script src="<%=path%>/resource/static/admin/js/config.js"></script>
<script src="<%=path%>/resource/static/admin/js/script.js"></script>
<script src="<%=path%>/resource/layui/layui.js"></script>

	<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
</head>
<body>

	<div id="app" class="d-flex">
		<jsp:include page="/WEB-INF/common/line.jsp" />

		<main>
			<jsp:include page="/WEB-INF/common/head.jsp" />

			<div id="body">


				<main>
					<div class="main">

						<div class="title-box">
							<h5>新增失物</h5>
						</div>
						<div class="form-box">
							<div class="row">
								<div class="col-5">
									<form id="saveForm">
										<div class="form-group">
											<label>物品名称</label> <input type="text" name="goodsname"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>物品状态</label> <select name="type" class="form-control">
												<option value="丢失物品">丢失物品</option>
												<option value="捡到物品">捡到物品</option>

										</select> <small class="form-text text-muted"></small>
										</div>



										<div class="form-group">
											<label>发布者姓名</label> <input type="text" name="publisher"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>发生地点</label> <input type="text" name="spot"
																	  class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>联系方式</label> <input type="text" name="phone"
																	  class="form-control"> <small
												class="form-text text-muted"></small>
										</div>


										<div class="form-group">
											<label>失物简介</label> <input type="text" name="note"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>


										<div class="form-group">
											<label>捡到/丢失日期</label> <input type="text" name="create_date"
												  class="form-control"> <small
												class="form-text text-muted"></small>
										</div>


										  
                                        <input type="hidden" name="photo" class="photo">
										   <div class="form-group">
										        <label>图片:</label>
										        <div class="layui-upload">
										          <div class="layui-upload-list">
										                <img class="layui-upload-img" style="width:200px;height:100px;" id="demo1">
										                <button type="button" class="btn btn-primary" id="test1">+</button>
										                <p id="demoText"></p>
										            </div>
										           
										        </div>
										    </div>

										<div class="form-group">
											<label> 物品详情</label>
											<script id="container" name="detail" type="text/plain"></script>
											<small class="form-text text-muted"></small>
										</div>
									</form>
								</div>
							</div>

						</div>


						<div class="submit-box">
							<button type="button" id="save" class="btn btn-primary">确定提交</button>
							<!--             <button type="button" onclick="window.history.back()" class="btn btn-outline-secondary">取消</button>
 -->
						</div>
					</div>
				</main>



			</div>

		</main>
	</div>
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
				url : "addProduct",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("新增成功！");
						window.parent.location.href = "ProductList";
					} else {
						alert("新增失败！");
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
