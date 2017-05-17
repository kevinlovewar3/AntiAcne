<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.acne.model.AcneImage"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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
	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="/acne/antiuser">个人首页</a></li>
			<li role="presentation" class="active"><a href="/acne/view_acne">用户查看</a></li>
			<li role="presentation"><a href="/acne/post_article">写点博客</a></li>
			<li role="presentation"><a href="/acne/post_goods">上传产品</a></li>
		</ul>
		<br />

		<%
			List<AcneImage> acneImages = (ArrayList) request.getAttribute("acneUsers");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for (int i = 0; i < acneImages.size(); i++) {
				AcneImage acneImage = acneImages.get(i);
				Long imageId = acneImage.getImageid();
				String imageName = acneImage.getPath();
				String desc = acneImage.getDesc();
				Long acneUserId = acneImage.getAcneuserid();
				if (desc == null || desc.length() == 0) {
					desc = "用户没留言";
				}
				Date postTime = acneImage.getPosttime();
				Integer auth = acneImage.getAuthorith();
				if (auth == 1)
					continue;

				out.print("<div class='row'>");
				out.print("<div class='col-lg-4'>");
				out.print("<img alt='Card image cap' style='height: 280px; width: 360px;' src='/acne/image/"
						+ acneImage.getPath() + "'>");
				out.print("</div>");

				out.print("<div class='col-lg-8'>");
				out.print("<div style='font-size: 17px; color: #888888; padding-top: 20px;'>");
				out.print("用户上传于：" + format.format(postTime));
				out.print("</div>");
				out.print("<div style='font-size: 16px; color: #ababab;'>");
				out.print("<p>" + desc + "</p>");
				out.print("</div>");
				out.print("<div style='margin-top: 10px;'>");
				out.print("<textarea id='comment-" + i
						+ "' placeholder='留言' rows='5' cols='0' style='width: 80%; padding: 3px; font-size: 18px; color: #444444;'></textarea>");
				out.print("</div>");
				out.print("<div style='margin-top: 10px;'>");
				out.print("<button id='btn_submit' onclick='addMessage(" + acneUserId + "," + i
						+ ")' class='btn btn-default' type='button'>提交</button>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
				out.print("<br /><br />");
			}
			if (acneImages.size() == 0) {
				out.print("<div class='row'>");
				out.print("<div class='col-lg-12' style='font-size: 20px; color: #999999;'>");
				out.print("暂时没有信息");
				out.print("</div>");
				out.print("</div>");
			}
		%>

		<nav aria-label="Page navigation">
		<ul class="pagination pagination-lg">
			<%
				Integer pages = (Integer) request.getAttribute("pages");
				Integer current = (Integer) request.getAttribute("current");
				if (pages == 0) {
				} else {
					if (current > 1) {
						out.print("<li class='enabled'><a href='/acne?pageNo=" + (current - 1)
								+ "&pageSize=9'><span aria-hidden='true'>&laquo;</a></span></li>");
					} else {
						out.print("<li class='disabled'><span><span aria-hidden='true'>&laquo;</span></span></li>");
					}
					if (current >= 6 && pages > 10) {
						for (int m = 5; m >= 1; m--) {
							out.print("<li class='enabled'><a href='/acne?pageNo=" + (current - m) + "&pageSize=9'>"
									+ (current - m) + "<span class='sr-only'>(current)</a></span></li>");
						}
						out.print("<li class='active'><span>" + current
								+ "<span class='sr-only'>(current)</span></span></li>");
						int next = (pages - current < 4) ? (pages - current) : 4;
						for (int n = 1; n <= next; n++) {
							out.print("<li class='enabled'><a href='/acne?pageNo=" + (current + n) + "&pageSize=9'>"
									+ (current + n) + "<span class='sr-only'>(current)</a></span></li>");
						}
					} else {
						int pageNum = pages >= 10 ? 10 : pages;
						for (int i = 1; i <= pageNum; i++) {
							if (current == i) {
								out.print("<li class='active'><span>" + i
										+ "<span class='sr-only'>(current)</span></span></li>");
							} else {
								out.print("<li class='enabled'><a href='/acne?pageNo=" + i + "&pageSize=9'>" + i
										+ "<span class='sr-only'>(current)</a></span></li>");
							}
						}
					}
					if (current >= pages) {
						out.print("<li class='disabled'><span><span aria-hidden='true'>&raquo;</span></span></li>");
					} else {
						out.print("<li class='enabled'><a href='/acne?pageNo=" + (current + 1)
								+ "&pageSize=9'><span aria-hidden='true'>&raquo;</a></span></li>");
					}
				}
			%>

		</ul>
		</nav>

		<footer class="footer">
		<p>&copy; Company 2017</p>
		</footer>

	</div>
	<!-- /container -->

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script>
		function addMessage(acneUserId, i) {
			var comment = $('#comment-' + i).val();
			console.log(comment);
			$.get('/acne/comments', { acneUserId : acneUserId, comment : comment }, function(data) { console.log(data); });
		}
	</script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		$(document).ready(function() {

		});
	</script>
</body>
</html>
