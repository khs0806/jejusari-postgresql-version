
function createForm(obj){
	if(obj.report_title.value == ""){
		alert("제목을 반드시 입력하세요.");
		obj.report_title.focus();
		return false;
	}
	
	if(obj.report_content.value == ""){
		alert("내용를 반드시 입력하세요.");
		obj.report_content.focus();
		return false;
	}
	
	}
	


