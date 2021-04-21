/**
 * 1. 배치는 호출 흐름 순으로 기술
 * 2. 전역변수는 처음 줄에 모두 기술
 * 3. document.ready 작성
 * 4. document.ready 내 화면 초기화 작업들 진행
 */

//ID 중복검사

function chkId(){
    var memId = $("#memId").val();
    
    if(isEmpty(memId)){
      alert("ID 값이 입력되지 않았습니다.");
      $("#memId").focus();
      $("#spMemId").text("ID 값이 유효하지 않습니다");
      $("#spMemId").show();
      return;
    }
    
    // 유효성 검사 - 영어 소문자와 숫자로 구성, 3글자 이상 10글자 이하
    var regExp = /^[a-z0-9]{3,10}$/;
    if(!regExp.test(memId)){ // 정규식 값에 맞는지 확인함.
      alert("ID 값이 유효하지 않습니다.");
      $("#memId").focus();
      $("#spMemId").text("ID 값이 유효하지 않습니다");
      $("#spMemId").show();
      return;
    }
    
    $.ajax({ // DB에서 중복검사 수행 
      url : "/JqueryPro/MemberServlet" // 서블릿 가져오기(jsp 통째로 넘어온 것)
      ,type : "post"
      ,data : {"memId" : memId, "flag" : "CHKID"} // 서블릿에게 행할 행위 명령
      ,dataType : "json"
      ,success : function(data){
        if(data.resultCnt == 0){
        	alert("사용 가능한 아이디 입니다.");
        	$("#spMemId").text("사용 가능한 아이디 입니다.");
        	$("#spMemId").show();
        }else if(data.resultCnt == 1){
        	alert("중복된 아이디 입니다.");
        	$("#spMemId").text("중복된 아이디입니다.");
        	$("#spMemId").show();
        }
      }
      ,error : function(xhr){
        console.log(xhr);
        alert("ID 중복 검사 중 오류가 발생했습니다.");
      }
    });
 }


///////////////////////////////////////////////////////////////
function openZip(){
	// 시 셀렉트 박스 조회하고 초기화
	initCitySelect();
	// 테이블 초기화
	$("#tbZipResult tbody").empty();
	// 주소창(모달창) 열기 - 부트스트랩의 모달 창 호출
	$("#zipModal").modal("hide");
}
////////////////////////////////////////////////////////////////


/** 회원정보 저장하기 */
function save(){ 
	movePageByPost("/MiddleProjectTest/member/insertForm.do");
}

function movePageByGet(url){
	  console.log("test");
	  console.log("url" + url);
	  // 페이지이동 1
	  location.href = url;
}


function movePageByPost(url){
	  //페이지 이동 2 
	  var fm = document.getElementById("fm");
	  fm.method = "post"
	  fm.action = url;
	  fm.submit();
}


