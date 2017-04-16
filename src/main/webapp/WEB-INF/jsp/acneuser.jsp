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
<link href="res/css/bootstrap-select.min.css" rel="stylesheet">

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

	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">个人首页</a></li>
			<li role="presentation"><a href="/acne/post_images">自拍照片</a></li>
			<li role="presentation"><a href="/acne/anti_recommands">推荐达人</a></li>
		</ul>
		<br />

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
							性别： <select id="sel-sex" class="selectpicker"
								data-style="btn btn-default">
								<option selected="selected">男</option>
								<option>女</option>
							</select>
						</div>
						<div class="col-lg-6" style="vertical-align: middle;">
							<div class="input-group">
								<span class="input-group-addon">患痘痘时长</span> <input
									id="span-time" type="text" class="form-control" placeholder="3"
									aria-describedby="span-time">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							肤质： <select id="sel-skintype" class="selectpicker"
								data-style="btn btn-default">
								<option selected="selected">缺水</option>
								<option>油性</option>
								<option>痘痘肌</option>
							</select>
						</div>
						<div class="col-lg-6" style="vertical-align: middle;">
							<div class="input-group">
								<span class="input-group-addon">年龄</span> <input id="age"
									type="number" class="form-control" placeholder="25"
									aria-describedby="age">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12"
							style="text-align: center; padding-top: 5px;">
							<div class="btn-group" role="group" aria-label="">
								<button id="btn-save" type="button" class="btn btn-default">保存</button>
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
			<div id="anti_recommand" class="row"></div>
		</div>


		<footer class="footer">
		<p>&copy; Company 2017</p>
		</footer>

	</div>
	<!-- /container -->

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script src="res/js/bootstrap-select.min.js"></script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		$(document).ready(function() {

			var userId =
	<%=userId%>
		;

			$.get('/acne/anti/recommands', function(data, status) {
				if (status == 'success') {
					var recommand_html = '';
					data.forEach(function(value, index, arr){
						var userId = value.userid;
						var avatar = value.avatar;
						var username = value.username;
						var desc = value.description;

						recommand_html += '<div class="col-xs-6 col-md-3">';
						recommand_html += '<a href="/acne/anti/userId='+userId+'" class="thumbnail">';
						recommand_html += '<img src="'+avatar+'", alt="'+desc+'">';
						recommand_html += '</a></div>';
					});
					$('#anti_recommand').html(recommand_html);
				}
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

			$('#btn-save').click(function() {
				var sex = $('#sel-sex').val();
				var skinType = $('#sel-skintype').val();
				var age = $('#age').val();
				var spanTime = $('#span-time').val();

				$.post('/acne/complete', {
					sex : sex,
					skinType : skinType,
					age : age,
					spanTime : spanTime
				}, function(data, status) {

					if (status == 'success') {
						$('#collapseExample').collapse('hide');
					}
				});
			});
		});
	</script>
</body>
</html>
