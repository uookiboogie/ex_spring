/* webapp/resources/asset/js/reply.js */

    let replyService = (function(){
	    //추가
	    function add(callback, error){
	    	$.ajax({
	    		url : "../reply/",
	    		data : $("#replyForm").serialize(),
	    		method :  "post",
	    		dataType :  "json",
	    		success : function(data){
	    			if(callback) callback(data);
	    		},
	    		error : function(){
	    			if(error) error();
	    		}
	    	});
	    }
	    //목록
	    function getList(param, callback, error){
	      $.ajax({
	      		url : "../reply/",
		        data : {bno: bno},   //"bno=377"
		        dataType : "json",
		        success : function(data){
	    			if(callback) callback(data);
	    		},
	    	    error : function(){
	    			if(error) error();
	    		}
	      });
	    }
	    return {add:add, getList:getList}
    })()