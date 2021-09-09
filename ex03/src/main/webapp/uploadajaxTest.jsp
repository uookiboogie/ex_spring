<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadajaxTest</title>
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/resources/asset/vendor/jquery/jquery.min.js"></script>
</head>
<body>
  <div>
   <form name="frm">
    <input type="text" name="writer"/>
    <input type="text" name="content"/>
   </form>
    <input type="file" name="uploadFile" multiple="multiple"/>
  </div>
  <button type="button" id="uploadBtn">upload</button>
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
			  url:"uploadAjaxAction",
			  data: formData,
			  type:'POST',
			  success : function(result){
				  alert("uploaded")
			  }
		  })
		  
	  })
  })
</script>
</body>
</html>