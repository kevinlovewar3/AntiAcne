<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link href="res/css/fileinput.min.css" rel="stylesheet">
<link href="res/css/imgareaselect-default.css" rel="stylesheet">
<style>
.progress_modal {
	position: fixed;
	z-index: 999;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	background-color: Black;
	filter: alpha(opacity = 50);
	opacity: 0.5;
	-moz-opacity: 0.8;
}

.center {
	z-index: 1000;
	margin: 250px auto;
	padding: 10px;
	width: 140px;
	background-color: White;
	border-radius: 10px;
	filter: alpha(opacity = 60);
	opacity: 1;
	-moz-opacity: 1;
}

.loader {
	border: 16px solid #f3f3f3; /* Light grey */
	border-top: 16px solid #222222; /* Blue */
	border-radius: 50%;
	width: 120px;
	height: 120px;
	animation: spin 2s linear infinite;
}
</style>
<script>
	function upload_input() {
		var formData = new FormData();
		formData.append('file', $('input[type=file]')[0].files[0]);
		formData.append('x1', $('input[name="x1"]').val());
		formData.append('x2', $('input[name="x2"]').val());
		formData.append('y1', $('input[name="y1"]').val());
		formData.append('y2', $('input[name="y2"]').val());

		$('.progress_modal').show();
		$.ajax({
			url : '/acne/image/avatar',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				$('.progress_modal').hide();
				$('img#img_avatar').imgAreaSelect({
					hide : true
				});
				$('#myModal').modal('hide');
				var result = JSON.parse(data);
				if (result.message == 'success') {
					var filename = result.filename;
					$('#user_avatar').attr("src", "/acne/image/avatar/" + filename);
				}
			},
			error : function(err) {
				$('.progress_modal').hide();
				$('img#img_avatar').imgAreaSelect({
					hide : true
				});
				$('#myModal').modal('hide');
				var result = JSON.parse(JSON.stringify(data));
				console.log(result);
				if (result.message = 'fail') {

				}
			}
		});
	}
</script>

</head>

<body>
	<%
		String userIdStr = request.getSession().getAttribute("userId").toString();
		Long userId = Long.parseLong(userIdStr);
		String username = request.getSession().getAttribute("username").toString();
		String phone = request.getSession().getAttribute("phone").toString();
		String avatar = request.getSession().getAttribute("avatar").toString();
		String registerDate = request.getSession().getAttribute("registerDate").toString();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(registerDate);
		String description = request.getSession().getAttribute("description").toString();
	%>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<input type="hidden" name="x1" value="0" /> <input type="hidden"
					name="y1" value="0" /> <input type="hidden" name="x2" value="100" />
				<input type="hidden" name="y2" value="100" /> <input
					id="fileToUpload" name="fileToUpload" type="file" class="file"
					data-show-preview="false" data-show-upload="false"
					data-show-remove="false" data-style="width: 800px;" />
				<div id="facediv"
					style="display: block; z-index: 100; text-align: center; width: 100%;">
				</div>
				<div class="progress_modal" style="display: none;">
					<div class="center">
						<div class="loader"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">个人首页</a></li>
			<li role="presentation"><a href="/acne/post_images">自拍照片</a></li>
			<li role="presentation"><a href="/acne/anti_recommands">推荐达人</a></li>
		</ul>
		<br />

		<div class="container jumbotron" style="text-align: left;">
			<div class="row" style="width: 80%;">
				<div class="col-lg-4">
					<div class="avatar">
						<%
							out.print(
									"<img id='user_avatar' alt='Avatar' class='thumbnail' style='width: 200px; height: 200px;' src='/acne/image/avatar/"
											+ avatar + "'>");
						%>
					</div>
					<div id="dialog" class="btn-group btn-group-xs btn-primary"
						role="button">修改头像</div>
					<div style="font-size: 13px; color: #888888; margin-top: 5px;">
						注册时间：<%=format.format(date)%></div>
				</div>
				<div class="col-lg-8">
					<div style="font-size: 16px; color: #232323;">
						用户名：<%=username%>
						<br /> 手机号码：<%=phone%>
						<br />
						<div class="row">
							<div style="float: left; margin-left: 20px;">
								<h5>个人简介</h5>
							</div>
							<div style="float: right; margin-right: 20px;">
								<div class="btn-group btn-group-xs" role="group">
									<button id="save_desc_btn" type="button"
										class="btn btn-default">保存</button>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 5px;">
							<div class="col-lg-6">
								<select id="sel-sex" class="selectpicker" title="性别"
									data-style="btn btn-default">
									<option>男</option>
									<option>女</option>
								</select>
							</div>
							<div class="col-lg-6" style="vertical-align: middle;">
								<div class="input-group">
									<span class="input-group-addon">患痘痘时长</span> <input
										id="span-time" type="text" class="form-control"
										placeholder="3" aria-describedby="span-time">
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 5px;">
							<div class="col-lg-6">
								<select id="sel-skintype" class="selectpicker" title="肤质"
									data-style="btn btn-default">
									<option>缺水</option>
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
						<div style="vertical-align: bottom; margin-top: 5px;">
							<textarea id="desc-tt" class="form-control" rows="3" cols="50"
								placeholder="个人简介"><%=description%></textarea>
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
				<h4>浏览过的产品</h4>
				<div id="goods_hist"></div>
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
	<script src="res/js/fileinput.min.js"></script>
	<script src="res/js/jquery.imgareaselect.min.js"></script>
	<script src="res/js/jquery.imgareaselect.pack.js"></script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		$(document)
				.ready(
						function() {

							var avatar_input = document.getElementById("fileToUpload");
							var avatar_result = document.getElementById("facediv");

							if (typeof FileReader === 'undefined') {
								avatar_result.innerHTML = 'your browser not support';
								avatar_input.setAttribute('disabled', 'disabled');
							} else {
								avatar_input.addEventListener('change', readFile, false);
							}

							function readFile() {
								var file = this.files[0];
								if (!/image\/\w+/.test(file.type)) {
									alert('文件必须为图片');
									return false;
								}
								var reader = new FileReader();
								reader.readAsDataURL(file);
								reader.onload = function(e) {
									avatar_result.innerHTML = '<div><img id="img_avatar" src="'
											+ this.result
											+ '" alt="upload image" style="display: block; overflow: hidden; width: 100%; height: 500px;"/><p style="margin-top: 20px;"><input id="upload_input" onclick="upload_input()" type="button" class="btn btn-primary" value="提交"></p></div>';

									$('img#img_avatar').imgAreaSelect({
										maxWidth : 500,
										maxHeight : 500,
										minWidth : 100,
										minHeight : 100,
										x1 : 0,
										y1 : 0,
										x2 : 250,
										y2 : 250,
										aspectRatio : '1:1',
										handles : true,
										onSelectEnd : function(img, selection) {
											$('input[name="x1"]').val(selection.x1);
											$('input[name="y1"]').val(selection.y1);
											$('input[name="x2"]').val(selection.x2);
											$('input[name="y2"]').val(selection.y2);
										}
									});
								}
							}

							$.get('/acne/post_self', function(data, status) {
								if (status == 'success') {
									var sex = data.sex;
									var skintype = data.skintype;
									var acnetimespan = data.acnetimespan;
									var age = data.age;
									var description = data.description;
									$('#sel-sex').selectpicker('val', sex);
									$('#sel-skintype').selectpicker('val', skintype);
									$('#span-time').val(acnetimespan);
									$('#age').val(age);
									$('#desc-tt').val(description);
								}
							});

							var userId =<%=userId%>;
							$.get('/acne/anti/recommands', function(data, status) {
								if (status == 'success') {
									var recommand_html = '';
									data.forEach(function(value, index, arr) {
										var userId = value.userid;
										var avatar = value.avatar;
										var username = value.username;
										var desc = value.description;

										recommand_html += '<div class="col-xs-6 col-md-3">';
										recommand_html += '<a href="/acne/anti/userId='+userId+'" class="thumbnail">';
										recommand_html += '<img src="/acne/image/avatar/'+avatar+'", alt="'+desc+'">';
										recommand_html += '</a></div>';
									});
									$('#anti_recommand').html(recommand_html);
								}
							});

							$.get('/acne/article_hist', {
								userId : userId
							}, function(data, status) {

								if (status == 'success') {
									if (data === '[null]') {
										$('#article_hist').html('<div style="font-size: 15px; color: #999999;">无浏览历史</div>');
									} else {
										var article_list_html = '';
										$.each(data, function(index, obj) {
											var title = obj.title.substr(0, 10);
											var articleId = obj.articleid;
											var content = '';
											if (obj.content.length > 50) {
												content = obj.content.substr(0, 50) + '......';
											} else {
												content = obj.content;
											}
											article_list_html += '<h4><a href="/acne/article?articleId=' + articleId + '">' + title + '</a></h4>';
											article_list_html += '<p>' + content + '</p>';
										});
										$('#article_hist').html(article_list_html);
									}
								}
							});

							$.get('/acne/goods_hist', {
								userId : userId
							}, function(data, status) {
								if (status == 'success') {
									if (data === '[null]') {
										$('#goods_hist').html('<div style="font-size: 15px; color: #999999;">无浏览历史</div>');
									} else {
										var goods_list_html = '';
										$.each(data, function(index, obj) {

										});
										$('#goods_hist').html(goods_list_html);
									}
								}
							});

							$('#save_desc_btn').click(function() {
								var sex = $('#sel-sex').val();
								var skinType = $('#sel-skintype').val();
								var age = $('#age').val();
								var spanTime = $('#span-time').val();
								var desc_tt = $('#desc-tt').val();

								$.post('/acne/complete', {
									sex : sex,
									skinType : skinType,
									age : age,
									spanTime : spanTime,
									desc : desc_tt
								}, function(data, status) {
									if (status == 'success') {
										
									}
								});
							});

							$('#dialog').click(function() {
								$('#myModal').modal('show');
							});
						});
	</script>
</body>
</html>
