<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SELECT STOCK ITEM TYPE</title>

	<style>
		a{
			text-decoration: none;
			font-weight: bold;
			color: #88047B;
			background-color: #75FFBA;
			cursor: pointer;
			border: 2px groove green;
			border-radius: 5px;
		}
		a:hover{
			color: #611414;
			background-color: #D6D6D6;
			border-radius: 2px groove yellow;
		}
	</style>
	
	<script>
		document.onmousedown=disableclick;
		status="Right Click Disabled";
		function disableclick(event)
		{
		  if(event.button==2)
		   {
		     alert(status);
		     return false;    
		   }
		}
	</script>

</head>
<body oncontextmenu="return false">
	<a href="" onclick="window.open('newenter.jsp','pavan','width=450,height=480,resizable=0,scrollbars=0,toolbar=no,status=no,notop=0,left=150'); return false;">Add Stock</a><br>
	<br>
	<a href="" onclick="window.open('newstuenter.jsp','mandava','width=450,height=560,resizable=0,scrollbars=0,toolbar=no,status=no,notop=0,left=150'); return false;">Add Student</a><br>
	<br>
	<br>
	
	<a href="modifyst.jsp">Modify Student Data</a><br><br>
	<a href="modifygr.jsp">Modify Stock Item</a>
	
</body>
</html>