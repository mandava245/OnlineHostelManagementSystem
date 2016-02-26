<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="remissionstyle.css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER THE  REMISSION DAYS</title>
</head>
<style>
body{
	align: center;
	float: center;
}
h2{
	font-family: Cambria;
	font-weight: bold;
	color: #B44E10;
}
#matter{
	font-family: Cambria;
	font-weight: bold;
	font-size: 20px;	
}
#matter td{
	text-align: left;
	color: #A92195;
	background-color: #E4FDD9;
}
input{
font-family: Cambria;
	border: 2px solid #D5DFA8;
	border-radius: 5px 5px 5px 5px;
	color: #65682D;
	background-color: #F8E7FA;
	font-size: 16px;
	text-align: center;
	font-weight: bold;
}
input:hover{
	cursor: text;
	border: 2.2px groove #F80E8E;
	border-radius: 5px 5px 5px 5px;
	color: #0D5201;
	background-color: #FFF8E8;
	}
	form button{
		display: inline-block;
		align: center;
	}

</style>
<body>
	<%@ page import="java.sql.*" %>
	<%@ page import="connect.*" %>
	<%
	if(request.getParameter("hidden")!=null){
		
	int count = Integer.parseInt(request.getParameter("count"));
	if(count!=0){
	
	String sid[] = new String[count];
	for(int i=0;i<count;i++){
		sid[i] = request.getParameter("param"+i);
	}
	/* String days = (String)session.getAttribute("totdays");
	int totdays = Integer.parseInt(days); */
	
	int totdays = (Integer)session.getAttribute("totdays");
	
	Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
	Connection con = dcon.Connect_DB();
	String query = "SELECT sname,roomno,branch,syear FROM student WHERE sid in ?";
	PreparedStatement pstmt = con.prepareStatement(query);
	
	ResultSet rs = null;
	%>
	<form action="remconfirm.jsp" method="post">
	<center>
	<h2>Please provide the Number of days for Remission</h2><br>
	</center>
	<table id="matter" align="center" border="1">
	<tr><td>Total Expenditure : </td><td> <%= Math.ceil((Double)session.getAttribute("totamt")) %> </td></tr>
	<tr><td>Total Inmates Strength : </td><td> <%= session.getAttribute("totstrength") %> </td></tr>
	<tr><td>Total No.of Days : </td><td> <%= session.getAttribute("totdays") %> </td></tr>
	</table>
	<br>
	
	<table align="center" border="1" cellpadding="5" cellspacing="1">
	<tr>
		<th>Name</th>
		<th>Room No</th>
		<th>Branch</th>
		<th>Year</th>
		<th>Remission Days</th>
	</tr>
<%
	for(int j=0;j<count;j++){
		
		pstmt.setString(1,sid[j]);
		rs = pstmt.executeQuery();
	
	while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("sname") %></td>
		<td><%= rs.getString("roomno") %></td>
		<td><%= rs.getString("branch") %></td>
		<td><%= rs.getString("syear") %></td>
		<td>
		<input type="number" name="<%= sid[j] %>" size="3" min="1" max="<%= totdays %>" autocomplete="off" autofocus required/>
		<input type="hidden" name="param<%= j %>" value="<%= sid[j] %>">
		<input type="hidden" name="count" value="<%= count %>" />
		</td>
	</tr>
	<%
	}
	}
	
	%>
	</table>
	<br>
	<center>
	<button type="submit">Submit</button>
	</center>
	</form>
	<br>
	<form action="genremission.jsp" method="post" >
	<input type="hidden" name="hidden" value="PavanMandava" />
	<center>
	<button type="submit">Reset</button>
	</center>
	</form>	
	<%
	con.close();
	}
	}
	else{
	response.sendRedirect("genremission.jsp");
	}
	%>
	
</body>
</html>
