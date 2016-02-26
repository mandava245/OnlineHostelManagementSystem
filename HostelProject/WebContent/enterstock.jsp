<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER STOCK DETAILS</title>

		<style>
				@charset "utf-8";
				/* CSS Document */
				h2{
					font-family: Comic Sans MS;
					color: #AD1897;
					font-weight: bold;
				}
				#lists{
					text-align: center;
					border-radius: 6px;
					border: 3px solid #D5DFA8;
					color: #65682D;
					background-color: #F4FAFF;
					font-size: 24px;
					height: 45px;
				}
				#lists option{
					border-radius: 6px;
					border: 2px thin #FF6;
					text-align: center;
					text-height: 30px;
					font-size: 24px;
					width: auto;
				}
				#lists:hover{
					cursor: pointer;
					border: 3px solid #F80E8E;
					border-radius: 6px;
					color: #0D5201;
					background-color: #FFF8E8;
					font-size: 24px;
					height: 45px;
					text-align: center;
				}
				input{
					border: 2px solid #D5DFA8;
					border-radius: 7px 7px 7px 7px;
					color: #65682D;
					background-color: #F4FAFF;
					font-size: 20px;
					text-align: center;
					font-weight: bold;
					font-family: Andalus;
				}
				input:hover{
					cursor: pointer;
					border: 2px solid #F80E8E;
					border-radius: 7px 7px 7px 7px;
					color: #0D5201;
					background-color: #FFF8E8;
					font-size: 20px;
					text-align: center;
					font-weight: bold;
					font-family: Andalus;
				}
				button{
					cursor: pointer;
					color: #F2095A;
					font-family: Comic Sans MS;
					font-size: 22px;
					font-weight: bold;
					border: 4px solid #DDD3DE;
					border-radius: 9px 5px 9px 5px;
					background-color: #EFDCCF;
				}
				button:hover{
					border-radius: 5px 9px 5px 9px;
					cursor: pointer;
					font-family: Comic Sans MS;
					font-size: 22px;
					color: #02AFBD; 
					font-weight: bold;
					border: 4px solid #DDD3DE;
					background-color: #E6CEB7;
				}
				select option{
					text-align: center;
				}
				h1{
					font-family: Cambria;
					color: #9C9923;
				}
		</style>
</head>
<body>
		<script>
 				function formValidation(){
 					
 					var x = document.akgForms.pergroc.value;
					if(x=="" || x==null){
 						alert('Stock Item Must be selected..!!');
 						return false;	
 					}
					
 				}
 				
				function formValidate1(){	
 					var a = document.pktForms.pergroc.value;
 					if(a=="" || a==null){
 						alert('Stock Item Must be selected..!!');
						return false;	
 					}
 					
				}
				
				function formValidate2(){
 					var b = document.botForms.pergroc.value;
 					if(b=="" || b==null){
 						alert('Stock Item Must be selected..!!');
 						return false;	
 					}
 					
				}
				
				function formValidate3(){
 					var y = document.maslForms.miscgroc.value;
					if(y=="" || y==null){
 						alert('Stock Item Must be selected..!!');
 						return false;	
 					}
					
				}
				
				function formValidate4(){
 					var c = document.cwgForms.miscgroc.value;
 					if(c=="" || c==null){
 						alert('Stock Item Must be selected..!!');
						return false;	
 					}
 					
				}
				
				function formValidate5(){
 					var d = document.miscForms.miscgroc.value;
 					if(d=="" || d==null){
 						alert('Stock Item Must be selected..!!');
 						return false;	
 					}
 					
 				}
		
		</script>

<%@ page import="connect.*" %>
<%@ page import="java.sql.*" %>
<h1 align="center">Choose a Category and Enter the Stock Details</h1>
	<div align="center">
		<form name="akgForms" action="stockcnfm.jsp" method="post">
		<h2 align="center"><u>Per KG Groceries</u></h2>
  		<select name="pergroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			Connection con = dcon.Connect_DB();
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM GROCERIES WHERE cgid='akg'";
			ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			
		%>	
			<option value="<%= rs.getString("gid") %>"><%= rs.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  <input type="number" min="1" max="2000" name="quantity" placeholder="Quantity" size="1" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		   <button type="submit" onclick="return formValidation()">Enter</button>
		</form>	
	</div>
	<br><br>
	
		<div align="center">
		<form name="pktForms" action="stockcnfm.jsp" method="post">
		<h2 align="center"><u>Per PACKET Groceries</u></h2>
  		<select name="pergroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt1 = con.createStatement();
			String sql1 = "SELECT * FROM GROCERIES WHERE cgid='pkt'";
			ResultSet rs1 = stmt.executeQuery(sql1);
		while(rs1.next()){
			
		%>	
			<option value="<%= rs1.getString("gid") %>"><%= rs1.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  <input type="number" min="1" max="2000" name="quantity" placeholder="Quantity" size="1" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit"  onclick="return formValidate1()">Enter</button>
		</form>	
	</div>
			<br><br>	
	
		<div align="center">
		<form name="botForms" action="stockcnfm.jsp" method="post">
		<h2 align="center"><u>Per BOTTLE Groceries</u></h2>
  		<select name="pergroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt2 = con.createStatement();
			String sql2 = "SELECT * FROM GROCERIES WHERE cgid='bot'";
			ResultSet rs2 = stmt.executeQuery(sql2);
		while(rs2.next()){
			
		%>	
			<option value="<%= rs2.getString("gid") %>"><%= rs2.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  <input type="number" min="1" max="2000" name="quantity" placeholder="Quantity" size="1" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit" onclick="return formValidate2()">Enter</button>
		</form>	
	</div>
		
		<br><br>	
		<div align="center">
		<form name="maslForms" action="misccnfrm.jsp" method="post">
		<h2 align="center"><u>MASALA Groceries</u></h2>
  		<select name="miscgroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt3 = con.createStatement();
			String sql3 = "SELECT * FROM GROCERIES WHERE cgid='msl'";
			ResultSet rs3 = stmt.executeQuery(sql3);
		while(rs3.next()){
			
		%>	
			<option value="<%= rs3.getString("gid") %>"><%= rs3.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit" onclick="return formValidate3()">Enter</button>
		</form>	
	</div>
	
		<br><br>	
		<div align="center">
		<form name="cwgForms" action="misccnfrm.jsp" method="post">
		<h2 align="center"><u>CLEANING & WORKERS Groceries</u></h2>
  		<select name="miscgroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt4 = con.createStatement();
			String sql4 = "SELECT * FROM GROCERIES WHERE cgid='cwg'";
			ResultSet rs4 = stmt.executeQuery(sql4);
		while(rs4.next()){
			
		%>	
			<option value="<%= rs4.getString("gid") %>"><%= rs4.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit" onclick="return formValidate4()">Enter</button>
		</form>	
	</div>
		
		
		<br><br>	
		<div align="center">
		<form name="miscForms" action="misccnfrm.jsp" method="post">
		<h2 align="center"><u>MISCELLANEOUS Groceries</u></h2>
  		<select name="miscgroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt5 = con.createStatement();
			String sql5 = "SELECT * FROM GROCERIES WHERE cgid='misc'";
			ResultSet rs5 = stmt.executeQuery(sql5);
		while(rs5.next()){
			
		%>	
			<option value="<%= rs5.getString("gid") %>"><%= rs5.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit" onclick="return formValidate5()">Enter</button>
		</form>	
	</div>
		<br>
		<br>
		<br>
</body>
</html>