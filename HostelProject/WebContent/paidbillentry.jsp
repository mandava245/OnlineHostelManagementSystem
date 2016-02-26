<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ENTER PAID LIST</title>
<style>

	#nontotal{
		border: 1px groove #00F;
		border-radius: 5px;
		font-family: Cambria;
		font-size: 19px;
		text-align:center;
		color: #933;
	}
	label{
		font-size: 20px;
		color: #498D32;
		font-weight: bold;
	}
			form button{
				cursor: pointer;
				color: #F2095A;
				font-family: Cambria;
				font-size: 20px;
				font-weight: bold;
				border: 1px solid #38A907;
				border-radius: 6px 5px 6px 5px;
				background-color: #D2D2D2;
			}
			form button:hover{
				border: 1.5px groove #FF8A15;
				border-radius: 5px 6px 5px 6px;
				font-family: Cambria;
				color: #02AFBD; 
				font-weight: bold;
				background-color: #FFFFB3;
			}
			
			#maind{
		font-family: Cambria;
		font-size: 20px;
		border-radius: 5px;
		text-align: center;
	}
	#maind th{
		color: #7B2449;
		border-radius: 5px;
		background-color: #DFF2F2;
	}
	#maind td{
		color: #6B503A;
		border-radius: 5px;
		background-color: #F2F9DD;
	}
	center h2{
		font-family: Cambria;
		font-weight: bold;
		color: #7E4F1F;
	}
	center font{
		font-family: Cambria;
		font-weight: bold;
		font-size: 22px;
		color: #8B1D59;
	}
	
</style>
</head>

<body>
<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>

<script>
	function radioCheck(){
		if(document.getElementById("check_1").checked){
			document.getElementById("nontotal").disabled = false;	
		}
		else{
			document.getElementById("nontotal").disabled = true;
		}
	}
	function radioValidation(){
			var chk = document.billForm.check.value;
			if(chk==null || chk==""){
				alert('Please Select any one of the Option!');	
				return false;
			}
	}
</script>
<%
String sid = request.getParameter("sid");
		if(sid!=null){
		Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		
		
			String squery = "SELECT * FROM student WHERE sid = '"+sid+"'";
		
		ResultSet rst = stmt.executeQuery(squery);
		%>
		
			<center><h2>DETAILS OF THE STUDENT</h2></center>
			<br>
			<table id="maind" align="center" border=1 cellpadding=4 cellspacing=4>
				<tr>
					<th>Sid</th>
					<th>Name</th>
					<th>Room No</th>
					<th>Year</th>
					<th>Branch</th>
					<th>Already Paid</th>
					<th>Not Paid</th>
					<th>Fine</th>
					<th>Total</th>
				</tr>
				<%
					while(rst.next()){	
						%>
						<tr>
							<td><%= rst.getString("sid") %></td>
							<td><%= rst.getString("sname") %></td>
							<td><%= rst.getString("roomno") %></td>
							<td><%= rst.getString("syear") %></td>
							<td><%= rst.getString("branch") %></td>
							<td><%= rst.getDouble("paid") %></td>
							<td><%= rst.getDouble("notpaid") %></td>
							<td><%= rst.getDouble("fine") %></td>
							<td><%= (rst.getDouble("notpaid")+rst.getDouble("fine")) %></td>
						</tr>
						<%
					}
				%>
			</table>
			<br>
			<div id="fulldetails" align="center">
				<form action="fulldetails.jsp" method="post" target="_blank">
					<input type="hidden" name="sid" value="<%= sid %>" />
					<button type="submit">View Full Details >></button>
				</form>
			</div>
		<%
		
		
		String sql = "SELECT * FROM tempbill WHERE sid='"+sid+"' AND status='Not Paid' ";
		ResultSet rSet = stmt.executeQuery(sql);
		double total = 0.0;
		double fine = 0.0;
		if(rSet.next()){
			total = rSet.getDouble("total");
			fine = rSet.getDouble("fine");
		}
		else{
			
		}

%>

<br><br>
<form name="billForm" action="cnfpaid.jsp" method="post">
	
	<center>
		<font>
				Select any one of the Option as the Mess Bill Paid by the Student
		</font>
	</center>
	<br>

  <table align="center" cellpadding=5 cellspacing=5>
    <tr>
      <td width="400"><label>
        <input type="radio" name="check" value="total" id="check_0" onclick="radioCheck()" />
        <%= total %>
        </label></td>
    </tr>
    <%
    	if(fine!=0.0){
    	
    %>
    
    <tr>
     <td><label>
        <input type="radio" name="check" value="sometotal" id="check_2" onclick="radioCheck()" />
        <%= (total+fine) %></label></td>
    </tr>
    <% } %>
    <tr>
      <td><label>
        <input type="radio" name="check" value="nottotal" id="check_1"  onclick="radioCheck()"/>
        Enter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="non-total" pattern="\d+(\.\d{2})?" size="5" id="nontotal" placeholder="Amount" disabled required/>
        </label>
        </td>
        
        <tr>
        <td> <button type="submit" name="submit" onClick="return radioValidation()">Submit</button> </td>
   </tr>
  </table>
</form>
<%
}
else
{
	response.sendRedirect("billpaid.jsp");
}
%>

</body>
</html>
