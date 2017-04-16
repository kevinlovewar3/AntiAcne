<%@page import="java.net.URLDecoder"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.acne.model.Article"%>
<%@page import="java.util.List"%>
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

<title>精选博文</title>

<!-- Bootstrap core CSS -->
<link href="res/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="res/css/offcanvas.css" rel="stylesheet">
</head>

<body style="padding-top: 0px;">

	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="/acne/post_suggest" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">网站建议</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="name">Please feel free and send your
								suggestion to us, Thank you in advance.</label>
							<textarea id="text_suggest" class="form-control" rows="5"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="btn_submit" type="button" class="btn btn-primary"
							type="submit">提交</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div
		style="width: 100%; height: 100px; vertical-align: middle; background-color: #ddd; display: inline-block; text-align: center;">

		<div style="width: 100%; height: 100%;">
			<table border="0" width=100% height=100%>
				<tr align=center valign=middle>
					<td style="width: 50%"><span><h1>SKIN FRESH</h1></span></td>
					<td style="width: 50%">
						<ul class="nav nav-pills">
							<li role="presentation" class="active"><a href="#">精选博文</a></li>
							<li role="presentation"><a href="/acne/goods-self">推荐产品</a></li>
							<%
								Object userType = request.getSession().getAttribute("userType");
								if (userType != null) {
									if (userType.toString().equalsIgnoreCase("acne_user")) {
										out.print("<li role='presentation' class='dropdown'>");
										out.print(
												"<a class='dropdown-toggle' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>");
										String username = request.getSession().getAttribute("username").toString();
										out.print(username);
										out.print("<span class='caret'></span>");
										out.print("</a>");
										out.print("<ul class='dropdown-menu'>");
										out.print("<li style='margin: 0 auto;'><a href='/acne/acneuser'>个人首页</a></li>");
										out.print("<li style='margin: 0 auto;'><a href='#'>自拍上传</a></li>");
										out.print("<li style='margin: 0 auto;'><a href='/acne/logout'>注销</a></li>");
										out.print("</ul></li>");
									}
									if (userType.toString().equalsIgnoreCase("anti_user")) {
										out.print("<li role='presentation' class='dropdown'>");
										out.print(
												"<a class='dropdown-toggle' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>");
										String username = request.getSession().getAttribute("username").toString();
										out.print(username);
										out.print("<span class='caret'></span>");
										out.print("</a>");
										out.print("<ul class='dropdown-menu'>");
										out.print("<li style='margin: 0 auto;'><a href='/acne/antiuser'>个人首页</a></li>");
										out.print("<li style='margin: 0 auto;'><a href='/acne/view_acne'>浏览痘痘患者</a></li>");
										out.print("<li style='margin: 0 auto;'><a href='/acne/post_article'>写点博客</a></li>");
										out.print("<li style='margin: 0 auto;'><a href='/acne/post_goods'>上传产品</a></li>");
										out.print("<li style='margin: 0 auto;'><a href='/acne/logout'>注销</a></li>");
										out.print("</ul></li>");
									}
								} else {
									out.print("<li role='presentation'><a href='/acne/login'>个人信息</a></li>");
								}
							%>
							<li role="presentation"><a data-toggle="modal"
								data-target="#myModal">网站建议</a></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>


	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<div style="width: 100%; height: 40px;"></div>

			<div class="col-12 col-md-9">

				<div class="jumbotron">
					<h2>重要通知</h2>
					<p>
						请大家查看小编精心挑选的博文，并留下宝贵的意见。小编会坚持查找优质博文，同时为大家推荐物美价廉的产品。
						同时大家可以把自己的照片上传，<b>您的信息不会泄露给任何人</b>。网站目前已有18位达人注册，帮助您解决问题。
					</p>
				</div>
				<div class="row">

					<%
						List<Article> list = (ArrayList) request.getAttribute("articles");
						for (int i = 0; i < list.size(); i++) {
							Article article = list.get(i);
							Long articleId = article.getArticleid();

							String title = article.getTitle();
							String content = article.getContent();
							String digest = content.length() > 50 ? content.substring(0, 50) : content;

							out.print("<div class='col-6 col-lg-4'>");
							out.print("<h3>");
							out.print(title);
							out.print("</h3>");
							out.print("<p>");
							out.print(digest);
							out.print("</p>");
							out.print("<p>");
							out.print("<a class='btn btn-secondary' href='/acne/article?articleId=" + articleId
									+ "' role='button'>查看详情&raquo;</a>");
							out.print("</p>");
							out.print("</div>");
						}
					%>
				</div>
				<!--/row-->
			</div>
			<!--/span-->

			<div class="col-6 col-md-3">
				<p>
					<b>今天推荐</b>
				</p>
			</div>
			<div class="col-6 col-md-3 sidebar-offcanvas" id="sidebar">
				<div id="list-articles" class="list-group"></div>
			</div>
			<!--/span-->
		</div>

		<!--/row-->
		<hr>

		<nav aria-label="Page navigation">
		<ul class="pagination pagination-lg">
			<%
				Integer pages = (Integer) request.getAttribute("pages");
				Integer current = (Integer) request.getAttribute("current");
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
					out.print("<li class='active'><span>" + current + "<span class='sr-only'>(current)</span></span></li>");
					int next = (pages - current < 4) ? (pages - current) : 4;
					for (int n = 1; n <= next; n++) {
						out.print("<li class='enabled'><a href='/acne?pageNo=" + (current + n) + "&pageSize=9'>"
								+ (current + n) + "<span class='sr-only'>(current)</a></span></li>");
					}
				} else {
					int pageNum = pages >= 10 ? 10 : pages;
					for (int i = 1; i <= pageNum; i++) {
						if (current == i) {
							out.print(
									"<li class='active'><span>" + i + "<span class='sr-only'>(current)</span></span></li>");
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
			%>
		</ul>
		</nav>
		<footer>
		<p>&copy; Company 2017</p>
		</footer>

	</div>
	<!--/.container-->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="res/js/jquery-3.1.1.slim.min.js"></script>
	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script src="res/js/offcanvas.js"></script>
	<script charset="utf-8">
		$(document)
				.ready(
						function() {
							$('#myModal').on('shown.bs.modal', function() {
								$('#suggest').focus();
							});

							$('#btn_submit').click(function(){
								var userId =<%=request.getSession().getAttribute("userId")%>;
								var userType ='<%=request.getSession().getAttribute("userType")%>';
								var suggest = $('#text_suggest').val();
								
								$.post('/acne/post_suggest', {
									userId : userId,
									userType : userType,
									suggest : suggest
								}, function(data, status) {
									$('#myModal').modal('hide');
								});	
							});
							
							$.get('/acne/recommands',
											{
												size : 10
											},
											function(data, status) {
												$.each(data,function(index,obj) {
													var title = obj.title.substr(0,10);
													$("#list-articles").append('<a href="/acne/article?articleId='+ obj.articleid+ '" class="list-group-item">'+ title+ '</a>');
												});
											});
						});
	</script>
</body>
</html>