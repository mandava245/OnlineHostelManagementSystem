<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STUDENT LIST</title>
</head>

<style>

table {
	text-align: center;
	border: 2px groove #EF9ADA;
	border-radius: 5px;
}

table td {
	border: 1px groove;
	border-radius: 5px;
	color: #253D1F;
	background-color: #FBFBFB;
}

table th {
	color: #824E48;
	background-color: #FFFFB9;
	border: 1px groove #D6B649;
	border-radius: 5px;
	font-size: 24px;
}

button {
	border: 1px groove #3EB9D2;
	border-radius: 5px;
	color: #E1F11F;
	background-color: black;
	font-weight: bold;
	font-size: 24px;
	font-family: Cambria;
}

button:hover {
	cursor: pointer;
	border: 2px groove yellow;
}
				
				select{
					text-align: center;
					border-radius: 6px;
					border: 2px solid #D5DFA8;
					color: #65682D;
					background-color: #F4FAFF;
					font-size: 24px;
				}
				select option{
					border-radius: 6px;
					border: 2px thin #FF6;
					text-align: center;
					text-height: 30px;
					font-size: 24px;
					width: auto;
				}
				select:hover{
					cursor: pointer;
					border: 2px groove yellow;
					border-radius: 6px;
					color: #0D5201;
					background-color: #FFF8E8;
					text-align: center;
				}
				span{
					font-family: Cambria;
					font-size: 20px;
					font-weight: bold;
					color: #873A52;
				}
				center h1{
					font-family: Cambria;
					font-weight: bold;
					
				}
</style>

<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="connect.*"%>
	<%
	String year,branch = null;
	year= request.getParameter("year");
	branch = request.getParameter("branch");
	
	%>
	<div id="year" align="center">
	
		<center><h1>Students List</h1></center><br>
	
	<form action="studentlist.jsp" method="post">
	<span>Select Year :</span>&nbsp;
		<select name="year" id="year" onchange="this.form.submit()">
		
		<%
				if(year==null || year.equals("all")){
				%>
				
					<option value="all" selected>--All--</option>
					<option value="1">I/IV</option>
					<option value="2">II/IV</option>
					<option value="3">III/IV</option>
					<option value="4">IV/IV</option>
					
				<%
					}
				else if(year.equals("1")){
					%>
					
					<option value="all">--All--</option>
					<option value="1" selected>I/IV</option>
					<option value="2">II/IV</option>
					<option value="3">III/IV</option>
					<option value="4">IV/IV</option>
					
					<%
				}
				else if(year.equals("2")){
					%>
					
					<option value="all">--All--</option>
					<option value="1">I/IV</option>
					<option value="2" selected>II/IV</option>
					<option value="3">III/IV</option>
					<option value="4">IV/IV</option>
					
					<%
				}
				else if(year.equals("3")){
					%>
					
					<option value="all">--All--</option>
					<option value="1">I/IV</option>
					<option value="2">II/IV</option>
					<option value="3" selected>III/IV</option>
					<option value="4">IV/IV</option>
					
					<%
				}
				else if(year.equals("4")){
					%>
					
					<option value="all">--All--</option>
					<option value="1">I/IV</option>
					<option value="2">II/IV</option>
					<option value="3">III/IV</option>
					<option value="4" selected>IV/IV</option>
					
					<%
				}
		%>
			
		</select>
		&nbsp;&nbsp;&nbsp;<span>Select Branch :</span>&nbsp;
				<select name="branch" id="branch" onchange="this.form.submit()">
				
						<%
											if(branch==null || branch.equals("all")){
												%>
												<option value="all" selected>--All--</option>
												<option value="CSE">CSE</option>
												<option value="ECE">ECE</option>
												<option value="Mech">Mech</option>
												<option value="IT">IT</option>
												<option value="Civil">Civil</option>
												<option value="EEE">EEE</option>
												<option value="EIE">EIE</option>
												<%
											}
											else if(branch.equals("CSE")){
												%>
												<option value="all">--All--</option>
												<option value="CSE" selected>CSE</option>
												<option value="ECE">ECE</option>
												<option value="Mech">Mech</option>
												<option value="IT">IT</option>
												<option value="Civil">Civil</option>
												<option value="EEE">EEE</option>
												<option value="EIE">EIE</option>
												<%
											}
											else if(branch.equals("ECE")){
												%>
												<option value="all">--All--</option>
												<option value="CSE">CSE</option>
												<option value="ECE" selected>ECE</option>
												<option value="Mech">Mech</option>
												<option value="IT">IT</option>
												<option value="Civil">Civil</option>
												<option value="EEE">EEE</option>
												<option value="EIE">EIE</option>
												<%
											}
											else if(branch.equals("Mech")){
												%>
												<option value="all">--All--</option>
												<option value="CSE">CSE</option>
												<option value="ECE">ECE</option>
												<option value="Mech" selected>Mech</option>
												<option value="IT">IT</option>
												<option value="Civil">Civil</option>
												<option value="EEE">EEE</option>
												<option value="EIE">EIE</option>
												<%
											}
											else if(branch.equals("IT")){
												%>
												<option value="all">--All--</option>
												<option value="CSE">CSE</option>
												<option value="ECE">ECE</option>
												<option value="Mech">Mech</option>
												<option value="IT" selected>IT</option>
												<option value="Civil">Civil</option>
												<option value="EEE">EEE</option>
												<option value="EIE">EIE</option>
												<%
											}
											else if(branch.equals("Civil")){
												%>
												<option value="all">--All--</option>
												<option value="CSE">CSE</option>
												<option value="ECE">ECE</option>
												<option value="Mech">Mech</option>
												<option value="IT">IT</option>
												<option value="Civil" selected>Civil</option>
												<option value="EEE">EEE</option>
												<option value="EIE">EIE</option>
												<%
											}
											else if(branch.equals("EEE")){
												%>
												<option value="all">--All--</option>
												<option value="CSE">CSE</option>
												<option value="ECE">ECE</option>
												<option value="Mech">Mech</option>
												<option value="IT">IT</option>
												<option value="Civil">Civil</option>
												<option value="EEE" selected>EEE</option>
												<option value="EIE">EIE</option>
												<%
											}
											else if(branch.equals("EIE")){
												%>
												<option value="all">--All--</option>
												<option value="CSE">CSE</option>
												<option value="ECE">ECE</option>
												<option value="Mech">Mech</option>
												<option value="IT">IT</option>
												<option value="Civil">Civil</option>
												<option value="EEE">EEE</option>
												<option value="EIE" selected>EIE</option>
												<%
											}
										%>
					
						
				</select>

	</form>
	</div><br>
	<%
		Connect dcon = ConnectFactory.getConnToDB("Oracle");
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String sql = null;
		if(year==null || year.equals("all"))
		{
			if(branch==null || branch.equals("all")){
			sql = "SELECT * FROM student ORDER BY syear ASC";
			}
			else
			{
				sql = "SELECT * FROM student WHERE branch='"+branch+"' ORDER BY syear ASC";
			}
		}
		else if(branch==null || branch.equals("all")){
			sql = "SELECT * FROM student WHERE syear="+year+"";
		}
		else if(year.equals("1") || year.equals("2") || year.equals("3") || year.equals("4"))
		{
			sql="SELECT * FROM student WHERE syear="+year+" and branch='"+branch+"' ORDER BY roomno ASC";
		}
		
		ResultSet rs = stmt.executeQuery(sql);
	%>
	<table align="center" border=1>
		<tr>
			<th width=60px>SNo</th>
			<th width=90px>SID</th>
			<th width=100px>Room No</th>
			<th width=200px>Student Name</th>
			<th width=100px>Branch</th>
			<th width=50px>Year</th>
			<th width=100px>Paid</th>
			<th width=95px>Not Paid</th>
			<th width=80px>Fine</th>
		</tr>

		<%
			int i = 1;
			while (rs.next()) {
		%>
		<tr>
			<td><%=i%></td>
			<td><%=rs.getString("sid")%></td>
			<td><%=rs.getString("roomno")%></td>
			<td align="left"><%=rs.getString("sname")%></td>
			<td><%=rs.getString("branch")%></td>
			<td><%=rs.getString("syear")%></td>
			<td><%=rs.getDouble("paid")%></td>
			<td><%=rs.getDouble("notpaid")%></td>
			<td><%=rs.getDouble("fine")%></td>
		</tr>
		<%
			i++;
			}
			con.close();
			dcon.closeConnection();
		%>

	</table>
	<br>
	<div id="print" align="center">
		<button type="submit" onclick="return window.print(); return false;">&nbsp;&nbsp;Print&nbsp;&nbsp;</button>
	</div>
</body>
</html>