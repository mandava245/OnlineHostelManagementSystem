<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CONFIRMATION</title>

	<style>
				table{
					font-family: Cambria;
					text-align: center;
					font-size: 24px;
					color: #168580;
				}
				table td{
					text-align: center;
					color: #C10BA6;
				}
				button{
					cursor: pointer;
					color: #F2095A;
					font-family: Comic Sans MS;
					font-size: 22px;
					font-weight: bold;
					border: 1px groove #DDD3DE;
					border-radius: 6px 5px 6px 5px;
					background-color: #EFDCCF;
				}
				button:hover{
					border-radius: 5px 6px 5px 6px;
					color: #02AFBD; 
					font-weight: bold;
					border: 1px groove yellow;
					background-color: #E6CEB7;
				}
				#second{
					 font-family: Cambria;
					font-size: 24px;
					font-weight: bold;
					color: #9A451D;
				}
				#second tr td{
					text-align: left;
				}
				
				form{
					display: inline-block;
				}
				h2{
					font-family: Cambria;
					color: #D00D74;
					font-weight: italic;
				}
	</style>

</head>
<body>
			
	<script>
			function formConfirm(){
				var cnf = confirm('Are you sure you want to Enter the Stock!');
				if(cnf==true){
					return true;
				}
				else{
					return false;
				}
			}
			function formReset(){
				var rst= confirm('Are you sure you want to Reset and Re-Enter the Stock!');
				if(rst==true){
					return true;
				}
				else{
					return false;
				}
			}
	</script>
	
			
			
<%@ page import="connect.*" %>
<%@ page import="java.sql.*" %>
<%
	String gid = null;
	int vquantity = 0;
	double vprice = 0;
	if(request.getParameter("hidden")!=null){
		gid = request.getParameter("miscgroc");
		if(gid!=null){
		
		try
		{	
		
		vprice = Double.parseDouble(request.getParameter("price"));
		double total = (vprice*vquantity);
		Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String query = "SELECT tname,total FROM groceries WHERE gid='"+gid+"'";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
	%>
		<table align="center" border=0 cellpadding=5 cellspacing=5>
			<tr>
				<th>Name</th>
				<th>Total</th>
			</tr>
			<tr>
				<td><%= rs.getString("tname") %></td>
				<td><%= rs.getDouble("total") %></td>
			</tr>
		</table>
		
		<br><br>
		
		<h2 align="center">Verify the New Stock to be Entered...!!!</h2>
		
		<div align="center">
			<form action="miscentry.jsp" method="post">
			<table align="center" id="second" border=0 cellpadding=5 cellspacing=5>
				<tr><td>New Price : </td><td> <%= vprice %></td></tr>
			</table><br>
				<input type="hidden" name="hidden" value="hidden" />
				<input type="hidden" name="gid" value="<%= gid %>" />
				<input type="hidden" name="price" value="<%= vprice %>" />
				<button type="submit" onclick="return formConfirm()">Confirm</button>
			</form>
			<form action="enterstock.jsp" method="post">
				<input type="hidden" name="hidden" value="PavanMandava" />
				<button type="submit" onclick="return formReset()">Reset</button>
			</form>
			</div>
	<%
		}
		
		catch(NumberFormatException e){
			
			%>
				<script>
					alert('Please Enter a valid Price !');
				</script>
				
			<%
			
			RequestDispatcher rd1 = application.getRequestDispatcher("/enterstock.jsp");
			rd1.include(request,response);
			
		}	
		}
		
		else
		{
			%>
				<script>
					alert('Please Select the Stock Item and then try to Enter Stock');
				</script>
			<%
			
			RequestDispatcher rd = application.getRequestDispatcher("/enterstock.jsp");
			rd.include(request,response);
			
		}
	}
	else
	{
		response.sendRedirect("enterstock.jsp");
	}

%>

</body>
</html>