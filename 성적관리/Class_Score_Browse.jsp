<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	
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
       String sql = null;
       sql = "select s.class_number,class.class_name,s.score,s.level "+
       		  "from class "+
        	   "inner join (select * from student_score where id=?) AS s on class.class_number=s.class_number;";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1,id);
       result = pstmt.executeQuery();

       
	   
       while(result.next()){
    	   JSONObject json = new JSONObject();
    	   System.out.println(result.getString("class_number"));
    	   json.put("class_number",result.getString("class_number"));
    	   json.put("class_name",result.getString("class_name"));
    	   json.put("score",result.getString("score"));
    	   json.put("level",result.getString("level"));
    	   jsonArray.add(json);
       }
       response.getWriter().print(jsonArray);
       
    }catch(Exception e){
    	e.printStackTrace();
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>
    