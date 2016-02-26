<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER STUDENT ID</title>

	<style>		
			#fulldetails input{
				border: 2px solid #D5DFA8;
				border-radius: 6px;
				color: #65682D;
				background-color: #F4FAFF;
				font-size: 20px;
				text-align: center;
				font-weight: bold;
				font-family: Andalus;
			}
			#fulldetails input:hover{
				cursor: text;
				border: 2px groove yellow;
				border-radius: 6px;
				font-size: 20px;
				color: #0D5201;
				background-color: #FFF8E8;
			}
			#fulldetails button{
				cursor: pointer;
				color: #F2095A;
				font-family: Cambria;
				font-size: 22px;
				font-weight: bold;
				border: 2px solid #38A907;
				border-radius: 6px 5px 6px 5px;
				background-color: #D2D2D2;
			}
			#fulldetails button:hover{
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
			#fulldetails center h2{
				font-fmaily: Cambria;
				font-weight: bold;
				color: #612349;
			}
	</style>

</head>
<body>
<br>
<div id="fulldetails" align="center">
<center><h2>Enter Student ID to <i>VIEW FULL DETAILS</i></h2></center>
	<form action="fulldetails.jsp" method="post">

	<center>
	<span>Student ID :</span> &nbsp;<input type="text" name="sid" size="4" placeholder="Enter SID" autofocus required/><br><br>
    <button type="submit">Enter</button>
    </center>
    
    </form>

</div>
<br>

<div align="center">

<%@ include file="search.jsp" %>

</div>
</body>
</html>