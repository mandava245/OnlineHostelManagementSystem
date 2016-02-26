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
		int c=0,p=0,q=0;
		if(request.getParameter("sid")!=null){
			String sid = request.getParameter("sid");
			String percent = request.getParameter("percnt");
			Connect dcon = ConnectFactory.getConnToDB("Oracle");
			Connection con = dcon.Connect_DB();
			Statement stmt = con.createStatement();
			String sql = "INSERT INTO messmembers VALUES ('"+sid+"',"+percent+")";
			c = stmt.executeUpdate(sql);
			Statement stmt1 = con.createStatement();
			String sql1 = "UPDATE month SET type='mm' WHERE sid='"+sid+"'";
			p = stmt1.executeUpdate(sql1);
			Statement stmt2 = con.createStatement();
			String sql2 = "UPDATE tempbill SET type='mm' WHERE sid='"+sid+"'";
			q = stmt2.executeUpdate(sql2);
			
			if(c==1 && p==1 && q==1){
				%>
					<script>
						alert('Mess Member Added Successfully !!');
					</script>
				<%
				response.sendRedirect("mmdetails.jsp");
			}
			else
			{
				%>
				<script>
					alert('Something is Wrong ! Mess Member has not been Added..!!');
				</script>
				<%
			}
			con.close();
			dcon.closeConnection();
		}
		else{
			response.sendRedirect("messmembs.jsp");
		}
	
	%>
</body>
</html>