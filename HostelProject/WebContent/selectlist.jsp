<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SELECT STOCK</title>

<style type="text/css">
	table{
		font-size: 28px;
	}
	label{
		color: #7C3F51;
		font-weight: bold;
	}
	label:hover{
		cursor: pointer;
		background-color: #FBFDB5;
		color: red;
	}
	button{
		font-family: Cambria;
		font-size: 28px;
		font-weight: bold;
		border-radius: 5px;
		border: 2px solid red;
		color: #1C4593;
		background-color: #CBEFE8;
	}
	button:hover{
		cursor: pointer;
		border: 2px groove green;
		color: #994F22;
		background-color: #F3EA30;
	}
	h1{
		color: #152D57;
		font-family: Cambria;
	}
	center b{
		font-family: Cambria;
		font-size: 20px;
		color: #B41B48;
	}
</style>
	
</head>
<body>

<%@ page import="connect.*" %>
<%@ page import="java.sql.*" %>

<form action="showstock.jsp" method="post">

<h1 align="center">Please Select the Stock Items</h1>
<center><b>*&nbsp; Uncheck the below check boxes if a Particular Item is not used&nbsp; *</b></center><br>
<div align="center" style="width:15;">
	<%
		if(request.getParameter("hidden")!=null){
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			Connection con = dcon.Connect_DB();
			
			int count = 0;
			Statement st = con.createStatement();
			String sql = "SELECT count(*) FROM GROCERIES";
			ResultSet rSet = st.executeQuery(sql);
			rSet.next();
			count = rSet.getInt(1);
		String dname[] = new String[count+3];
		String dgid[] = new String[count+3];
		String tname[] = new String[count+3];
		
		Statement stmt = con.createStatement();
		String query = "SELECT gid,name,tname FROM groceries";
		ResultSet rs = stmt.executeQuery(query);
		int j=0;
		while(rs.next()){
			
			dname[j]=rs.getString("name");//used as id name for <input type="checkbox"> tag
			tname[j]=rs.getString("tname");
			dgid[j]=rs.getString("gid");  //used as name and value for <input> tag
			j++;
					
		}
		
		//String array for storing all groceries in Telugu
		//String tname[]= {"బియ్యం","వేపిన శనగపప్పు","వేరు శనగగుళ్ళు","బియ్యం పిండి","మైదా పిండి","ఇడ్లి రవ్వ","శనగ పిండి","పంచదార","పెసర పప్పు","మినప గుళ్ళు","కంది పప్పు","చింతపండు","పచ్చి శనగపప్పు","గోధుమ పిండి","టీ పొడి","బెల్లం","పసుపు","కారం","Salt","ఆవాలు","జీలకర్ర","మెంతులు","మిరపకాయిలు","ధనియాలు","మిరియాలు","బొంబాయి రవ్వ","గోధుమ రవ్వ","డాల్డ","నెయ్యి","తినే సోడా","జీడి నూక","Tasting Salt","వెల్లుల్లి","నిర్మా సర్ఫ్","అగ్గి పెట్టెలు","Bleaching","పెసలు","సాయి మినపప్పు","కళ్ళు ఉప్పు బస్తా","గ్రీన్ పీస్","మెంతు పిండి","ఆన పిండి","నిమ్మ ఉప్పు","బాసుమతి రైస్","కొబ్బరి కోరు","పచ్చి శనగలు","ఎండు కొబ్బరి","ధనియాల పొడి","కార్న్ ఫ్లొర్","సేమ్య","సగ్గు బియ్యం","మిల్ మేకర్","Chicken Masala","General Masala","బియ్యం రవ్వ","సాంబారు ","రసం","అప్పడాలు","జీడి పప్పు","Biscuits","Tomato Sauce","Chilli Sauce","Soya Sauce","Venigar","ఇంగువ","Refined Oil","Phenol","లవంగాలు","యాలకులు","గసగసాలు","దాల్చిన చెక్క","అనాస పువ్వు","పలావ్ ఆకు","పెప్పర్","జాజికాయలు","నువ్వులు","మరాఠి మొగ్గ","జాపత్రి","వాము","షాజీర","మెంతు ఆకు","పుచ్చ పప్పు","Colours","పుల్లల చీపుర్లు","కుంచి చీపుర్లు","పీచులు","గమేక్షన్","Exo Soaps","Santoor","ZanduBalm","Burnol","Cybol","Mineral Water","Gas","Sweets","Bakery Items","Eggs","Vegetables","Milk","Non-Vegetarian","Others"};
		
		for(int i=0;i<count;i=i+3) //Loop for printing all groceries
		{
	%>
		<table align="center" width="750" cellspacing="4">
		<tr>
		
		<%
			if(dname[i+1]==null && dname[i+2]==null){
		%>
		
		<td align="left" width="250">
		<input type="checkbox" id="<%= dname[i] %>" name="<%= dgid[i] %>" value="<%= dgid[i] %>" checked/>
		<label for="<%= dname[i] %>"><b><%= tname[i] %></b></label>&nbsp;
		</td>
		
		<%
			}
			else if(dname[i+2]==null){
		%>
		
		<td align="left" width="250">
		<input type="checkbox" id="<%= dname[i] %>" name="<%= dgid[i] %>" value="<%= dgid[i] %>" checked/>
		<label for="<%= dname[i] %>"><b><%= tname[i] %></b></label>&nbsp;
		</td>
		<td align="left" width="250">
		<input type="checkbox" id="<%= dname[i+1] %>" name="<%= dgid[i+1] %>" value="<%= dgid[i+1] %>" checked/>
		<label for="<%= dname[i+1] %>"><b><%= tname[i+1] %></b></label>&nbsp;
		</td>
		
		<%
			}
			else{
		%>
		
		<td align="left" width="250">
		<input type="checkbox" id="<%= dname[i] %>" name="<%= dgid[i] %>" value="<%= dgid[i] %>" checked/>
		<label for="<%= dname[i] %>"><b><%= tname[i] %></b></label>&nbsp;
		</td>
		<td align="left" width="250">
		<input type="checkbox" id="<%= dname[i+1] %>" name="<%= dgid[i+1] %>" value="<%= dgid[i+1] %>" checked/>
		<label for="<%= dname[i+1] %>"><b><%= tname[i+1] %></b></label>&nbsp;
		</td>
		<td align="left" width="250">
		<input type="checkbox" id="<%= dname[i+2] %>" name="<%= dgid[i+2] %>" value="<%= dgid[i+2] %>" checked/>
		<label for="<%= dname[i+2] %>"><b><%= tname[i+2] %></b></label>&nbsp;
		</td>
		
		<%
			}
		%>
		
		</tr>
		</table>
		
	<%		
		}
	%>
	
	<br>
	
	<input type="hidden" name="hidden" value="Mandava" />
	<input type="hidden" name="count" value="<%= count %>" />
	<button type="submit">Enter</button>
	<%
		}
		else{
			response.sendRedirect("confirmdates.jsp");
		}
	%>
</div>
</form>
<br>
</body>
</html>