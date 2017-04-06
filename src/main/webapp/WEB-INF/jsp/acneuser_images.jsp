<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

</head>

<body>
	<%
		String userIdStr = request.getSession().getAttribute("userId").toString();
		Long userId = Long.parseLong(userIdStr);
		String username = request.getSession().getAttribute("username").toString();
		String phone = request.getSession().getAttribute("phone").toString();
	%>

	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="/acne/acneuser">个人首页</a></li>
			<li role="presentation" class="active"><a
				href="/acne/post_images">自拍照片</a></li>
			<li role="presentation"><a href="/acne/anti_recommands">推荐达人</a></li>
		</ul>
		<br />

		<div class="row">
			<div class="col-lg-12">
				<form action="/acne/post_images" method="post" target="target_frame"
					enctype="multipart/form-data">
					<input id="file_upload" class="file" name="image" type="file">
				</form>
			</div>
		</div>
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
				uploadUrl : '/acne/post_images',
				language : 'zh',
				allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
				allowedPreviewTypes : [ 'image' ],
				dropZoneEnabled : true,
				enctype : 'multipart/form-data',
				showUpload : true,
				showRemove : true,
				showCaption : false,
				autoReplace : false,
				browseClass : "btn btn-primary",
				previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
				maxFileSize : 2000,
			});
			
			$.get('', function(){
				
			});
		});
	</script>
</body>
</html>
