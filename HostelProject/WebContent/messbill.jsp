<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VIEWING MESS BILL</title>

<style>
	button{
		border: 1px groove green;
		border-radius: 5px;
		font-size: 20px;
		font-family: Cambria;
		font-weight: bold;
		background-color: black;
		color: yellow;
	}
	button:hover{
		cursor: pointer;
		border: 1px groove yellow;
		background-color: #5A372E;
	}
</style>
</head>
<body>

	<%@ page import="java.sql.*" %>
	<%@ page import="connect.*" %>
	
<%

Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
Connection con = dcon.Connect_DB();
Statement stmt1 = con.createStatement();
String sql = "SELECT s.roomno,s.sname,s.syear,s.branch,t.totdays,t.remdays,t.billdays,t.messchrgs,t.commchrgs,t.total FROM tempbill t ,STUDENT s where t.sid=s.sid ORDER BY s.syear ASC,s.roomno ASC";
ResultSet rs = stmt1.executeQuery(sql);
int p = 1;
%>
	<table align="center" border="1">
		<tr>
			<th>Sno</th>
			<th>RoomNo</th>
			<th>Name</th>
			<th>Tot Days</th>
			<th>Rem Days</th>
			<th>Bill Days</th>
			<th>Mess Chrgs</th>
			<th>Comm Chrgs</th>
			<th>&nbsp;&nbsp;Total&nbsp;&nbsp;</th>
		</tr>
<%	

while(rs.next()){
%>
		<tr align="center">
			<td><%= p %></td>
			<td><%= rs.getString("roomno") %></td>
			<td align="left"><%= rs.getString("sname") %></td>
			<td><%= rs.getInt("totdays") %></td>
			<td><%= rs.getInt("remdays") %></td>
			<td><%= rs.getInt("billdays") %></td>
			<td><%= rs.getDouble("messchrgs") %></td>
			<td><%= rs.getDouble("commchrgs") %></td>
			<td>&nbsp;&nbsp;<%= rs.getDouble("total") %>&nbsp;&nbsp;</td>
		</tr>					
<%
	p++;
}
%>
</table>
<br>
<center><button value="Print" onclick="window.print(); return false;">Print</button></center>
<br><br>
</body>
</html>