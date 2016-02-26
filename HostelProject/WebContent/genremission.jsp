<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER COUNT</title>
</head>

<style>
#text{
	font-family: Cambria;
	font-size: 24px;
}
button{
	color: #F2095A;
	font-family: Cambria;
	font-size: 28px;
	font-weight: bold;
	border: 2px solid #DDD3DE;
	border-radius: 5px 5px 5px 5px;
	background-color: #EFDCCF;
}
button:hover{
	border-radius: 5px 5px 5px 5px;
	cursor: pointer;
	font-family: Cambria;
	font-size: 28px;
	color: #02AFBD; 
	font-weight: bold;
	border: 2.5px groove #DDD3DE;
	background-color: #E6CEB7;
}
input{
	
	border: 2px solid #D5DFA8;
	border-radius: 7px 7px 7px 7px;
	color: #65682D;
	background-color: #F4FAFF;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	font-family: Andalus;
}
input:hover{
	cursor: text;
	border: 2px groove #F80E8E;
	border-radius: 7px 7px 7px 7px;
	color: #0D5201;
	background-color: #FFF8E8;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
}

		#tableid{
			font-family: Cambria;
			border-radius: 5px;
			border: 2px groove #DAB521;
			font-weight: bold;
			font-size: 20px;	
		}
		#tableid td{
			border-radius: 5px;
			border: 2px groove #D855EA;
			text-align: left;
			color: #A92195;
			background-color: #E4FDD9;
		}

center h2{
	font-family: Cambria;
	color: red;
	font-weight: bold;
}

</style>
<body>

	<%
		if(request.getParameter("hidden")!=null)
		{
			int total = (Integer)session.getAttribute("totstrength");
			double amount = (Double)session.getAttribute("totamt");
	%>
		<br>
		<table align="center" id="tableid" border=0 cellpadding=5 cellspacing=5>
			<tr>
				<td>Total Expenditure towards Groceries</td>
				<td><%= Math.ceil(amount) %></td>
			</tr>
			<tr>
				<td>Total Strength of Inmates</td>
				<td><%= total %></td>
			</tr>
			
		</table>
		<br><br>
	<form action="remdetails.jsp" method="post">
	<center><h2>Please Enter the Total No.of Students for Remission</h2></center>
	<div id="text" align="center">Enter Count: &nbsp;<input type="number" name="count" min="1" max="100" autofocus required />
	<input type="hidden" name="hidden" value="PavanMandava" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit">Enter</button></div><br><br>
	</form>
	<form action="remission.jsp" method="post" >
	<center>
		<h2 align="center">If nobody is eligible for Remission then<br> Click on the below button <br>to calculate Remission for Mess Members directly</h2><br>
		<input type="hidden" name="hidden" value="PavanMandava" />
		<input type="hidden" name="count" value=0 /><br>
		<button type="submit">No Remission</button>
	</center>
	</form>
			
		<script type="text/javascript">
			alert('If Remission Students are there then give Count, Otherwise Click on \"No Remission\" Button to give Remission to Mess Members!')
		</script>
			
	<%
	
		}
		else
		{
			response.sendRedirect("billcalc.jsp");
		}
	%>
	
</body>
</html>