<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONFIRMATION</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>

	<%
	if(request.getParameter("sid")!=null){
		String sid = request.getParameter("sid");
		int percent = Integer.parseInt(request.getParameter("percnt"));
		Connect dcon = ConnectFactory.getConnToDB("Oracle");
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String sql ="UPDATE messmembers SET percentage="+percent+" WHERE sid='"+sid+"'";
		int c = stmt.executeUpdate(sql);
		if(c==1){
			%>
			<br>
				<center><font size=6 color=green>Successfully modified Mess Member Percentage..!!</font>
				<br><br>Please Wait.....		</center>
			
			<%
			response.setHeader("refresh","2; mmdetails.jsp");
		}
	}
	else{
		response.sendRedirect("modifymm.jsp");
	}
	%>

</body>
</html>