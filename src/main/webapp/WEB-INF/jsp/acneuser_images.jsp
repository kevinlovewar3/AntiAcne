<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.acne.model.AcneImage"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="res/images/favicon.ico">

<title>个人首页</title>

<!-- Bootstrap core CSS -->
<link href="res/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="res/css/fileinput.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="res/css/narrow-jumbotron.css" rel="stylesheet">
<script>
	function saveMedia() {
		var formData = new FormData();
		formData.append('file', $('input[type=file]')[0].files[0]);
		console.log('form data' + formData);
		$.ajax({
			url : '/acne/post_images',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				var result = JSON.parse(data);
				if (result.message == 'success') {
					location.reload(true);
				}
			},
			error : function(err) {
				var result = JSON.parse(JSON.stringify(data));
				if (result.message = 'fail') {
					alert('failed to upload, please try again latter.');
				}
			}
		});
	}

	function onUpdate(imageid, auth) {
		var url = '/acne/update/image/' + imageid;
		$.post(url, {
			operation : 'update',
			authority : auth
		}, function(data, status) {
			console.log(status);
			console.log(data);
		});
	}

	function onDelete(imageid) {
		var url = '/acne/update/image/' + imageid;
		$.post(url, {
			operation : 'delete'
		}, function(data, status) {
			if (status == 'success') {
				location.reload(true);
			}
		});
	}
</script>
</head>

<body>
	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="/acne/acneuser">个人首页</a></li>
			<li role="presentation" class="active"><a href="#">自拍照片</a></li>
			<li role="presentation"><a href="/acne/anti_recommands">推荐专家</a></li>
		</ul>
		<br />
		
		<form action="/acne/post_images" target="upload_target"
			class="form-vertical required-validate" method="post"
			enctype="multipart/form-data" onsubmit="saveMedia();">
			<div class="row">
				<h3>上传照片</h3>
				<div class="col-lg-6 form-group">
					<input type="file" class="file" data-show-upload="false" data-browse-label="选择图片"
					 data-browse-icon = "<i class='glyphicon glyphicon-picture'></i>"
						id="file_upload" data-show-preview="false">
					<p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 form-group">	
					<button id="upload_btn" type="submit" class="btn btn-success">上传</button>
				</div>
			</div>
		</form>

		<iframe id="upload_target" name="upload_target" src="#"
			style="width: 0; height: 0; border: 0px solid #fff;"></iframe>

		<div class="row">
			<h3>历史照片</h3>
			<div id="display">
				<%
					Object imagesObj = request.getAttribute("acneImages");
					if (imagesObj == null) {
						out.print("<div style='font-size: 16px; color: #999999;'><h3>无照片可以显示</h3></div>");
					} else {
						List<AcneImage> acneImages = (ArrayList<AcneImage>) imagesObj;
						for (int i = 0; i < acneImages.size(); i++) {
							if (i % 3 == 0) {
								out.print("<div class='row'>");
							}
							AcneImage acneImage = acneImages.get(i);
							Long imageId = acneImage.getImageid();
							out.print("<div class='col-lg-4'>");
							out.print("<div class='card' style='font-size: 13px; color: #999999;'>");
							Date date = acneImage.getPosttime();
							Integer open = acneImage.getAuthorith();
							String openStr = "";
							String privateStr = "";
							if (open == 1) {
								openStr = "";
								privateStr = "active";
							} else {
								openStr = "active";
								privateStr = "";
							}
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							out.print("<div style='display: block; vertical-align: text-bottom;'>上传于：" + format.format(date));
							out.print(
									"<div style='display: block; float: right; margin-bottom: 5px;' class='btn-group' data-toggle='buttons'><label class='btn btn-default "
											+ openStr + "' onclick='onUpdate(" + imageId
											+ ", \"open\");'><input type='radio' name='options' autocomplete='off'>公开</label><label class='btn btn-default "
											+ privateStr + "' onclick='onUpdate(" + imageId
											+ ", \"private\");'><input type='radio' name='options' autocomplete='off'>隐私</label>");
							out.print("<label class='btn btn-default' onclick='onDelete(" + imageId
									+ ")'><input type='radio' name='options' autocomplete='off'>删除</label>");
							out.print("</div></div>");
							out.print("<a href='/acne/check_comments/"+imageId+"'><img alt='Card image cap' style='height: 280px; width: 360px;' src='/acne/image/"
									+ acneImage.getPath() + "'></a>");
							out.print("</div>");
							out.print("<div style='font-size: 14px; color: #ababab;'>简述：" + acneImage.getDesc() + "</div>");
							out.print("</div>");
							if (i % 3 == 2) {
								out.print("</div><br /><br />");
							}
						}
						if(acneImages.size() == 0){	
							out.print("<div style='font-size: 16px; color: #999999;'><h3>无照片可以显示</h3></div>");
						}
					}
				%>
			</div>
		</div>

		<br />
		<footer class="footer">
			<p>&copy; Company 2017</p>
		</footer>

	</div>
	<!-- /container -->

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script src="res/js/fileinput.min.js"></script>
	<script src="res/js/locales/zh.js"></script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		$(document).ready(function() {
			$('#file_upload').fileinput({
				language : 'zh',
				browseLabel: "选择图片",
		        browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i> ",
				allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
				showPreview : false,
				allowedPreviewTypes : [ 'image' ],
				dropZoneEnabled : true,
				showUpload : true,
				showRemove : true,
				showCaption : false,
				autoReplace : false,
				browseClass : "btn btn-primary",
				previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
			});

		});
	</script>
</body>
</html>
