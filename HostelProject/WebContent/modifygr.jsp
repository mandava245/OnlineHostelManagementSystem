<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER STOCK ID TO MODIFY</title>

<style>
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
			span{
				font-family: Cambria;
				font-weight: bold;
				font-size: 22px;
			}
	</style>

</head>
<body>
<div align="center">
<br>
	<form action="getmodifygr.jsp" method="post">
	<input type="hidden" name="hidden" value="PavanMandava" />
	<span>Enter Stock Item ID: </span>&nbsp;<input type="text" name="gid" size="4" placeholder="Stock Id" required/>
	<br><br>
	
	<button type="submit">Submit</button>
	</form>
</div>

</body>


</html>