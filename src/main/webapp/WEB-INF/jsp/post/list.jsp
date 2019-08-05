<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>DoubleB`s Page</title>

</head>

<body>
	<div id="wrapper">

		<%@ include file="/WEB-INF/include/sidebar.jspf"%>


		<!-- Page Header -->
		<!-- Set your background image for this header on the line below. -->
		<header class="intro-header"
			style="background-image: url('/resource/img/home-bg.jpg')">
			<div id="page-content-wrapper">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">클릭!-메뉴나옴</a>

						</div>
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


</html>
