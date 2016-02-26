<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STOCK PRESENT</title>
<style>
	table{
		text-align: center;
		border: 2px groove #EF9ADA;
		border-radius: 5px;
	}
	table td{
		border: 1px groove ;
		border-radius: 5px;
		font-weight: bold;
		color: #253D1F;
		background-color: #FBFBFB;
	}
	table th{
		color: #824E48;
		background-color: #E4FDE1;
		border: 1px groove #D6B649;
		border-radius: 5px;
		font-size: 24px;

	}
	button{
		border: 1px groove #3EB9D2;
		border-radius: 5px;
		color: #E1F11F;
		background-color: black;
		font-weight: bold;
		font-size: 24px;
		font-family: Cambria;
	}
	button:hover{
		cursor: pointer;
		border: 2px groove yellow;
	}
	span{
		font-family: Cambria;
		color: #347662;
		font-size: 20px;
	}
				select{
					text-align: center;
					border-radius: 6px;
					border: 2px solid #D5DFA8;
					color: #65682D;
					background-color: #F4FAFF;
					font-size: 24px;
				}
				select option{
					border-radius: 6px;
					border: 2px thin #FF6;
					text-align: center;
					text-height: 30px;
					font-size: 24px;
					width: auto;
				}
				select:hover{
					cursor: pointer;
					border: 2px groove yellow;
					border-radius: 6px;
					color: #0D5201;
					background-color: #FFF8E8;
					text-align: center;
				}
				center h1{
					font-family: Cambria;
					font-weight: bold;
					color: #843C26;
				}
				div h2{
					font-family: Cambria;
					font-weight: bold;
					color: #CC2F46;
				}
</style>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%@ page import="connect.*" %>
	<div align="center">
	
	<center><h1>Showing Stock Details</h1></center><br>
	
	<%
			String cgid=null;
			cgid=request.getParameter("cgid");
			
	%>
	
	 <form name="newForm" action="currentstock.jsp" method="post">	
		 <span>Select Stock Type :</span> <select name="cgid" id="type" onchange="this.form.submit()">
	<%
		if(cgid==null || cgid.equals("all")){
			%>
					<option value="all" selected>&nbsp;&nbsp;&nbsp;- - - - - - - All - - - - - - -&nbsp;&nbsp;&nbsp;</option>
					<option value="akg">Per KG Groceries</option>
					<option value="pkt">Per PACKET Groceries</option>
					<option value="bot">Per BOTTLE Groceries</option>
					<option value="msl">MASALA Groceries</option>
					<option value="cwg">CLEANING &amp; WORKERS Groceries</option>
					<option value="misc">MISCELLANEOUS Groceries</option>
			<%
		}
		else if(cgid.equals("akg")){
			%>
					<option value="all">&nbsp;&nbsp;&nbsp;- - - - - - - All - - - - - - -&nbsp;&nbsp;&nbsp;</option>
					<option value="akg" selected>Per KG Groceries</option>
					<option value="pkt">Per PACKET Groceries</option>
					<option value="bot">Per BOTTLE Groceries</option>
					<option value="msl">MASALA Groceries</option>
					<option value="cwg">CLEANING &amp; WORKERS Groceries</option>
					<option value="misc">MISCELLANEOUS Groceries</option>
			<%
		}
		else if(cgid.equals("pkt")){
			%>
					<option value="all">&nbsp;&nbsp;&nbsp;- - - - - - - All - - - - - - -&nbsp;&nbsp;&nbsp;</option>
					<option value="akg">Per KG Groceries</option>
					<option value="pkt" selected>Per PACKET Groceries</option>
					<option value="bot">Per BOTTLE Groceries</option>
					<option value="msl">MASALA Groceries</option>
					<option value="cwg">CLEANING &amp; WORKERS Groceries</option>
					<option value="misc">MISCELLANEOUS Groceries</option>
			<%
		}
		else if(cgid.equals("bot")){
			%>
					<option value="all">&nbsp;&nbsp;&nbsp;- - - - - - - All - - - - - - -&nbsp;&nbsp;&nbsp;</option>
					<option value="akg">Per KG Groceries</option>
					<option value="pkt">Per PACKET Groceries</option>
					<option value="bot" selected>Per BOTTLE Groceries</option>
					<option value="msl">MASALA Groceries</option>
					<option value="cwg">CLEANING &amp; WORKERS Groceries</option>
					<option value="misc">MISCELLANEOUS Groceries</option>
			<%
		}
		else if(cgid.equals("msl")){
			%>
					<option value="all">&nbsp;&nbsp;&nbsp;- - - - - - - All - - - - - - -&nbsp;&nbsp;&nbsp;</option>
					<option value="akg">Per KG Groceries</option>
					<option value="pkt">Per PACKET Groceries</option>
					<option value="bot">Per BOTTLE Groceries</option>
					<option value="msl" selected>MASALA Groceries</option>
					<option value="cwg">CLEANING &amp; WORKERS Groceries</option>
					<option value="misc">MISCELLANEOUS Groceries</option>
			<%
		}
		else if(cgid.equals("cwg")){
			%>
					<option value="all">&nbsp;&nbsp;&nbsp;- - - - - - - All - - - - - - -&nbsp;&nbsp;&nbsp;</option>
					<option value="akg">Per KG Groceries</option>
					<option value="pkt">Per PACKET Groceries</option>
					<option value="bot">Per BOTTLE Groceries</option>
					<option value="msl">MASALA Groceries</option>
					<option value="cwg" selected>CLEANING &amp; WORKERS Groceries</option>
					<option value="misc">MISCELLANEOUS Groceries</option>
			<%
		}
		else if(cgid.equals("misc")){
			%>
					<option value="all">&nbsp;&nbsp;&nbsp;- - - - - - - All - - - - - - -&nbsp;&nbsp;&nbsp;</option>
					<option value="akg">Per KG Groceries</option>
					<option value="pkt">Per PACKET Groceries</option>
					<option value="bot">Per BOTTLE Groceries</option>
					<option value="msl">MASALA Groceries</option>
					<option value="cwg">CLEANING &amp; WORKERS Groceries</option>
					<option value="misc" selected>MISCELLANEOUS Groceries</option>
			<%
		}
	%>		
			
			</select>
		</form>
	</div><br>
	<%
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			Connection con = dcon.Connect_DB();
			Statement stmt = con.createStatement();
			String sql = null;
			if(cgid==null || cgid.equals("all"))
			{
				sql = "SELECT * FROM groceries WHERE cgid in ('akg','pkt','bot') ORDER BY gid ASC";
				
			}
			else
			{
				sql="SELECT * FROM groceries WHERE cgid='"+cgid+"' ORDER BY gid ASC";
			}
			
			ResultSet rs = stmt.executeQuery(sql);
			
		%>
		<table align="center" border=1>
			<tr>
			<th width=50px>Sno</th>
			<th width=150px height=40px>GID</th>
			<th width=200px>Stock Name</th>
			<%
				if(cgid==null || cgid.equals("all") || cgid.equals("akg") || cgid.equals("pkt") || cgid.equals("bot")){
			%>
			<th>Quantity</th>
			<th width=70px>Price</th>
			<%
				}
			%>
			
			<th width=100px>Total</th>
			</tr>
		
		
		<%
		int i=1;
			while(rs.next()){
				%>
					<tr>
					<td height=30px><%= i %></td>
					<td><%= rs.getString("gid") %></td>
					<td><%= rs.getString("tname") %></td>
					<%
						if(cgid==null || cgid.equals("all") || cgid.equals("akg") || cgid.equals("pkt") || cgid.equals("bot")){
					%>
					<td><%= rs.getInt("quantity") %></td>
					<td><%= rs.getDouble("price") %></td>
					<%
						}
					%>
					<td><%= rs.getDouble("total") %></td>	
					</tr>
				<%
				i++;
			}
			if(cgid==null || cgid.equals("all")){
			Statement stmt1 = con.createStatement();
			String query = "SELECT * FROM groceries WHERE cgid in ('msl','cwg','misc') ORDER BY gid ASC";
			ResultSet rs1 = stmt1.executeQuery(query);
			while(rs1.next()){
				%>
					<tr>
					<td height=30px><%= i %></td>
					<td><%= rs1.getString("gid") %></td>
					<td><%= rs1.getString("tname") %></td>
					<td></td>
					<td></td>
					<td><%= rs1.getDouble("total") %></td>			
					</tr>
				<%
				i++;
			}
			}
			String squery = "SELECT sum(total) FROM groceries";
			ResultSet rss = stmt.executeQuery(squery);
			double total = 0.0;
			if(rss.next()){
			total = rss.getDouble(1);
			}
			con.close();
			dcon.closeConnection();
	%>
	</table>
	<div align="center">
		<h2>Total = <%= total  %></h2>
	</div>
	<br>
	<div id="print" align="center">
	<button type="submit" onclick="return window.print(); return false;">&nbsp;&nbsp;Print&nbsp;&nbsp;</button>
	</div>
</body>
</html>