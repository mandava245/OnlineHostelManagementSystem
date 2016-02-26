<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STUDENT DATA ENTERED</title>

<style>
	body{
		background-color: black;
	}
	center{
		font-family: Cambria;
		color: red;
		font-weight: bold;
		font-size: 24px;
	}
	table{
		font-family: Cambria;
		color: yellow;
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
	span{
		font-weight: bold;
		font-size: 20px;
	}
</style>

</head>
<body onkeydown="return (event.keyCode != 116)">
	
	<script type="text/javascript">
	
		document.onmousedown=disableclick;
		status="Right Click Disabled";
		function disableclick(event)
		{
		  if(event.button==2)
		   {
		     alert(status);
		     return false;    
		   }
		}
	</script>
	
	
<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>

<% 
request.setCharacterEncoding("UTF-8");
if(request.getParameter("hidden")!=null){
	String name = request.getParameter("name");
	int year = Integer.parseInt(request.getParameter("year"));
	String branch = request.getParameter("branch");
	String roomno = request.getParameter("roomno");
	String regno = request.getParameter("rollno");
	double notpaid = Double.parseDouble(request.getParameter("notpaid"));
	double paid = Double.parseDouble(request.getParameter("paid"));
	double fine = Double.parseDouble(request.getParameter("fine"));
	String mobile = request.getParameter("mobile");
	String sid= null;
	
	Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
	Connection con = dcon.Connect_DB();
	Statement stmt1 = con.createStatement();
	ResultSet rs = null;
		if(year==1){
			int sidn = 0;
			String query = "SELECT sid1.nextval FROM DUAL";
			rs = stmt1.executeQuery(query);
			if(rs.next()){
				sidn = rs.getInt(1);
			}
			sid="bh"+year+sidn;
		}
		else if(year==2){
			int sidn = 0;
			String query = "SELECT sid2.nextval FROM DUAL";
			rs = stmt1.executeQuery(query);
			if(rs.next()){
				sidn = rs.getInt(1);
			}
			sid="bh"+year+sidn;
		}
		else if(year==3){
			int sidn = 0;
			String query = "SELECT sid3.nextval FROM DUAL";
			rs = stmt1.executeQuery(query);
			if(rs.next()){
				sidn = rs.getInt(1);
			}
			sid="bh"+year+sidn;
		}
		else if(year==4){
			int sidn = 0;
			String query = "SELECT sid4.nextval FROM DUAL";
			rs = stmt1.executeQuery(query);
			if(rs.next()){
				sidn = rs.getInt(1);
			}
			sid="bh"+year+sidn;
		}
		int c=0;
		int t=0;
		Statement stmt = con.createStatement();
		String query1 = "INSERT INTO student VALUES('"+sid+"','"+name+"','"+roomno+"','"+branch+"',"+year+",'"+regno+"','"+mobile+"',"+notpaid+","+paid+","+fine+")";
		c = stmt.executeUpdate(query1);
		Statement stmt2 = con.createStatement();
		String sql1 = "INSERT INTO month VALUES('"+sid+"','gen',0,0,0,0,0,0)";
		t=stmt2.executeUpdate(sql1);
		if(c==1){ 
			
		%>
		<script type="text/javascript">
		alert('Student Data Entered Successfully..!!');
		</script>
		
		
		<center><font color=red>Student Data Entered Successfully</font></center>
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
			<a href="javascript:self.close()">&nbsp;&nbsp;Close Window&nbsp;&nbsp;</a>
			</div>
		<%
		}
		else
		{
			%>
			
				<script type="text/javascript">
				alert('Something is Wrong! Please Re-Enter the Student Data..!!');
				</script>
				
			<%
		}
		con.close();
		dcon.closeConnection();
	}
	else{
		response.sendRedirect("newitementry.jsp");
	}
%>


</body>
</html>