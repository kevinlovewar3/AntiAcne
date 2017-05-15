<%@page import="java.util.ArrayList"%>
<%@page import="com.acne.model.GoodsWithBLOBs"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
				<%
					List<GoodsWithBLOBs> list = (ArrayList) request.getAttribute("goods");
					for (int i = 0; i < list.size(); i++) {
						GoodsWithBLOBs goodsWithBLOBs = list.get(i);

						String image = goodsWithBLOBs.getGoodspicture();
						String description = goodsWithBLOBs.getDescription();
						out.print("<div class='card'>");
						out.print("<img data-src='" + image
								+ "' alt='Card image cap' style='height: 280px; width: 100%; display: block;'>");
						out.print("<p class='card-text'>");
						out.print(description);
						out.print("</p>");
						out.print("</div>");
					}
					if (list.size() == 0) {
						out.print("<div style='font-size: 30px; color: #999999;'>");
						out.print("没有产品展示");
						out.print("</div>");
					}
				%>
			</div>

			<nav aria-label="Page navigation">
			<ul class="pagination pagination-lg">
				<%
					Integer pages = (Integer) request.getAttribute("pages");
					Integer current = (Integer) request.getAttribute("current");
					if (pages == 0) {
					} else {
						if (current > 1) {
							out.print("<li class='enabled'><a href='/acne/goods?pageNo=" + (current - 1)
									+ "&pageSize=9'><span aria-hidden='true'>&laquo;</a></span></li>");
						} else {
							out.print("<li class='disabled'><span><span aria-hidden='true'>&laquo;</span></span></li>");
						}
						if (current >= 6 && pages > 10) {
							for (int m = 5; m >= 1; m--) {
								out.print("<li class='enabled'><a href='/acne/goods?pageNo=" + (current - m) + "&pageSize=9'>"
										+ (current - m) + "<span class='sr-only'>(current)</a></span></li>");
							}
							out.print("<li class='active'><span>" + current
									+ "<span class='sr-only'>(current)</span></span></li>");
							int next = (pages - current < 4) ? (pages - current) : 4;
							for (int n = 1; n <= next; n++) {
								out.print("<li class='enabled'><a href='/acne/goods?pageNo=" + (current + n) + "&pageSize=9'>"
										+ (current + n) + "<span class='sr-only'>(current)</a></span></li>");
							}
						} else {
							int pageNum = pages >= 10 ? 10 : pages;
							for (int i = 1; i <= pageNum; i++) {
								if (current == i) {
									out.print("<li class='active'><span>" + i
											+ "<span class='sr-only'>(current)</span></span></li>");
								} else {
									out.print("<li class='enabled'><a href='/acne/goods?pageNo=" + i + "&pageSize=9'>" + i
											+ "<span class='sr-only'>(current)</a></span></li>");
								}
							}
						}
						if (current >= pages) {
							out.print("<li class='disabled'><span><span aria-hidden='true'>&raquo;</span></span></li>");
						} else {
							out.print("<li class='enabled'><a href='/acne/goods?pageNo=" + (current + 1)
									+ "&pageSize=9'><span aria-hidden='true'>&raquo;</a></span></li>");
						}
					}
				%>
			</ul>
			</nav>
		</div>
	</div>

	<footer class="text-muted">
	<div class="container">
		<p class="float-right">
			<a href="/acne/">返回首页</a>.
		</p>
	</div>
	</footer>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="res/js/jquery-3.1.1.slim.min.js"></script>
	<script>
		window.jQuery || document.write('<script src="res/js/jquery-3.1.1.min.js"><\/script>')
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
