<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER A NEW ITEM</title>

	<style>
		@charset "utf-8";
		/* CSS Document */
		
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
		body{
			position: absolute;
			background-attachment: fixed;
			/* background-color: #EAEAD5; */
			 background-color: black;
		}
		span{
			font-size: 15px;
			font-weight: bold;
			/* color: #391E8C; */
			color: #FFFF66;
			background-color: brown;
		}
		h2{
			font-family: Cambria;
			font-weight: bold;
			/* color: #9D063F; */
			color: yellow;
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
	</style>
</head>
	<body onkeydown="return (event.keyCode != 116)">
	
	<script type="text/javascript">
	
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
		
		function formv(){
			var select=document.newForm.type.value;
			if(select==null || select==""){
				alert('Please select the Stock Type of Stock Item!');
				return false;
			}
			var cnf = confirm('Are you sure you want to Enter this new Stock Item!');
			if(cnf==true){
				return true;
			}
			else{
				return false;
			}
		}
		
		function validate(){
			var type=document.newForm.type.value;
			if(type=="akg" || type=="pkt" || type=="bot"){
				document.getElementById("quantity").disabled=false;
				return false;
			}
			else{
				document.getElementById("quantity").disabled=true;
				return false;
			}
		}
	</script>
	
	  <div align="center">
		<h2><b>Enter a New Stock Item</b></h2>
		  <form name="newForm" action="newget.jsp" method="post">	
		  		<select name="type" id="type" onChange="validate()" required>
					<option value="" disabled selected>- - Select Type - -</option>
					<option value="akg">Per KG Groceries</option>
					<option value="pkt">Per PACKET Groceries</option>
					<option value="bot">Per BOTTLE Groceries</option>
					<option value="msl">MASALA Groceries</option>
					<option value="cwg">CLEANING & WORKERS Groceries</option>
					<option value="misc">MISCELLANEOUS Groceries</option>
				</select>
				<br><br>
			<table cellpadding=3 cellspacing=3>
			    <tr><td><input type="text" name="tname" placeholder="Telugu Name" size="10" autocomplete="off" required/></td><td><span>Ex: పంచదార</span></td></tr>
			    <tr><td><input type="text" name="name" placeholder="Stock Name" size="9" autocomplete="off" required /></td><td><span>Ex: panchadara</span></td></tr>
			    <tr><td><input id="quantity" type="number" min=1 max=5000 name="quantity" placeholder="Quantity" size="6" autocomplete="off" required/></td><td><span>Ex: 50</span></td></tr>
			    <tr><td><input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="6" autocomplete="off" required /></td><td><span>Ex: 44.50 (per 1 Quantity)</span></td></tr>
			</table><br>
			    <center><input type="hidden" name="hidden" value="PavanMandava"><button type="submit" onClick="return formv()">Enter</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset">Reset</button></center>
			  
  		  </form>  
	  </div>
	</body>
</html>