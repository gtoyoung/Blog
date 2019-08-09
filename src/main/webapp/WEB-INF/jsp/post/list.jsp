<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>

<meta charset="utf-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>DoubleB`s Page</title>
<link rel="stylesheet"
	href="/webjars/jqcloud2/2.0.1/dist/jqcloud.min.css">
<link href="/webjars/semantic-ui/2.1.8/dist/semantic.min.css"
	rel="stylesheet" type="text/css">
</head>

<body>
	<div class="ui top attached menu">
		<a class="item"> <i class="sidebar icon"></i> Menu
		</a>
	</div>
	<div class="ui wide left vertical inverted sidebar labeled icon menu">
		<div class="item">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<h2>
					환영합니다. ${pageContext.request.userPrincipal.name} 님<a id="logoutbtn"
						onclick="document.forms['logoutForm'].submit()">Logout</a>
				</h2>

			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name == null}">
				<h2>
					<a href="/login">Login</a>
				</h2>
			</c:if>
		</div>
		<a class="item" href="/post/list"><i class="Home icon"></i>Home</a> <a
			class="item" href="/post/write"> <i class="Write icon"></i>글쓰기
		</a>
		<c:if test="${pageContext.request.userPrincipal.name == 'admindb'}">
			<a class="item" href="/admin"> <i class="User icon"></i>관리자 페이지
			</a>
		</c:if>
		<h1 id="menu">공부중</h1>
		<div id="submenu" style="display: none;">
			<a class="ui red tag label" href="/study/RGB/index.html"> -RGB</a><br>
			<a class="ui tag label" href="/study/Garthner/index.html"> -Hyper</a><br>
			<a class="ui teal tag label" href="/study/Etc/test.html">-이동하는글
				링크</a><br> <a class="ui red tag label" href="/study/Etc/text.html">-텍스트파일
				읽기</a>
		</div>

		<h1 id="categorymenu">category</h1>
		<div id="categorysubmenu" style="display: none;">
			<c:forEach items="${categoryMap}" var="category">
				<a href="/category/${category.id}/post/list" class="ui tag label"><c:out
						value="${category.name}" escapeXml="true" /></a>
			</c:forEach>
		</div>

		<h2>Tags</h2>
		<div id="tag-cloud"
			style="width: 95%; height: 270px; margin: -10px 5px;"></div>
	</div>
	<div class="pusher">
		<!-- Page Header -->
		<!-- Set your background image for this header on the line below. -->
		<header class="intro-header"
			style="background-image: url('/resource/img/home.bmp')">
			<div id="page-content-wrapper">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12"></div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
						<div class="site-heading">
							<h1>clean`s blog</h1>
							<hr class="small">
							<span class="subheading">스프링 좀 익숙해져라ㅋㅋ</span>
						</div>
					</div>
				</div>
			</div>

		</header>

		<!-- Main Content -->
		<div class="container">
			<div>
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
						<c:if test="${query!=null}">
							<c:out value="${query}" escapeXml="true" /> (으)로 검색된 
						</c:if>
						<c:if test="${category!=null}">
							<c:out value="${category}" escapeXml="true" /> 카테고리에 
						</c:if>
						<c:if test="${tag!=null}">
							<c:out value="${tag}" escapeXml="true" /> 태그에 
						</c:if>
						<c:if test="${postPage.totalElements>0}">
							총 ${postPage.totalElements} 개의 글이 있습니다.
						</c:if>
						<c:if test="${postPage.totalElements==0}">
							글이 없습니다.
						</c:if>
						<c:forEach var="post" items="${postPage.content}">
							<div class="post-preview">
								<a href="/post/${post.id}">
									<h2 class="post-title">
										<c:out value="${post.title}" escapeXml="true"></c:out>
									</h2>
									<h3 class="post-subtitle">
										<c:out value="${post.subtitle}" escapeXml="true"></c:out>
									</h3>
								</a>
								<p class="post-meta">
									Posted by <a href="#">${post.member.getUsername()}</a> in <a
										href="/category/${post.category.getId()}/post/list"><c:out
											value="${post.category.getName()}" escapeXml="true" /></a> on
									${post.regDate}
								</p>
							</div>
							<hr>
						</c:forEach>

						<!-- Pager -->
						<ul class="pager">
							<c:if test="${!postPage.first}">
								<li class="previous"><a href="?page=${postPage.number-1}">&larr;
										Newer Posts</a></li>
							</c:if>
							<c:if test="${!postPage.last}">
								<li class="next"><a href="?page=${postPage.number+1}">Older
										Posts &rarr;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<hr>

		<!-- Footer -->
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
						<ul class="list-inline text-center">
							<li><a href="#"> <span class="fa-stack fa-lg"> <i
										class="fa fa-circle fa-stack-2x"></i> <i
										class="fa fa-twitter fa-stack-1x fa-inverse"></i>
								</span>
							</a></li>
							<li><a href="#"> <span class="fa-stack fa-lg"> <i
										class="fa fa-circle fa-stack-2x"></i> <i
										class="fa fa-facebook fa-stack-1x fa-inverse"></i>
								</span>
							</a></li>
							<li><a href="#"> <span class="fa-stack fa-lg"> <i
										class="fa fa-circle fa-stack-2x"></i> <i
										class="fa fa-github fa-stack-1x fa-inverse"></i>
								</span>
							</a></li>
						</ul>
						<p class="copyright text-muted">Copyright &copy; Your Website
							2014</p>
					</div>
				</div>
			</div>
		</footer>
	</div>

</body>
<script src="/webjars/semantic-ui/2.1.8/dist/semantic.min.js"></script>
<script src="/webjars/jqcloud2/2.0.1/dist/jqcloud.min.js"></script>
<script>
	$("#menu").click(function(e) {
		e.preventDefault();
		var obj = document.getElementById("submenu");
		if (obj.style.display == "none") {
			obj.style.display = "block";
		} else if (obj.style.display == "block")
			obj.style.display = "none";

	});
	$.ajax({
		type : 'GET',
		url : '/tag-cloud',
		dataType : 'json',
		success : function(word_array) {
			$("#tag-cloud").jQCloud(word_array);
			loadTag = true;
		}
	});
	$("#categorymenu").click(function(e) {
		e.preventDefault();
		var obj = document.getElementById("categorysubmenu");
		if (obj.style.display == "none") {
			obj.style.display = "block";
		} else if (obj.style.display == "block")
			obj.style.display = "none";

	});
	$('.ui.labeled.icon.sidebar')
			.sidebar('setting', 'transition', 'scale down').sidebar(
					'attach events', '.menu .item')
</script>

</html>
