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
<link href="res/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="res/css/summernote.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="res/css/narrow-jumbotron.css" rel="stylesheet">
</head>

<body>
	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="/acne/antiuser">个人首页</a></li>
			<li role="presentation"><a href="/acne/view_acne">用户查看</a></li>
			<li role="presentation" class="active"><a
				href="/acne/post_article">写点博客</a></li>
			<li role="presentation"><a href="/acne/post_goods">上传产品</a></li>
		</ul>
		<br />

		<div class="container">
			<div class="row" style="margin-bottom: 20px;">
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1">标题</span> <input
						id="title" type="text" class="form-control" placeholder="标题"
						aria-describedby="sizing-addon1">
				</div>
			</div>
			<div class="row" style="margin-bottom: 20px;">
				<div id="summernote"></div>
				<div>
					<button id="upload" class="btn btn-default">保存</button>
					<button id="reset" class="btn btn-default">重置</button>
				</div>
			</div>
		</div>

		<footer class="footer">
		<p>&copy; Company 2017</p>
		</footer>

	</div>
	<!-- /container -->

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script src="res/js/summernote.js"></script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 600,
				minHeight : null,
				maxHeight : null,
				focus : true
			});

			$('#upload').click(function() {
				var title = $('#title').val();
				var textarea = $('#summernote').summernote('code');
				var json = {}
				json.title = title;
				json.blog = textarea;
				$.ajax({
					type : 'POST',
					url : '/acne/article',
					data : json,
					success : function(data) {
						console.log(data);
						var result = JSON.parse(data);
						if(result.message == 'success.'){
							$('#title').val('');
							$('#summernote').summernote('code', '');
							alert("上传成功!");
						}
					}
				});
			});
			
			$('#reset').click(function(){
				$('#title').val('');
				$('#summernote').summernote('code', '');
			});
		});
	</script>
</body>
</html>