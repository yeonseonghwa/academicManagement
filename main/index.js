/**
 * 
 */



var json = new Array();
var array = new Array();
var object = new Object();

function replaceAll(str, searchStr, replaceStr) {
	  return str.split(searchStr).join(replaceStr);
}
function parsingData(data){
	  var jsonArray;
	  jsonArray = data.split("]")[0];
	  jsonArray = replaceAll(jsonArray,"\"","");
	  jsonArray = jsonArray.replace("[","");
	  jsonArray = jsonArray.replace("]","");
	  json = jsonArray.split("},{");
	  for(var i =0;i<json.length;i++){
	    json[i] = json[i].replace("{","");
	    json[i] = json[i].replace("}","");
	  }
	  var temp = Array();
	  var temp1 = Array();
	  var temp2 = Array();
	  for(var i=0;i<json.length;i++){
	    temp = json[i].split(",");
	    object = new Object;
	    for(var j=0;j<temp.length;j++){
	      temp1 = temp[j].split(":");
	      object[temp1[0]] = temp1[1];
	    }
	    array.push(object);
	  }
}
function mouseDown(event){
	event.style.color = "blue";
}
function mouseUp(event){
	event.style.color = "black"
}

function mainDisplay(){
	$(".subDisplay").hide();
	$(".mainDisplay").show();
}
function Syllabus_Browse_Display(){
	$("#Syllabus_Browse_Display").show();
	$("#Student_Event_Browse_Display").hide();
	$("#Class_Score_Management_Delete").hide();
	$("#Class_Score_Management_Update").hide();
	$(".mainDisplay").hide();
}
function Class_Score_Browse_Display(){
	$("#Syllabus_Browse_Display").hide();
	$("#Student_Event_Browse_Display").hide();
	$("#Class_Score_Management_Delete").hide();
	$("#Class_Score_Management_Update").hide();
	$(".mainDisplay").hide();
}
function Class_Score_Management_Display(){
	$("#Syllabus_Browse_Display").hide();
	$("#Student_Event_Browse_Display").hide();
	$("#Class_Score_Management_Delete").show();
	$("#Class_Score_Management_Update").show();
	$(".mainDisplay").hide();
}
function Student_Event_Browse_Display(){
	$("#Syllabus_Browse_Display").hide();
	$("#Class_Score_Management_Delete").hide();
	$("#Class_Score_Management_Update").hide();
	$("#Student_Event_Browse_Display").show();
	$(".mainDisplay").hide();
}


function display(){
	var $level;
	$.ajax({
		type:"GET",
		url:"../login/getSession.jsp",
		dataType:"text",
		error:function(){
			alert("통신실패!!")
		},
		success:function(data){
			$level = data.trim();
			if($level=="root"){
				$("#Class_Enrolment").hide();
				$("#Class_Score_Browse").hide();
			}else if($level=="student"){
				$("#Scholarship_Upload").hide();
				$("#Syllabus_Upload").hide();
				$("#Student_Score_Upload").hide();
				$("#Class_Score_Management").hide();
				$("#Class_Upload").hide();
				$("#Class_Management").hide();
				$("#Student_Event_Upload").hide();
				$("#makeVip").hide();
				$("#Class_Score_Browse_all").hide();
			}else if($level=="professor"){
				$("#Scholarship_Upload").hide();
				$("#Class_Enrolment").hide();
				$("#Class_Enrolment_Browse").hide();
				$("#Student_Event_Upload").hide();
				$("#Student_Event_Browse").hide();
				$("#makeVip").hide();
				$("#Class_Score_Browse").hide();
			}
		}
	})


}


$(document).ready(function(){
	display();
	$(".subDisplay").hide();
	$(".mainDisplay").show();
	
	
	$("#logout").click(function(){
		$.ajax({
			type:"GET",
			url:"../login/logout.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				location.href="../login/login.html";
			}
		})
	})
	
	
	//장학생 등록
	//화면
	$("#Scholarship_Upload").click(function(){
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../장학관리/장학관리.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	//장학선발열람
	$("#Scholarship_Selection_Browse").click(function(){
		mainDisplay();
		json = new Array();
		array = new Array();
		object = new Object();
		$.ajax({
			type:"GET",
			url:"../장학관리/Scholarship_Selection_Browse.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				parsingData(data);
				$table = make_scholarship_selection_page();
				$(".mainDisplay").html($table);
			}
		})
	})
	
	//장학생현황
	$("#Scholarship_Status_Browse").click(function(){
		mainDisplay();
		json = new Array();
		array = new Array();
		object = new Object();
		$.ajax({
			type:"GET",
			url:"../장학관리/Scholarship_Status_Browse.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				parsingData(data);
				$table = make_scholarship_status_page();
				$(".mainDisplay").html($table);
			}
		})
	})
	
	//수강관리
	//강의계획서등록
	//화면
	$("#Syllabus_Upload").click(function(){
		mainDisplay();
		
		$.ajax({
			type:"GET",
			url:"../수강관리/강의계획서등록.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	
	//강의계획서 열람
	//화면
	$("#Syllabus_Browse").click(function(){
		Syllabus_Browse_Display();
	})
	//강의계획서 열람
	//버튼
	$("#Syllabus_Browse_Button").click(function(){
		json = new Array();
		array = new Array();
		object = new Object();
		var $data = $("#Syllabus_Browse_Class_Number").val();
		Syllabus_Browse_Display();
		$.ajax({
			type:"GET",
			url:"../수강관리/Syllabus_Browse.jsp",
			dataType:"text",
			data:{
				class_number:$data
			},
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				mainDisplay();
				parsingData(data);
				$table = make_syllabus_browse_page;
				$(".mainDisplay").html($table);
			}
		})
		
	})
	
	
	//수강신청
	$("#Class_Enrolment").click(function(){
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../수강관리/수강신청.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	//성적관리
	//성적처리 화면
	$("#Student_Score_Upload").click(function(){
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../성적관리/성적처리.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	//성적열람
	$("#Class_Score_Browse").click(function(){
		json = new Array();
		array = new Array();
		object = new Object();
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../성적관리/Class_Score_Browse.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				parsingData(data);
				$table = make_student_score_browse_page();
				$(".mainDisplay").html($table);
			}
		})
	})

	//성적표열람
	$("#Class_Score_Browse_all").click(function(){
		json = new Array();
		array = new Array();
		object = new Object();
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../성적관리/Class_Score_Browse_all.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				parsingData(data);
				$table = make_student_score_browse_all_page();
				$(".mainDisplay").html($table);
			}
		})
	})
	//성적표관리
	//화면
	$("#Class_Score_Management").click(function(){
		Class_Score_Management_Display();
	})
	//삭제
	$("#Class_Score_Management_Delete_Button").click(function(){
		mainDisplay();
		var $id = $("#Class_Score_Management_Delete_Id").val();
		var $class_number = $("#Class_Score_Management_Delete_Class_Number").val();
		$.ajax({
			type:"GET",
			url:"../성적관리/Class_Score_Management_Delete.jsp",
			dataType:"text",
			data:{
				id:$id,
				class_number:$class_number
			},
			error:function(){
				alert("통신실패!!");
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	//업데이트
	$("#Class_Score_Management_Update_Button").click(function(){
		mainDisplay();
		var $id = $("#Class_Score_Management_Update_Id").val();
		var $class_number = $("#Class_Score_Management_Update_Class_Number").val();
		var $score_new = $("#Class_Score_Management_Update_Score_New").val();
		var $level_new = $("#Class_Score_Management_Update_Level_New").val();
		$.ajax({
			type:"GET",
			url:"../성적관리/Class_Score_Management_Update.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			data:{
				id:$id,
				class_number:$class_number,
				score_new:$score_new,
				level_new:$level_new
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	
	//교과관리
	//교과정보등록
	//화면
	$("#Class_Upload").click(function(){
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../교과관리/교과정보등록.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	//교과정보관리
	//화면
	$("#Class_Management").click(function(){
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../교과관리/교과정보관리.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	//교과정보열람
	$("#Class_Browse").click(function(){
		mainDisplay();
		json = new Array();
		array = new Array();
		object = new Object();
		$(".subDisplay").hide();
		$.ajax({
			type:"GET",
			url:"../교과관리/Class_Browse.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				parsingData(data);
				$table = make_class_page();
				$(".mainDisplay").html($table);
			}
		})
	})
	
	//수강시간표열람
	$("#Class_Enrolment_Browse").click(function(){
		mainDisplay();
		json = new Array();
		array = new Array();
		object = new Object();
		$.ajax({
			type:"GET",
			url:"../교과관리/Class_Enrolment_Browse.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				parsingData(data);
				$table = make_class_enrolment_browse_page();
				$(".mainDisplay").html($table);
			}
		})
	})
	
	//학적관리
	//학적기본
	$("#Student_Event_Upload").click(function(){
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../학적관리/학적관리.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	//학적 조회
	$("#Student_Event_Browse").click(function(){
		Student_Event_Browse_Display();
	})
	$("#Student_Event_Browse_Button").click(function(){
		mainDisplay();
		json = new Array();
		array = new Array();
		object = new Object();
		var $id = $("#Student_Event_Browse_Id").val();
		$.ajax({
			type:"GET",
			url:"../학적관리/Student_Event_Browse.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			data:{
				id:$id
			},
			success:function(data){
				parsingData(data);
				$table = make_student_event_browse_page();
				$(".mainDisplay").html($table);
			}
		})
	})
	//회원 생성
	//화면
	$("#makeVip").click(function(){
		mainDisplay();
		$.ajax({
			type:"GET",
			url:"../회원생성/회원생성.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
})

function make_scholarship_selection_page(){
  var $table = $('<table></table>')
  var $title = $('<caption>선발열람</caption>')
  $table.append($title);
  var $tr = $('<tr></tr>')
  var $th1 = $('<th></th>')
  var $th2 = $('<th></th>')
  $th1.append("학생이름");
  $th2.append("학번");
  $tr.append($th1);
  $tr.append($th2);
  $table.append($tr);
  for(var i=0;i<array.length;i++){
    $tr = $('<tr></tr>')
    $th1 = $('<th></th>')
    $th2 = $('<th></th>')
    $th1.append(array[i].stu_name);
    $th2.append(array[i].id);
    $tr.append($th1);
    $tr.append($th2);
    $table.append($tr);
  }
  return $table;
}

function make_scholarship_status_page(){

	  var $table = $('<table></table>')
	  var $title = $('<caption>장학현황열람</caption>')
	  $table.append($title);
	  var $tr = $('<tr></tr>')
	  var $th1 = $('<th></th>')
	  var $th2 = $('<th></th>')
	  var $th3 = $('<th></th>')
	  var $th4 = $('<th></th>')
	  $th1.append("학생이름");
	  $th2.append("학번");
	  $th3.append("금액");
	  $th4.append("등급")
	  $tr.append($th1);
	  $tr.append($th2);
	  $tr.append($th3);
	  $tr.append($th4);
	  $table.append($tr);
	  for(var i=0;i<array.length;i++){
	    $tr = $('<tr></tr>')
	    $th1 = $('<th></th>')
	    $th2 = $('<th></th>')
	    $th3 = $('<th></th>')
	    $th4 = $('<th></th>')
	    $th1.append(array[i].stu_name);
	    $th2.append(array[i].id);
	    $th3.append(array[i].amount);
	    $th4.append(array[i].level);
	    $tr.append($th1);
	    $tr.append($th2);
	    $tr.append($th3);
	    $tr.append($th4);
	    $table.append($tr);
	  }
	  return $table;
}

function make_class_page(){
	  var $table = $('<table></table>')
	  var $title = $('<caption>교과목 정보</caption>')
	  $table.append($title);
	  var $tr = $('<tr></tr>')
	  var $th1 = $('<th></th>')
	  var $th2 = $('<th></th>')
	  var $th3 = $('<th></th>')
	  var $th4 = $('<th></th>')
	  $th1.append("학수번호");
	  $th2.append("과목이름");
	  $th3.append("교수이름");
	  $th4.append("강의시간")
	  $tr.append($th1);
	  $tr.append($th2);
	  $tr.append($th3);
	  $tr.append($th4);
	  $table.append($tr);
	  for(var i=0;i<array.length;i++){
	    $tr = $('<tr></tr>')
	    $th1 = $('<th></th>')
	    $th2 = $('<th></th>')
	    $th3 = $('<th></th>')
	    $th4 = $('<th></th>')
	    $th1.append(array[i].class_number);
	    $th2.append(array[i].class_name);
	    $th3.append(array[i].professor);
	    $th4.append(array[i].lecture_time);
	    $tr.append($th1);
	    $tr.append($th2);
	    $tr.append($th3);
	    $tr.append($th4);
	    $table.append($tr);
	  }
	  return $table;
}

function make_syllabus_browse_page(){
	  var $table = $('<table></table>')
	  var $title = $('<caption>강의 계획서 열람</caption>')
	  $table.append($title);
	  var $tr = $('<tr></tr>')
	  var $th1 = $('<th></th>')
	  var $th2 = $('<th></th>')
	  var $th3 = $('<th></th>')
	  $th1.append("과목이름");
	  $th2.append("학수번호");
	  $th3.append("계획서");
	  $tr.append($th1);
	  $tr.append($th2);
	  $tr.append($th3);
	  $table.append($tr);
	  for(var i=0;i<array.length;i++){
	    $tr = $('<tr></tr>')
	    $th1 = $('<th></th>')
	    $th2 = $('<th></th>')
	    $th3 = $('<th></th>')
	    $th1.append(array[i].class_name);
	    $th2.append(array[i].class_number);
	    $th3.append(array[i].topic);
	    $tr.append($th1);
	    $tr.append($th2);
	    $tr.append($th3);
	    $table.append($tr);
	  }
	  return $table;
}

function make_class_enrolment_browse_page(){
	  var $table = $('<table></table>')
	  var $title = $('<caption>수강시간표</caption>')
	  $table.append($title);
	  var $tr = $('<tr></tr>')
	  var $th1 = $('<th></th>')
	  var $th2 = $('<th></th>')
	  var $th3 = $('<th></th>')
	  $th1.append("학수번호");
	  $th2.append("수업이름");
	  $th3.append("시간");
	  $tr.append($th1);
	  $tr.append($th2);
	  $tr.append($th3);
	  $table.append($tr);
	  for(var i=0;i<array.length;i++){
	    $tr = $('<tr></tr>')
	    $th1 = $('<th></th>')
	    $th2 = $('<th></th>')
	    $th3 = $('<th></th>')
	    $th1.append(array[i].class_number);
	    $th2.append(array[i].class_name);
	    $th3.append(array[i].lecture_time);
	    $tr.append($th1);
	    $tr.append($th2);
	    $tr.append($th3);
	    $table.append($tr);
	  }
	  return $table;
}

function make_student_score_browse_page(){
	  var $table = $('<table></table>')
	  var $title = $('<caption>성적열람</caption>')
	  $table.append($title);
	  var $tr = $('<tr></tr>')
	  var $th1 = $('<th></th>')
	  var $th2 = $('<th></th>')
	  var $th3 = $('<th></th>')
	  var $th4 = $('<th></th>')
	  $th1.append("학수번호");
	  $th2.append("과목이름");
	  $th3.append("점수");
	  $th4.append("등급")
	  $tr.append($th1);
	  $tr.append($th2);
	  $tr.append($th3);
	  $tr.append($th4);
	  $table.append($tr);
	  for(var i=0;i<array.length;i++){
	    $tr = $('<tr></tr>')
	    $th1 = $('<th></th>')
	    $th2 = $('<th></th>')
	    $th3 = $('<th></th>')
	    $th4 = $('<th></th>')
	    $th1.append(array[i].class_number);
	    $th2.append(array[i].class_name);
	    $th3.append(array[i].score);
	    $th4.append(array[i].level);
	    $tr.append($th1);
	    $tr.append($th2);
	    $tr.append($th3);
	    $tr.append($th4);
	    $table.append($tr);
	  }
	  return $table;
}

function make_student_score_browse_all_page(){
	  var $table = $('<table></table>')
	  var $title = $('<caption>성적표열람</caption>')
	  $table.append($title);
	  var $tr = $('<tr></tr>')
	  var $th1 = $('<th></th>')
	  var $th2 = $('<th></th>')
	  var $th3 = $('<th></th>')
	  var $th4 = $('<th></th>')
	  var $th5 = $('<th></th>')
	  var $th6 = $('<th></th>')
	  $th1.append("학번")
	  $th2.append("이름")
	  $th3.append("학수번호");
	  $th4.append("과목이름");
	  $th5.append("점수");
	  $th6.append("등급")
	  $tr.append($th1);
	  $tr.append($th2);
	  $tr.append($th3);
	  $tr.append($th4);
	  $tr.append($th5);
	  $tr.append($th6);
	  $table.append($tr);
	  for(var i=0;i<array.length;i++){
	    $tr = $('<tr></tr>')
	    $th1 = $('<th></th>')
	    $th2 = $('<th></th>')
	    $th3 = $('<th></th>')
	    $th4 = $('<th></th>')
	    $th5 = $('<th></th>')
	    $th6 = $('<th></th>')
	    $th1.append(array[i].id);
	    $th2.append(array[i].stu_name);
	    $th3.append(array[i].class_number);
	    $th4.append(array[i].class_name);
	    $th5.append(array[i].score);
	    $th6.append(array[i].level);
	    $tr.append($th1);
	    $tr.append($th2);
	    $tr.append($th3);
	    $tr.append($th4);
	    $tr.append($th5);
	    $tr.append($th6);
	    $table.append($tr);
	  }
	  return $table;
}

function make_student_event_browse_page(){
	  var $table = $('<table></table>')
	  var $title = $('<caption>학적조회</caption>')
	  $table.append($title);
	  var $tr = $('<tr></tr>')
	  var $th1 = $('<th></th>')
	  var $th2 = $('<th></th>')
	  var $th3 = $('<th></th>')
	  $th1.append("학번");
	  $th2.append("이름");
	  $th3.append("이벤트");
	  $tr.append($th1);
	  $tr.append($th2);
	  $tr.append($th3);
	  $table.append($tr);
	  for(var i=0;i<array.length;i++){
	    $tr = $('<tr></tr>')
	    $th1 = $('<th></th>')
	    $th2 = $('<th></th>')
	    $th3 = $('<th></th>')
	    $th1.append(array[i].id);
	    $th2.append(array[i].stu_name);
	    $th3.append(array[i].event);
	    $tr.append($th1);
	    $tr.append($th2);
	    $tr.append($th3);
	    $table.append($tr);
	  }
	  return $table;
}