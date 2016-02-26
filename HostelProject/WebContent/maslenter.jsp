<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>STOCK ENTERED</title>
</head>
<body>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="connect.*" %>
<%@ page import="java.sql.*" %>
	<%
	String gid = null;
	String vtotal = null;
	String hidden = request.getParameter("hidden");
	if(hidden!=null){
		gid = request.getParameter("miscgroc");
		vtotal = request.getParameter("price");
		Date date1 = new Date();
		DateFormat dFormat = new SimpleDateFormat("d-MMM-YYYY");
		String newdate = dFormat.format(date1);
		
		double qtotal = Double.parseDouble(vtotal);
		Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String query = "SELECT * FROM groceries WHERE gid='"+gid+"'";
		ResultSet rs = stmt.executeQuery(query);
		
		int fquantity = 0;
		double ftotal = 0;
		
		int dquantity = 0;
		double dtotal = 0;
		if(rs.next()){
			dquantity = rs.getInt("quantity");
			dtotal = rs.getDouble("total");
		}
		if(dtotal==0){
			ftotal = qtotal;
		}
		else{
			ftotal = (qtotal+dtotal);
		}
		
		Statement st = con.createStatement();
		String uquery = "UPDATE groceries SET gdate='"+newdate+"',total="+ftotal+" WHERE gid='"+gid+"'";
		int c = st.executeUpdate(uquery);
		con.close();
		if(c==1){
		%>
		<center><h2><font size="5" color=green>Stock was Entered Successfully</font></h2><br>
		<a href="list.html">Go Back</a></center>
		<%
		}
		else{
		%>
		<center style="color:red" ><h1>Stock not Entered<br /><a href="list.html"><b>Click here</b></a> to go back and Re-Enter the Stock</h1></center>
		<%	
		}
	}
	else{
		response.sendRedirect("enterstock.jsp");
	}
		
		%>
</body>
</html>