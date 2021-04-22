/**
 * 
 */

function login(url){
	var fm = document.getElementById("fm");
	fm.method = "post"
	fm.action = url;
	fm.submit();
}

function movePageByGet(url){
	  location.href = url;
}
