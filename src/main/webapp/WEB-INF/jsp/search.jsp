<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<body>

	<div class="container">


		<div>
			<div>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" name="title" class="form-control"
							placeholder="제목" value="${postSearch.title}">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
			</div>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>회원명</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${posts}" var="post">
						<tr>
							<td>${post.id}</td>
							<td>${username}</td>
							<td>${post.title}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>