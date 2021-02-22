<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String level = request.getParameter("level");
    
    
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    
    try{
  	   String jdbcUrl = "jdbc:mysql://localhost:3306/portal?serverTimezone=UTC&useSSL=false";
  	   String dbId = "root";
  	   String dbPass = "yan_718117";
  	   Class.forName("com.mysql.cj.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       String sql = "insert into vip values(?,?,?,?);";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1,id);
       pstmt.setString(2,pw);
       pstmt.setString(3,name);
       pstmt.setString(4,level);
       pstmt.executeUpdate();
       
       str = "회원이 추가되었습니다.";
       System.out.println(session.getAttribute("id"));
       System.out.println(session.getAttribute("pw"));
       %>
       <script>alert("회원이 추가되었습니다.")</script>
       <%
       
    }catch(Exception e){
    	e.printStackTrace();
    	%>
        <script>alert("회원 추가 실패했습니다.")</script>
        <%
    	str = "실패";
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>
    <script>history.go(-1);</script>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>