<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="${pageContext.request.locale.language}">
<head>

<!-- Mobile Specific Meta -->
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
<%-- <%@ include file="/WEB-INF/include/include-header.jspf"%> --%>
<title>DoubleB`s Post</title>



</head>

<body onload="getAllList()">

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
					<h1 class="text-white">${post.title}</h1>
					<p class="text-white link-nav">
						<a href="/post/list">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="#"> ${post.title}</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Blog Area -->
	<section class="blog_area section-gap single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="main_blog_details">
						<img class="img-fluid"
							src="/resources/template/img/blog/news-blog.jpg" alt="">
						<h4>${post.subtitle}</h4>
						<div class="user_details">
							<div class="float-left">
								<c:forEach var="postTag" items="${post.postTagList}"
									varStatus="status">
									<a
										href="/tag/<c:out value="${postTag.tag.name}" escapeXml="true" />/post/list">
										<span class="label label-default"><c:out
												value="${postTag.tag.name}" escapeXml="true" /></span>
									</a>
								</c:forEach>
							</div>
							<div class="float-right">
								<div class="media">
									<div class="media-body">
										<h5>Posted by ${post.member.getUsername()}</h5>
										<p>${post.regDate}</p>
									</div>
									<div class="d-flex">
										<img src="/resources/template/img/blog/user-img.jpg" alt="">
									</div>
								</div>
							</div>
						</div>
						<p>${post.content }</p>
						<!-- 						<div class="news_d_footer">
							<a href="#"><i class="lnr lnr lnr-heart"></i>Lily and 4
								people like this</a> <a class="justify-content-center ml-auto"
								href="#"><i class="lnr lnr lnr-bubble"></i>06 Comments</a>
							<div class="news_socail ml-auto">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a> <a href="#"><i
									class="fa fa-rss"></i></a>
							</div>
						</div> -->
						<c:if
							test="${pageContext.request.userPrincipal.name == post.member.getUsername()}">
							<div class="pull-right">

								<a href="/post/${post.id}/edit">
									<button type="button" class="btn btn-warning">Edit</button>
								</a> <a href="/post/${post.id}/delete"
									onclick="if(!confirm('진심이에요?')){return false;}">
									<button type="button" class="btn btn-danger">Delete</button>
								</a>
							</div>
						</c:if>
					</div>
					<div class="comments-area">
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="/resources/template/img/blog/c1.jpg" alt="">
									</div>
									<div id="target" class="desc"></div>
								</div>
							</div>
						</div>
					</div>

					<c:if test="${pageContext.request.userPrincipal.name !=null}">
						<div class="container">
							<div id="target"
								class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1"></div>
							<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
								<div class="comment-form">
									<h4>Leave a Reply</h4>
									<form action="/reply" method="post" id="comment_form">
										<div class="form-group">
											<input type="hidden" name="postId" value="${post.id}">
											<input type="hidden" name="_csrf" value="${_csrf.token}"></input>
											<textarea name="content" class="form-control mb-10" rows="2"
												placeholder="Messege" onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Messege'"></textarea>
										</div>
										<button class="primary-btn submit_btn text-uppercase"
											type="submit">reply</button>
									</form>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Area -->

	<footer class="footer-area section-gap">
		<div class="container box_1170">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6 class="footer_title">About Us</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6 class="footer_title">Newsletter</h6>
						<p>Stay updated with our latest trends</p>
						<div id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="subscribe_form relative">
								<div class="input-group d-flex flex-row">
									<input name="EMAIL" placeholder="Email Address"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Email Address '" required=""
										type="email">
									<button class="btn sub-btn">
										<span class="lnr lnr-arrow-right"></span>
									</button>
								</div>
								<div class="mt-10 info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="single-footer-widget instafeed">
						<h6 class="footer_title">Instagram Feed</h6>
						<ul class="list instafeed d-flex flex-wrap">
							<li><img src="/resources/template/img/i1.jpg" alt=""></li>
							<li><img src="/resources/template/img/i2.jpg" alt=""></li>
							<li><img src="/resources/template/img/i3.jpg" alt=""></li>
							<li><img src="/resources/template/img/i4.jpg" alt=""></li>
							<li><img src="/resources/template/img/i5.jpg" alt=""></li>
							<li><img src="/resources/template/img/i6.jpg" alt=""></li>
							<li><img src="/resources/template/img/i7.jpg" alt=""></li>
							<li><img src="/resources/template/img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget f_social_wd">
						<h6 class="footer_title">Follow Us</h6>
						<p>Let us be social</p>
						<div class="f_social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div
				class="row footer-bottom d-flex justify-content-between align-items-center">
				<p class="col-lg-12 footer-text text-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="fa fa-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</footer>

	<%@ include file="/WEB-INF/include/reply-nav.jspf"%>
	<script id="template" type="x-tmpl-mustache">
{{#.}}
<div class="media">
  <div class="media-body">
	{{{content}}}<br>
	<h4 class="media-heading" style="display: inline-block;">{{name}}</h4> on {{momentNow}} <small>({{momentDate}})</small>
	{{#myComment}}<button type="button" style="margin-bottom: 5px;" class="btn btn-danger btn-sm" onclick="if(!confirm('진심이에요?')){return false;} deleteComment({{postId}}, {{id}});">Delete</button>{{/myComment}}
    <br>
  </div>
</div>
{{/.}}
</script>
	<script type="text/javascript">
		function deleteComment(postId, replyId) {
			$.ajax({
				type : "delete",
				url : "/reply/" + replyId + "?postId=" + postId,
				dataType : 'json',
				beforeSend : function(xhr) {
					xhr.setRequestHeader('X-CSRF-Token', '${_csrf.token}');
				},
				success : function(data, status) {
					loadComment();
				},
				error : function(data, status) {
					alert(data.responseJSON.message);
				}
			});
		}

		$("#comment_form").submit(function(event) {
			var form = $(this);
			$.ajax({
				type : form.attr('method'),
				url : form.attr('action'),
				data : form.serialize(),
				dataType : 'json',
				success : function(data, status) {
					loadComment();
					form[0].reset();
				},
				error : function(data, status) {
					alert(data.responseJSON.message);
				}
			});
			event.preventDefault();
		});

		var autolinker = new Autolinker({
			newWindow : false,
			truncate : 70
		});

		moment.locale('${pageContext.request.locale.language}');
		var template = $('#template').html();
		Mustache.parse(template);
		function loadComment() {
			$
					.ajax(
							{
								type : "GET",
								url : "/reply",
								data : "postId=${post.id}",
								dataType : 'json',
								cache : false,
								success : function(data, status) {

									for (k in data) {
										object = data[k];
										// console.log("object = " + object);
										for (key in object) {
											value = object[key];
											if (key == "regDate") {
												object['momentDate'] = moment(
														value).format(
														"YYYY-MM-DD HH:mm:ss");
												object['momentNow'] = moment(
														value).fromNow();
											}
											if (key == "content") {
												object['content'] = autolinker
														.link(value)
														.replace(
																/(?:\r\n|\r|\n)/g,
																"<br />"); // /\r?\n|\r/g
											}
											if (value == "${pageContext.request.userPrincipal.name}") {
												object['myComment'] = true;
											}

										}
									}
									$('#target').html(
											Mustache.render(template, data));
								},
								error : function(data, status) {
									alert("error");
								}
							}).always(function() {
					});
		}

		loadComment();
	</script>

	<%@ include file="/WEB-INF/include/template-bottom.jspf"%>
</body>

</html>
