<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FULL DETAILS</title>

<style>

	#maind{
		font-family: Cambria;
		font-size: 20px;
		border-radius: 5px;
		text-align: center;
	}
	#maind th{
		color: #7B2449;
		border-radius: 5px;
		background-color: #DFF2F2;
	}
	#maind td{
		color: #6B503A;
		border-radius: 5px;
		background-color: #F2F9DD;
	}
	center h2{
		font-family: Cambria;
		font-weight: bold;
		color: #7E4F1F;
	}
	#details{
		font-family: Andalus;
		font-size: 22px;
	}
	#details th{
		color: #9F2B4E;
		text-align: center;
		font-size: 24px;
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
					color: #6AA529;
				}
</style>

</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>
<%			
		String sid = request.getParameter("sid");
		String fltr = request.getParameter("filter");
		if(sid!=null){
		
		Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
		Connection con = dcon.Connect_DB();
		
		Statement stmt = con.createStatement();
		String squery = "SELECT * FROM student WHERE sid = '"+sid+"'";
		
		ResultSet rst = stmt.executeQuery(squery);
		%>
		
			<center><h2>DETAILS OF THE STUDENT</h2></center>
			<br>
			<table id="maind" align="center" border=1 cellpadding=4 cellspacing=4>
				<tr>
					<th>Sid</th>
					<th>Name</th>
					<th>Room No</th>
					<th>Year</th>
					<th>Branch</th>
					<th>Already Paid</th>
					<th>Not Paid</th>
					<th>Fine</th>
					<th>Total</th>
				</tr>
				<%
					while(rst.next()){	
						%>
						<tr>
							<td><%= rst.getString("sid") %></td>
							<td><%= rst.getString("sname") %></td>
							<td><%= rst.getString("roomno") %></td>
							<td><%= rst.getString("syear") %></td>
							<td><%= rst.getString("branch") %></td>
							<td><%= rst.getDouble("paid") %></td>
							<td><%= rst.getDouble("notpaid") %></td>
							<td><%= rst.getDouble("fine") %></td>
							<td><%= (rst.getDouble("notpaid")+rst.getDouble("fine")) %></td>
						</tr>
						<%
					}
				%>
			</table>
		<%
		
		Statement st1 = con.createStatement();
		String sql = "SELECT month,mbname FROM messbills";
		ResultSet rSet = st1.executeQuery(sql);
		%>
		<br>
	
		<form action="fulldetails.jsp" method="post">
		<div align="center">
			<span>Select Type : </span>
					<select name="filter" id="filter" onChange="this.form.submit()">
						<% if(fltr==null || fltr.equals("all")){ %>
							<option value="all" selected >All</option>
							<option value="Paid">Paid</option>
							<option value="Not Paid">Not Paid</option>
							<% }
								 else if(fltr.equals("Paid")){ %>
							<option value="all" >All</option>
							<option value="Paid" selected>Paid</option>
							<option value="Not Paid">Not Paid</option>
							<% } 
								else if(fltr.equals("Not Paid")){ %>
							<option value="all" >All</option>
							<option value="Paid">Paid</option>
							<option value="Not Paid" selected>Not Paid</option>
							<% }  %>
					</select>
				<input type="hidden" name="sid" value="<%= sid %>" />
			</div>
			<br>
			<table id="details" align="center" border=0 cellpadding=8 cellspacing=0>
			<tr>
				<th width="180">MONTH</th>
				<th width="100">Amt Paid</th>
				<th width="100">Not Paid</th>
				<th width="80">Fine</th>
				<th width="90">Total</th>
				<th width="100">Status</th>
				<th width="100">Paid Date</th>
			</tr>
				<%
				String tt = null;
				while(rSet.next()){
					
					tt = rSet.getString("mbname");
					String query = null;
					if(fltr==null || fltr.equals("all"))
					{
						query = "SELECT total,fine,amtpaid,status,to_char(pdate,'DD-MON-YY') pdate FROM \""+tt+"\" WHERE sid IN ?";
					}
					else{
						query = "SELECT total,fine,amtpaid,status,to_char(pdate,'DD-MON-YY') pdate FROM \""+tt+"\" WHERE sid IN ? AND status='"+fltr+"' ";
					}
					PreparedStatement pst = con.prepareStatement(query);
					pst.setString(1, sid);
					ResultSet rs = pst.executeQuery();
										
					while(rs.next()){
						%>
						<tr align="center"> 
							<td><%= rSet.getString("month") %></td>
							<td><%= rs.getDouble("amtpaid") %></td>
							<td><%= rs.getDouble("total") %></td>
							<td><%= rs.getDouble("fine") %></td>
							<td><%= (rs.getDouble("total")+rs.getDouble("fine")) %></td>
							<td><%= rs.getString("status")  %></td>
							<td><%= rs.getString("pdate")  %></td>
						</tr>
						<%
					}
				}
				
				%>
			</table>
			</form>
		<%
		}
		else
		{
			response.sendRedirect("showdetails.jsp");
		}
		%>		

</body>
</html>