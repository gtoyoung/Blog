<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/resources/template/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">

<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,500"
	rel="stylesheet">

<%@ include file="/WEB-INF/include/template-header.jspf"%>
<script src="/resource/editor/js/HuskyEZCreator.js"></script>
<title>DoubleB`s Post</title>
<style type="text/css">
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
</head>
<body>
	<!-- Start header Area -->
	<header id="header">
		<div class="container box_1170 main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="/post/list"><img
						src="/resources/template/img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="/post/list">Home</a></li>
						<li><a href="#">개고생중...</a></li>
						<li><a href="/post/write">Posting</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- End header Area -->

	<!-- start banner Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">글을 쓰시오</h1>
					<p class="text-white link-nav">
						<a href="/post/list">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="#">글쓰는 중</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<section class="blog_area section-gap single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="main_blog_details">
						<img class="img-fluid"
							src="/resources/template/img/blog/news-blog.jpg" alt="">
						<div>
							<form:form
								action="${requestScope['javax.servlet.forward.servlet_path']}"
								commandName="post" method="post" id="frm">

								<div class="form-group" style="height: 30px;">
									<label>Category</label>
									<div class="col-sm-10 col-xs-9" style="padding-right: 5px;">
										<form:select path="categoryId" items="${categoryMap}"
											id="category" class="form-control"></form:select>
										<form:errors path="categoryId" cssClass="error" />
									</div>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<br />
								<label>제목</label>
								<form:input type="text" path="title" name="title"
									style="height: 30px; width: 100%; font-size: 25px; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 1px; outline-style: none; font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; font-weight: 800;"></form:input>
								<form:errors path="title" cssClass="error" />
								<hr style="margin-top: 2px; border-top: 1px solid #999;">

								<label>부제목</label>
								<form:input type="text" name="subtitle" path="subtitle"
									style="height: 20px; width: 100%; font-size: 20px; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 1px; outline-style: none; font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; font-weight: 800;" />
								<hr style="margin-top: 2px; border-top: 1px solid #999;">

								<div class="form-group">
									<label for="exampleInputEmail1">File DROP Here -> "기능 구현 필요"</label>
									<div class="fileDrop" style="width: 710px;"></div>
								</div>
								<div class="box-footer">
									<div>
										<hr>
									</div>
									<ul class="mailbox-attachments clearfix uploadedList"></ul>
								</div>
								<form:textarea name="content" path="content" id="editor"
									rows="10" cols="30" style="width:710px; height:350px;" />

								<form:input type="text" path="tags"
									placeholder="Tag (option - 최대 10개. 공백으로 구분합니다.)"
									style="height: 40px; width: 100%; font-size: 18px; 
			border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 1px; outline-style: none; 
			font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; font-weight: 600;" />

								<hr style="margin-top: 2px; border-top: 1px solid #999;">
								<form:errors path="content" cssClass="error" />



								<button type="submit" class="btn btn-primary" id="savebutton">저장</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script type="text/javascript">
		$(function() {
			var obj = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : obj,
				elPlaceHolder : "editor",
				sSkinURI : "/resource/editor/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
				}
			});
			//전송버튼
			$("#savebutton").click(function() {
				//id가 smarteditor인 textarea에 에디터에서 대입
				obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				//폼 submit
				$("#frm").submit();
			})
		})
	</script>
	<script type="text/javascript">
		$('#add_category').submit(
				function(event) {
					var form = $(this);

					$.ajax({
						type : form.attr('method'),
						url : form.attr('action'),
						data : form.serialize()
					}).done(
							function(c) {
								$("#category").append(
										"<option value=" + c.id + ">" + c.name
												+ "</option>");
								$("#category").val(c.id);

								alert(c.name + " 카테고리가 추가되었습니다.");
							}).fail(function() {
						alert('error');
					});
					event.preventDefault();
				});
	</script>

	<%@ include file="/WEB-INF/include/template-bottom.jspf"%>
</body>
</html>