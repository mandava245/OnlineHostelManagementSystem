<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STUDENT DATA UPDATION</title>

		<style>
				
					center{
							font-size: 26px;
							font-weight: bold;
							font-family: Cambria;
							color: #8C5022;
					}
					table{
						font-size: 22px;
						font-family: Cambria;
						color: #B6496A;
						font-weight: bold;
					}
					a{
						font-size: 24px;
							color: yellow;
							text-decoration: none;
							background-color: #7A532C;
							border-radius: 5px;
							font-weight: bold;
						} 
						a:hover{
							color: red;
							background-color: yellow;
							border: 1px groove green;
						}
		</style>

</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>

<%

	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("sid")!=null){
		String name = request.getParameter("name");
		int year = Integer.parseInt(request.getParameter("year"));
		String branch = request.getParameter("branch");
		String roomno = request.getParameter("roomno");
		String regno = request.getParameter("rollno");
		double notpaid = Double.parseDouble(request.getParameter("notpaid"));
		double paid = Double.parseDouble(request.getParameter("paid"));
		double fine = Double.parseDouble(request.getParameter("fine"));
		String mobile = request.getParameter("mobile");
		String sid= request.getParameter("sid");
		Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String sql = "UPDATE student SET sname='"+name+"',roomno='"+roomno+"',branch='"+branch+"',syear="+year+",regno='"+regno+"',mobile='"+mobile+"',notpaid='"+notpaid+"',paid='"+paid+"',fine='"+fine+"' WHERE sid='"+sid+"'";
		int c = stmt.executeUpdate(sql);
		con.close();
		dcon.closeConnection();
		if(c==1)
		{
			%>
				<script>
					alert('Successfully Updated Student Data..!!');
				</script>
				
				
		<center><font color=red>Student Data Successfully Updated</font></center>
			<br>
			<table align="center" border=0 cellpadding=5 cellspacing=5>
				<tr><td>Name</td><td><span><%= name %></span></td></tr>
				<tr><td>Student ID</td><td><%= sid %></td></tr>
				<tr><td>Branch</td><td><%= branch %></td></tr>
				<tr><td>Year</td><td><%= year %></td></tr>
				<tr><td>Room No</td><td><%= roomno %></td></tr>
				<tr><td>Reg No</td><td><%= regno %></td></tr>
				<tr><td>To be Paid</td><td><%= notpaid %></td></tr>
				<tr><td>Already Paid</td><td><%= paid %></td></tr>
				<tr><td>Fine</td><td><%= fine %></td></tr>
				<tr><td>Mobile</td><td><%= mobile %></td></tr>
			
			</table>
				<br><br>
				<div align="center">
			<a href="modifyst.jsp">&nbsp;&nbsp;Go Back&nbsp;&nbsp;</a>
			</div>
				
			<%
		}
		else
		{
			%>
				<script>
					alert('OOPS..!! Data Updation Failed.! Something is Wrong Please try Again..!!');
				</script>
			<%	
			response.setHeader("refresh","1; modifyst.jsp");
		}
	}
	else{
		response.sendRedirect("modifyst.jsp");
	}
%>

</body>
</html>