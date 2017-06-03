<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.acne.model.AntiAcneUser"%>
<%@page import="java.util.Enumeration"%>
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
<!-- Custom styles for this template -->
<link href="res/css/narrow-jumbotron.css" rel="stylesheet">

</head>

<body>
	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">个人首页</a></li>
			<li role="presentation"><a href="/acne/view_acne">用户查看</a></li>
			<li role="presentation"><a href="/acne/post_article">写点博客</a></li>
			<li role="presentation"><a href="/acne/post_goods">上传产品</a></li>
		</ul>
		<br />

		<div class="row">
			<div class='col-lg-12'>
				<h4>个人信息</h4>
			</div>
		</div>

		<div class='row'>
			<div class='col-lg-4'>
				<img class="thumbnail" alt="avatar" src="res/img/default.png"
					style='width: 200px; height: 200px;'>
			</div>
			<div class='col-lg-8'>
				<div style="font-size: 16px; color: #444444;">
					<%
						AntiAcneUser antiAcneUser = (AntiAcneUser) request.getAttribute("antiAcneUser");

						String description = antiAcneUser.getDescription();
						Date registerDate = antiAcneUser.getRegisterdate();
						String title = antiAcneUser.getTitle();
						String[] titles = title.split("\\|");
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						out.print("注册日期: " + format.format(registerDate) + "<br />");
						out.print("简介: " + description + "<br /><br />");
						out.print("经验: " + titles[0] + "年<br />");
						out.print("头衔: " + titles[1] + "<br />");
					%>
				</div>
			</div>
		</div>

		<div class="row marketing">
			<div class="col-lg-6">
				<h4>发表的博文</h4>
				<div id="article_hist"></div>
			</div>

			<div class="col-lg-6">
				<h4>发布的产品</h4>
				<div id="goods_hist"></div>
			</div>
		</div>

		<br />
		<footer class="footer">
			<p>&copy; Company 2017</p>
		</footer>

	</div>
	<!-- /container -->

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		function delete_article(articleId) {
			$.get('/acne/delete/article', {
				articleId : articleId
			}, function(data, status) {
				if (status == 'success') {
					location.reload();
				}
			});
		}

		function delete_goods(goodsId) {
			$.get('/acne/delete/goods', {
				goodsId : goodsId
			}, function(data, status) {
				if (status == 'success') {
					location.reload();
				}
			});
		}

		$(document).ready(
				function() {

					$.get('/acne/posted_article', function(data, status) {

						if (status == 'success') {
							if (data.length == 0 || data == []) {
								$('#article_hist').html('<div style="font-size: 15px; color: #999999;">未发表文章</div>');
							} else {
								var article_list_html = '';

								$.each(data, function(index, obj) {

									if (obj.title != undefined) {
										var title = obj.title.substr(0, 10);
										var articleId = obj.articleid;
										var publishDate = obj.publishdate;
										var viewtimes = obj.viewtimes;
										var uptimes = obj.uptimes;
										var downtimes = obj.downtimes;

										article_list_html += '<div>';
										article_list_html += '<h4><a href="/acne/article?articleId=' + articleId + '">'
												+ title + '</a></h4>';
										article_list_html += '<div style="font-size: 15px; color: #ababab;">阅读：'
												+ viewtimes + '&nbsp;&nbsp;';
										article_list_html += '赞：' + uptimes + '&nbsp;&nbsp;';
										article_list_html += '踩：' + downtimes + '&nbsp;&nbsp;';
										article_list_html += '&nbsp;<a href="#" onclick="JavaScript:delete_article('
												+ articleId + ')">删除</a>';
										article_list_html += '</div>';

										article_list_html += '</div>';
									}
								});
								$('#article_hist').html(article_list_html);
							}
						} else {
							$('#article_hist').html('<div style="font-size: 15px; color: #999999;">未发表文章</div>');
						}
					});

					$.get('/acne/posted_goods', function(data, status) {

						if (status == 'success') {
							if (data.length == 0 || data == []) {
								$('#goods_hist').html('<div style="font-size: 15px; color: #999999;">未发布产品</div>');
							} else {
								var goods_list_html = '';
								$.each(data, function(index, obj) {

									var goodsName = obj.goodsname;
									var uploadDate = obj.uploaddate;
									var goodsid = obj.goodsid;
									var browsenum = obj.browsenum;
									var score = obj.score;

									goods_list_html += '<a href="/acne/goods_home/"'+goodsid+'><h4>' + goodsName
											+ '</h4></a>';
									goods_list_html += '<div style="font-size: 15px; color: #ababab;">阅读: ';
									goods_list_html += browsenum + '&nbsp;&nbsp;';
									goods_list_html += '指数: ' + score + '&nbsp;&nbsp;';
									goods_list_html += '&nbsp;<a href="#" onclick="JavaScript:delete_goods(' + goodsid
											+ ')">删除</a>';
									goods_list_html += '</div>';
								});
								$('#goods_hist').html(goods_list_html);
							}
						} else {
							$('#goods_hist').html('<div style="font-size: 15px; color: #999999;">未发布产品</div>');
						}
					});
				});
	</script>
</body>
</html>
