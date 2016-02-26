<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONFIRMATION</title>
</head>

	<style>
		center{
			font-family: Cambria;
			color: #0D7486;
		}
		#details{
			font-family: Cambria;
			border-radius: 5px;
			border: 2px groove #DAB521;
			font-weight: bold;
			font-size: 20px;	
		}
		#details td{
			border-radius: 5px;
			border: 2px groove #D855EA;
			text-align: left;
			border-radius: 5px;
			color: #A92195;
			background-color: #E4FDD9;
		}
		
		#cc{
			font-family: Cambria;
			font-weight: bold;
			font-size: 18px;
			color: #A6724A;	
		}
		input{
			font-size: 20px;
			text-align: center;
			font-weight: bold;
			font-family: Andalus;
			color: #AD253D;
			background-color: #FEFFEC;
			border: 2px groove #D27BD2;
			border-radius: 5px;
		}
		input:hover{
			background-color: #FFFFFF;
			border: 2.5px groove #EFF484;
		}
		button{
			color: #F2095A;
			font-family: Cambria;
			font-size: 24px;
			font-weight: bold;
			border: 4px solid #DDD3DE;
			border-radius: 6px 5px 6px 5px;
			background-color: #EFDCCF;
		}
		button:hover{
			border-radius: 5px 6px 5px 6px;
			cursor: pointer;
			color: #02AFBD; 
			font-weight: bold;
			border: 5px groove #DDD3DE;
			background-color: #E6CEB7;
		}
	</style>

<body>

	<%@ page import="java.sql.*" %>
	<%@ page import="connect.*" %>

	<%
	if(request.getParameter("hidden")!=null)
	{
		double finaltotal = (Double)session.getAttribute("finaltotal");
		int finalstrength = (Integer)session.getAttribute("finalstrength");
		String table = (String)session.getAttribute("tabname");
		/* String days = (String)session.getAttribute("totdays");
		int totdays = Integer.parseInt(days); */
		
		int totdays = (Integer)session.getAttribute("totdays");
		double indvtotal = finaltotal/finalstrength;
		
		Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String query = "UPDATE tempbill SET messchrgs="+indvtotal+", totdays="+totdays+",billdays="+totdays+" WHERE type='gen'";
		int c = stmt.executeUpdate(query);
		
		double mmt = (Double)session.getAttribute("mmtotal");
		
	%>
	<center><h2>Mess Bill Details: </h2></center>
	<table id="details" align="center" border="1">
		<tr>
			<td>Mess Bill per head : &nbsp;</td>
			<td>&nbsp;<%= Math.ceil(indvtotal) %></td>
		</tr>
		<tr>
			<td>Total Bill Days : </td>
			<td>&nbsp;<%= totdays %></td>
		</tr> 
		<tr>
			<td>Total Strength : </td>
			<td>&nbsp;<%= session.getAttribute("totstrength") %></td>
		</tr>
		<tr>
			<td>Mess Members Total : </td>
			<td>&nbsp;<%= Math.ceil(mmt) %></td>
		</tr>
	</table>
	
	<script type="text/javascript">
		alert("Remaining Bill distrbuted for  Students");
	</script>
	
	<br>
	
	<%
		
		Statement st = con.createStatement();
		String sqlq = "SELECT * FROM ccharges";
		ResultSet rs = st.executeQuery(sqlq);
	%>
	
	<center><h2>Enter Expenditure Details (Divided Equally)</h2></center>
	<form action="ccconfirm.jsp" method="post">
	<table id="cc" align="center">
	
	<% while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("cname") %></td>
				<td><input type="text" name="<%= rs.getString("ccid") %>" size="5" pattern="\d+(\.\d{2})?" required/></td>
			</tr>
		<%	
	}
	%>
		<tr>
			<td><input type="hidden" name="hidden" value="PavanMandava" /></td>
			<td align="center"><button type="submit">&nbsp;&nbsp;Submit&nbsp;&nbsp;</button></td>
		</tr>
	</table>
	</form>
	<%
	}
	else
	{
		response.sendRedirect("remission.jsp");
	}
	%>
	
</body>
</html>