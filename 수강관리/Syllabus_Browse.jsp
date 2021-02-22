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
       if(class_number.equals("all")){
           sql = "select class.class_name,syllabus.class_number,syllabus.topic "+
       					"from class "+
        		   	    "inner join syllabus on class.class_number=syllabus.class_number;";
           pstmt = conn.prepareStatement(sql);
           result = pstmt.executeQuery();
       }else{
    	   sql = "select class.class_name,s.class_number,s.topic "+
  				 "from class "+
   		   	     "inner join (select * from syllabus where class_number=?) AS s on class.class_number=s.class_number;";
    	   pstmt = conn.prepareStatement(sql);
    	   pstmt.setString(1, class_number);
           result = pstmt.executeQuery();
       }
       
	   
       while(result.next()){
    	   JSONObject json = new JSONObject();
    	   json.put("class_name",result.getString("class_name"));
    	   json.put("class_number",result.getString("class_number"));
    	   json.put("topic",result.getString("topic"));
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

    