<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="remissionstyle.css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MESS MEMBERS BILL</title>
</head>	
<style>
	center{
		font-family: Cambria;
		color: #0D7486;
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
h2{
	color: red;
	font-family: Comic Sans MS;
	font-weight: bold;
}
</style>

<body>
	<%@ page import="java.sql.*" %>
	<%@ page import="connect.*" %>

	<%
		if(request.getParameter("hidden")!=null)
		{
		
			int totstrngthrem = 0;
			double totamtrem = 0.0;
			double mmtotal = 0.0;
			String table = (String)session.getAttribute("tabname");
			int mmcount = 0;
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			Connection con = dcon.Connect_DB();
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();
			String sql = "SELECT * FROM messmembers";
			String jsql = "SELECT s.sname,s.syear,s.branch,s.roomno,m.percentage FROM student s,messmembers m WHERE s.sid=m.sid";
			String csql = "SELECT count(*) FROM messmembers ";
			ResultSet rs = stmt.executeQuery(csql);
			int mmnos = 0;
			if(rs.next()){
			mmnos = Integer.parseInt(rs.getString(1));
			}
			ResultSet drs = stmt1.executeQuery(sql);
			ResultSet drs1 = stmt1.executeQuery(jsql);
			String sid[] = new String[mmnos];
			int n = 0;
			while(drs.next()){
				sid[n]=drs.getString("sid");
				n++;
			}
			ResultSet rSet = null;
			ResultSet resultSet = null;
			int p = 0;
			double finaltotal = 0.0;
			double dmesschrgs[] = new double[n];
			int cnt = Integer.parseInt(request.getParameter("count"));
		if(cnt!=0)
		{
		
			totstrngthrem = (Integer)session.getAttribute("totstrngthrem");
			totamtrem = (Double)session.getAttribute("totamtrem");
			
		String sql2 = "SELECT sid,messchrgs FROM tempbill WHERE type='rem' AND sid=?";
		PreparedStatement pstmt = con.prepareStatement(sql2);

		for(int i=0;i<mmnos;i++){
			pstmt.setString(1,sid[i]);
			rSet = pstmt.executeQuery();
		}
		
		String dsid[] = new String[mmnos];
		double messchrgs[] = new double[mmnos];
		while(rSet.next()){
			dsid[p] = rSet.getString("sid");
			messchrgs[p] =rSet.getDouble("messchrgs");
			p++;
		}
		
		finaltotal = totamtrem;
		double rembill[] = new double[p];
		
		if(p!=0){
			for(int f=0;f<p;f++){
				rembill[f] = 0.2*messchrgs[f];
				dmesschrgs[f] = messchrgs[f]-rembill[f];
				mmtotal = mmtotal+rembill[f];
			}
			String query = "UPDATE tempbill SET messchrgs=?, type=? WHERE sid in ?";
			PreparedStatement psmt = con.prepareStatement(query);
			int c=0;
			for(int f=0;f<p;f++){
	
				psmt.setDouble(1,dmesschrgs[f]);
				psmt.setString(2,"rmm");
				psmt.setString(3,dsid[f]);
				c=psmt.executeUpdate();
				mmcount = mmcount+c;
			}
			
		}
		
		}
		
		mmnos = mmnos-p;
		String query1 = "SELECT * FROM messmembers WHERE sid in ?";
		PreparedStatement pSt = con.prepareStatement(query1);
		for(int f=0;f<p;f++){
			pSt.setString(1,sid[f]);
			resultSet = pSt.executeQuery();
		}
		double tmpamt = 0.0;
		double remamt = 0.0;
		double finalamt = 0.0;
		double remtotal = 0.0;
		int finalstrength = 0;
		if(cnt==0)
		{
			totamtrem = (Double)session.getAttribute("totamt");
			totstrngthrem = (Integer)session.getAttribute("totstrength");
			
			finaltotal = totamtrem;
		}
		tmpamt = totamtrem/totstrngthrem;
		remamt = tmpamt*0.2;
		finalamt = tmpamt-remamt;
		remtotal = mmnos*remamt;
		mmtotal = mmtotal+remtotal;
		finalstrength = totstrngthrem;
		//
		finaltotal= (Double)session.getAttribute("totamt");
		%>
	<h1 align="center">MESS MEMBERS BILL</h1>
	<table border="1" align="center" cellpadding="5" cellspacing="5">
		<tr align="center">
			<th>Name</th>
			<th>Year</th>
			<th>Branch</th>
			<th>Room No</th>
			<th>Percentage</th>
			<th>Mess Bill</th>
		</tr>		
	<%
		if(p!=0){
		for(int f=0;f<p;f++){
			while(resultSet.next()){	
	%>
			<tr align="center">
				<td><%= resultSet.getString("sname") %></td>
				<td><%= resultSet.getString("syear") %></td>
				<td><%= resultSet.getString("branch") %></td>
				<td><%= resultSet.getString("roomno") %></td>
				<td><%= resultSet.getString("percentage") %></td>
				<td><%= Math.ceil(dmesschrgs[f]) %></td>
			<tr>
	<%	
		}
		}
		}
	%>
		
	<%		
	while(drs1.next()){
	%>		
		<tr align="center">
			<td><%= drs1.getString("sname") %></td>
			<td><%= drs1.getString("syear") %></td>
			<td><%= drs1.getString("branch") %></td>
			<td><%= drs1.getString("roomno") %></td>
			<td><%= drs1.getString("percentage") %>&nbsp;%</td>
			<td><%= Math.ceil(finalamt) %></td>
		</tr>
	<%
	}
			/* 	String days = (String)session.getAttribute("totdays");
				int totdays = Integer.parseInt(days); */
	int totdays = (Integer)session.getAttribute("totdays");
	String mmsql = "UPDATE tempbill SET messchrgs=?,billdays="+totdays+" WHERE type='mm'";
	PreparedStatement pstmt1 = con.prepareStatement(mmsql);
		pstmt1.setDouble(1,finalamt);
		int x = pstmt1.executeUpdate();
		mmcount = mmcount+x;		
	con.close();
	%>
	</table>
	<script>
		alert('Remission given for <%= mmcount %> Mess Members');
	</script>
	
	<%
		session.setAttribute("finaltotal",finaltotal);
		session.setAttribute("finalstrength",finalstrength);
		session.setAttribute("mmtotal",mmtotal);
	%>
	<center>
		<br>
		<form action="finalmb.jsp" method="post">
			<input type="hidden" name="hidden" value="PavanMandava" />
			<h2>Click on the below button to calculate Mess Charges for Remaining Members</h2><br><br>
			<button type="submit">Calculate Mess Charges for Remaining Members</button>
		</form>
	</center>
	
	<%
		}
		else
		{
			response.sendRedirect("remdetails.jsp");		
		}
				
	%>
	
</body>
</html>