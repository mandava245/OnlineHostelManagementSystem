<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STOCK ENTERED</title>

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
		font-size: 24px;
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
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="connect.*" %>

<% 
request.setCharacterEncoding("UTF-8");
if(request.getParameter("hidden")!=null){

	String cgid = request.getParameter("type");
	String tname = request.getParameter("tname");
	String name = request.getParameter("name");
	double vprice = Double.parseDouble(request.getParameter("price"));
	DateFormat dFormat = new SimpleDateFormat("d-MMM-yy");
	Date date1 = new Date();
	String newdate = dFormat.format(date1); 
	Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
	Connection con = dcon.Connect_DB();
	Statement stmt1 = con.createStatement();
	String qury = "SELECT gid.nextval from dual";
	ResultSet rs = stmt1.executeQuery(qury);
	int gidn = 0;
	if(rs.next()){
			gidn = rs.getInt(1);
	}
	String gid = "groc"+gidn;
	Statement stmt = con.createStatement();
	Statement st = con.createStatement();
	int c=0;
	int t=0;
	int vquantity=0;
	double total = 0.0;
	if(request.getParameter("quantity")!=null){
		
		vquantity = Integer.parseInt(request.getParameter("quantity"));
		total = vprice*vquantity;
		String query = "INSERT INTO groceries VALUES('"+gid+"','"+cgid+"','"+tname+"','"+name+"','"+newdate+"',"+vquantity+","+vprice+","+total+")";
		c=stmt.executeUpdate(query);
		String sql1 = "INSERT INTO tempgroceries VALUES('"+gid+"','"+cgid+"',0,0,0)";
		t=st.executeUpdate(sql1);
		con.close();
		dcon.closeConnection();
	}
	else
	{
		total = vprice;
		String sql = "INSERT INTO groceries(gid,cgid,tname,name,gdate,total) VALUES('"+gid+"','"+cgid+"','"+tname+"','"+name+"','"+newdate+"',"+total+")";
		c=stmt.executeUpdate(sql);
		String qy = "INSERT INTO tempgroceries(gid,cgid,total) VALUES('"+gid+"','"+cgid+"',0)";
		t = st.executeUpdate(qy);
		con.close();
		dcon.closeConnection();
	}
	if(c==1 && t==1)
	{
		%>
		<script type="text/javascript">
		alert('Stock Entered Successfully..!!');
		</script>
		
		
		<center><font color=red>Stock Entered Successfully</font></center>
			<br>
			<table align="center" border=0 cellpadding=3 cellspacing=3>
			
				<tr><td>Stock Name</td><td>&nbsp;&nbsp;<span><%= tname %></span></td></tr>
				<tr><td>Stock ID</td><td><%= gid %></td></tr>
				<tr><td>Date</td><td><%= newdate %></td></tr>
				<tr><td>Quantity</td><td><%= vquantity %></td></tr>
				<tr><td>Price</td><td><%= vprice %></td></tr>
				<tr><td>Total</td><td><%= total %></td></tr>
			
			</table>
			<br>
			<div align="center">
			<a href="javascript:self.close()">&nbsp;&nbsp;Close Window&nbsp;&nbsp;</a>
			</div>
			
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert('Something is Wrong! Please Re-Enter the Stock..!!');
		</script>
		<%@ include file="newenter.jsp" %>
		<%
	}
	%>
	
	<%
}
else{
		response.sendRedirect("newstockitem.jsp");
	}
	%>
</body>
</html>