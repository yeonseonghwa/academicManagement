<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    String class_number = request.getParameter("class_number");
    String topic = request.getParameter("topic");
    
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";

    try{
  	   String jdbcUrl = "jdbc:mysql://localhost:3306/portal?serverTimezone=UTC&useSSL=false";
  	   String dbId = "root";
  	   String dbPass = "yan_718117";
  	   Class.forName("com.mysql.cj.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       String sql = "insert into Syllabus values(?,?)";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1,class_number);
       pstmt.setString(2,topic);
       pstmt.executeUpdate();
       
       str = "강의계획서가 추가되었습니다.";
       %>
       <script>alert("강의계획서가 추가되었습니다.")</script>
       <%
       
    }catch(Exception e){
    	e.printStackTrace();
    	%>
        <script>alert("추가 실패했습니다.")</script>
        <%
    	str = "실패";
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>
    <script>history.go(-1);</script>