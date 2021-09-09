<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                            Board Register
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form" id="frm" action="register" method="post" >
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input class="form-control" name="title">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Writer</label>
                                            <input class="form-control" name="writer">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Content</label>
                                            <textarea class="form-control" rows="3" name="content"></textarea>
                                        </div>
                                        <div>
                                        <button type="button" class="btn btn-default" id="btnRegister">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                        </div>
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
<!-- 파일업로드 새로 추가하는 부분-->
<div class="row">
  <div class="col-lg-6">
    <div class="panel panel-default">

      <div class="panel-heading">File Attach</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' multiple="multiple">
        </div>
            <button type="button" id="uploadBtn">업로드</button>
        <div class='uploadResult'> 
          <ul>
          
          </ul>
        </div>
        
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->                                        


<script>
  $(function(){
	  
	    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
	  
	  $("#uploadBtn").on("click",function(){
		  let formData = new FormData(document.frm); //formdata 자동으로 만들 주기
/* 		  let formData = new FormData();
 		  let inputFile = $("input[name='uploadFile']");
		  		  
		  for(i=0; i<files.length; i++){
			  formData.append("uploadFile",files[i]); //Ajax로 할려면 formData를 수동으로 만들어 줘야 한다.
		  }  */
		  
		  let inputfile = $('[name="uploadFile"]');
		  let files = inputfile[0].files;
		  for(i=0; i<files.length;i++){
			  if( ! checkExtension(files[i].name, files[i].size))
				  return;
			  formData.append("uploadFile", files[i]);
		  }
		  
		  $.ajax({
			  processData : false, //formData로 보내줄려면 있어야 한다.
			  contentType : false, //formData로 보내줄려면 있어야 한다.
			  url:"../uploadAjaxAction",
			  data: formData,
			  type:'POST',
			  success : function(datas){
				  var str ="";
				  for(i=0; i<datas.length; i++){
					    
					    var obj = datas[i];
					    
					    var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='../resources/asset/img/attach.png'></a>";
						str += "</div>";
						str +"</li>";
					  
				  }
				  $(".uploadResult ul").html(str);
			  }
		  })
		  
	  })
	  
	  //등록버튼 이벤트
	  $("#btnRegister").on("click",function(){
		  var str = "";
		  $(".uploadResult ul li").each(function(i,obj){
			 var jobj = $(obj);
		      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].fileType' value='1'>"; //"+ jobj.data("type")+"
		  });
	    $("#frm").append(str).submit();
	  });
	  
  })
</script>

    
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>