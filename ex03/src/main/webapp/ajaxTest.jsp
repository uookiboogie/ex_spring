<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxTest</title>
<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources/asset/vendor/jquery/jquery.min.js"></script>
</head>
<script>
  $(function(){  //page ready 이벤트
  
    //btn1.click = function(){}
    //btn1.addEventListener("click",function(){})
    
    //$("#btn1").click(function(){})
    //addEventListener와 동일, 이벤트 여러개 추가 가능
    $("#btn1").on("click",function(){
      $.ajax({
    	 url : "ajax1",
    	 method : "get", //post
    	 data : {writer: $("#writer").val()}, //"writer=" + $("#writer").val(),
    	 //async : false, //동기식
    	 dataType : "json",  //plain=text, json, xml
    	 success : function(data){
    		 $("#result").append(data.content+"<br>");
    		 $("#result").append(data.writer+"<br>");
    	 }
      });
      $("#result").append("클릭됨<br>")
    })  //btn1 click end
    
    $("#btn2").on("click",function(){
    	$.ajax({
    		url : "ajax2",
    		method : "post",
    		data : JSON.stringify( {writer: $("#writer").val()} ),
    		contentType: "application/json",
    		dataType : "json",
    		success : function(data){
    			$("#result").append($("<p>").append(data.content).append("<br>").append(data.writer))
    			//$("#result").append($(`<p>\${data.writer}<br>\${data.content}</p>`))
    			//$("#result").append($('<p>'+{data.content}+'</p>')) //다양한 방법
       	 }
    	})
    }) //btn2 click end
    
    // 그룹 이벤트 : 위임 -> 동적으로 추가될 태그에도 미리 이벤트 지정 찾아보기
    // 부모태그에 이벤트 지정
    $("#result").on("click","p",function(){
    	$(this).remove();
    })
  })  //end of $(function(){
</script>
<body>
  <div align="center">
    <input name="writer" id="writer">
    <button type="button" id="btn1">문자열출력</button>
    <button type="button" id="btn2">파라미터(json)</button>
    <div id="result"></div>
  </div>
  
<script>
  //$("#result").html("bbbb<br>");
</script>  
</body>
</html>