<%@page import="com.acne.util.StringUtil"%>
<%@page import="com.acne.util.ObjectUtil"%>
<%@page import="com.acne.util.HtmlRegexpUtil"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.session.Session"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.acne.model.Article"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="">
<meta name="keywords" content="护肤 祛痘 祛痘印 祛黑头 去痘 去痘印 去黑头 补水 控油">
<meta name="description"
	content="SKIN FRESH是一个优质护肤文章、护肤产品信息共享的平台。护肤专家根据用户提供的详细信息做出针对性的护肤建议。">
<link rel="icon" href="res/images/favicon.ico">

<title>精选博文</title>

<!-- Bootstrap core CSS -->
<link href="res/css/bootstrap.min.css" type="text/css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="res/css/offcanvas.css" type="text/css" rel="stylesheet">
<link href="res/css/narrow-jumbotron.css" type="text/css"
	rel="stylesheet">

<style type="text/css">
body {
	padding-top: 0px;
}
</style>

</head>

<body>

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
							<label for="name">留言薄</label>
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

	<nav class="navbar navbar-expand-md navbar-inverse bg-inverse mb-4"
		style="padding-left: 20%; padding-right: 20%;">
		<a class="navbar-brand" href="#">SKIN FRESH</a>
		<ul class="nav nav-pills" style="margin: 5px;">
			<li role="presentation" class="active"><a href="#">精选博文</a></li>
			<li role="presentation"><a href="/acne/goods">产品分析</a></li>
			<%
				Object acneNumObj = request.getAttribute("acneNum");
				Object antiNumObj = request.getAttribute("antiNum");

				Subject subject = SecurityUtils.getSubject();
				Session shiroSession = subject.getSession(false);
				if (shiroSession != null) {
					Object userType = shiroSession.getAttribute("userType");
					if (userType != null) {
						if (userType.toString().equalsIgnoreCase("acne_user")) {
							out.print("<li role='presentation' class='dropdown'>");
							out.print(
									"<a class='dropdown-toggle' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>");
							String username = request.getSession().getAttribute("username").toString();
							out.print(username);
							out.print("<span class='caret'></span>");
							out.print("<span id='badge' class='badge'></span>");
							out.print("</a>");
							out.print("<ul class='dropdown-menu'>");
							out.print("<li style='margin: 0 auto;'><a href='/acne/acneuser'>个人首页</a></li>");
							out.print("<li style='margin: 0 auto;'><a href='/acne/post_images'>自拍上传</a></li>");
							out.print("<li style='margin: 0 auto;'><a href='/acne/anti_recommands'>推荐专家</a></li>");
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
							out.print("<li style='margin: 0 auto;'><a href='/acne/view_acne'>用户查看</a></li>");
							out.print("<li style='margin: 0 auto;'><a href='/acne/post_article'>写点博客</a></li>");
							out.print("<li style='margin: 0 auto;'><a href='/acne/post_goods'>上传产品</a></li>");
							out.print("<li style='margin: 0 auto;'><a href='/acne/logout'>注销</a></li>");
							out.print("</ul></li>");
						}
					} else {
						out.print("<li role='presentation'><a href='/acne/login'>个人信息</a></li>");
					}
				} else {
					out.print("<li role='presentation'><a href='/acne/login'>个人信息</a></li>");
				}
			%>
			<li role="presentation"><a data-toggle="modal"
				data-target="#myModal">网站建议</a></li>
		</ul>
	</nav>

	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right col-lg-12">
			<div style="width: 100%; height: 40px;"></div>
			<div class="col-lg-9 col-md-9 col-9">
				<div class="jumbotron">
					<h2>重要通知</h2>
					<p>
						<%
							out.print("网站注册用户：");
							out.print(acneNumObj.toString());
							out.print("<br />");
							out.print("护肤专业人员：");
							out.print(antiNumObj.toString());
						%>
					</p>
				</div>

				<%
					List<Article> list = (ArrayList) request.getAttribute("articles");
					for (int i = 0; i < list.size(); i++) {
						Article article = list.get(i);
						Long articleId = article.getArticleid();

						String title = article.getTitle();
						String content = article.getContent();
						String delHtmlContent = HtmlRegexpUtil.delHTMLTag(content);
						String digest = delHtmlContent.length() > 60
								? delHtmlContent.substring(0, 60) + "......"
								: delHtmlContent;
						Integer upTimes = article.getUptimes();
						Integer downTimes = article.getDowntimes();
						Integer viewTimes = article.getViewtimes();
						Date publishDate = article.getPublishdate();
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

						out.print("<div class='col-lg-9' style='margin-bottom: 10px;'>");
						out.print("<h4 style='color: #333333;'>");
						out.print(title);
						out.print("</h4>");
						out.print("<div style='font-size: 10px; color: #636363;'>");
						out.print("发布于:" + format.format(publishDate));
						out.print("</div>");
						out.print("<div style='font-size: 14px; margin-top: 5px; color: #333333;'>");
						// 过滤掉html标签
						out.print(digest);
						System.out.println(digest);

						out.print("<a class='btn btn-secondary' href='/acne/article?articleId=" + articleId
								+ "' role='button'>查看详情&raquo;</a>");
						out.print("</div>");
						out.print("<div style='font-size: 10px;line-height: 15px; color: #999999;'>");
						out.print("浏览:" + viewTimes);
						out.print("&nbsp;&nbsp;赞:" + upTimes);
						out.print("&nbsp;&nbsp;踩:" + downTimes);
						out.print("&nbsp;&nbsp;0 " + "位专家推荐");
						out.print("</div>");
						out.print("</div>");
					}

					if (list.size() == 0) {
						out.print("<div style='font-size: 20px; color: #999999;'>");
						out.print("&nbsp;&nbsp;&nbsp;&nbsp;没有文章");
						out.print("</div>");
					}
				%>
			</div>
			<!--/span-->

			<div class="col-lg-3 col-md-3 col-3"
				style="float: right; display: block; position: relative;">

				<div class="card" style="padding: 5px;">
					<p>
						<b>关于本站</b>
					</p>
					<%
						out.print("用户数量：" + acneNumObj.toString());
						out.print("<br />");
						out.print("护肤专家：" + antiNumObj.toString());
						out.print("<br />");
						out.print("已帮助0人");
					%>
				</div>

				<br />
				<p>
					<b>今天推荐</b>
				</p>
				<div class="sidebar-offcanvas" id="sidebar">
					<div id="list-articles" class="list-group"></div>
				</div>

				<br />
				<p>
					<b>推荐专家</b>
				</p>
				<div class="sidebar-offcanvas" id="sidebar2">
					<div id="list-anti-users" class="list-group"></div>
				</div>
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

		<footer class="text-muted">
			<div class="container">
				<p class="float-right">
				<p>&copy; Company 2017</p>
				</p>
			</div>
		</footer>
	</div>
	<!--/.container-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="res/js/jquery-3.1.1.slim.min.js"></script>
	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/tether.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script src="res/js/offcanvas.js"></script>
	<script charset="utf-8">
		$(document).ready(function() {
			
							$('#myModal').on('shown.bs.modal', function() {
								$('#suggest').focus();
							});

							$('#btn_submit').click(function(){
								var userId =<%=request.getSession().getAttribute("userId")%>;
								var userType ='<%=request.getSession().getAttribute("userType")%>';
						var suggest = $('#text_suggest').val();

						if (suggest == '') {
							$('#myModal').modal('hide');
							return;
						}

						$.post('/acne/post_suggest', {
							userId : userId,
							userType : userType,
							suggest : suggest
						}, function(data, status) {
							$('#myModal').modal('hide');
						});
					});

					$.get('/acne/recommands', {
						size : 6
					}, function(data, status) {
						if (status == 'success') {
							var recommand_html = '';
							if (data.length == 0) {
								recommand_html = '<div style="font-size: 15px; color: #999999;">无文章推荐</div>';
							} else {
								$.each(data, function(index, obj) {
									var title = obj.title.substr(0, 10);
									recommand_html += '<a href="/acne/article?articleId=' + obj.articleid + '" class="list-group-item">' + title + '</a>'
								});
							}
							$("#list-articles").append(recommand_html);
						}
					});

					$.get('/acne/anti/recommands', function(data, status) {
						if (status == 'success') {
							var recommand_html = '';

							if (data.length == 0) {
								recommand_html = '<div style="font-size: 15px; color: #999999;">无专家推荐</div>';
							} else {
								recommand_html += '<table>';
								data.forEach(function(value, index, arr) {
									var userId = value.userid;
									var avatar = value.avatar;
									var username = value.username;
									var desc = value.description;
									var title = value.title;
									var titles = title.split('|');

									if (avatar === undefined) {
										avatar = 'res/img/default.png';
									} else {
										avatar = '/acne/image/avatar/' + avatar;
									}

									recommand_html += '<tr>';
									recommand_html += '<td style="width: 100px; height: 80px;">';
									recommand_html += '<a href="/acne/anti_home?antiUserId=' + userId + '" title="' + desc
											+ '" class="thumbnail"><img style="width: 100px; height: 80px;" src="'+avatar+'" alt="avatar"></a>';
									recommand_html += '</td>';
									recommand_html += '<td style="padding-left: 10px;">';
									recommand_html += '<span><b>' + username + '</b></span>';
									recommand_html += '<div class="tip"><span>' + titles[0] + '年护肤经验<br />';
									recommand_html += titles[1] + '</span></div>';
									recommand_html += '</td>';
									recommand_html += '</tr>';
								});
								recommand_html += '<table>';
							}
							$('#list-anti-users').html(recommand_html);
						}
					});
					
					<%
					Object userIdObj = request.getSession().getAttribute("userId");
					Object userTypeObj = request.getSession().getAttribute("userType");
			Long userId = null;
			String userType = null;
			if (userIdObj != null) {
				userId = ObjectUtil.ObjectToLong(userIdObj);
			}
			if(userTypeObj != null){
				userType = ObjectUtil.ObjectToString(userTypeObj);
			}
			%>
					var userId = <%=userId%>;
					var userType = '<%=userType%>';
					
					console.log(userId);
					console.log(userType);
					
					if(userId != null && userType == 'acne_user'){
						
						var websocket = null;
						if ('WebSocket' in window) {
							websocket = new WebSocket("ws://localhost:8080/acne/websocket/socketserver");
							console.log('connect to web socket.');
						} else if ('MozWebSocket' in window) {
						    websocket = new MozWebSocket("ws://localhost:8080/acne/websocket/socketserver");
						} else {
						    websocket = new SockJS("ws://localhost:8080/acne/sockjs/websocket/socketserver");
						}
						websocket.onopen = onOpen;
						websocket.onmessage = onMessage;
						websocket.onerror = onError;
						websocket.onclose = onClose;
						
						$(window).on('beforeunload', function(){
							websocket.close();
						});
						  
						function onOpen(evt) {
							console.log('open');
							console.log(evt);
						}
						function onMessage(evt) {
							var arr = JSON.parse(evt.data);
							$('#badge').text(arr.length);
						}
						function onError(evt) {
							console.log('error');
							console.log(evt);
						}
						function onClose(evt) {
							console.log('close');
							console.log(evt);
						}
						function doSend() {
							if (websocket.readyState == websocket.OPEN) {
						    		websocket.send('hello world!');//调用后台handleTextMessage方法
						    } else {
						    }
						}
					}
				});
	</script>
</body>
</html>