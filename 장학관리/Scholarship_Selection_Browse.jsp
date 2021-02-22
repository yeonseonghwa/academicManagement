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
       String sql = "select vip.stu_name,scholarship_selection.id "+
    				"from vip "+
    		    	"inner join scholarship_selection on vip.id = scholarship_selection.id;";
       pstmt = conn.prepareStatement(sql);
       result = pstmt.executeQuery();
		JSONObject temp = new JSONObject();
       while(result.next()){
    	   JSONObject json = new JSONObject();
    	   json.put("id",result.getString("id"));
    	   json.put("stu_name",result.getString("stu_name"));
    	   jsonArray.add(json);
    	   temp = json;
       }
//	   System.out.println(jsonArray.getClass());
       response.getWriter().print(jsonArray);
   //    response.setContentType("application/json");
  //     out.print(jsonArray.toJSONString());
  //		System.out.println("asd");
 // 		response.setContentType("text/javascript");
  //		String r = "(" + temp + ")";
  //		PrintWriter pw = response.getWriter();
  //		pw.print(r);
  		
       
    }catch(Exception e){
    	e.printStackTrace();
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>