<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADD MESS MEMBERS</title>
<style>
			form input{
				border: 2px solid #D5DFA8;
				border-radius: 6px;
				color: #65682D;
				background-color: #F4FAFF;
				font-size: 20px;
				text-align: center;
				font-weight: bold;
				font-family: Andalus;
			}
			form input:hover{
				cursor: text;
				border: 2px groove yellow;
				border-radius: 6px;
				font-size: 20px;
				color: #0D5201;
				background-color: #FFF8E8;
			}
			form button{
				cursor: pointer;
				color: #F2095A;
				font-family: Cambria;
				font-size: 22px;
				font-weight: bold;
				border: 2px solid #38A907;
				border-radius: 6px 5px 6px 5px;
				background-color: #D2D2D2;
			}
			form button:hover{
				border: 2px groove #FF8A15;
				border-radius: 5px 6px 5px 6px;
				font-family: Cambria;
				color: #02AFBD; 
				font-weight: bold;
				background-color: #FFFFB3;
			}
			span{
				font-family: Cambria;
				font-weight: bold;
				font-size: 22px;
			}
			#messmem{
				font-family: Cambria;
			}
			#messmem th{
				text-align: left;
				font-weight: bold;
				font-size: 24px;
				color: #82223A;
			}
			#messmem td{
				font-size: 22px;
				color: #AA7D2B;
			}
			#messmem input{
				border: 2px groove #D5DFA8;
				border-radius: 5px;
				color: #65682D;
				background-color: #D9FDFD;
				font-size: 21px;
				text-align: center;
				font-weight: bold;
				font-family: Cambria;
			}
			#messmem input:hover{
				cursor:text;
				font-size: 21px;
				back-ground-color: #FDECFA;
				border: 2px groove yellow;
			}
			#messmem button{
				cursor: pointer;
				color: #F2095A;
				font-family: Cambria;
				font-size: 22px;
				font-weight: bold;
				border: 2px solid #BE050A;
				border-radius: 6px 5px 6px 5px;
				background-color: #F0FCED;
			}
			#messmem button:hover{
				border: 2px groove yellow;
				border-radius: 5px 6px 5px 6px;
				font-family: Cambria;
				color: #02AFBD; 
				font-weight: bold;
				background-color: #FFFFB3;
			}
			center h2{
				font-family: Cambria;
				color: #3D7E54;
				font-weight: bold;
			}
	</style>

</head>
<body>
		<script type="text/javascript">
				
				function formConfirm(){
					var cnf = confirm('Are you sure you want to Add as Mess Member ?');
					if(cnf==true){
						return true;
					}
					else{
						return false;
					}
				}
		
		</script>
		
		<%@ page import="java.sql.*" %>
		<%@ page import="connect.*" %>
		
	

	<%
		String sid = null;
		sid = request.getParameter("sid");
	%>

		<div align="center" id="stid">
		<center><h2>Add a Mess Member</h2></center>
		
			<form action="messmembs.jsp" method="post">
			
			<%
				if(sid==null){
					%>
					<span>Enter Student ID :</span> &nbsp;<input type="text" name="sid" size="4" placeholder="Enter SID" autofocus required/><br><br>
					<%
				}
				else{
					%>
					<span>Enter Student ID :</span> &nbsp;<input type="text" name="sid" value="<%= sid %>" size="4" placeholder="Enter SID" required/><br><br>
					<%
				}
			%>
			
					<button type="submit">Submit</button>
			</form>
		
		</div>
		
		<%
			if(sid!=null){
				
				Connect dcon = ConnectFactory.getConnToDB("Oracle");
				Connection con = dcon.Connect_DB();
				Statement st = con.createStatement();
				String query = "SELECT * FROM messmembers WHERE sid='"+sid+"'";
				ResultSet rSet = st.executeQuery(query);
				if(!rSet.next()){
					
					Statement stmt = con.createStatement();
					String sql = "SELECT * FROM student WHERE sid='"+sid+"'";
					ResultSet rs = stmt.executeQuery(sql);
					if(rs.next()){
						%>
					<br>
					<br>
					<form action="addmm.jsp" method="post">
						<table id="messmem" align="center" border=0 cellpadding=5 cellspacing=5>
							<tr><th>Student Id</th><td><%= rs.getString("sid") %></td></tr>
							<tr><th>Name</th><td><%= rs.getString("sname") %></td></tr>
							<tr><th>Room No</th><td><%= rs.getString("roomno") %></td></tr>
							<tr><th>Branch</th><td><%= rs.getString("branch") %></td></tr>
							<tr><th>Year</th><td><%= rs.getString("syear") %></td></tr>
							<tr><th>Percentage</th><td><input type="number" name="percnt" min=1 max=100 required/></td></tr>
							<tr><th></th><td><input type="hidden" name="sid" value="<%= sid %>"/><button type="submit" onclick="return formConfirm()">Add as Mess Member</button></td></tr>
						</table>
					</form>
					<br><br>
					
					<%
				}
				
			}
				else{
					%>
						<script>
							alert('Already a Mess Member..!!');
						</script>
					<%
				}
				
				con.close();
				dcon.closeConnection();		
		}
		
		%>
		<%@ include file="search.jsp" %>
</body>
</html>