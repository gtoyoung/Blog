<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="${pageContext.request.locale.language}">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<title>DoubleB`s Post</title>



</head>

<body onload="getAllList()">

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">DoubleB</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/post/list">홈으로</a></li>
					<li><a href="#">개고생중..</a></li>
					<li><a href="/post/write">글쓰기</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('/resource/img/post-bg.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="post-heading">
						<h1>${post.title }</h1>
						<h2 class="subheading">${post.subtitle }</h2>
						<span class="meta">Posted by <a href="#">${post.member.getUsername()}</a>
							on ${post.regDate}
						</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Post Content -->
	<article>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					${post.content }</div>
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<h3 style="line-height: 1.6;">
						<c:forEach var="postTag" items="${post.postTagList}"
							varStatus="status">
							<a
								href="/tag/<c:out value="${postTag.tag.name}" escapeXml="true" />/post/list">
								<span class="label label-default"><c:out
										value="${postTag.tag.name}" escapeXml="true" /></span>
							</a>
						</c:forEach>
					</h3>
				</div>
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
			
	</article>

	<hr>
	<footer>
		<c:if test="${pageContext.request.userPrincipal.name !=null}">
			<div class="container">
				<hr>

				<div class="row">
					<div id="target"
						class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1"></div>
					<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
						<br>
						<form action="/reply" method="post" id="comment_form">
							<input type="hidden" name="postId" value="${post.id}"> <input
								type="hidden" name="_csrf" value="${_csrf.token}"></input>
							<div class="media">
								<div class="media-body">
									<textarea name="content" class="form-control" rows="2"></textarea>
								</div>
								<div class="media-right">
									<button class="btn" type="submit">저장</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</c:if>
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

</body>

</html>
