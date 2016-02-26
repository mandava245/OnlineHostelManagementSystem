<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER A NEW STUDENT DATA</title>
	
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
			font-size: 14px;
			background-color: #925A43;
			font-weight: bold;
			/* color: #391E8C; */
			color: #FFFF66;
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
					font-size: 20px;
				}
				select option{
					border-radius: 6px;
					border: 2px thin #FF6;
					text-align: center;
					text-height: 30px;
					font-size: 20px;
					width: auto;
				}
				select:hover{
					cursor: pointer;
					border: 2px groove yellow;
					border-radius: 6px;
					color: #0D5201;
					background-color: #FFF8E8;
					font-size: 20px;
					text-align: center;
				}
	</style>
	
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
		
		
	</script>
	

</head>

<body onkeydown="return (event.keyCode != 116)">

	<script>
		function validateForm()
		{
			var y = document.stuForm.year.value;
			if(y==null || y=="")
			{
				alert('Please Select the Student Year !');
				return false;
			}
			var z = document.stuForm.branch.value;
			if(z==null || z=="")
			{
				alert('Please Select the Branch !');
				return false;
			}
			var rno = document.stuForm.rollno.value;
			if(isNaN(rno)){
				alert('Roll Number should be a Number !');
				return false;
			}
			var mbl = document.stuForm.mobile.value;
			if(isNaN(mbl)){	
				alert('Mobile should be a Number !');
				return false;
			}
			var pd = document.stuForm.paid.value;
			if(isNaN(pd)){	
				alert('Already Paid should be a Number !');
				return false;
			}
			var npd = document.stuForm.notpaid.value;
			if(isNaN(npd)){	
				alert('Not Paid should be a Number !');
				return false;
			}
			var fine = document.stuForm.fine.value;
			if(isNaN(fine)){	
				alert('Fine should be a Number !');
				return false;
			}
			var cnf = confirm('Are you sure you want to Enter the new Student Data!');
			if(cnf==true){
				return true;
			}
			else{
				return false;
			}
		}
	</script>
	<div align="center">	
		<center><h2>Enter New Student Details</h2></center>
	</div>
		<form name="stuForm" action="newstuget.jsp" method="post">
	
			<table align="center" border=0 cellspacing=3 cellpadding=3>
			<tr><td><input type="text" name="name" placeholder="Student Name" size="14" autocomplete="off" required /></td><td><span>Ex: M Pavan</span></td></tr>
			<tr>
			<td>
				<select name="year" id="year">
					<option value="" selected disabled>- - Year - -</option>
					<option value="1">I/IV</option>
					<option value="2">II/IV</option>
					<option value="3">III/IV</option>
					<option value="4">IV/IV</option>
				</select>
			</td><td><span>Ex: III/IV</span></td>
			</tr>
			<tr>
			<td>
				<select name="branch">
					<option value="" selected disabled>--Branch--</option>
					<option value="CSE">CSE</option>
					<option value="ECE">ECE</option>
					<option value="Mech">Mech</option>
					<option value="IT">IT</option>
					<option value="Civil">Civil</option>
					<option value="EEE">EEE</option>
					<option value="EIE">EIE</option>	
				</select>
			</td><td><span>Ex: CSE</span></td>
			</tr>
			<tr>
				<td><input type="text" name="roomno" size="7" placeholder="Room No" autocomplete="off" required/></td>
				<td><span>Ex: 219</span></td>
			</tr>
			<tr>
				<td><input type="text" name="rollno" placeholder="Roll No" size="12" autocomplete="off" required /></td>
				<td><span>Ex: 312177110088</span></td>
			</tr>
			<tr><td><input type="text" name="notpaid" size="8" placeholder="To be Paid" autocomplete="off" required /></td><td><span>Ex: 500 </span></td></tr>
			<tr><td><input type="text" name="paid" size="8" placeholder="Already Paid" autocomplete="off" required /></td><td><span>Ex: 4850</span></td></tr>
			<tr><td><input type="text" name="fine" size="8" placeholder="Fine" autocomplete="off" required /></td><td><span>Ex: 150</span></td></tr>
			<tr><td><input type="mobile" name="mobile" placeholder="Mobile" size="11" pattern="\d{10}" autocomplete="off" required /></td><td><span>Ex: 9640881461</span></td></tr>
			</table>
			<br><input type="hidden" name="hidden" value="PavanMandava" />
			<center><button type="submit" name="submit" onclick="return validateForm()">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset">Reset</button></center>
			
		</form>
</body>
</html>