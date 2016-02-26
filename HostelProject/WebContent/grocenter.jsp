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
	String vquantity = null;
	String vprice = null;
	String hidden = request.getParameter("hidden");
	if(hidden!=null){
		gid = request.getParameter("gid");
		vquantity = request.getParameter("quantity");
		vprice = request.getParameter("price");
		Date date1 = new Date();
		DateFormat dFormat = new SimpleDateFormat("d-MMM-YYYY");
		String newdate = dFormat.format(date1);
		
		int qquantity = Integer.parseInt(vquantity);
		double qprice = Double.parseDouble(vprice);
		double qtotal = (qquantity*qprice);
		Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String query = "SELECT * FROM groceries WHERE gid='"+gid+"'";
		ResultSet rs = stmt.executeQuery(query);
		
		int fquantity = 0;
		double fprice = 0;
		double ftotal = 0;
		
		int dquantity = 0;
		double dprice = 0;
		double dtotal = 0;
		if(rs.next()){
			dquantity = rs.getInt("quantity");
			dprice = rs.getDouble("price");
			dtotal = rs.getDouble("total");
		}
		if(dprice==0){
			fquantity = qquantity+dquantity;
			fprice = qprice;
			ftotal = (qtotal+dtotal);
		}
		else{
			fquantity = qquantity+dquantity;
			ftotal = (qtotal+dtotal);
			fprice = (ftotal/fquantity);
		}
		
		Statement st = con.createStatement();
		String uquery = "UPDATE groceries SET gdate='"+newdate+"',quantity="+fquantity+",price="+fprice+",total="+ftotal+" WHERE gid='"+gid+"'";
		int c = st.executeUpdate(uquery);
		con.close();
		if(c==1){
		%>
			<script type="text/javascript">
				alert('Stock entered Successfully!');
			</script>
			<center><font color=green><h2>Stock Entered Successfully</h2></font></center>
			<br>
			<center>Please wait.....</center>
		<%
		response.setHeader("refresh","1; enterstock.jsp");
		}
		else
		{
		%>
			<script>
				alert('Stock not entered..!! Please Re-Enter stock...!!!');
			</script>
			<center><font color=red>Please Re-Enter the Stock</font></center>
			
		<%	
		
		RequestDispatcher rd = application.getRequestDispatcher("/enterstock.jsp");
		rd.include(request,response);
		
		}
	}
	else{
		response.sendRedirect("enterstock.jsp");
	}
		%>
</body>
</html>