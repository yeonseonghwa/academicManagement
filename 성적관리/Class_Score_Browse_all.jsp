<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");

	
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
       sql = "select s.id,s.stu_name,s.class_number,class.class_name,s.score,s.level "+
       		  "from class "+
        	   "inner join (select vip.stu_name,a.id,a.class_number,a.score,a.level "+
       		   "from vip "+
        		"inner join (select * from student_score) "+
       		    "AS a on vip.id=a.id) "+
        		"AS s on class.class_number=s.class_number;";
       pstmt = conn.prepareStatement(sql);
       result = pstmt.executeQuery();

       
	   
       while(result.next()){
    	   JSONObject json = new JSONObject();
    	   json.put("id",result.getString("id"));
    	   json.put("stu_name",result.getString("stu_name"));
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
    