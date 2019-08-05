<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="/resource/css/bootstrap.min.css" rel="stylesheet">

<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/resource/editor/js/HuskyEZCreator.js"></script>
<title>글작성</title>
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
	<div style="float: right; width: 66%">
		<form:form
			action="${requestScope['javax.servlet.forward.servlet_path']}"
			commandName="post" method="post" id="frm">

			<div class="form-group" style="height: 30px;">
				<label for="category" class="col-sm-2 col-xs-3 control-label"
					style="padding-left: 5px;">Category</label>
				<div class="col-sm-10 col-xs-9" style="padding-right: 5px;">
					<form:select path="categoryId" items="${categoryMap}" id="category"
						class="form-control" />
					<form:errors path="categoryId" cssClass="error" />
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

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
				<label for="exampleInputEmail1">File DROP Here</label>
				<div class="fileDrop"></div>
			</div>
			<div class="box-footer">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
			<form:textarea name="content" path="content" id="editor" rows="10"
				cols="100" style="width: 50%; height: 100px;" />

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


</body>
</html>