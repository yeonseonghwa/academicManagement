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
    String level = (String)session.getAttribute("level");
    String userId = (String)session.getAttribute("id");
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
       String sql=null;

       if( ((!level.equals("student")) && (!id.equals("all"))) || (userId.equals(id)) ){
    	   sql = "select vip.id,vip.stu_name,s.event "+
       			 "from vip "+
    			   "inner join (select * from student_event where id=?) AS s on vip.id=s.id;";
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, id);
           result = pstmt.executeQuery();
           while(result.next()){
        	   JSONObject json = new JSONObject();
        	   json.put("id",result.getString("id"));
        	   json.put("stu_name",result.getString("stu_name"));
        	   json.put("event",result.getString("event"));
        	   jsonArray.add(json);
           }
           response.getWriter().print(jsonArray);
       }else if(id.equals("all")){
    	   sql = "select vip.id,vip.stu_name,s.event "+
         			 "from vip "+
      			   "inner join (select * from student_event) AS s on vip.id=s.id;";
             pstmt = conn.prepareStatement(sql);
             result = pstmt.executeQuery();
             while(result.next()){
          	   JSONObject json = new JSONObject();
          	   json.put("id",result.getString("id"));
          	   json.put("stu_name",result.getString("stu_name"));
          	   json.put("event",result.getString("event"));
          	   jsonArray.add(json);
             }
             response.getWriter().print(jsonArray);
       }

	   


  		
       
    }catch(Exception e){
    	e.printStackTrace();
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>