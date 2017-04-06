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
		Map<String, Object> map = null;
		Object articleObj = request.getAttribute("article");
		if (articleObj != null) {
			map = (HashMap<String, Object>) articleObj;
			out.print(map.get("title").toString());
		}
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
					if (map != null) {
						String title = map.get("title").toString();
						out.print(title);
					}
				%>
			</h1>
			<p class="lead blog-description"
				style="margin-bottom: 10px; margin-top: 10px;">
				<%
					if (map != null) {
						String username = map.get("username").toString();
						String description = map.get("description").toString();
						String publishDate = map.get("publishDate").toString();

						String viewTimes = map.get("viewTimes").toString();
						String upTimes = map.get("upTimes").toString();
						String downTimes = map.get("downTimes").toString();
						out.print(username + "发表于：" + publishDate + "<br>");
						out.print(viewTimes + "次浏览" + " " + upTimes + "人觉得有用 " + downTimes + "人觉得没用");
					}
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
				
				<div class="btn-group" style="margin-top: 30px; margin-bottom: 40px;" role="group" aria-label="acne option">
  					<button id="upTimebtn" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="赞  +1">赞一个</button>
  					<button id="downTimebtn" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="踩  +1">踩一下</button>
				</div>
			</div>
			<!-- /.blog-main -->
			<div class="col-sm-3 offset-sm-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<h4>关于作者</h4>
					<p>
						<em> <%
 								if (map != null) {
 									String username = map.get("username").toString();
 									out.print(username);
 								}
 							%></em> 
 							<br />
						<%
							if (map != null) {
								String desc = map.get("description").toString();
								out.print(desc);
							}
						%>
					</p>
				</div>
				<div class="sidebar-module">
					<h4>作者的其它文章</h4>
					<ol id="article_list" class="list-unstyled">
					</ol>
				</div>
			</div>
			<!-- /.blog-sidebar -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<footer class="blog-footer">
	<p>
		Blog template built for <a href="https://getbootstrap.com">Bootstrap</a>
		by <a href="https://twitter.com/mdo">@mdo</a>.
	</p>
	<p>
		<a href="#">Back to top</a>
	</p>
	</footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="res/js/jquery-3.1.1.slim.min.js"></script>
	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="res/js/jquery.min.js"><\/script>')
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>

	<script src="res/js/Markdown.Converter.js"></script>

	<script>
		$(document).ready(function() {	
			
			function aHereDoc() {/*
				<%=map.get("content").toString()%>
			*/}

			function hereDoc(func) {
				return func.toString().split(/\n/).slice(1, -1).join('\n');
			}
			var content = hereDoc(aHereDoc);
			var converter = new Markdown.Converter();
			var htm = converter.makeHtml(content);
			$('#blog-content').html(content);
			
			<%Object userIdObj = request.getSession().getAttribute("userId");
			Object userTypeObj = request.getSession().getAttribute("userType");
			String userId = userIdObj == null ? null : userIdObj.toString();
			String userType = userTypeObj == null ? null : userTypeObj.toString();%>
			var articleId = '<%=Long.parseLong(map.get("articleId").toString())%>';
			var viewTimes = 1;
			var userId = '<%=userId%>';
			var userType = '<%=userType%>';

			$.get('/acne/anti/article_list', {
				articleId : articleId
			}, function(data, status) {

				var article_list_html = '';
				$.each(data, function(index, obj) {
					var title = obj.title.substr(0, 10);
					var articleId = obj.articleid;
					article_list_html += '<li><a href="/acne/article?articleId=' + articleId + '">' + title + '</a></li>';
				});
				$('#article_list').html(article_list_html);
			});

			$.post('/acne/article_hist', {
				articleId : articleId,
				viewTimes : 1,
				userId : userId,
				userType : userType
			}, function(data, status) {
			});
			
			$('#upTimebtn').click(function(){
				$.get('/acne/article/option?articleId='+articleId+'&upTimes=1', function(data, status){
					if(status == 'success'){
						$('#upTimebtn').tooltip('show');
						setTimeout(function(){
							$('#upTimebtn').tooltip('destroy');
						}, 2500);
					}
				});
			});
			
			$('#downTimebtn').click(function(){
				$.get('/acne/article/option?articleId='+articleId+'&downTimes=1', function(data, status){
					if(status == 'success'){
						$('#downTimebtn').tooltip('show');
						setTimeout(function(){
							$('#downTimebtn').tooltip('destroy');
						}, 2500);
					}
				});
			});
		});
	</script>

</body>
</html>
