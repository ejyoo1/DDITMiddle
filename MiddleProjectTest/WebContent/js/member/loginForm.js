/**
 * 로그인 페이지 js
 */

function login(url){
	var fm = document.getElementById("fm");
	fm.method = "post"
	fm.action = url;
	fm.submit();
}

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

function reset(){
	
}

function goToBack(){
	
}