<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="toolbar" style="float: right; width: 33%">
		<span id="back" class="icon-back" onclick="history.back();">돌아가기</span><br>
		<span id="hinted" class="icon-pre disabled"
			title="Toggle Markdown Hints"></span>

		<form action="/category/add" method="post" id="add_category">
			<input type="text" name="categoryName" class="form-control"
				placeholder="새로운 카테고리" required="required"> <input
				type="hidden" name="_csrf" value="${_csrf.token}">
			<button type="submit" class="form-control">추가</button>
		</form>
	</div>
</body>
</html>