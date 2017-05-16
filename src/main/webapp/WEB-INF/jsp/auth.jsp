<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="res/images/favicon.ico">

<title>用户登录</title>

<!-- Bootstrap core CSS -->
<link href="res/css/bootstrap.min.css" type="text/css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="res/css/signin.css" type="text/css" rel="stylesheet">
</head>

<body>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">账户注册</h4>
				</div>
				<div class="modal-body">

					<p>
					<div class="input-group">
						<span class="input-group-addon">用户名：</span> <input
							id="register-username" type="text" class="form-control"
							placeholder="用户名" aria-describedby="register-username">
					</div>
					</p>

					<p>
					<div class="input-group">
						<span class="input-group-addon" id="phone_number">手机号码：</span> <input
							id="register-phone" type="number" class="form-control"
							placeholder="+86-" aria-describedby="phone_number">
					</div>
					</p>

					<div class="input-group">
						<span class="input-group-addon" id="password">输入密码：</span> <input
							id="register-password" class="form-control" placeholder="至少6位" type="password"
							aria-describedby="password">
					</div>
					</p>

					<div class="input-group">
						<span class="input-group-addon" id="conform_password">确认密码：</span>
						<input type="password" class="form-control" placeholder="至少6位" id="conform-password"
							aria-describedby="conform_password">
					</div>
					</p>
					您是
					<div>
						<label class="radio-inline"> <input type="radio"
							checked="checked" name="userType0" id="acne_user"
							value="acne_user">普通用户
						</label> <label class="radio-inline"> <input type="radio"
							name="userType0" id="anti_user" value="anti_user">皮肤专家
						</label>
					</div>
				</div>
				<div class="modal-footer">
					<!--
					<div id="count_down" style="display: block;"></div>
					-->
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<!--
					<button id="send_code_btn" data-loading-text="请等待..." autocomplete="off" type="button" class="btn btn-primary">发送动态验证码</button>
					-->
					<button id="register_btn" type="button" class="btn btn-primary">注册</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<script>
			function remember() {

				if (document.getElementById('remember-me').checked) {

					localStorage.remember = 'checked';
					localStorage.phone = document.getElementById('inputPhone').value;
					localStorage.password = document.getElementById('inputPassword').value;
					var radio = document.getElementsByName('userType');
					for (i = 0; i < radio.length; i++) {
						if (radio[i].checked) {
							localStorage.userType = radio[i].value;
						}
					}
				} else {
					localStorage.remember = 'unchecked';
				}
			}
		</script>

		<form class="form-signin" method="post" action="#"
			accept-charset="UTF-8">
			<h2 class="form-signin-heading">请输入手机号码登录</h2>
			<label for="inputPhone" class="sr-only">手机号码</label> <input
				type="text" id="inputPhone" class="form-control" name="username"
				placeholder="手机号码" required autofocus> <label
				for="inputPassword" class="sr-only">密码</label> <input
				type="password" id="inputPassword" class="form-control"
				name="password" placeholder="密码" required>
			<div>
				<label class="radio-inline"> <input type="radio"
					checked="checked" name="userType" id="acne_user" value="acne_user">普通用户
				</label> <label class="radio-inline"> <input type="radio"
					name="userType" id="anti_user" value="anti_user">皮肤专家
				</label>
			</div>
			<br /> <label> <input id="remember-me" type="checkbox"
				value="true" name="rememberMe" onclick="remember();"> 记住我
			</label>

			<div class="input-group" style="padding: 5px;">
				<span class="input-group-addon"> 
				<%
 					out.print("<div>");
 					Object validateCodeObj = request.getAttribute("validateCode");
 					if (validateCodeObj != null) {
 						String validatorString = validateCodeObj.toString();
 						for (int i = 0; i < validatorString.length(); i++) {
 							String name = validatorString.charAt(i) + ".gif";
 							out.print("<img src='res/img/" + name + "' alt='" + name + "'>");
 						}
 					}
 					out.print("</div>");
 				%>
				</span> <input id="validate_code" type="text" class="form-control"
					name="validateCode" placeholder="验证码"
					aria-describedby="validate code">
			</div>

			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
			<button id="btn_register" class="btn btn-lg btn-default btn-block"
				type="button" data-toggle="modal" data-target="#myModal">一键注册</button>
		</form>

	</div>
	<!-- /container -->

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script charset='utf-8'>
		$(document).ready(function() {

			$('#register_btn').click(function() {

				var phone = $('#register-phone').val();
				var password = $('#register-password').val();
				var conform_password = $('#conform-password').val();
				var userType = $("input[name='userType0']:checked").val();
				var username = $('#register-username').val();
				
				if(username == ""){
					alert('用户名不可为空！');
					return;
				}
				
				if(phone == "" || password == "" || conform_password == ""){
					alert('电话或者密码不可为空！');
					return;
				}
				if(phone.length != 11){
					alert('电话为11位数字!');
					return;
				}
				
				if(password != conform_password){
					alert('两次输入密码不一致!');
					return;
				}
				
				$.post('/acne/register_no_verify', {
					username : username,
					phone : phone,
					password : hex_md5(password),
					userType : userType
				}, function(data, status) {
					if(status == 'success'){
						if(data.message == 'success'){
							$('#myModal').modal('hide');
							
							$('#inputPhone').val(phone);
							$('#inputPassword').val(password);
						}	
					}
				});
			});

			$('#send_code_btn').click(function() {
				$('#send_code_btn').button('loading');
				$('#count_down').css("display", "block");

				var phone = $('#register-phone').val();
				var userType = $("input[name='userType0'][checked]").val();

				$.get('/acne/send_code', {
					phone : phone,
					userType : userType
				}, function(data) {
					console.log(data);
				});

				var count = 60;
				var interval = setInterval(function() {
					if (count == 1) {
						clearInterval(interval);
						$('#send_code_btn').button('reset');
					}
					count--;
					$('#count_down').html('<label>' + count + ' s</label>');
				}, 1000)
			});

			$('#myModal').on('shown.bs.modal', function() {
				$('#myModalLabel').focus();
			})

			var remember = localStorage.getItem("remember");
			if (remember == 'checked') {
				document.getElementById('remember-me').checked = true;
				var userType = localStorage.getItem("userType");
				var radio = document.getElementsByName('userType');
				for (i = 0; i < radio.length; i++) {
					if (radio[i].value == userType) {
						radio[i].checked = true;
					}
				}
				var phone = localStorage.getItem("phone");
				var password = localStorage.getItem("password");
				if (phone != null && password != null) {
					document.getElementById('inputPhone').value = phone;
					document.getElementById('inputPassword').value = password;
				}
			} else {
				document.getElementById('inputPhone').value = '';
				document.getElementById('inputPassword').value = '';
			}
		});
	</script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script src="res/js/md5.js"></script>
</body>
</html>