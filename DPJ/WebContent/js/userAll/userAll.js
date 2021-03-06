/**
 * 
 */
var idFlag = false;
var runIdCheckFlag = false;

$(document).ready(function(){
	 $("#userId").keydown(function(){ // 아이디 입력 시 check 초기화
		 console.log("키보드 입력 이벤트 발생");
		 $("#spUserId").text("");
		 idFlag = false;
		 runIdCheckFlag = false;
	 });
});


function chkId(){
	idFlag = false;
	runIdCheckFlag = true;
	
	var userId = $("#userId").val();
	console.log(userId);
	
	// 빈 값 체크
	if(isEmpty(userId)){
		var str = "아이디가 입력되지 않았습니다.";
		formSetting(str,"#spUserId",false);
		$("#userId").focus();
	    return;
	}
	
	// 공백 체크
	if(hasBlank(userId)) {
		var str = "아이디에 빈 칸은 입력하실 수 없습니다.";
		formSetting(str,"#spUserId",false);
		$("#userId").focus();
		return false;
	}
	
    var regExp = /^(?=.*[a-z])[a-z0-9]{4,12}$/;
    if(!regExp.test(userId)){ // 정규식 값에 맞는지 확인함.
    	var str = "4~12자 영문 소문자, 숫자를 사용하세요. 영문 소문자는 필수입니다.";
    	formSetting(str,"#spUserId",false);
    	$("#userId").focus();
    	return;
    }
	
	$.ajax({
		url : "/DPJ/userAll/checkUserAll.do"
		, type : "post"
		, data : {"userId" : userId}
		, dataType : "json"
		, async : false
		, success : function(data){
			console.log(data);
			if(data > 0){
				idFlag = false;
				var str = "중복된 아이디가 존재합니다.";
		    	formSetting(str,"#spUserId",false);
		    	$("#userId").focus();
		    	return;
			}else{
				idFlag = true;
				var str = "사용가능한 아이디입니다.";
		    	formSetting(str,"#spUserId",true);
			}
		}
		, error : function(xhr){
			console.log(xhr);
			alert("ID 중복 검사 중 오류가 발생했습니다. 관리자에게 문의하세요.");
		}
	});
}


function save(){
	console.log("idFlag : " + idFlag);
	console.log("runIdCheckFlag : " + runIdCheckFlag);
	
	if(runIdCheckFlag){ // 중복 검사를 수행한 경우
		// 회원 정보 유효성 체크
		var result = validate();
		console.log("result : " + result);
		if(!result) {
			return;
		}
		// 사용자 컨펌
		if(!confirm("저장하시겠습니까?")) {
			return;
		}
	}else if(!runIdCheckFlag){
		alert("아이디 중복 검사는 필수입니다.");
		$("#userIdChk").focus();
		return;
	}
	
	
//	$("#formFlag").val("C");
//	$.ajax({
//		url : "/MemberPj/MemberServlet"
//		,type : "post"
//		,data : $("#fm").serialize()
//		,dataType : "json"
//		,success : function(data){
//			alert("저장되었습니다.");
//			reset();
//		}
//		, error : function(xhr){ // 사용자가 잘못한 것이 아니라 관리자가 처리해야 하는 오류
//			alert("실패하였습니다. \n관리자에게 문의하세요.");
//			console.log(xhr);
//		}
//	});

function validate(){ // 저장 버튼 클릭 시 유효성 검사
		$("#spUserId").hide();
		$("#spUserPw").hide();
//		$("#spMemBir").hide();
//		$("#spMemPass").hide();
//		$("#spMemHp").hide();
//		$("#spMemMail").hide();
//		$("#spMemAdd2").hide();
		
		//정규식
		var userPwExp     = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-_!@#$%^&?])[A-Za-z\d-_!@#$%^&?]{8,12}$/;
		var dditNameExp   = /^[가-힣]{2,5}$/;
		var dditHpExp  = /^01[0-1]-?\d{3,4}-?\d{4}$/;
		var dditBirExp    = /^(19[0-9][0-9]|20[0-1][0-9]|202[0-1])-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		var dditMailExp  = 
			/^(?=.*[a-z])[a-z0-9]{4,12}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
		
		if(!idFlag){
			alert("아이디 중복검사를 진행해주세요.");
			return false;
		}
		
		/** 비밀번호 검사*/
	    val = $("#userPw").val();
	    
	    // 빈 값 체크
		if(isEmpty(val)){ 
			var str = "비밀번호를 입력해주세요.";
			formSetting(str,"#spUserPw",false);
			$("#userPw").focus();
	        return false;
	    }
		
		// 공백 체크
		if(hasBlank(val)) {
			var str = "비밀번호에 빈 칸은 입력하실 수 없습니다.";
			formSetting(str,"#spUserPw",false);
			$("#userPw").focus();
			return false;
		}
		
		// 형식 체크
		if(checkRegExp(userPwExp, val)){
			var str = "8~12자 영문 대소문자, 숫자, 특수문자(-_!@#$%^&?)를 모두 포함하세요.";
			formSetting(str,"#spUserPw",false);
			$("#userPw").focus();
	        return false;
		}
		
		/** 이름 체크*/
		val = $("#dditName").val();
		
		// 빈 값 체크
		if(isEmpty(val)){ 
			var str = "이름을 입력해주세요.";
			formSetting(str,"#spDditName",false);
			$("#dditName").focus();
	        return false;
	    }
		
		// 공백 체크
		if(hasBlank(val)) {
			var str = "이름에 빈 칸은 입력하실 수 없습니다.";
			formSetting(str,"#spDditName",false);
			$("#dditName").focus();
			return false;
		}
		
		// 형식 체크
	    if(checkRegExp(dditNameExp, val)){ // 정규식 체크(길이, 공백, 올바른 입력)
	    	var str = "한글 2~5자를 입력해주세요.";
	    	formSeting(str,"#spDditName","#dditName");
	        return false;
	    }
	    
	    /** 프로필 사진 유효성 검사 필요 - 선택하지 않은 경우 */
	    
	    /** 소속반은 유효성 검사 하지 않음 - 디폴트 값으로 삽입*/
	    
	    /** 휴대전화 검사 */
	    val = $("#dditHp").val();
	    
	    // 빈 값 체크
		if(isEmpty(val)){
			var str = "휴대폰 번호는 필수 정보입니다.";
	    	formSeting(str,"#spDditHp",false);
	    	$("#dditHp").focus();
	        return false;
	    }
		
		// 공백 체크
		if(hasBlank(val)){
			var str = "휴대폰 번호에 빈 칸은 입력하실 수 없습니다.";
	    	formSeting(str,"#spDditHp",false);
	    	$("#dditHp").focus();
	        return false;
		}
		
	    if(checkRegExp(dditHpExp, val)){ // 정규식 체크(길이, 공백, 올바른 입력)
	    	var str = "010 또는 011로 시작하는 휴대폰 번호만 사용하세요. (예: 010-0000-0000)";
	    	formSeting(str,"#spDditHp",false);
	    	$("#dditHp").focus();
	        return false;
	    }
	    
	    /** 이메일 검사 */
	    val = $("#dditMail").val();
	    
	    // 빈 값 체크
		if(isEmpty(val)){ 
			var str = "이메일 주소는 필수 정보입니다.";
	    	formSeting(str,"#spDditMail",false);
	    	$("#dditMail").val();
	        return false;
	    }
		
		// 공백 체크
		if(hasBlank(val)){
			var str = "이메일 주소에 빈 칸은 입력하실 수 없습니다.";
	    	formSeting(str,"#spDditMail",false);
	    	$("#dditMail").focus();
	        return false;
		}
		
		// 형식 체크 : 한글 2~5 글자
	    if(checkRegExp(dditMailExp, val)){ // 정규식 체크(길이, 공백, 올바른 입력)
	    	var str = "올바른 이메일 형식을 입력해주세요.";
	    	formSeting(str,"#spDditMail",false);
	    	$("#dditMail").focus();
	        return false;
	    }
	    
	    /** 생년월일 검사 */
	    val = $("#dditBir").val();
	    
	    if(isEmpty(val)){ // 빈 값 체크
	    	var str = "생년월일은 필수 정보입니다.";
	    	formSeting(str,"#spDditBir",false);
	    	$("#dditBir").focus();
	        return false;
	    }
	    
	    if(checkRegExp(dditBirExp, val)){ // 정규식 체크(길이, 공백, 올바른 입력)
	    	var str = "올바른 생년월일을 입력하세요. (1993-12-06)";
	    	formSeting(str,"#spMemBir","#memBir");
	        return false;
	    }
	    
	    var dateArr = val.split("-");
	    console.log("dateArr : " + dateArr);
	    var age = 18;
	    var mydate = new Date();
	    mydate.setFullYear(dateArr[0], dateArr[1]-1, dateArr[2]);

	    var currdate = new Date();
	    currdate.setFullYear(currdate.getFullYear() - age);
	    
	    if ((currdate - mydate) < 0){
	    	var str = "가입할 수 없는 연령입니다.";
	        formSeting(str,"#spMemBir","#memBir");
	        return false;
	    }
	    
	    
	    
	    
	    
	    
		
		
		return true;
	}
}

/** 유효성 검사 폼 세팅*/
function formSetting(str,spanId,flag){
	alert(str);
	if(flag){
		$(spanId).attr('class', 'form-text text-success');
	} else { 
		$(spanId).attr('class', 'form-text text-danger');
	}
	$(spanId).text(str);
    $(spanId).show();
}

/** 정규식 검사*/
function checkRegExp(regExp, param){
	if(param.match(regExp)){
		return false;
	}else{
		return true;
	}
}

function hasBlank(str) {
	return str.match(" ");
}