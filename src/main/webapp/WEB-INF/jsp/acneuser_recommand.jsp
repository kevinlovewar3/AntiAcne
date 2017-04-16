<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.acne.model.AntiAcneUser"%>
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
	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="/acne/acneuser">个人首页</a></li>
			<li role="presentation"><a href="/acne/post_images">自拍照片</a></li>
			<li role="presentation" class="active"><a href="#">推荐达人</a></li>
		</ul>
		<br />

		<%
			Object antiObj = request.getSession().getAttribute("antiUser");
			if (antiObj == null) {
				out.print("No Anti User available!");
			} else {
				List<AntiAcneUser> list = (ArrayList) antiObj;
				for (int i = 0; i < list.size(); i++) {
					AntiAcneUser user = list.get(i);
					Long userId = user.getUserid();
					String desc = user.getDescription();
					String avatar = user.getAvatar();
					if (i % 4 == 0) {
						out.print("<div class='row'>");
					}
					out.print("<div class='col-xs-6 col-md-3'>");
					out.print("<a href='/acne/anti/userId=" + userId + "' class='thumbnail'>");
					out.print("<img src='" + avatar + "', alt='" + desc + "'>");
					out.print("</a></div>");
					if (i % 4 == 3) {
						out.print("</div>");
					}
				}
			}
		%>

		<div class="row">
			<div class="col-"></div>
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
</body>
</html>
