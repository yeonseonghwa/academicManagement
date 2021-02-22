<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String ID = request.getParameter("ID");
    String PW = request.getParameter("PW");
    String name=null;
    String level=null;
    boolean I = false;
    boolean P = false;

    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    ResultSet result = null;
	ArrayList<String> oneLineData;
	ArrayList<ArrayList<String>> allData = new ArrayList<ArrayList<String>>();
    try{
	    String jdbcUrl = "jdbc:mysql://localhost:3306/portal?serverTimezone=UTC&useSSL=false";
	    String dbId = "root";
	    String dbPass = "yan_718117";
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	    
	    String sql = "select * from vip";
	    pstmt = conn.prepareStatement(sql);
	    result = pstmt.executeQuery();
	    while(result.next()){
			oneLineData = new ArrayList<String>();
			oneLineData.add(result.getString("id"));
			oneLineData.add(result.getString("pw"));
			oneLineData.add(result.getString("stu_name"));
			oneLineData.add(result.getString("level"));
			allData.add(oneLineData);
	    }
	    int i,j;
	    for(i=0;i<allData.size();i++){
	    	if(ID.equals(allData.get(i).get(0))){
	    		I=true;
	    		if(PW.equals(allData.get(i).get(1))){
	    			P=true;
	    			name = allData.get(i).get(2);
	    			level = allData.get(i).get(3);
	    			break;
	    		}else{
	    			P=false;
	    		}
	    	}else{
	    		I=false;
	    	}
	    }
	    System.out.printf("ID=%s,PW=%s,name=%s,level=%s\n",ID,PW,name,level);
	    if(I==true && P==true){
	    	//session.invalidate();
	    	session.setAttribute("id",ID);
			session.setAttribute("pw",PW);
			session.setAttribute("level",level);
			
	    %>
			<script>
				var ID = "<%=ID%>";
				var name = "<%=name%>"; 
				var level = "<%=level%>";
				location.href="../main/index.jsp?ID="+ID+"&name="+name+"&level="+level;
			</script>
		<%}else if(I==false){%>
    		<script>
    			alert("아이디가 맞지 않습니다.")
    			history.go(-1);
    		</script>
    	<%}else if(P==false){%>
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		<%}
	    
    }catch(Exception e){
    	e.printStackTrace();
    }finally {
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
     }
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>