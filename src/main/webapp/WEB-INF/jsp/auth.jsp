<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="res/images/favicon.ico">

<title>用户登录</title>

<!-- Bootstrap core CSS -->
<link href="res/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="res/css/signin.css" rel="stylesheet">
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
						<span class="input-group-addon" id="phone_number">手机号码：</span> <input
							type="number" class="form-control" placeholder="+86-"
							aria-describedby="phone_number">
					</div>
					</p>

					<p>
					<div class="input-group">
						<span class="input-group-addon" id="dynamic_password">动态密码：</span>
						<input type="number" class="form-control" placeholder="123456"
							aria-describedby="dynamic_password">
					</div>
					</p>

					<div class="input-group">
						<span class="input-group-addon" id="password">输入密码：</span> <input
							type="text" class="form-control" placeholder="至少6位"
							aria-describedby="password">
					</div>
					</p>

					<div class="input-group">
						<span class="input-group-addon" id="conform_password">确认密码：</span>
						<input type="text" class="form-control" placeholder="至少6位"
							aria-describedby="conform_password">
					</div>
					</p>

					您是
					<div>
						<label class="radio-inline"> <input type="radio"
							checked="checked" name="userType" id="acne_user"
							value="acne_user">痘痘患者
						</label> <label class="radio-inline"> <input type="radio"
							name="userType" id="anti_user" value="anti_user">治痘达人
						</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">发送动态验证码</button>
				</div>
			</div>
		</div>
	</div>

	<%
		Object userType = request.getAttribute("userType");
		if (userType != null) {
			request.getSession().setAttribute("userType", userType.toString());
		} else {
			request.getSession().removeAttribute("userType");
		}
		Object result = request.getAttribute("result");
		if (result != null) {
			if (result.toString().indexOf("username") == -1) {
				out.println(result.toString());
				return;
			}

			JSONObject resultJsonObj = new JSONObject(result.toString());

			String username = resultJsonObj.getString("username");
			String phone = resultJsonObj.getString("phone");
			Long userId = resultJsonObj.getLong("userid");
			int available = resultJsonObj.getInt("available");
			request.getSession().setAttribute("userId", userId);
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("phone", phone);
			request.getSession().setAttribute("available", available);

			response.sendRedirect("/acne");
		} else {
			request.getSession().removeAttribute("userId");
			request.getSession().removeAttribute("username");
			request.getSession().removeAttribute("phone");
			request.getSession().removeAttribute("available");
		}
	%>

	<div class="container">

		<form class="form-signin" method="post" action="#"
			accept-charset="UTF-8">
			<h2 class="form-signin-heading">请输入手机号码登录</h2>
			<label for="inputPhone" class="sr-only">手机号码</label> <input
				type="text" id="inputPhone" class="form-control" name="phone"
				placeholder="手机号码" required autofocus> <label
				for="inputPassword" class="sr-only">密码</label> <input
				type="password" id="inputPassword" class="form-control"
				name="password" placeholder="密码" required>
			<div>
				<label class="radio-inline"> <input type="radio"
					checked="checked" name="userType" id="acne_user" value="acne_user">痘痘患者
				</label> <label class="radio-inline"> <input type="radio"
					name="userType" id="anti_user" value="anti_user">治痘达人
				</label>
			</div>
			<br /> <label> <input type="checkbox" value="remember-me">
				记住我
			</label>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>

			<button id="btn_register" class="btn btn-lg btn-default btn-block"
				type="button" data-toggle="modal" data-target="#myModal">一键注册</button>
		</form>


	</div>
	<!-- /container -->

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#myModal').on('shown.bs.modal', function() {
				$('#myModalLabel').focus();
			})

		});
	</script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>