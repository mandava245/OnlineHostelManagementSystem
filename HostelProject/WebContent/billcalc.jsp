<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>PRICE OF USED STOCK</title>
<style>
#header{
	font-family: Cambria;
	background-color: #FDF7FD;
	font-weight: bold;
	color: #784432;
	text-decoration: underline;
}
table{
	width: auto;
	border: 2px groove orange;
	border-radius: 6px;
	text-align: center;
}
th{
	font-size: 28px;
	font-weight: bold;
	border-radius: 6px;
	border: 1px groove #B76528;
	font-weight: bold;
	color: #4A3977;
	background-color: #FDE8FB;
}
td{
	border-radius: 5px;
	border: 1px groove #0AB824;
	color: #D21A1A;
	background-color: #EBF3F2;
}
label{
	font-size: 24px;
}
h3{
	font-family: Cambria;
}
#amount{
	font-weight: bold;
	font-size: 28px;
	color: #30687A;
}
button{
	color: #F2095A;
	font-family: Cambria;
	font-size: 24px;
	font-weight: bold;
	border: 2px solid #DDD3DE;
	border-radius: 7px 5px 7px 5px;
	background-color: #EFDCCF;
}
button:hover{
	border-radius: 5px 7px 5px 7px;
	cursor: pointer;
	font-family: Cambria;
	font-size: 24px;
	color: #02AFBD; 
	font-weight: bold;
	border: 2.5px groove #DDD3DE;
	background-color: #E6CEB7;
}
		
		
		
		
	h3{
		font-family: Cambria;
		color: #5C2E47;
	}
	h3 b{
		color: #766138;
	}
</style>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>
<%
	if(request.getParameter("hidden")!=null)
	{
	int count = Integer.parseInt(request.getParameter("count"));
	int dcnt = Integer.parseInt(request.getParameter("dcnt"));
	Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
	Connection con = dcon.Connect_DB();
	Statement stmt = con.createStatement();
	String sql = "SELECT gid FROM groceries WHERE cgid IN ('akg','pkt','bot')";
	ResultSet drs = stmt.executeQuery(sql);
	Statement stt = con.createStatement();
	String cquery = "SELECT count(*) FROM groceries";
	ResultSet rSt = stt.executeQuery(cquery);
	int tc = 0;
	if(rSt.next()){
		tc = rSt.getInt(1);
	}
	int s=0;
	String delgid[] = new String[tc]; //imp
	int delquantity[] = new int[tc];  //imp
	while(drs.next())
	{
		if(request.getParameter(drs.getString("gid"))!=null){
			delgid[s] = drs.getString("gid");
			delquantity[s] = Integer.parseInt(request.getParameter(drs.getString("gid")));
			s++;
		}
		
	}
	int dquantity[] = new int[dcnt];
	String tname[] = new String[tc];
	double dprice[] = new double[dcnt];
	double dtotal[] = new double[dcnt];
	int fquantity[] = new int[dcnt];
	double fprice[] = new double[tc];
		
	String query = "SELECT tname,quantity,price,total FROM groceries WHERE gid in ?";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = null;
	for(int j=0;j<s;j++){
		pstmt.setString(1,delgid[j]);
		rs = pstmt.executeQuery();
		while(rs.next()){			
				dquantity[j] = rs.getInt("quantity");
				tname[j] = rs.getString("tname");
				dprice[j] = rs.getDouble("price");		//*imp
				dtotal[j] = rs.getDouble("total");		//*imp
			}
	}
	for(int j=0;j<s;j++){	
			fquantity[j] = dquantity[j]-delquantity[j];	
			fprice[j] = fquantity[j]*dprice[j];
	}
	
	String stcount = "SELECT count(*) FROM student";
	Statement st2 = con.createStatement();
	ResultSet cnt = st2.executeQuery(stcount);
	cnt.next();
	int nos = Integer.parseInt(cnt.getString(1));
	
	String dsql = "SELECT gid,tname,total FROM groceries WHERE cgid in ('msl','cwg','misc')";
	Statement stmt1 = con.createStatement();
	ResultSet drs1 = stmt1.executeQuery(dsql);
	int tno=0;
	int m=s;
	int tcag = s;
	while(drs1.next()){
		delgid[tcag]=drs1.getString("gid");
		tname[m] = drs1.getString("tname");
		fprice[m] = drs1.getDouble("total");
		m++;
		tcag++;
	}
	tno=m;
	
%>
<h1 align="center"><span id="header">Used Stock Details</span></h1>
<br>
<table align="center" border="0.5" cellpadding="5" cellspacing="5">
<tr>
<th align="center"><i>Item Name</i></th><th align="center"><i>Price</i></th>
</tr>
<%
double amt = 0.0;
for(int k=0;k<tno;k++){
	amt = amt+fprice[k]; 
%>

<tr>
<td><b><label><%= tname[k] %></label></b></td><td><label> <%= fprice[k] %> </label></td>
<%
}
%>
</tr>
</table>
<div id="amount"><h3 align="center">The Final Total of Used Stock = &nbsp;<u><%= Math.ceil(amt) %></u></h3></div>
<form action="genremission.jsp" method="post">
	
				
	<%
		session.setAttribute("totamt",Math.ceil(amt));
		session.setAttribute("totstrength",nos);
		
		int cntwo = (Integer)session.getAttribute("cnt");
		String sql1 = "UPDATE TEMPGROCERIES SET quantity=?,price=?,total=? WHERE gid=?";
		PreparedStatement pst = con.prepareStatement(sql1);
		
		for(int l=0;l<cntwo;l++)
		{
			pst.setInt(1,fquantity[l]);
			pst.setDouble(2,dprice[l]);
			pst.setDouble(3,fprice[l]);
			pst.setString(4,delgid[l]);
			pst.executeUpdate();
		}		
		
		String sql2 = "UPDATE TEMPGROCERIES SET total=? WHERE gid=?";
		PreparedStatement pst1 = con.prepareStatement(sql2);
		for(int z=s;z<tno;z++){
			pst1.setDouble(1,fprice[z]);
			pst1.setString(2,delgid[z]);
			pst1.executeUpdate();
		}
		
	%>
	
	<br><input type="hidden" name="hidden" value="PavanMandava" />
	<center><h3>Press <b>Next</b> Button to go to Remission Page</h3></center>
	<center><button type="submit">Next</button></center>
</form>
<%
	}
	else{
		response.sendRedirect("showstock.jsp");
	}
%>
</body>
</html>