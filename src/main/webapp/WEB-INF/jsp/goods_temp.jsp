<%@page import="java.util.ArrayList"%>
<%@page import="com.acne.model.GoodsWithBLOBs"%>
<%@page import="java.util.List"%>
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

<title>推荐产品</title>

<!-- Bootstrap core CSS -->
<link href="res/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="res/css/album.css" rel="stylesheet">
</head>

<body>

	<div class="navbar navbar-inverse bg-inverse">
		<div class="container d-flex justify-content-between">
			<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		</div>
	</div>

	<section class="jumbotron text-center">
	<div class="container">
		<h1 class="jumbotron-heading">主打产品</h1>
		<p class="lead text-muted">这是一款原生态，没有任何化学添加的产品。</p>
	</div>
	</section>

	<div class="album text-muted">
		<div class="container">

			<div class="row">
				
			</div>
		</div>
	</div>

	<footer class="text-muted">
	<div class="container">
		<p class="float-right">
			<a href="#">Back to top</a>
		</p>
		<p>Album example is &copy; Bootstrap, but please download and
			customize it for yourself!</p>
		<p>
			New to Bootstrap? <a href="../../">Visit the homepage</a> or read our
			<a href="../../getting-started/">getting started guide</a>.
		</p>
	</div>
	</footer>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="res/js/jquery-3.1.1.slim.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="res/js/jquery-3.1.1.min.js"><\/script>')
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script src="res/js/holder.min.js"></script>
	<script>
		$(function() {
			Holder.addTheme("thumb", {
				background : "#55595c",
				foreground : "#eceeef",
				text : "Thumbnail"
			});
		});
	</script>
	<script src="res/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
