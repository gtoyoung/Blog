<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

// ���ٴ�� �Է� �޼ҵ�
function doCreateCmt() {
      // ���ٴ�� ������ �ʼ��̹Ƿ� �˻�
      if($('#cmt').val() == '') {
            alert("���� ����� ������ �ʼ� �Է��Դϴ�.");
            $('#cmt').focus(); return;
      }
      // ��ư �ߺ� Ŭ�� ����
      $('#createbt').attr('disabled', 'disabled');
      $.post('/hh/post/${post.id}/reply',
                  {cwriter:$('#cwriter').val(),
                   cmt:$('#cmt').val(),
                   no:${post.id}},
                  function(data){
                         $('#cmt').val(''); // ���� ����
                         // �ٽ� Ŭ���� �����ϰԲ�
                         $('#createbt').attr("disabled", false);
                         // �Է��� �Ϸᰡ �����Ƿ� �ٽ� ����Ʈ �ҷ�����
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
			�۾��� : <input type="text" id="cwriter" value="${post.reply }"
				style="width: 10%" /> ��� : <input type="text" id="cmt"
				style="width: 50%" /> <input type="button" value="�Է�" id="createbt"
				onclick="doCreateCmt();" />
		</div>

	</div>

	<div id="cmtTarget"></div>

</body>
</html>