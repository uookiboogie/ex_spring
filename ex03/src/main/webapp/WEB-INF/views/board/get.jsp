<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/asset/dist/js/sb-admin-2.js"></script>

<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board 상세보기
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form" action="modify" method="post">
                                        <div class="form-group">
                                            <label>bno</label>
                                            <input class="form-control" name="bno" value="${board.bno}" readonly>
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input class="form-control" name="title" value="${board.title}">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Writer</label>
                                            <input class="form-control" name="writer" value ="${board.writer}">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>regdate</label>
                                            <input class="form-control" name="bno" value="<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/>" readonly>
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Content</label>
                                            <textarea class="form-control" rows="3" name="content">${board.content}</textarea>
                                        </div>

										  <input type="hidden" name="pageNum" value="${cri.pageNum}">
										  <input type="hidden" name="amount" value="${cri.amount}">

                                        <button type="submit" class="btn btn-default">수정하기</button>
                                        <button type="submit" class="btn btn-danger" formaction="delete">삭제하기</button>
                                        <a type="button" class="btn btn-success" href="list?pageNum=${cri.pageNum }&amount=${cri.amount}">목록으로</a>
                                    </form>                  
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<!-- 댓글 등록 -->
<div class="row">
<div class="col-lg-6">
<div class="panel panel-default">
<div class="panel-heading">
  <form id ="replyForm">
    <input type="hidden" name="bno" value="${board.bno }">
      <div class="form-group">
        <label>replyer</label>
        <input class="form-control" name="replyer" value ="">
      </div>
      <div class="form-group">
        <label>reply</label>
        <textarea class="form-control" rows="2" name="reply"></textarea>
      </div>

    <button type="button" id="saveReply">댓글등록</button>
  </form>
</div>
</div>
</div>
</div>
<!-- 댓글 목록  -->
<div class="row">
  <div class="col-lg-6">
    <div class="panel panel-default">
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> 댓글
      </div>
      <div class="panel-body">
        <ul class="chat">
          
        </ul>
      </div>
      
    </div>
    
  </div>

</div>

<script>
  let bno = "${board.bno}";
  $(function(){
	//등록처리
	$("#saveReply").on("click",function(){
		$.ajax({
		  url : "../reply/",
		  method : "post",
		  data : $("#replyForm").serialize(),
		  dataType : "json",
		  success : function(data){
				    $(".chat").append(makeLi(data));
		            }
		});
	});
	//목록조회  
	$.ajax({
		url : "../reply/",   //method(or type):"get"
		data : {bno: bno},   //"bno=377"
		dataType : "json",   //응답결과가 json
		success : function(datas){
			//console.log(datas);
			str ="";
			for(i=0; i<datas.list.length; i++){
				str += makeLi(datas.list[i])
			}
			$(".chat").html(str);
		}
	})
	function makeLi(data){ 
        return'  <li class="left clearfix"> '
			+ '      <div>'
			+ '        <div class="header">'
			+ '          <strong class="primary-font">'+data.replyer+'</strong>'
			+ '          <small class="pull-right text-muted">'+data.replyDate+'</small>'
			+ '	        </div>'
			+ '        <p>'+data.reply+'</p>'
			+ '        <div><a id="replyDel" href="#" data-rno="'+data.rno+'"onclick="replyDelFunc(this);return false;" class="small pull-right">삭제</a><div>'
		    + '    </div>'
		    + '	 </li>'
	}
  })
  //삭제 함수
  function replyDelFunc(obj){
	  let rno = $(obj).attr('data-rno');
	  let result = confirm("삭제하시겠습니까?");
	  let li = $(obj).closest("li");
	  if(result) {
		  $.ajax({
			  url: '../reply/'+rno,
			  type:'DELETE',
			  dataType:'json',
			  success:function(e){
				  if(e==true){
					  li.remove();
				  }
				  
			  }
		  })//ajax end==
	  }
  }//replyDelFunc end==
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>