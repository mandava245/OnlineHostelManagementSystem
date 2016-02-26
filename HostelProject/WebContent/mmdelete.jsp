<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DELETE MESS MEMBERS</title>

<style>
table {
	text-align: center;
	border: 2px groove #EF9ADA;
	border-radius: 5px;
}

label {
	cursor: pointer;
}

#row:hover {
	cursor: pointer;
	background-color: #FCFAB1;
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
	font-family: Cambria;
	font-weight: bold;
	font-size: 22px;
	border-radius: 5px;
	border: 2px groove yellow;
	background-color: black;
	color: yellow;
}

button:hover {
	cursor: pointer;
	border: 2px groove green;
	background-color: #613F29;
	color: #FFFF84;
}
center h2{
	font-family: Cambria;
	font-weight: bold;
	color: #497542;
}
</style>

</head>
<body>

	<script>
		function formConfirm() {
			var cnf = confirm('Are you sure you want to delete the Selected Mess Members ?');
			if (cnf == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>

	<%@ page import="java.sql.*"%>
	<%@ page import="connect.*"%>

	<%
		Connect dcon = ConnectFactory.getConnToDB("Oracle");
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String sql = "SELECT s.sid,s.sname,s.roomno,s.branch,s.regno,s.syear,m.percentage FROM student s,messmembers m WHERE s.sid=m.sid";
		ResultSet rs = stmt.executeQuery(sql);
	%>
	<center>
		<h2>Select the Mess Members to Delete</h2>
	</center>
	<form action="mmdelcnf.jsp" method="post">
		<table align="center" border=1>
			<tr>
				<th>Select</th>
				<th>SID</th>
				<th>Room No</th>
				<th>Student Name</th>
				<th>Branch</th>
				<th>Regd No</th>
				<th>Year</th>
				<th>Percentage</th>
			</tr>

			<%
				String sid = null;
				while (rs.next()) {
					sid = rs.getString("sid");
			%>

			<tr id="row">
				<td><input id="<%=sid%>" type="checkbox" name="<%=sid%>"
					value="<%=sid%>" /></td>

				<td><label for="<%=sid%>"><%=rs.getString("sid")%></label></td>
				<td><label for="<%=sid%>"><%=rs.getString("roomno")%></label></td>
				<td align="left"><label for="<%=sid%>"><%=rs.getString("sname")%></label></td>
				<td><label for="<%=sid%>"><%=rs.getString("branch")%></label></td>
				<td><label for="<%=sid%>"><%=rs.getString("regno")%></label></td>
				<td><label for="<%=sid%>"><%=rs.getString("syear")%></label></td>
				<td><label for="<%=sid%>"><%=rs.getDouble("percentage")%>%</label></td>

			</tr>

			<%
				}
				con.close();
				dcon.closeConnection();
			%>
		</table>
		<br>
		<center>
			<button type="submit" onclick="return formConfirm()">Delete</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="reset">Reset</button>
		</center>
	</form>


</body>
</html>