<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>ENTER STUDENT ID</title>

<style>
			#billpaid input{
				border: 2px solid #D5DFA8;
				border-radius: 6px;
				color: #65682D;
				background-color: #F4FAFF;
				font-size: 20px;
				text-align: center;
				font-weight: bold;
				font-family: Andalus;
			}
			#billpaid input:hover{
				cursor: text;
				border: 2px groove yellow;
				border-radius: 6px;
				font-size: 20px;
				color: #0D5201;
				background-color: #FFF8E8;
			}
			#billpaid button{
				cursor: pointer;
				color: #F2095A;
				font-family: Cambria;
				font-size: 22px;
				font-weight: bold;
				border: 2px solid #38A907;
				border-radius: 6px 5px 6px 5px;
				background-color: #D2D2D2;
			}
			#billpaid button:hover{
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
			table{
				font-family: Cambria;
			}
			center h2{
				font-family: Comic Sans MS;
				font-weight: bold;
				color: #4E2260;
			}
</style>

</head>

<body>
<br>

<center><h2>ENTER THE DETAILS PAID MESS BILL</h2></center><br>
<div id="billpaid" align="center">
	<form action="paidbillentry.jsp" method="post">

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
