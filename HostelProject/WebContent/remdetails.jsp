<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER STUDENT ID'S</title>
</head>
<style>
	h2{
	font-family: Cambria;
}
button{
	color: #F2095A;
	font-family: Cambria;
	font-size: 28px;
	font-weight: bold;
	border: 2px solid #DDD3DE;
	border-radius: 5px 5px 5px 5px;
	background-color: #EFDCCF;
}
button:hover{
	border-radius: 5px 5px 5px 5px;
	cursor: pointer;
	font-family: Cambria;
	font-size: 28px;
	color: #02AFBD; 
	font-weight: bold;
	border: 2.5px groove #DDD3DE;
	background-color: #E6CEB7;
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
	font-weight: bold;
}
a{
	text-decoration: none;
	font-family: Cambria;
	font-size: 20px;
	font-weight: bold;
}
a:hover{
	font-family: Cambria;
	font-size: 20px;
	color: red;
}
a:active{
	color:red;
}
</style>
<body>
<%
	if(request.getParameter("hidden")!=null){
	int count = Integer.parseInt(request.getParameter("count"));
%>
	<form action="giverem.jsp" method="post">
	<table align="center" width=auto border="0">
		<tr><td><center>
			<h2>Enter Student ID's to give Remission :</h2>
			<table border=0>
			<%
				for(int i=0;i<count;i++){
					
			%>
					<tr><td><%= (i+1) %></td><td><input type="text" name="param<%= i %>" placeholder="Student ID" size="7" required /></td>
			<%
				}
			%>
			
			<tr><td><input type="hidden" name="hidden" value="PavanMandava" />
			<input type="hidden" name="count" value="<%= count %>" />
			</td><td><button type="submit">Enter</button></td>
			</table>
		</center></td>
		
		<td align="center">
			<a href="studentlist.jsp" target="_blank">Click Here</a> <i><b>to see Student List</b></i><br><b>or<br>Search below</b>	
		</td>
		
	</table>
	</form>
	<div align="center">
		<%@ include file="search.jsp" %>
	</div>
<%	
	}
	else{
%>
		<script>
			alert('Please Enter the Details First !');
		</script>	
<%
		response.sendRedirect("genremission.jsp");
	}
%>
</body>
</html>