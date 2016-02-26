<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style>
				body{
					background-color: black;
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
	
	<script>
			$('#type').on('change',function(){
			     var selection = $(this).val();
			    switch(selection){
			    case "akg":
			    $("#quantity").show();
			   break;
			    case "pkt":
			    	 $("#quantity").show();
					   break;
			    case "bot":
			    	 $("#quantity").show();
					   break;	
			    default:
			    $("#quantity").hide();
			    }
			});
	
	</script>
	

</head>
<body>

	<center><h2>Select Stock Type</h2></center>
		<div align="center">
			<form action="newenter.jsp" method="post">
				<select name="type" id="type">
					<option disabled>- - Select Type - -</option>
					<option value="akg">Per KG Groceries</option>
					<option value="pkt">Per PACKET Groceries</option>
					<option value="bot">Per BOTTLE Groceries</option>
					<option value="msl">MASALA Groceries</option>
					<option value="cwg">CLEANING & WORKERS Groceries</option>
					<option value="misc">MISCELLANEOUS Groceries</option>
				</select>
			</form>
		</div>
</body>
</html>