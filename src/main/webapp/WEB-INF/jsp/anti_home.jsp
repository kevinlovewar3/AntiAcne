<%@page import="com.acne.util.ObjectUtil"%>
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

<title>专家页面</title>

<!-- Bootstrap core CSS -->
<link href="res/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="res/css/narrow-jumbotron.css" rel="stylesheet">
</head>

<body>
	<%
		Long antiUserId = null;
		Object antiUserIdObj = request.getAttribute("antiUserId");
		if (antiUserIdObj == null) {

		} else {
			antiUserId = ObjectUtil.ObjectToLong(antiUserIdObj);
		}
	%>
	<div class="container">
		<div></div>

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

	<script src="res/js/jquery-3.1.1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		$(document).ready(function() {

			var antiUserId =<%=antiUserId%>;

			$.get('/acne/posted_article', {
				antiUserId : antiUserId
			}, function(data, status) {
				
				if (status == 'success') {
					if (data.length == 0 || data == []) {
						$('#article_hist').html('<div style="font-size: 15px; color: #999999;">未发表文章</div>');
					} else {
						var article_list_html = '';
						$.each(data, function(index, obj) {

							var title = obj.title.substr(0, 10);
							var articleId = obj.articleid;
							var publishDate = obj.publishdate;
							var viewtimes = obj.viewtimes;
							var uptimes = obj.uptimes;
							var downtimes = obj.downtimes;

							article_list_html += '<div>';
							article_list_html += '<h4><a href="/acne/article?articleId=' + articleId + '">' + title + '</a></h4>';
							article_list_html += '<div style="font-size: 15px; color: #ababab;">阅读：' + viewtimes + '&nbsp;&nbsp;';
							article_list_html += '赞：' + uptimes + '&nbsp;&nbsp;';
							article_list_html += '踩：' + downtimes + '&nbsp;&nbsp;';
							article_list_html += '</div>';
							article_list_html += '</div>';
						});
						$('#article_hist').html(article_list_html);
					}
				} else {
					$('#article_hist').html('<div style="font-size: 15px; color: #999999;">未发表文章</div>');
				}
			});

			$.get('/acne/posted_goods', {
				antiUserId : antiUserId
			}, function(data, status) {

				if (status == 'success') {
					if (data.length == 0 || data == []) {
						$('#goods_hist').html('<div style="font-size: 15px; color: #999999;">未发布产品</div>');
					} else {
						var goods_list_html = '';
						$.each(data, function(index, obj) {
							var goodsName = obj.goodsName;
							var desc = obj.description.substr(0, 10);
							var uploadDate = obj.uploadDate;

							console.log(goodsName + desc + uploadDate);

							goods_list_html += '<h4>' + goodsName + '</h4>';
							goods_list_html += '<p>' + desc + '</p>';
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