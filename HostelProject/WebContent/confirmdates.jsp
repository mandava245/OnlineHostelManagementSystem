<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DATES CONFIRMATION</title>
<style type="text/css">
	#center{
			font-family: Cambria;
			color: #7B1760;
			font-size: 20px;
	}
	#center h2{
		font-family: Candara;
		color: #934A57;
	}
	#center h2 b{
		font-family: Castellar;
		color: #B81B46;
		cursor: pointer;
		background-color: #E9EBC2;
	}
	#center table{
		color: #D827D8;
	}
	#center table th{
		color: #233381;
	}
	#center table b{
		color: #BB0B6B;
		font-size: 24px;
		background-color: #DBF7F2;
		cursor: pointer;
	}
	button{
		font-family: Comic Sans MS;
		font-size: 24px;
		font-weight: bold;
		border-radius: 5px;
		border: 2px thin red;
		color: #1C4593;
		background-color: #E6FFFF;
	}
	button:hover{
		font-size: 25px;
		cursor: pointer;
		border: 3px groove green;
		color: #994F22;
		background-color: #F3EA30;
	}
	a{
		font-family: Cambria;
		font-size: 25px;
		font-weight: bold;
		text-decoration: none;
		color: #387C8B;
		background-color: #E7FE98;
		border-radius: 5px;
	}
	a:hover{
		border: 2px groove red;
		font-size: 25.5px;
		text-decoration: underline;
		color: #3A4BC5;
		background-color: #FEFCBC;
	}
	a:active{
		color: red;
	}

</style>
</head>
<body>
	
		<script>
			function formConfirm(){
				var cnf = confirm('Are you sure you want to Proceed to Calculate Mess Bill!');
				if(cnf==true){
					return true;
				}
				else{
					return false;
				}
			}
		</script>

<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="connect.*" %>
<%@ page import="java.sql.*" %>
<div id="center" align="center">
		<%
		if(request.getParameter("hidden")!=null){
			java.util.Date fd = new SimpleDateFormat("yy-M-dd").parse(request.getParameter("from"));
			java.util.Date td = new SimpleDateFormat("yy-M-dd").parse(request.getParameter("to"));
			
			Calendar c1 = new GregorianCalendar(fd.getYear(),fd.getMonth(),fd.getDate());
			Calendar c2 = new GregorianCalendar(td.getYear(),td.getMonth(),td.getDate());
			
			String fromd = new SimpleDateFormat("d MMM-yyyy").format(fd);
			String tod = new SimpleDateFormat("d MMM-yyyy").format(td);
			
			int days = 0;
			int fdays = c1.get(Calendar.DAY_OF_YEAR);
			int tdays = c2.get(Calendar.DAY_OF_YEAR);
			if(fd.getYear()==td.getYear()){
				days = (tdays-fdays)+1;
			}
			else if(td.getYear()>fd.getYear()){
				days = ((365+tdays)-fdays)+1;	
			}
			
		    session.setAttribute("totdays",days);
			String mon = request.getParameter("month");
			String year = request.getParameter("year");
			String month = "MONTH";
			String table = mon.toUpperCase()+"-"+year.toUpperCase();
			session.setAttribute("tabname",table);
			String grt = "GR"+table;
			String cct = "CC"+table;
			String mbt = "MB"+table;
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			Connection con = dcon.Connect_DB();
			Statement st1 = con.createStatement();
			String sql = "SELECT * FROM messbills WHERE month='"+table+"'";
			ResultSet rs = st1.executeQuery(sql);
			if(rs.next()){	
				
			%>
			
			<script type="text/javascript">
				alert('Table Name Already Existed..!  Please Re-Enter Month Name and Year...!!!');
			</script>
			
			<font size=2 color=red>Table Name Already Existed..!! &nbsp; Please Re-Enter Month Name and Year...!!!</font>
				
			<%
			RequestDispatcher rd = application.getRequestDispatcher("/start.jsp");
			
				rd.include(request,response);
			
			//response.sendRedirect("start.jsp");
					
			}
			else
			{				
		%>		
					
		<h1>Verify the Details</h1>
		<center><h2><strong>Please Check <u>Total Days</u> and <u>Table Name</u></strong></h2></center>
		<table align="center" border=0 cellpadding=10 cellspacing=10>
		<tr align="center"><th><u>From Date</u></th><th><u>To Date</u></th><th><u>Total Days</u></th></tr>
		<tr align="center"><td><%= fromd %></td><td><%= tod %></td><td><b><%= days %></b></td></tr>
		</table>
		
		<br>
		<form action="selectlist.jsp" method="post">
		<h2>Table Name: &nbsp; <b><%= table %></b></h2><br>
		<button type="submit" onclick="return formConfirm()"><i>Proceed >></i></button>
		<input type="hidden" name="hidden" value="PavanMandava" />
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="start.jsp">Go Back</a>
		</form>
				
		<%		
			java.util.Date date1 = new java.util.Date();
			DateFormat dFormat = new SimpleDateFormat("d-MMM-YY");
			String mdate = dFormat.format(date1);
			/* 
			Statement stmt1 = con.createStatement();
			String query = "create table \""+table+"\" as select * from \""+month+"\"";
			stmt1.execute(query);
			 */
			 
			 Statement stMt = con.createStatement();
			 String seq = "SELECT messbill.nextval from dual";
			 ResultSet rset = stMt.executeQuery(seq);
			 int mbno = 0;
			 if(rset.next()){
				 mbno = rset.getInt(1);
			 }
			 String mid = "mb"+mbno;
			 Statement stmt = con.createStatement();
			 String query = "UPDATE tempbill SET totdays=0,remdays=0,billdays=0,messchrgs=0,commchrgs=0,total=0";
			 stmt.executeUpdate(query);
			 
			 Statement stmt1 = con.createStatement();
			 String sql1 = "UPDATE tempbill SET type='gen' WHERE sid NOT IN (SELECT sid FROM messmembers)";
			 stmt1.executeUpdate(sql1);
			 
			Statement stmt2 = con.createStatement();
			String sql2 = "UPDATE tempbill SET totdays="+days;
			stmt2.executeUpdate(sql2);
			
			Statement stmt3 = con.createStatement();
			String sql3 = "INSERT INTO messbills VALUES('"+mid+"','"+table+"','"+mbt+"','"+cct+"','"+grt+"','"+mdate+"','"+fromd+"','"+tod+"',"+days+")";
			stmt3.executeUpdate(sql3);
			}
		}
		else{
			response.sendRedirect("start.jsp");
		}
		
		%>
		
</div>

</body>
</html>