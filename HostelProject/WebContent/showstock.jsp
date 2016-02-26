<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SHOWING STOCK</title>

<style type="text/css">
@CHARSET "utf-8";
body{
	font-size: 20px;
	color: #8F4B34;
}
#header{
	font-size: 28px;
	font-weight: bold;
	font-family: Cambria;
	color: #EC3C00;	
}
#tableth{
	color: #709629;
	font-size: 24px;
}
#fixed{
	position: relative;
	font-size: 24px;
	text-decoration: underline;
}
td{
	color: #C811B6;
}
input{
	
	border: 2px solid #D5DFA8;
	border-radius: 7px 7px 7px 7px;
	color: #65682D;
	background-color: #F4FAFF;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	font-family: Andalus;
}
input:hover{
	cursor: text;
	border: 2px groove #F80E8E;
	border-radius: 7px 7px 7px 7px;
	color: #0D5201;
	background-color: #FFF8E8;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
}
button{
	color: #F2095A;
	font-family: Comic Sans MS;
	font-size: 22px;
	font-weight: bold;
	border: 2px solid #DDD3DE;
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
	border: 2px groove #DDD3DE;
	background-color: #E6CEB7;
}

</style>

</head>
  <body>
	<%@ page import="connect.*" %>
	<%@ page import="java.sql.*" %>
	<%
		if(request.getParameter("hidden")!=null){
			int count = Integer.parseInt(request.getParameter("count"));
			//Checking Hidden Parameter
		
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			Connection con = dcon.Connect_DB();
			int cnt = 0;
			Statement st1 = con.createStatement();
			String qry = "select count(*) from GROCERIES where CGID IN ('akg','pkt','bot')";
			Statement st = con.createStatement();
			String squery = "SELECT gid FROM groceries WHERE cgid in ('akg','pkt','bot')";
			ResultSet rSet3 = st.executeQuery(squery);
			ResultSet rSet1 = st1.executeQuery(qry);
			rSet1.next();
			cnt = rSet1.getInt(1);
			
			session.setAttribute("cnt", cnt);
			
			 String tmpname[] = new String[count]; //Stirng array for storing groceries ID's with nulls
			 String delname[] = new String[count]; //String array for groceries ID's after eliminating nulls
			 int i=0;
			 while(rSet3.next())
			 { // Loop for checking all parameters with nulls
			   tmpname[i] = request.getParameter(rSet3.getString("gid")); 
			   i++;
			 }
			 
			 int k=0;
			 for(int m=0;m<i;m++){ // Loop for eliminating null parameters
				 if(tmpname[m]!=null){
					 delname[k] = tmpname[m];
					 k++;
				 }
			 }
		 
		//String tname[]= {"బియ్యం","వేపిన శనగపప్పు","వేరు శనగగుళ్ళు","బియ్యం పిండి","మైదా పిండి","ఇడ్లి రవ్వ","శనగ పిండి","పంచదార","పెసర పప్పు","మినప గుళ్ళు","కంది పప్పు","చింతపండు","పచ్చి శనగపప్పు","గోధుమ పిండి","టీ పొడి","బెల్లం","పసుపు","కారం","Salt","ఆవాలు","జీలకర్ర","మెంతులు","మిరపకాయిలు","ధనియాలు","మిరియాలు","బొంబాయి రవ్వ","గోధుమ రవ్వ","డాల్డ","నెయ్యి","తినే సోడా","జీడి నూక","Tasting Salt","వెల్లుల్లి","నిర్మా సర్ఫ్","అగ్గి పెట్టెలు","Bleaching","పెసలు","సాయి మినపప్పు","కళ్ళు ఉప్పు బస్తా","గ్రీన్ పీస్","మెంతు పిండి","ఆన పిండి","నిమ్మ ఉప్పు","బాసుమతి రైస్","కొబ్బరి కోరు","పచ్చి శనగలు","ఎండు కొబ్బరి","ధనియాల పొడి","కార్న్ ఫ్లొర్","సేమ్య","సగ్గు బియ్యం","మిల్ మేకర్","Chicken Masala","General Masala","బియ్యం రవ్వ","సాంబారు ","రసం","అప్పడాలు","జీడి పప్పు","Biscuits","Tomato Sauce","Chilli Sauce","Soya Sauce","Venigar","ఇంగువ","Refined Oil","Phenol","లవంగాలు","యాలకులు","గసగసాలు","దాల్చిన చెక్క","అనాస పువ్వు","పలావ్ ఆకు","పెప్పర్","జాజికాయలు","నువ్వులు","మరాఠి మొగ్గ","జాపత్రి","వాము","షాజీర","మెంతు ఆకు","పుచ్చ పప్పు","Colours"};
		
		//Global array declaration for storing details of the selected groceries
		String dsid[] = new String[cnt];
		String dname[] = new String[cnt];
		String tname[] = new String[cnt];
		String dquantity[] = new String[cnt];
		String dprice[] = new String[cnt];
		String dtotal[] = new String[cnt];
		
		String query = "SELECT gid,name,tname,quantity,price,total FROM groceries WHERE gid in ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		
		ResultSet rs = null;
		for(int j=0;j<k;j++){
			
			pstmt.setString(1,delname[j]);
			rs = pstmt.executeQuery();
		
		while(rs.next()){
			
			if(j<k){
				//Storing Table values into arrays for calculation and for Display
			dsid[j] = rs.getString("gid");
			dname[j] = rs.getString("name");
			tname[j] = rs.getString("tname");
			dquantity[j] =rs.getString("quantity");
			dprice[j] = rs.getString("price");
			dtotal[j] = rs.getString("total");
			}
		}		
	}
	%>
	<script>
		alert('Please Enter the Remaining Stock Carefully!');
	</script>
	
	<div align="center" id="header">To Calculate the Mess Bill Enter the Remaining Stock</div><br>
	  <form action="billcalc.jsp" method="post">
		<table width="700" height="190" align="center" cellpadding="2" cellspacing="2">
		<tr id="fixed"><th></th><th>Quantity</th><th>Price</th><th>Total</th><th>Remaining Stock</th></tr>
		<%
		
		for(int j=0;j<cnt;j++){
			
			if(dquantity[j]!=null && dprice[j]!=null && dtotal[j]!=null){
			
		%>		
		  
			<tr align="center"><td id="tableth"><b><%= tname[j] %></b></td><td><%= dquantity[j] %></td><td><%= dprice[j] %></td><td><%= dtotal[j] %></td><td><input type="number" min="0" max="<%= dquantity[j] %>" name="<%= dsid[j] %>" size="1" autofocus autocomplete="off" required/></td></tr>
			
		<%
		}
		}
		%>
		<tr><td></td><td></td><td></td><td></td><td align="center"><input type="hidden" name="hidden" value="PavanMandava" /><input type="hidden" name="dcnt" value="<%= k %>" /><input type="hidden" name="count" value="<%= count %>" /><button type="submit">Enter</button></td></tr>
		</table>
	  </form>
	 <%
		}
		else{
			response.sendRedirect("selectlist.jsp");
		}
	 %> 
	  
    </body>
</html>