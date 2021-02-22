<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    String class_number_old = request.getParameter("class_number");
    String class_name_new = request.getParameter("class_name_new");
    String professor_new = request.getParameter("professor_new");
    String lecture_time_new = request.getParameter("lecture_time_new");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";

    try{
  	   String jdbcUrl = "jdbc:mysql://localhost:3306/portal?serverTimezone=UTC&useSSL=false";
  	   String dbId = "root";
  	   String dbPass = "yan_718117";
  	   Class.forName("com.mysql.cj.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       String sql = "update class set class_name=?,professor=?,lecture_time=? where class_number=?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1,class_name_new);
       pstmt.setString(2,professor_new);
       pstmt.setString(3,lecture_time_new);
       pstmt.setString(4,class_number_old);
       pstmt.executeUpdate();
       
       
       
       
       str = "성공적으로 업데이트되었습니다.";
       %>
       <script>alert("성공적으로 업데이트되었습니다.")</script>
       <%
       
    }catch(Exception e){
    	e.printStackTrace();
    	%>
        <script>alert("업데이트 실패했습니다.")</script>
        <%
    	str = "실패";
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>
    <script>history.go(-1);</script>