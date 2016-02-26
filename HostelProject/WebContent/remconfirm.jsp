<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="remissionstyle.css" media="screen"/>
<title>CONFIRMATION</title>
</head>
<style>
h2{
	font-family: Cambria;
	font-weight: bold;
	color: #A47848;
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

	a{
		text-decoration: none;
		font-family: Cambria;
		font-size: 18px;
		font-weight: bold;
	}
	a:hover{
		font-family: Cambria;
		font-size: 18px;
		color: #421B8B;
	}
	a:active{
		color:red;
	}
	#or{
		font-size: 22px;
		font-weight: bold;
		color: red;
	}
	#anchor{
		font-family: Cambria;
		font-size: 18px;
		color: #987B45;
	}
</style>
<body>

<script type="text/javascript">
	function formConfirm(){
		var cnf = confirm('Are you sure you want to give Remission to Mess Members ?  Please Make sure that you have Correct list of Mess Members..');
		if(cnf==true){
			return true;
		}
		else{
			return true;
		}
	}
</script>


<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>
<%
int cnt = 0;
if(request.getParameter("count")!=null){
		int count = Integer.parseInt(request.getParameter("count"));
		String sid[] = new String[count];
		int remdays[] = new int[count];
		for(int i=0;i<count;i++){
			sid[i] = request.getParameter("param"+i);
			remdays[i] = Integer.parseInt(request.getParameter(sid[i]));
		}
		double totalamt = (Double)session.getAttribute("totamt");
		int totstrength = (Integer)session.getAttribute("totstrength");
		String table = (String)session.getAttribute("tabname");
		/* 
		String days = (String)session.getAttribute("totdays");
		int totdays = Integer.parseInt(days); 
		*/
		int totdays = (Integer)session.getAttribute("totdays");
		double totremamt = 0.0;
		double phtot = totalamt/totstrength;
		double pdbill = phtot/totdays;
		double redbill[] = new double[count];
		double splbill[] = new double[count];
		for(int j=0;j<count;j++){
			redbill[j] = pdbill*remdays[j];
			splbill[j] = phtot-redbill[j];
			totremamt = totremamt+splbill[j];
		}
		double totamtafterrem = totalamt-totremamt;
		session.setAttribute("totstrngthrem",totstrength-count);
		session.setAttribute("totamtrem",totamtafterrem);
	%>
	<table id="matter" align="center" border="1">
	<tr>
		<td>Total Expenditure : </td>
		<td> <%= Math.ceil((Double)session.getAttribute("totamt")) %> </td>
	</tr>
	<tr>
		<td>Total Inmates Strength : </td>
		<td> <%= session.getAttribute("totstrength") %> </td>
	</tr>
	<tr>
		<td>Total No.of Days : </td>
		<td> <%= session.getAttribute("totdays") %> </td>
	</tr>
	<tr>
		<td>No.of Remission Students : </td>
		<td><%= count %></td>
	</tr>
	<tr>
		<td>Total Remission Amount : </td>
		<td><%= Math.ceil(totremamt) %></td>
	</tr>
	<tr>
		<td>Total Amount after giving Remission : </td>
		<td><%= Math.ceil(totamtafterrem) %></td>
	</tr>
	</table>
	<br>
		
	<%
		Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
		Connection con = dcon.Connect_DB();
		String query = "SELECT sname,roomno,branch,syear FROM student WHERE sid in ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		
		ResultSet rs = null;
	%>
		<center><h2>Details after giving Remission:</h2></center>
		<table align="center" border="1" cellpadding="5" cellspacing="1">
		<tr>
			<th>Name</th>
			<th>Room No</th>
			<th>Branch</th>
			<th>Year</th>
			<th>Remission Days</th>
			<th>Final Bill</th>
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
			<td><b><%= remdays[j] %></b></td>
			<td><%= Math.ceil(splbill[j]) %></td>
		</tr>
		
<%
	}
	}
%>
	</table>
<%
		String sql = "UPDATE tempbill SET totdays=?,remdays=?,billdays=?,messchrgs=?,type='rem' WHERE sid=?";
		PreparedStatement pstmt1 = con.prepareStatement(sql);
		int c = 0,p;
		for(int k=0;k<count;k++){
			pstmt1.setInt(1,totdays);
			pstmt1.setInt(2,remdays[k]);
			pstmt1.setInt(3,totdays-remdays[k]);
			pstmt1.setDouble(4,splbill[k]);
			pstmt1.setString(5,sid[k]);
			p=pstmt1.executeUpdate();
			c = c+p;
		}
		cnt=c;
	%>
		<script>
			alert("Remission given for <%= c %> members");
		</script>			 		
	<%
		con.close();
		}
		else{
		response.sendRedirect("genremission.jsp");
		}
	%>
	<form action="remission.jsp" method="post">
		<br>
		<center id="anchor"><a href="mmdetails.jsp" target="_blank">Click here&nbsp;</a> to ADD,MODIFY,DELETE the Mess Members</center><br>
		<div align="center" id="or">OR</div><br>
		<input type="hidden" name="hidden" value="PavanMandava" />
		<input type="hidden" name="count" value="<%= cnt %>" />
		<center><button type="submit" onclick="return formConfirm()">Give Remission to Mess Members</button></center>
	</form>
</body>
</html>