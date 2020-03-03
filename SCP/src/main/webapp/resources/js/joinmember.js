function validate()
{
	/*$(function(){

	//비밀번호 확인
	$("#passwd2").blur(function(){
	   if($("#passwd").val() != $("#passwd2").val()){
	    	if($("#passwd2").val()!=''){
	    		alert("비밀번호가 일치하지 않습니다.");
	    	    $("#passwd2").val('');
	          $("#passwd2").focus();
		       }
		    }
		})
	});*/
	
	/*if (document.myForm.id.value == "") 
	{
		alert("아이디를 입력해주세요.");
		document.myForm.id.focus();
		return false;
	}

	else if (document.myForm.passwd.value == "") 
	{
		alert("비밀번호를 입력해주세요.");
		document.myForm.passwd.focus();
		return false;
	}

	else if (document.myForm.passwd.value != document.myForm.passwd2.value)
	{
		alert("비밀번호가 일치하지 않습니다.");
		document.myForm.passwd.focus();
		return false;
	}
	
	else if (document.myForm.name.value == "") 
	{
		alert("이름을 입력해주세요.");
		document.myForm.name.focus();
		return false;
	}

	else if (document.myForm.phone.value == "") 
	{
		alert("핸드폰 번호를 입력해주세요.");
		document.myForm.phone.focus();
		return false;
	}

	else if (document.myForm.email.value == "") 
	{
		alert("이메일을 입력해주세요.");
		document.myForm.email.focus();
		return false;
	}

	else if (document.myForm.address.value == "") 
	{
		alert("주소를 입력해주세요.");
		document.myForm.address.focus();
		return false;
	}

	else if (document.myForm.birth.value == "")
	{
		alert("생일을 입력해주세요.");
		document.myForm.birth.focus();
		return false;
	}*/
}

var checkList = 0; //배열선언

function check(){
	if(checkList == 1){
		$("#submit").prop("disabled", false);
	}else{
		$("#submit").prop("disabled", true);
	}
	//id 검사
	$("#id").blur(function(){
		if($('#id').val() == ""){
			$('#idchk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">아이디를 입력해주세요</span>');
		}else{
			$.ajax({
				type : "POST",
				url : "idCheck.do",
				data : {
					"id":$('#id').val()
				},
				success : function(data){
					if($.trim(data)=="YES"){
						checkList = 1;
						$('#idchk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:blue">사용가능한 아이디입니다</span>');
					}
					else{
						checkList = 0;
						$('#idchk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">중복된 아이디입니다</span>');
					}
				}
			});
		}
	});
	
	//pw 검사
	$("#passwd").blur(function(){
		var inputed = $('#passwd').val();
	    var reinputed = $('#passwd2').val();
	    
	    if(inputed==""){
	    	checkList = 0;
	    	$('#pwchk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">비밀번호를 입력해주세요</span>');
	    }
	    else if(reinputed==""){
	    	checkList = 0;
	        $('#pwchk2').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">비밀번호를 입력해주세요</span>');
	    }
	    else if (inputed == reinputed) {
	    	checkList = 1;
	    	$('#pwchk2').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:blue">비밀번호가 일치합니다</span>');
	    }
	    else if (inputed != reinputed) {
	        //$("#submit").prop("disabled", true);
	    	checkList = 0;
	        $('#pwchk2').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">비밀번호가 일치하지 않습니다</span>'); 
	    }
	})
	//이름
	$("#name").blur(function(){
		if($('#name').val() == ""){
			checkList = 0;
			$('#namechk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">이름을 입력해주세요</span>');
		}else checkList = 1;
	})
	//핸드폰번호
	$("#phone").blur(function(){
		if($('#phone').val() == ""){
			checkList = 0;
			$('#phonechk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">핸드폰 번호를 입력해주세요</span>');
		}
	})
	//이메일
	$("#email").blur(function(){
		if($('#email').val() == ""){
			checkList = 0;
			$('#emailchk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">이메일을 입력해주세요</span>');
		}
	})
	//주소
	$("#address").blur(function(){
		if($('#address').val() == ""){
			checkList = 0;
			$('#addchk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">주소를 입력해주세요</span>');
		}
	})
	//생일
	$("#birth").blur(function(){
		if($('#birth').val() == ""){
			checkList = 0;
			$('#birthchk').html('&nbsp;&nbsp;&nbsp;<span style="font-size:12px;color:red">생년월일을 입력해주세요</span>');
		}
	})
}
/*function checkid() {
	$("#id").blur(function(){
		$.ajax({
			type : "POST",
			url : "idCheck.do",
			data : {
				"id":$('#id').val()
			},
			success : function(data){
				if($.trim(data)=="YES"){
					//alert("사용가능한 아이디입니다.");
					idCheck = 1;
					$('#idchk').html('&nbsp;<span style="font-size:12px;color:blue">사용가능한 아이디입니다</span>');
				}
				else{
					idCheck = 0;
					$('#idchk').html('&nbsp;<span style="font-size:12px;color:red">중복된 아이디입니다</span>');
				}
			}
		});
	});
}

function checkpw() {
    var inputed = $('#passwd').val();
    var reinputed = $('#passwd2').val();
    if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
        $("#submit").prop("disabled", true);
        $('#pwchk').html('&nbsp;<span style="font-size:12px;color:red">비밀번호를 입력해주세요</span>');
    }
    else if (inputed == reinputed) {
        $("#passwd2").css("background-color", "#B0F6AC");
        pwdCheck = 1;
        if(idCheck == 1 && pwdCheck == 1) {
            $("#submit").prop("disabled", false);
        }
    } else if (inputed != reinputed) {
        pwdCheck = 0;
        $("#submit").prop("disabled", true);
        $("#passwd2").css("background-color", "#FFCECE");    
    }
}*/

/**
 * ID 중복체크 검사하는 함수
 */

function zipCheck(){
	url = "ZipCheck.jsp?check=y";	//check=y를 Get 방식으로 전송
	window.open(url, "windowZipcode", "width=500, height=700, scrollbars=yes");
}

function dongCheck(){
	alert('dongcheck 호출');
	if(document.zipForm.area3.value == null){
		alert('동이름을 입력하세요.');
		document.zipForm.area3.focus();
		return;	//현재 상태 유지
	}
	//submit() : submit 객체를 누른 것과 동일한 효과
	document.zipForm.submit();
}

function sendAddress(zipcode,area1,area2,area3,area4){
	var address = area1 + " " + area2 + " " + area3 + " " + area4 + " ";
	opener.document.myForm.zipcode.value = zipcode;
	opener.document.myForm.address.value = address;
	self.close();
}





/*
 * 우편번호 찾기 함수
 */
/*

function sendAddress(zipcode,area1,area2,area3,area4){
	var address = area1 + " " + area2 + " " + area3 + " " + area4 + " ";
	opener.document.myForm.mem_zipcode.value = zipcode;
	opener.document.myForm.mem_address.value = address;
	self.close();
}*/