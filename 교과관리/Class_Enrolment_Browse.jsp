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
    JSONArray jsonArray = new JSONArray();
	ResultSet result = null;
    try{
  	   String jdbcUrl = "jdbc:mysql://localhost:3306/portal?serverTimezone=UTC&useSSL=false";
  	   String dbId = "root";
  	   String dbPass = "yan_718117";
  	   Class.forName("com.mysql.cj.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       String sql = "select s.class_number,class.class_name,class.lecture_time "+
       				"from class "+
    		   	 	"inner join (select * from class_enrolment where id=?) AS s on class.class_number=s.class_number;";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, id);
       result = pstmt.executeQuery();
       while(result.next()){
    	   JSONObject json = new JSONObject();
    	   json.put("class_number",result.getString("class_number"));
    	   json.put("class_name",result.getString("class_name"));
    	   json.put("lecture_time",result.getString("lecture_time"));
    	   jsonArray.add(json);
       }
       response.getWriter().print(jsonArray);
       str = "성공했습니다.";

       
    }catch(Exception e){
    	e.printStackTrace();
    	str = "실패";
    }finally {
    	System.out.println(str);
    	
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>
    <script>history.go(-1);</script>