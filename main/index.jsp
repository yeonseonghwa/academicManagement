<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%String ID = request.getParameter("ID"); 
      String name = request.getParameter("name");
      String level = request.getParameter("level");
      String fileName;
    %>
<!DOCTYPE html>
<html>
<head>
<style>
	header {background-color: powderblue;}
	#menu {border-style: outset; width: 200px;}
	.item {cursor : pointer;}
	#display {border-style: inset; width: 1680px; height: 900px; position:absolute; top: 40px; left: 220px;}
	#subDisplay {}
	table,tr,th {  border: 1px solid black; border-collapse: collapse;}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../main/index.js" charset="utf-8"> </script>

<meta charset="utf-8">
<title>학사 관리 시스템</title>
</head>
<body>
	<header>
		<pre>사용자 이름 : <%=name %>  사용자 ID : <%=ID %>   등급 : <%=level %>   <input id="logout" type="submit" name="logout" value="로그옷"></pre>
	</header>
	<nav id="menu">
		<fieldset>
			<legend>장학관리:</legend>
			<p class="item" id="Scholarship_Upload" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">장학생등록</p>
			<p class="item" id="Scholarship_Selection_Browse" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">장학선발열람</p>
			<p class="item" id="Scholarship_Status_Browse" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">장학생현황</p>
		</fieldset>
		<fieldset>
			<legend>수강관리:</legend>
			<p class="item" id="Syllabus_Upload" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">강의계획서등록</p>
			<p class="item" id="Syllabus_Browse" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">강의계획서열람</p>
			<p class="item" id="Class_Enrolment" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">수강신청</p>
		</fieldset>
		<fieldset>
			<legend>성적관리:</legend>
			<p class="item" id="Student_Score_Upload" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">성적처리</p>
			<p class="item" id="Class_Score_Browse" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">성적열람</p>
			<p class="item" id="Class_Score_Browse_all" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">성적표열람</p>
			<p class="item" id="Class_Score_Management" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">성적표관리</p>
		</fieldset>
		<fieldset>
			<legend>교과관리:</legend>
			<p class="item" id="Class_Upload" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">교과정보등록</p>
			<p class="item" id="Class_Management" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">교과정보관리</p>
			<p class="item" id="Class_Browse" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">교과정보열람</p>
			<p class="item" id="Class_Enrolment_Browse" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">수강시간표열람</p>
		</fieldset>
		<fieldset>
			<legend>학적관리:</legend>
			<p class="item" id="Student_Event_Upload" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">학적기본</p>
			<p class="item" id="Student_Event_Browse" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">학적조회</p>
		<!--	<p class="item" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">학적변동</p>-->
		</fieldset>
		<fieldset>
			<legend>사용자 생성</legend>
			<p class="item" id="makeVip" onmouseDown="mouseDown(this)" onmouseUp="mouseUp(this)">사용자 생성</p>
		</fieldset>
	</nav>
	<nav id="display">
		<!-- 강의계획서 열람 -->
		<div class="subDisplay" id="Syllabus_Browse_Display">
			<p>강의계획서열람</p>
			<p>열람하고자하는 과목의 학수번호를 입력(모든 것을 열람하고 싶으면 all 를 입력)</p>
			<p>학수번호 : <input type="text" id="Syllabus_Browse_Class_Number" name="class_number" placeholder="학수번호입력"></p>
			<input id="Syllabus_Browse_Button" type="submit" name="submit" value="열람">
		</div>

		<!-- 성적표관리 -->
		<div class="subDisplay" id="Class_Score_Management_Delete">
			<p>성적삭제</p>
			<p>삭제하고자하는 학생의 학번이랑 과목의 학수번호를 입력</p>
			<p>학번 : <input type="text" id="Class_Score_Management_Delete_Id" name="id" placeholder="학번입력"></p>
			<p>학수번호 : <input type="text" id="Class_Score_Management_Delete_Class_Number" name="class_number" placeholder="학수번호입력"></p>
			<input id="Class_Score_Management_Delete_Button" type="submit" name="submit" value="삭제">
		</div>
		<div class="subDisplay" id="Class_Score_Management_Update">
			<p>성적수정</p>
			<p>수정하고자하는 학생의 학번이랑 과목의 학수번호를 입력</p>
			<p>학번 : <input type="text" id="Class_Score_Management_Update_Id" name="id" placeholder="학번입력"></p>
			<p>학수번호 : <input type="text" id="Class_Score_Management_Update_Class_Number" name="class_number" placeholder="학수번호입력"></p>
			<p>새로운 점수 : <input type="text" id="Class_Score_Management_Update_Score_New" name="class_number_new" placeholder="수정후 성적"></p>
			<p>새로운 등급 : <input type="text" id="Class_Score_Management_Update_Level_New" name="level_new" placeholder="수정후 등급"></p>
			<input id="Class_Score_Management_Update_Button" type="submit" name="submit" value="업데이트">
		</div>
		<!-- 학적조회 -->
		<div class="subDisplay" id="Student_Event_Browse_Display">
			<p>학적조회</p>
			<p>조회하고자하는 학생의 학번을 입력(관리자랑 교수는 모든 사람에 대해 조회가 가능하다. 모두 열람하고 싶으면 all 를 입력)</p>
			<p>학번 : <input type="text" id="Student_Event_Browse_Id" name="id" placeholder="학번입력"></p>
			<input id="Student_Event_Browse_Button" type="submit" name="submit" value="조회">
		</div>
		<!-- 메인 화면 -->
		<div class="mainDisplay">

		</div>

	</nav>
</body>
</html>

<!-- 장하관리 : 장학생 현황 , 장학 선발 열람
	 수강관리 : 강의 계획서 관리 , 강의 계획서 등록, 수간신청
	 성적관리 : 성적 처리 , 성적 열람, 성적표 열람, 성적표 관리
	 교과관리 : 교과 정보관리 , 교과 정보 열람, 교과 정보 등록, 수강 시간표 열람
	 학적고나리 : 학번부여, 학적기본, 학적변동, 학적조회
	 iframe
	 outset
	 intset
 -->