/**
 * none.js
 */
// 상품 비교 데이터 넣기
function toggleBtn1(cardId){  
   // alert(cardId);
// alert($(".lists__item").val());
  $.ajax({
 			type:"post",
 			url:"/cardallList",

 			success:function(result){
 			
 			 // 토글 할 버튼 선택 (btn1)
			  const btn1 = document.getElementById('btn1');
			  // const cardList = document.getElementById('btn1');
			  
			  // btn1 보이기 (display: block)
			  if(btn1.style.display == 'none') {
			    btn1.style.display = 'block';
 												
 			}
  }

}); // ajax 종료 

 		$.ajax({
 			type:"post",
 			url:"/CardCompare",
 			data:{"cardId": cardId},	
 				
 			success:function(result){
 	
 			$('.prod_list').append( 
 			
 			'<li class="prod_lists">' +  
	 			'<div class="oo">' + 
	 			'<img class="cardImg" src=' + result.cardImgUrl + '>' + '<br>' +
	 			'<input  type="hidden" class="cardName1" value="'+result.cardName + '"/>'+ result.cardName + '</input>' + 
	 			
	 
	 				'<div class="id6">' + 
	 					'<input type="checkbox" class="chkDelete" value="'+ result.cardId  +'"/>'+ 
	 				'</div>' +
	 				'<input  type="hidden" class="fee" value="'+result.cardFee + '"/>' + '</input>' +
	 					'<input class="desc" type="hidden" value="' +result.cardDes + '"/>' + 
	 					'<input type="hidden" class="button button--wayra" value="href="https://www.hyundaicard.com/cpc/cr/CPCCR0201_01.hc?cardWcd='+result.cardUrl +'"/>'+
	 					
	 			'</div>'+
	 		'</li>');
 		// 비교 임시테이블에 저장하기위함 함수호출
 		
 												
 			},
 			error:function(){
 				alert("실패");
 			}
 		}); // ajax 종료 
 		
 		

    }

  
     $(document).ready(function(){
 	// [전체 선택] 체크박스 체크했을 때
 	$('#allCheck').on('click', function(){
	 	var chk = $("#allCheck").prop("checked");
	 	
	 	// 체크 되었다면 (true) : 모든 개별 체크박스 true로 설정
	 	if(chk) {
	 		$('.chkDelete').prop("checked", true);
	 	} else {
	 		$('.chkDelete').prop("checked", false);
	 	}
	});
	
	// 개별 체크박스 해제할 경우 [전체 선택] 체크박스 해제
 	// 개별 체크박스 모두 체크되었을 때 [전체 선택] 체크
 	$('.chkDelete').on('click', function(){
 		var total = $('.chkDelete').length; //개별 체크박스의 전체 개수
 		var checked = $('.chkDelete:checked').length; // 체크된 체크박스 개수
 		
 		if(total != checked)  // 같지 않다면 (모두 선택된 상태가 아니라면)
 			$("#allCheck").prop("checked", false); // 해제
 		else
 			$("#allCheck").prop("checked", true); // 체크
 	});
 	
 	
 	
 });
 
    $( document ).ready( function() {
 // [선택상품삭제] 버튼을 클릭했을 때 장바구니에서 선택된 상품 삭제
 	$('#deleteCardBtn').on('click', function(){
 		// 선택 여부 확인 : 하나라도 선택하면 ture, 아무것도 선택하지 않으면 false
 		var checked = $('.chkDelete').is(':checked');
 		
 		if(checked){ // 하나라도 선택한 경우
 		var answer = confirm("선택된 상품을 삭제하시겠습니까?");
 		if(answer){
 		   $( '.oo' ).empty();
 		   }
 		 
 		  
 			}
 	
 	 });
    });

 
/*  $(document).ready(function() {
        $(".sel_prod_comp").click(function() {
            $.ajax({
                url : "menu.html",
                success : function(result) {
                    var refine = $("#message2").html(result).find('li');
                    console.log(result);
                    console.log(refine);
                    console.log(typeof(refine));
                    $('#message2').html(refine);
                }
            });
        });
    });
    
    */
    
    
    
    
    
    
    
    
    
 /* 	
 	// [삭제] 버튼을 클릭했을 때 장바구니에서 선택된 상품 삭제
 	$('#deleteCardBtn').on('click', function(){
 		// 선택 여부 확인 : 하나라도 선택하면 ture, 아무것도 선택하지 않으면 false
 		var checked = $('.chkDelete').is(':checked');
 		
 		if(checked){ // 하나라고 선택한 경우
 			var answer = confirm("선택된 상품을 삭제하시겠습니까?");
 			
 			if(answer){
 			// 체크된 체크박스의 cartNo를 배열에 추가
 			var checkArr = new Array();
 			$('.chkDelete:checked').each(function(){
 				// checkArr.push($(this).val()); // value=${prd.cartNo} 한 경우
 				checkArr.push($(this).attr("data-cartNo")); // 태그에 사용자 정의 속성을 사용한 경우 :  data-cartNo="${prd.cartNo}
 				
 			});
 			
 			// 서버로 전송
 			$.ajax({
 			type:"post",
 			url:"/deleteCard",
 			data: {"chbox":checkArr},
 			dataType:'text',
 			success:function(result){
 				if(result == 1){
 					location.href="/CardCompare";
 				}
 				},
 				error:function(){
 				alert("실패");
 				},
 				complete:function(){
 				//alert("작업 완료");
 				}
 			}); // ajax 종료 	
 					
 			}
 					
 		}else{ //아무것도 선택하지 않은 경우
 		alert("선택된 상품이 없습니다.");		
 		
 		}
 	
 	 });
 	
 	


*/