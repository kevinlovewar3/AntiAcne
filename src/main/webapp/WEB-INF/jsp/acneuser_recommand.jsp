<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.acne.model.AntiAcneUser"%>
<%@page import="java.util.Date"%>
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
<link href="res/css/bootstrap-select.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="res/css/narrow-jumbotron.css" rel="stylesheet">
</head>

<body>
	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="/acne/acneuser">个人首页</a></li>
			<li role="presentation"><a href="/acne/post_images">自拍照片</a></li>
			<li role="presentation" class="active"><a href="#">推荐专家</a></li>
		</ul>
		<br />


		<%
			Object antiObj = request.getAttribute("antiUser");
			if (antiObj == null) {
				out.print("<div class='row col-lg-12 text-center' style='font-size: 20px; color: #999999;'>");
				out.print("暂时无推荐");
				out.print("</div>");
			} else {
				List<AntiAcneUser> list = (ArrayList) antiObj;
				for (int i = 0; i < list.size(); i++) {
					AntiAcneUser user = list.get(i);
					Long userId = user.getUserid();
					String desc = user.getDescription();
					String avatar = user.getAvatar();
					Integer available = user.getAvailable();
					String username = user.getUsername();
					Date registerDate = user.getRegisterdate();
					String title = user.getTitle();
					out.print("<div class='row'>");
					if (avatar == null) {
						avatar = "res/img/default.png";
					} else {
						avatar = "/acne/image/avatar/" + avatar;
					}
					out.print("<div class='col-lg-2 card' style='width: 150px; height: 120px; display: block;'>");
					out.print("<a href='/acne/anti/userId=" + userId + "' class='thumbnail'>");
					out.print("<img src='" + avatar + "', alt='" + desc + "'>");
					out.print("</a>");
					out.print("</div>");
					out.print("<div class='col-lg-10' style=' vertical-align: middle; display: block; font-size: 16px; color: #333333;'>");
					out.print("<span><b>" + username + "</b></span>");
					out.print("<br />");
					out.print("注册于：" + registerDate);
					out.print("<br />");
					out.print(desc);
					out.print("<br />");
					String[] titles = title.split("|");
					out.print(titles[0] + "年护肤经验" + " " + titles[1]);
					out.print("</div>");
					out.print("</div>");
				}
			}
		%>

		<br />

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
</body>
</html>
