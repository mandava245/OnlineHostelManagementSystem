<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FINAL BILL ...</title>
</head>

<style>
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
		table{
			font-family: Cambria;
			font-weight: bold;
			font-size: 22px;
			color: #84562D;
		}
</style>

<body>
	<%@ page import="java.sql.*" %>
	<%@ page import="connect.*" %>
	
	<%	
		int c = 0;
		int totcnt = 0;
		double commchrgs = 0.0;
		Connection con = null;
		String table = (String)session.getAttribute("tabname");
		if(request.getParameter("hidden")!=null){
			
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			con = dcon.Connect_DB();
			
			Statement stmt1 = con.createStatement();
			String squery = "SELECT count(*) FROM student";
			ResultSet rs = stmt1.executeQuery(squery);
			if(rs.next()){
				totcnt = rs.getInt(1);
			}
			
			Statement st1 = con.createStatement();
			String sql = "SELECT count(*) FROM ccharges";
			ResultSet rSet = st1.executeQuery(sql);
			int cnt = 0;
			if(rSet.next()){
				cnt = rSet.getInt(1);
			}
			Statement st2 = con.createStatement();
			String sql2 = "SELECT ccid FROM ccharges where ccid !='inc1'";
			ResultSet rSet1 = st2.executeQuery(sql2);
			double indv[] = new double[cnt]; 
			double total = 0.0;
			int i = 0;
			String psql = "UPDATE tempccharges SET cost=? WHERE ccid=?";
			PreparedStatement pst = con.prepareStatement(psql);
			while(rSet1.next()){
				if(request.getParameter(rSet1.getString("ccid"))!=null)
				{
				indv[i] = Double.parseDouble(request.getParameter(rSet1.getString("ccid")));
			
				pst.setDouble(1, indv[i]);
				pst.setString(2, rSet1.getString("ccid"));
				pst.executeUpdate();
				total = total+indv[i];
				i++;
				}
			}
			double income = Double.parseDouble(request.getParameter("inc1"));
			String sqlst = "UPDATE tempccharges SET cost ="+income+" WHERE ccid='inc1'";
			Statement stment = con.createStatement();
			stment.executeUpdate(sqlst);
			double fintot = total-income;
			//totinms = (Integer)session.getAttribute("totstrength");
			commchrgs = fintot/totcnt;
			Statement stmt = con.createStatement();
			String query = "UPDATE tempbill SET commchrgs="+commchrgs+", total = ceil(messchrgs + "+commchrgs+") ";
			c = stmt.executeUpdate(query);			
		}
		else{
			response.sendRedirect("finalmb.jsp");
		}	
	%>
		<%
			if(c==totcnt){
		%>
				<script>
					alert('Mess Bill Generated Successfully');
				</script>		
		<%
			Statement stmt1 = con.createStatement();
			String sql = "SELECT * FROM messbills WHERE month='"+table+"'";
			ResultSet rSet1 = stmt1.executeQuery(sql);
			String mbtable = null;
			String grtable = null;
			String cctable = null; 
			if(rSet1.next()){
					mbtable = rSet1.getString("mbname");
					grtable = rSet1.getString("grname");
					cctable = rSet1.getString("ccname");
				}
			
					Statement st = con.createStatement();
					String squery = "create table \""+mbtable+"\" as select * from tempbill";
					String squery1 = "create table \""+grtable+"\" as select * from tempgroceries";
					String squery2 = "create table \""+cctable+"\" as select * from tempccharges";
					st.execute(squery);
					st.execute(squery1);
					st.execute(squery2);
					Statement stment = con.createStatement();
					String dsql = "SELECT sid,total FROM \""+mbtable+"\"";
					ResultSet rSet = stment.executeQuery(dsql);
					String psql = "UPDATE student SET notpaid = notpaid + ? WHERE sid = ?";
					PreparedStatement pst = con.prepareStatement(psql);
					while(rSet.next()){
						pst.setDouble(1, rSet.getDouble("total"));
						pst.setString(2, rSet.getString("sid"));
						pst.executeUpdate();
					}
			}
			else{
		%>
				<center><font color=red>Something is Wrong! Please Try Again</font></center>
		<%
				RequestDispatcher rd = request.getRequestDispatcher("finalmb.jsp");
				rd.include(request,response);
			}
		
		%>
		<div align="center">
		<form action="messbill.jsp" method="post">
			<button type="submit">View Mess Bill</button>
		</form>
		</div>
		<br><br>
		<%
		
			double mbt = 0.0;
			double grt = 0.0;
			double cct = 0.0;
			Statement stt = con.createStatement();
			Statement stt1 = con.createStatement();
			Statement stt2 = con.createStatement();
			String sqqueryl = "SELECT sum(total) FROM tempbill";
			String sqqueryl1 = "SELECT sum(total) FROM tempgroceries";
			String sqqueryl2 = "SELECT sum(cost) FROM tempccharges";
			ResultSet rSt1 = stt.executeQuery(sqqueryl);
			ResultSet rSt2 = stt1.executeQuery(sqqueryl1);
			ResultSet rSt3 = stt2.executeQuery(sqqueryl2);
			if(rSt1.next()){
				mbt = rSt1.getDouble(1);
			}
			if(rSt2.next()){
				grt = rSt2.getDouble(1);
			}
			if(rSt3.next()){
				cct = rSt3.getDouble(1);
			}
		%>
		<div align="center">
		
			<table border=0>
				<tr><td>Total of Mess Bills : </td><td><%= mbt %></td></tr>
				<tr><td>Total of Groceries : </td><td><%= grt %></td></tr>
				<tr><td>Total of Comm Charges : </td><td><%= cct %></td></tr>
				<%-- <tr><td>Income</td><td><%= (mbt-(grt+cct)) %></td></tr> --%>
			</table>
			
		</div>
		</body>
</html> 