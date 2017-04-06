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
<link href="res/css/narrow-jumbotron.css" rel="stylesheet">
</head>
<body>

	<%
		String userIdStr = request.getSession().getAttribute("userId").toString();
		Long userId = Long.parseLong(userIdStr);
		String username = request.getSession().getAttribute("username").toString();
		String phone = request.getSession().getAttribute("phone").toString();
	%>



	<div class="jumbotron" style="text-align: left;">
		<table style="width: 80%;">
			<tr>
				<td><img alt="User Avatar" src="res/images/favicon.ico"></td>
				<td>
					<div>
						<p>
							用户名：<%=username%></p>
						<p>
							手机号码：<%=phone%></p>
					</div>
				</td>
			</tr>
		</table>
		<br /> <a class="btn btn-primary" role="button"
			data-toggle="collapse" href="#collapseExample" aria-expanded="false"
			aria-controls="collapseExample">完善个人资料</a>

		<div class="collapse" id="collapseExample">
			<div class="well">
				<div class="row">
					<div class="col-lg-6">
						性别：
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								男 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">男</a></li>
								<li><a href="#">女</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6" style="vertical-align: middle;">
						<div class="input-group">
							<span class="input-group-addon" id="span-time">患痘痘时长</span> <input
								type="text" class="form-control" placeholder="3"
								aria-describedby="span-time">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						肤质：
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								油性 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">油性</a></li>
								<li><a href="#">痘痘肌</a></li>
								<li><a href="#">缺水肌</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6" style="vertical-align: middle;">
						<div class="input-group">
							<span class="input-group-addon" id="age">年龄</span> <input
								type="number" class="form-control" placeholder="25"
								aria-describedby="age">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row marketing">
		<div class="col-lg-6">
			<h4>浏览过的博文</h4>
			<div id="article_hist"></div>
		</div>

		<div class="col-lg-6">
			<h4>浏览产品</h4>
			<div id="goods_hist"></div>
			<p>Donec id elit non mi porta gravida at eget metus. Maecenas
				faucibus mollis interdum.</p>

			<h4>Subheading</h4>
			<p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
				Cras mattis consectetur purus sit amet fermentum.</p>

			<h4>Subheading</h4>
			<p>Maecenas sed diam eget risus varius blandit sit amet non
				magna.</p>
		</div>
	</div>

	<div class="row marketing">
		<div class="col-lg-12">
			<h4>推荐达人</h4>
		</div>
	</div>

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		$(document).ready(function() {

			var userId =<%=userId%>;

			$.get('/acne/anti/recommands', function(data, status) {
			});

			$.get('/acne/article_hist', {
				userId : userId
			}, function(data, status) {

				var article_list_html = '';
				$.each(data, function(index, obj) {
					var title = obj.title.substr(0, 10);
					var articleId = obj.articleid;
					var content = obj.content.substr(0, 50);
					article_list_html += '<h4><a href="/acne/article?articleId=' + articleId + '">' + title + '</a></h4>';
					article_list_html += '<p>' + content + '</p>';
				});
				$('#article_hist').html(article_list_html);
			});

			$.get('/acne/goods_hist', {
				userId : userId
			}, function(data, status) {
			});
		});
	</script>
</body>
</html>