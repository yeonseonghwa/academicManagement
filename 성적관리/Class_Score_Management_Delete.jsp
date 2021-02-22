<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String class_number = request.getParameter("class_number");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    ResultSet result = null;
    JSONArray jsonArray = new JSONArray();
    try{
  	   String jdbcUrl = "jdbc:mysql://localhost:3306/portal?serverTimezone=UTC&useSSL=false";
  	   String dbId = "root";
  	   String dbPass = "yan_718117";
  	   Class.forName("com.mysql.cj.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       String sql = "delete from student_score where id=? and class_number=?;";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1,id);
       pstmt.setString(2,class_number);
       pstmt.executeUpdate();
       
       str = "성적이 삭제되었습니다.";
       %>
       <script>
       alert("성적이 삭제되었습니다.");
       </script>
       <%
       
    }catch(Exception e){
    	e.printStackTrace();
    	%>
        <script>
        alert("삭제 실패했습니다.");
        </script>
        <%
    	str = "실패";
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>