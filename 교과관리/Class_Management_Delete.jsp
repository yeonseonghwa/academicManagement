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
    
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    ResultSet rs = null;
    JSONArray jsonArray = new JSONArray();
    try{
  	   String jdbcUrl = "jdbc:mysql://localhost:3306/portal?serverTimezone=UTC&useSSL=false";
  	   String dbId = "root";
  	   String dbPass = "yan_718117";
  	   Class.forName("com.mysql.cj.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       String sql = "delete from class where class_number=?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1,class_number_old);
       pstmt.executeUpdate();

       
       str = "성공적으로 삭제되었습니다.";
       %>
       <script>alert("성공적으로 삭제되었습니다.")</script>
       <%
       
    }catch(Exception e){
    	e.printStackTrace();
    	%>
        <script>alert("수강하공 있는 학생이 있으므로 삭제가 불가능하다.")</script>
        <%
    	str = "실패";
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>
    <script>history.go(-1);</script>