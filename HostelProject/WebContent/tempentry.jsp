<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ page import="java.sql.*" %>
	<%@ page import="connect.*" %>

	<%
	String tmpname[]= {"బియ్యం","వేపిన శనగపప్పు","వేరు శనగగుళ్ళు","బియ్యం పిండి","మైదా పిండి","ఇడ్లి రవ్వ","శనగ పిండి","పంచదార","పెసర పప్పు","మినప గుళ్ళు","కంది పప్పు","చింతపండు","పచ్చి శనగపప్పు","గోధుమ పిండి","టీ పొడి","బెల్లం","పసుపు","కారం","Salt","ఆవాలు","జీలకర్ర","మెంతులు","మిరపకాయిలు","ధనియాలు","మిరియాలు","బొంబాయి రవ్వ","గోధుమ రవ్వ","డాల్డ","నెయ్యి","తినే సోడా","జీడి నూక","Tasting Salt","వెల్లుల్లి","నిర్మా సర్ఫ్","అగ్గి పెట్టెలు","Bleaching","పెసలు","సాయి మినపప్పు","కళ్ళు ఉప్పు బస్తా","గ్రీన్ పీస్","మెంతు పిండి","ఆన పిండి","నిమ్మ ఉప్పు","బాసుమతి రైస్","కొబ్బరి కోరు","పచ్చి శనగలు","ఎండు కొబ్బరి","ధనియాల పొడి","కార్న్ ఫ్లొర్","సేమ్య","సగ్గు బియ్యం","మిల్ మేకర్","Chicken Masala","General Masala","బియ్యం రవ్వ","సాంబారు ","రసం","అప్పడాలు","జీడి పప్పు","Biscuits","Tomato Sauce","Chilli Sauce","Soya Sauce","Venigar","ఇంగువ","Refined Oil","Phenol","లవంగాలు","యాలకులు","గసగసాలు","దాల్చిన చెక్క","అనాస పువ్వు","పలావ్ ఆకు","పెప్పర్","జాజికాయలు","నువ్వులు","మరాఠి మొగ్గ","జాపత్రి","వాము","షాజీర","మెంతు ఆకు","పుచ్చ పప్పు","Colours","పుల్లల చీపుర్లు","కుంచి చీపుర్లు","పీచులు","గమేక్షన్","Exo Soaps","Santoor","ZanduBalm","Burnol","Cybol","Mineral Water","Gas","Sweets","Bakery Items","Eggs","Vegetables","Milk","Non-Vegetarian","Others"};
	
	Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
	Connection con = dcon.Connect_DB();
	String sql = "UPDATE groceries SET tname=? where gid=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	int cnt = 0;
	for(int i=0;i<101;i++){
		pstmt.setString(1,tmpname[i]);
		pstmt.setString(2,"groc"+(i+1));
		cnt = cnt + pstmt.executeUpdate();
	}
	%>
	<%= cnt %>
	

</body>
</html>