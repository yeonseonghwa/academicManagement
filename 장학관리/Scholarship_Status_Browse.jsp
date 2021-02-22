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
       String sql = "select vip.stu_name,scholarship_status.id,scholarship_status.amount,scholarship_status.level "+
    				"from vip "+
    		    	"inner join scholarship_status on vip.id = scholarship_status.id;";
       pstmt = conn.prepareStatement(sql);
       result = pstmt.executeQuery();
       while(result.next()){
    	   JSONObject json = new JSONObject();
    	   json.put("id",result.getString("id"));
    	   json.put("stu_name",result.getString("stu_name"));
    	   json.put("amount",result.getString("amount"));
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