<%@page import="com.acne.model.GoodsWithBLOBs"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.acne.model.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="res/images/favicon.ico">

<title>
	<%
		GoodsWithBLOBs goodsWithBLOBs = (GoodsWithBLOBs) request.getAttribute("goods");
	%>
</title>

<!-- Bootstrap core CSS -->
<link href="res/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="res/css/blog.css" rel="stylesheet">
</head>

<body>

	<div class="navbar navbar-inverse bg-inverse">
		<div class="container d-flex justify-content-between">
			<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		</div>
	</div>

	<div class="blog-header">
		<div class="container">
			<h1 class="blog-title">
				<%
					String title = goodsWithBLOBs.getGoodsname();
					out.print("<h1>");
					out.print(title);
					out.print("</h1>");
				%>
			</h1>
			<p class="lead blog-description"
				style="margin-bottom: 10px; margin-top: 10px; font-size: 15px;">
				<%
					String content = goodsWithBLOBs.getDescription();
				%>
			</p>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-8 blog-main">
				<div class="blog-post">
					<h2 class="blog-post-title"></h2>
				</div>
				<div id="blog-content"></div>
				<!-- /.blog-post -->

				<div class="">
					<a href="/acne">返回首页</a>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<footer class="blog-footer">
	<p>
		<a href="#">Back to top</a>
	</p>
	</footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="res/js/jquery-3.1.1.slim.min.js"></script>
	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/tether.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>

	<script>
		$(document).ready(function() {

			function aHereDoc() {
				/*
	<%=goodsWithBLOBs.getDescription()%>
		*/
			}

			function hereDoc(func) {
				return func.toString().split(/\n/).slice(1, -1).join('\n');
			}
			var content = hereDoc(aHereDoc);
			$('#blog-content').html(content);

		});
	</script>

</body>
</html>
