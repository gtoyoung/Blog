<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

// 한줄댓글 입력 메소드
function doCreateCmt() {
      // 한줄댓글 내용이 필수이므로 검사
      if($('#cmt').val() == '') {
            alert("한줄 댓글의 내용은 필수 입력입니다.");
            $('#cmt').focus(); return;
      }
      // 버튼 중복 클릭 방지
      $('#createbt').attr('disabled', 'disabled');
      $.post('/hh/post/${post.id}/reply',
                  {cwriter:$('#cwriter').val(),
                   cmt:$('#cmt').val(),
                   no:${post.id}},
                  function(data){
                         $('#cmt').val(''); // 내용 비우기
                         // 다시 클릭이 가능하게끔
                         $('#createbt').attr("disabled", false);
                         // 입력이 완료가 됐으므로 다시 리스트 불러오기
                         cmtList();
                  });
}

function doDeleteCmt(cno) {

      $.post('/hh/post/${post.id}/reply',

                  {"cno":cno, no:${post.id}}, function(data) {cmtList();});

}

$(function(){
      $('#cmt').keyup(function(e){
            if(e.keyCode == 13) doCreateCmt();
      });
      cmtList();
});

</script>
</head>
<body>

	<div>

		<div>
			글쓴이 : <input type="text" id="cwriter" value="${post.reply }"
				style="width: 10%" /> 댓글 : <input type="text" id="cmt"
				style="width: 50%" /> <input type="button" value="입력" id="createbt"
				onclick="doCreateCmt();" />
		</div>

	</div>

	<div id="cmtTarget"></div>

</body>
</html>