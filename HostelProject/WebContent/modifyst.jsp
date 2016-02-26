<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER STUDENT ID TO MODIFY</title>

	<style>
			
			form span{
				font-family: Cambria;
				font-weight: bold;
				font-size: 22px;
			}
		input{
			border: 2px solid #D5DFA8;
			border-radius: 6px;
			color: #65682D;
			background-color: #F4FAFF;
			font-size: 20px;
			text-align: center;
			font-weight: bold;
			font-family: Andalus;
		}
		input:hover{
			cursor: text;
			border: 2px groove yellow;
			border-radius: 6px;
			font-size: 20px;
			color: #0D5201;
			background-color: #FFF8E8;
		}
		button{
			cursor: pointer;
			color: #F2095A;
			font-family: Cambria;
			font-size: 22px;
			font-weight: bold;
			border: 2px solid #38A907;
			border-radius: 6px 5px 6px 5px;
			background-color: #D2D2D2;
		}
		button:hover{
			border: 2px groove #FF8A15;
			border-radius: 5px 6px 5px 6px;
			font-family: Cambria;
			color: #02AFBD; 
			font-weight: bold;
			background-color: #FFFFB3;
		}
		body{
			position: absolute;
			background-attachment: fixed;
		}
		select{
					text-align: center;
					border-radius: 6px;
					border: 2px solid #D5DFA8;
					color: #65682D;
					background-color: #F4FAFF;
					font-size: 20px;
				}
				select option{
					border-radius: 6px;
					border: 2px thin #FF6;
					text-align: center;
					text-height: 30px;
					font-size: 20px;
					width: auto;
				}
				select:hover{
					cursor: pointer;
					border: 2px groove yellow;
					border-radius: 6px;
					color: #0D5201;
					background-color: #FFF8E8;
					font-size: 20px;
					text-align: center;
				}
				table{
					float: center;
				}
				table tr th{
					font-family: Cambria;
					font-weight: bold;
					font-size: 24px;
					color: #693D51;
				}
				h2{
					font-weight: bold;
					font-family: Cambria;
					color: #8C5022;
				}
				div{
					align: center;
					float: center;
				}	
				 body{
				 	margin-left: 26%;
				 	float: center;
				 }		
	</style>

	<script>
		function validateForm()
		{
			var y = document.stuForm.year.value;
			if(y==null || y=="")
			{
				alert('Please Select the Student Year !');
				return false;
			}
			var z = document.stuForm.branch.value;
			if(z==null || z=="")
			{
				alert('Please Select the Branch !');
				return false;
			}
			var rno = document.stuForm.rollno.value;
			if(isNaN(rno)){
				alert('Roll Number should be a Number !');
				return false;
			}
			var mbl = document.stuForm.mobile.value;
			if(isNaN(mbl)){	
				alert('Mobile should be a Number !');
				return false;
			}
			var pd = document.stuForm.paid.value;
			if(isNaN(pd)){	
				alert('Already Paid should be a Number !');
				return false;
			}
			var npd = document.stuForm.notpaid.value;
			if(isNaN(npd)){	
				alert('Not Paid should be a Number !');
				return false;
			}
			var fine = document.stuForm.fine.value;
			if(isNaN(fine)){	
				alert('Fine should be a Number !');
				return false;
			}
		}
		
	
	</script>

</head>
<body>

<%
	String sid = null;
	sid = request.getParameter("sid");

%>

<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>
	
	
	<center><h2>Modify the Student Data</h2></center>
<div align="center">
<br>
	<form action="modifyst.jsp" method="post">
	<input type="hidden" name="hidden" value="PavanMandava" />
	<%
		if(sid==null)
		{
			%>
			<span>Enter Student ID: </span>&nbsp;<input type="text" name="sid" size="4" placeholder="Student Id" autofocus required/>
			<%
		}
		else{
			%>
				<span>Enter Student ID: </span>&nbsp;<input type="text" name="sid" value="<%= sid %>" size="4" placeholder="Student Id" required/>
			<%
		}
	%>
	<br><br>
	
	<button type="submit">Submit</button>
	</form>
</div>
	
	<%
		if(request.getParameter("sid")!=null){
			
			if(request.getParameter("hidden")!=null)
			{
				sid = request.getParameter("sid");
				Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
				Connection con = dcon.Connect_DB();
				Statement stmt = con.createStatement();
				String sql = "SELECT * FROM STUDENT WHERE sid='"+sid+"'";
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()==true)
				{
					String sidn = rs.getString("sid");
					int year = rs.getInt("syear");
					String branch = rs.getString("branch");
					%>	
					<div align="center">
					<center><h2>Update the required Fields in the below Text Boxes</h2></center>
						<form action="stmody.jsp" method="post">
								<table align="center" border=0 cellpadding=4 cellspacing=4>
									<tr><th width=200>Name</th><td><input type="text" name="name" value="<%= rs.getString("sname") %>" placeholder="Student Name" size="14" autocomplete="off" required /></td></tr>
									<tr><th>Room No</th><td><input type="text" name="roomno" value="<%= rs.getString("roomno") %>" size="7" placeholder="Room No" autocomplete="off" required/></td></tr>
									<tr><th>Branch</th>
										<td>
											<select name="branch">
												<%
												
													if(branch.equals("CSE")){
														%>
														<option value="CSE" selected>CSE</option>
														<option value="ECE">ECE</option>
														<option value="Mech">Mech</option>
														<option value="IT">IT</option>
														<option value="Civil">Civil</option>
														<option value="EEE">EEE</option>
														<option value="EIE">EIE</option>
														<%
													}
													else if(branch.equals("ECE")){
														%>
														<option value="CSE">CSE</option>
														<option value="ECE" selected>ECE</option>
														<option value="Mech">Mech</option>
														<option value="IT">IT</option>
														<option value="Civil">Civil</option>
														<option value="EEE">EEE</option>
														<option value="EIE">EIE</option>
														<%
													}
													else if(branch.equals("Mech")){
														%>
														<option value="CSE">CSE</option>
														<option value="ECE">ECE</option>
														<option value="Mech" selected>Mech</option>
														<option value="IT">IT</option>
														<option value="Civil">Civil</option>
														<option value="EEE">EEE</option>
														<option value="EIE">EIE</option>
														<%
													}
													else if(branch.equals("IT")){
														%>
														<option value="CSE">CSE</option>
														<option value="ECE">ECE</option>
														<option value="Mech">Mech</option>
														<option value="IT" selected>IT</option>
														<option value="Civil">Civil</option>
														<option value="EEE">EEE</option>
														<option value="EIE">EIE</option>
														<%
													}
													else if(branch.equals("Civil")){
														%>
														<option value="CSE">CSE</option>
														<option value="ECE">ECE</option>
														<option value="Mech">Mech</option>
														<option value="IT">IT</option>
														<option value="Civil" selected>Civil</option>
														<option value="EEE">EEE</option>
														<option value="EIE">EIE</option>
														<%
													}
													else if(branch.equals("EEE")){
														%>
														<option value="CSE">CSE</option>
														<option value="ECE">ECE</option>
														<option value="Mech">Mech</option>
														<option value="IT">IT</option>
														<option value="Civil">Civil</option>
														<option value="EEE" selected>EEE</option>
														<option value="EIE">EIE</option>
														<%
													}
													else if(branch.equals("EIE")){
														%>
														<option value="CSE">CSE</option>
														<option value="ECE">ECE</option>
														<option value="Mech">Mech</option>
														<option value="IT">IT</option>
														<option value="Civil">Civil</option>
														<option value="EEE">EEE</option>
														<option value="EIE" selected>EIE</option>
														<%
													}
												%>
											</select>
										</td>
									</tr>
									<tr><th>Year</th>
									<td>
										<select name="year" id="year">
											<%
												if(year==1)
												{
													%>
													 <option value=1 selected>I/IV</option>
													 <option value=2>II/IV</option>
													 <option value=3>III/IV</option>
													 <option value=4>IV/IV</option>
													<%
												}
												else if(year==2)
												{
													%>
													 <option value=1>I/IV</option>
													 <option value=2 selected>II/IV</option>
													 <option value=3>III/IV</option>
													 <option value=4>IV/IV</option>
													<%
												}
												else if(year==3)
												{
													%>
													 <option value=1>I/IV</option>
													 <option value=2>II/IV</option>
													 <option value=3 selected>III/IV</option>
													 <option value=4>IV/IV</option>
													<%
												}
												else if(year==4)
												{
													%>
													 <option value=1>I/IV</option>
													 <option value=2>II/IV</option>
													 <option value=3>III/IV</option>
													 <option value=4 selected>IV/IV</option>
													<%
												}
											%>
										</select>
									  </td>
									</tr>
									<tr><th>Regd No</th><td><input type="text" name="rollno" value="<%= rs.getString("regno") %>" placeholder="Roll No" size="12" autocomplete="off" required /></td></tr>
									<tr><th>Mobile</th><td><input type="mobile" name="mobile" value="<%= rs.getString("mobile") %>" placeholder="Mobile" size="10" pattern="\d{10}" autocomplete="off" required /></td></tr>
									<tr><th>Not Paid</th><td><input type="text" name="notpaid" value="<%= rs.getString("notpaid") %>" placeholder="To be Paid" size="5" autocomplete="off" required /></td></tr>
									<tr><th>Paid</th><td><input type="text" name="paid" value="<%= rs.getString("paid") %>" placeholder="Already Paid" size="5" autocomplete="off" required /></td></tr>
									<tr><th>Fine</th><td><input type="text" name="fine" value="<%= rs.getString("fine") %>" placeholder="Fine" size="3" autocomplete="off" required /></td></tr>
									
								</table><br><br>
								<center><input type="hidden" name="sid" value="<%= sidn %>" /><button type="submit">Update</button></center>
						</form>
						</div>
					<%
					
				}
				else
				{
					%>
						<script>
							alert('Invalid Student ID..!!');
						</script>
					<%
				}
				con.close();
				dcon.closeConnection();
			}
			
		}
	%>
	
	
</body>
</html>