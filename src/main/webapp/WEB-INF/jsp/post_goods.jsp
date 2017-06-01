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

<title>上传产品</title>

<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/bootstrap-theme.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="res/css/narrow-jumbotron.css" rel="stylesheet">
<link href="res/css/summernote.css" rel="stylesheet">

<script src="res/js/jquery-3.1.1.min.js"></script>
<script src="res/js/bootstrap.min.js"></script>
<script src="res/js/summernote.js"></script>
<script src="res/js/angular.min.js"></script>
<script src="res/js/ng-file-upload-shim.min.js"></script>
<script src="res/js/ng-file-upload.min.js"></script>
<script src="res/js/angular-summernote.min.js"></script>

</head>


<body data-ng-app="app">
	<div class="container">
		<a href="/acne/" class="navbar-brand">SKIN FRESH</a>
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="/acne/antiuser">个人首页</a></li>
			<li role="presentation"><a href="/acne/view_acne">用户查看</a></li>
			<li role="presentation"><a href="/acne/post_article">写点博客</a></li>
			<li role="presentation" class="active"><a href="#">上传产品</a></li>
		</ul>
		<br />

		<form data-ng-controller="FileController">
			<div class='row'>
				<div class='col-lg-12'>
					<div class="input-group input-group-lg">
						<span class="input-group-addon" id="sizing-addon1">产品名称:</span> <input
							data-ng-model="goods_name" type="text" class="form-control"
							placeholder="产品名称" aria-describedby="sizing-addon1">
					</div>
				</div>
			</div>

			<div class='row' style='margin-top: 20px; margin-bottom: 20px;'>
				<div class='col-lg-12'>
					<div class="btn btn-primary" data-ngf-select
						data-ngf-pattern="'image/*'" data-ng-model="files"
						data-ngf-multiple="true">选择多张图片</div>
					<p data-ng-repeat="file in files">{{ file.name }}</p>
				</div>
			</div>

			<div class='row'>
				<div class='col-lg-12'>	
					<summernote height="600" id="editor" code="text" data-ng-model="note"></summernote>
				</div>
			</div>

			<button type='submit' class='btn btn-default'
				data-ng-click='submit()'>提交</button>
			<button type='reset' class='btn btn-default' data-ng-click='reset()'>重置</button>
		</form>

		<footer class="footer">
			<p>&copy; Company 2017</p>
		</footer>

	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="res/js/ie10-viewport-bug-workaround.js"></script>
	<script charset="utf-8">
		var app = angular.module('app', [ 'ngFileUpload', 'summernote' ]);
		app.controller('FileController', function($scope, Upload) {

			$scope.upload = function(files, name, note) {
				if (files && files.length) {
					for (var i = 0; i < files.length; i++) {
						Upload.upload({
							//服务端接收
							url : '/acne/add_goods',
							//上传的同时带的参数
							data : {
								'goodsName' : name,
								'description': note
							},
							//上传的文件
							file : files
						}).progress(function(evt) {
							//进度条
							var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
							console.log('progess:' + progressPercentage + '%' + evt.config.file.name);
						}).success(function(data, status, headers, config) {
							//上传成功
							console.log('file ' + config.file.name + 'uploaded. Response: status: ' + status);
						});
					}
				}
			}

			$scope.files = [];

			//提交
			$scope.submit = function() {

				console.log($scope.goods_name);
				console.log($scope.files);
				console.log($scope.note);

				$scope.upload($scope.files, $scope.goods_name, $scope.note);
			};

			$scope.reset = function() {
				$scope.goods_name = '';
				$scope.note = '';
			};
		});
	</script>
</body>
</html>