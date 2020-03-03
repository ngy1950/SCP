var optionList = new Array();


window.onload = function(){
	$("#option2s,#option3s").hide();
	itemChange();
	

}

function itemChange() {	
	
	optionList.push('${product.pcode}');

	$('select[name=option1]').change(function() {
		
		$("#option2s,#option3s").hide();
		$("#option2s").html("<option selected='selected'>사이즈</option>");
		optionList.splice(0,optionList.length);
		optionList.push($(this).children(":selected").attr("id"));
		optionList.push($(this).val());
		$.ajax({
			url : 'GetOption.do',
			type : 'POST',
			traditional : true,
			data : {
				"optionList" : optionList
			},
			success : function(data) {
				console.log(data);
				for(var i=0; i<data.length; i++){
					console.log(data[i]);
					$("#option2s").html( $("#option2s").html()+"<option value="+data[i].size+">"+data[i].size+"</option>\n" );
				}
			},
			error : function() {
				alert("호출실패");
			}
		})
		$("#option2s").show();
	})

	$('select[name=option2]').change(function() {
		optionList.push($(this).val());
		$("#option3s").html("<option selected='selected'>색상</option>");
		$.ajax({
			url : 'GetOption.do',
			type : 'POST',
			traditional : true,
			data : {
				"optionList" : optionList
			},
			success : function(data) {
				console.log(data);
				for(var i=0; i<data.length; i++){
					$("#option3s").html($("#option3s").html()+"<option value="+data[i].color+">"+data[i].color+"<b style='color: gray; font-size: 0.7em'> |"+data[i].margin+"개 남음</b>"+"</option>\n");
				}
			},
			error : function() {
				alert("호출실패");
			}
		})
		$("#option3s").show();
	})
	$('select[name=option3]').change(function() {		
		optionList.push($(this).val());

	})
		
}	
function minNum(num, type) {
	var Pnum = parseInt(num);

	if(type == 1){		// 플러스 버튼 클릭
		if(Pnum >= 10){
			alert('더 이상 추가할 수 없습니다.');
		}else{
			Pnum += 1;
		}
	}else{				// 마이너스 버튼 클릭
		if(Pnum <=1){
			
		}else{
			Pnum -= 1;
		}
	}
	document.getElementById('quant[1]_text').value = Pnum;
}

function cartInsert(id) {
	var num = document.getElementById('quant[1]_text').value;
	var cartList = new Array();
	
	if(option1 == '상품을 선택하세요' || option2 == '사이즈' || option3 =='색상'){
		alert('옵션을 선택해주세요');
	}else{
		
		// 선택된 아이탬의 POPTION과 상품 가격을 얻기 위해 서버로 데이터 전송
		$.ajax({
			url : 'GetOption.do',	
			type : 'POST',
			async:false,
			traditional : true,
			data : {
				'optionList' : optionList
				
			},
			success : function(data) {
				console.log(data);
				
				cartList.push(optionList[0]);		// 상품코드번호(pcode)
				cartList.push(id);					// 사용자 ID
				cartList.push(num);					// 상품 주문 수량
				cartList.push(data[0].price);		// 상품 가격
				cartList.push(data[0].poption);		// 옵션 상품코드번호(poption)
				
				// cart Insert
				$.ajax({
					url : 'cart.do',	
					type : 'POST',
					async:false,
					traditional : true,
					data : {
						'cartList' : cartList
						
					},
					success : function(data) {
						alert('장바구니 담기 완료!');
					}
				})
			},
			error : function() {
				alert('장바구니 담기 실패(서버 통신에러)');
			}
		})
		
	}
}

