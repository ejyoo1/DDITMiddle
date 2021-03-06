/**
 * 회원 정보를 검색하는 JS
 * jquery7 - ex02_jsonsubmit.html 참고
 */

$(document).ready(function(){
	
	/* 목록 시작 시 전체 회원 수를 불러옴 */
	memberListInit();
	
	function memberListInit(){
		// 서버로 전달할 데이터 만들기
	    $.ajax({
	    	url : "/MiddleProjectTest/member/memberListJson.do"
	    	, type : "post"
	    	, dataType : "json"
	    	,success : function(data){
	    		alert("로드 성공");
	    		makeTable(data);
	    		
	    	}
	    	,error : function(xhr){
	    		console.log(xhr);
	    		alert("로드 오류");
	    	}
	    });
	}
	
	
	
	
	  $("#btnSearch").click(function(){
		   alert("검색버튼 클릭함");
	  });
	  $("#btnReset").click(function(){ // 데이터 초기화
		  $(".result").html("");
	  });
	  
	  function makeTable(data){
		  console.log("data.length : " + data.length);
		  var str = "";
		  if(data.length > 0){
			  for(var i = 0 ; i < data.length ; i++){
				  str += "<tr>"
					  + "<td>" + (i + 1) + "</td>"
					  + "<td>" + data[i].memId + "</td>"
					  + "<td>" + data[i].memName + "</td>"
					  + "<td>" + data[i].memPass + "</td>"
					  + "<td>" + data[i].memBir + "</td>"
					  + "<td>" + data[i].memHp + "</td>" // 01012341234
//					  + "<td>" + formatHp(data[i].memHp) + "</td>" // 포맷하여 번호 변경
					  + "<td>" + data[i].memMail + "</td>"
					  + "<td>" + data[i].memJobName + "</td>"
					  + "<td>" 
					  		+ "<button type='button'>수정</button>&nbsp;" 
					  		+ "<button type='button'>삭제</button>" 
					  + "</td>"
					  + "</tr>";
			  }
			  console.log("str : " + str);
		  } else {
			  str = "검색결과가 없습니다.";
		  }
		  
		  $("#tbResult tbody").html(str);
	  }
	  
	  function formatHp(val){
//		  val : 01012341234, 010-1234-1234, 010-12341234, 0101234-1234, 010 1234 1234, 010 12341234, 0101234 1234
		  
		  val = val.replaceAll("-", "").replaceAll(" ", "");
		  // 010-123-1234, 010-1234-1234
		  val = val.replace(/(\d{3})(\d{3,4})(\d{4})/, $1-$2-$3);
		  return val;
	  }
	  
	  
	  
	  
}); // document.ready 종료 



function movePageByGet(url){
	  console.log("test");
	  console.log("url" + url);
	  // 페이지이동 1
	  location.href = url;
	  
	  //페이지 이동 2 
//	  var fm = document.getElementById("tmpFm");
//	  fm.method = "get"
//	  fm.action = "url";
//	  fm.submit();
}


function movePageByPost(url){
	  // 페이지이동 1
	  //location.href = "/member/memberNew.do";
	  
	  //페이지 이동 2 
	  var fm = document.getElementById("tmpFm");
	  fm.method = "get"
	  fm.action = "url";
	  fm.submit();
}

function save(){
	$.ajax({
		url : "/MiddleProjectTest/member/insertForm.do"
		,type : "post"
		,data : $("#fm").serialize()
		,dataType : "json"
		,success : function(data){
			alert("저장되었습니다.");
			
			postMovePage();
		}
	});
}

function logout(){
	alert("로그아웃 합니다.");
	movePageByGet("/MiddleProjectTest/member/logout.do");
}