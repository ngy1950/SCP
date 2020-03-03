$(function(){
    $("#phone").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
				
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) )){
  	 	   e.preventDefault();
		}
    	}).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        	if($(this).val() == '') return;

        	// 기존 번호에서 - 를 삭제합니다.
        	var trans_num = $(this).val().replace(/-/gi,'');
      
        	// 입력값이 있을때만 실행합니다.
        	if(trans_num != null && trans_num != ''){
           	 	// 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            	if(trans_num.length==11 || trans_num.length==10) {   
               	 // 유효성 체크
               	 var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                 if(regExp_ctn.test(trans_num)){
                   	 // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                   	 trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                   	 $(this).val(trans_num);
                     $("#phonechk").empty();
                     phonechk_result  = true;
               	 	}
               	 else{
               			$("#phonechk").empty();
            			$("#phonechk").append("유효하지 않은 전화번호 입니다.");
                    	$(this).val("");
                    	$(this).focus();
                    	phonechk_result  = false;
                	}
            	}
            	else 
            	{ 		
            		$("#phonechk").empty();
        			$("#phonechk").append("유효하지 않은 전화번호 입니다.");
                	$(this).val("");
               		$(this).focus();
               		phonechk_result  = false;
               		
          	  }
    	  }
  	});
    
    
    $("#email").on('keydown', function(e){
    	
    }).on('blur', function(){
    	if($(this).val() == '') return;
    	
    	var check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	var email = $("#email").val();
    	if(check.test(email)){
   		 	$("#emailchk").empty();
   		 	emailchk_result = true;
   		 }else{
   			$("#emailchk").empty();
   		 	$("#emailchk").append("적합하지 않은 이메일 형식입니다.");
   		 	$(this).val("");
   			$(this).focus();
   		 	emailchk_result = false;
   		 }
    });	
    
    
    $("#birth").on('keydown', function(e){
    	
    }).on('blur', function(){
    	if($(this).val() == '') return;
    	
    	var birth = $("#birth").val();
    	if(birth.length == 8){
    		$("#birthchk").empty();
    		birthchk_result  = true;
    	}else{
    		$("#birthchk").empty();		
    		$("#birthchk").append("양식을 지켜주세요. ex)19950209");
    		$(this).val("");
    		$(this).focus();
    		birthchk_result = false;
    	}
    });	
    
});