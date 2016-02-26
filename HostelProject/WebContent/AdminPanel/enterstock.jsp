<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ENTER STOCK DETAILS</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!--   <link rel="stylesheet" type="text/css" href="adstyle.css" /> -->
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="modernizr-1.5.min.js"></script>
  
  <style type="text/css">
  	@font-face { 
  font-family: Droid Sans; 
    src: url('DroidSans-webfont.eot'); 
    src: local("Droid Sans"), url('DroidSans-webfont.woff'); 
} 

@font-face { 
  font-family: News Cycle; 
    src: url('NewsCycle-Regular.eot'); 
    src: local("News Cycle"), url('NewsCycle-Regular.ttf'); 
} 

html { 
  height: 100%;
}

* { 
  margin: 0;
  padding: 0;
}

/* tell the browser to render HTML 5 elements as block */
article, aside, figure, footer, header, hgroup, nav, section { 
  display:block;
}

body { 
  font: normal .80em 'Droid Sans', arial, sans-serif;
  background: #F9F9F9;
  color: #444;
}

p { 
  padding: 0 0 16px 0;
  line-height: 1.7em;
}

img { 
  border: 0;
}

h1, h2, h3, h4, h5, h6 { 
  color: #362C20;
  letter-spacing: 0em;
  padding: 0 0 5px 0;
}

h1, h2, h3 { 
  font: normal 140% 'News Cycle', arial;
  margin: 0 0 15px 0;
  padding: 15px 0 5px 0;
  color: #222;
}

h2 { 
  font-size: 160%;
  padding: 9px 0 5px 0;
}

h3 { 
  font-size: 140%;
  padding: 5px 0 0 0;
}

h4, h6 { 
  color: #555;
  padding: 0 0 5px 0;
  font: normal 120% 'Droid Sans', arial, sans-serif;
}

h5, h6 { 
  color: #999;
  font: italic 100% 'Droid Sans', arial;
  padding: 0 0 15px 0;
}

h6 { 
  font: normal 100% 'Droid Sans', arial;
}

a, a:hover { 
  outline: none;
  text-decoration: none;
  color: #58B5D6;
}

a:hover { 
  text-decoration: none;
  cursor: pointer;
}

blockquote { 
  margin: 20px 0; 
  padding: 10px 20px 0 20px;
  border: 1px solid #E5E5DB;
  background: #FFF;
}

ul { 
  margin: 2px 0 22px 17px;
}

ul li { 
  list-style-type: circle;
  margin: 0 0 6px 0; 
  padding: 0 0 4px 5px;
  line-height: 1.5em;
}

ol { 
  margin: 8px 0 22px 20px;
}

ol li { 
  margin: 0 0 11px 0;
}

.left { 
  float: left;
  width: auto;
  margin-right: 10px;
}

.right { 
  float: right; 
  width: auto;
  margin-left: 10px;
}

.center { 
  display: block;
  text-align: center;
  margin: 20px auto;
}

#main, #container, #logo, #site_content, footer { 
  margin-left: auto; 
  margin-right: auto;
}

#main {
  background: #EFF3E5;
}


header { 
 /* background: #444 url(logo.png) no-repeat;*/
  height: 150px;
}

#logo { 
  width: 1000px;
  height: 140px;
  background: transparent;
  color: #888;
  padding: 0 0 20px 0;  
}

#logo #logo_text { 
  width: 450px;
  left: 0;
  padding: 10px 20px 20px 0;
}

#logo h1, #logo h2 { 
  font: normal 250% 'News Cycle', arial, sans-serif;
  border-bottom: 0;
  text-transform: none;
  margin: 0;
}

#logo_text h1, #logo_text h1 a, #logo_text h1 a:hover { 
  padding: 0;
  color: #555;
  text-decoration: none;
}

#logo_text h1 a .logo_colour { 
  color: #09D4FF;
}

#logo_text a:hover .logo_colour { 
  color: #FFF;
}

#logo_text h2 { 
  font-size: 140%;
  padding: 0 0 0 0;
  color: #777;
}

nav { 
	width: 1000px;
	border-radius: 6px;
  height: 44px;
  margin: -30px auto 0 auto;
  color: #fef4e9;
  background: #555747;
} 

#menu_container { 
  width: 1000px;
  text-align:center;
  margin: 0 auto 0 auto;
}

#site_content { 
  width: 1000px;
  overflow: hidden;
  margin: 0px auto 0 auto;
  padding: 15px 0 25px 0;
  text-shadow: 0 1px #FFF;
} 

.content { 
  text-align: left;
  width: 1000px;
  margin: 0 0 15px 0;
  float: left;
  font-size: 120%;
  padding: 14px 0 0 0;
}
  
.content ul { 
  margin: 2px 0 22px 0px;
}

.content ul li, .sidebar ul li { 
  list-style-type: none;
  background: url(bullet.png) no-repeat;
  margin: 0 0 0 0; 
  padding: 0 0 4px 28px;
  line-height: 1.5em;
}

footer { 
  font: 100% 'Droid Sans', arial, sans-serif;
  height: 100px;
   padding: 28px 0 5px 0;
  text-align: center; 
  background: #555747;
  color: #FFF;
  margin: 0;
  border-top: 6px solid #82CC2A;
}

footer p { 
  line-height: 1.7em;
  padding: 0 0 10px 0;
}

footer a { 
  color: #FFF;
  text-decoration: none;
}

footer a:hover { 
  color: #FFF;
  text-decoration: underline;
}

.separator { 
  width: 100%;
  height: 0;
  border-top: 1px solid #D9D5CF;
  border-bottom: 1px solid #FFF;
  margin: 0 0 20px 0;
}
  
/* scroll to top */
#scroll { 
  position: relative; 
  width: 1000px;
  margin: 0 auto;
  bottom: 15px; 
  right: 0;
  background: red;
  padding: 0;
}
  
#scroll a { 
  float: right;
  margin: 0 0 0 0; 
  padding: 0 0 0 0;
}
  
#scroll a img { 
  float: right;
  padding: 0 0 0 0;
  margin: 0;
}





/**
Stylesheet for SooperFish by www.SooperThemes.com
Author: Jurriaan Roelofs
**/

/* Configuration of menu width */
html body ul.sf-menu ul,html body ul.sf-menu ul li { 
  width: auto;
}

html body ul.sf-menu ul ul { 
  margin: 0 0 0 220px;
}

/* Framework for proper showing/hiding/positioning */
ul.sf-menu,ul.sf-menu * { 
  margin: 0;
  padding: 0;
}

ul.sf-menu { 
  display: block;
  position: relative;
}
  
ul.sf-menu li { 
  display: block;
  list-style: none;
  float: left;
  position: relative;
}
  
ul.sf-menu li:hover { 
  visibility: inherit; /* fixes IE7 'sticky bug' */ 
}

ul.sf-menu a { 
  display: block;
  position: relative;
}
  
ul.sf-menu ul { 
  position: absolute;
  left: 0;
  top: auto;
  left: -999999px;
}
  
ul.sf-menu ul a { 
  zoom: 1; /* IE6/7 fix */ 
}

ul.sf-menu ul li { 
  float: left; /* Must always be floated otherwise there will be a rogue 1px margin-bottom in IE6/7 */
}
  
ul.sf-menu ul ul { 
  top: 0;
  margin: 0 0 0 150px;
}

ul.sf-menu li:hover ul,ul.sf-menu li:focus ul,ul.sf-menu li.sf-hover ul, 
ul.sf-menu ul li:hover ul,ul.sf-menu ul li:focus ul,ul.sf-menu ul li.sf-hover ul,
ul.sf-menu ul ul li:hover ul,ul.sf-menu ul ul li:focus ul,ul.sf-menu ul ul li.sf-hover ul,
ul.sf-menu ul ul ul li:hover ul,ul.sf-menu ul ul ul li:focus ul,ul.sf-menu ul ul ul li.sf-hover ul { 
  left: auto;
}
  
ul.sf-menu li:hover ul ul,ul.sf-menu li:focus ul ul,ul.sf-menu li.sf-hover ul ul,
ul.sf-menu ul li:hover ul ul,ul.sf-menu ul li:focus ul ul,ul.sf-menu ul li.sf-hover ul ul,
ul.sf-menu ul ul li:hover ul ul,ul.sf-menu ul ul li:focus ul ul,ul.sf-menu ul ul li.sf-hover ul ul,
ul.sf-menu ul ul ul li:hover ul ul,ul.sf-menu ul ul ul li:focus ul ul,ul.sf-menu ul ul ul li.sf-hover ul ul { 
  left: -999999px;
}

/* autoArrows CSS */
span.sf-arrow { 
  width: 7px;
  height: 7px;
  position: absolute;
  top: 20px;
  right: 5px;
  display: block;
  background: url(arrows-white.png) no-repeat 0 0;
  overflow: hidden; /* making sure IE6 doesn't overflow and expand the box */
  font-size: 1px;
}

ul ul span.sf-arrow { 
  right: 10;
  top: 20px;
  background-position: 0 100%;
}

/* Theming the menu */
ul#nav { 
/*  float: left;*/
text-align: center;
}

ul#nav ul { 
text-align: center;
  background: #555747;
  margin-top: 5px;
  padding-bottom: 15px;
}
ul#nav ul li{
	width: 220px;
	text-align: center;	
}
ul#nav li a { 
  padding:5px 20px 6px 20px;
  font: 150% 'News Cycle', arial, sans-serif;
  text-shadow: 1px 1px #222;
  text-decoration: none;
  color:#FFF;
  margin-right: 30px;
}

ul#nav li a:hover,ul#nav li a:focus { 
  color: #FFF;
  text-decoration: none;
  cursor: pointer;
}
.sf-menu #selected a{
  font-weight: bold;
  color: #FC0;	
}
  	
  </style>

		<style>
				@charset "utf-8";
				/* CSS Document */
				h2{
					font-family: Comic Sans MS;
					color: #AD1897;
					font-weight: bold;
				}
				#lists{
					text-align: center;
					border-radius: 6px;
					border: 3px solid #D5DFA8;
					color: #65682D;
					background-color: #F4FAFF;
					font-size: 24px;
					height: 45px;
				}
				#lists option{
					border-radius: 6px;
					border: 2px thin #FF6;
					text-align: center;
					text-height: 30px;
					font-size: 24px;
					width: auto;
				}
				#lists:hover{
					cursor: pointer;
					border: 3px solid #F80E8E;
					border-radius: 6px;
					color: #0D5201;
					background-color: #FFF8E8;
					font-size: 24px;
					height: 45px;
					text-align: center;
				}
				input{
					border: 2px solid #D5DFA8;
					border-radius: 7px 7px 7px 7px;
					color: #65682D;
					background-color: #F4FAFF;
					font-size: 20px;
					text-align: center;
					font-weight: bold;
					font-family: Andalus;
				}
				input:hover{
					cursor: pointer;
					border: 2px solid #F80E8E;
					border-radius: 7px 7px 7px 7px;
					color: #0D5201;
					background-color: #FFF8E8;
					font-size: 20px;
					text-align: center;
					font-weight: bold;
					font-family: Andalus;
				}
				button{
					cursor: pointer;
					color: #F2095A;
					font-family: Comic Sans MS;
					font-size: 22px;
					font-weight: bold;
					border: 4px solid #DDD3DE;
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
					border: 4px solid #DDD3DE;
					background-color: #E6CEB7;
				}
				select option{
					text-align: center;
				}
				h1{
					font-family: Cambria;
					color: #9C9923;
				}
		</style>
</head>
<body>
		<script>
 				function formValidation(){
 					
 					var x = document.akgForms.pergroc.value;
					if(x=="" || x==null){
 						alert('Stock Item Must be selected..!!');
 						return false;	
 					}
					
 				}
 				
				function formValidate1(){	
 					var a = document.pktForms.pergroc.value;
 					if(a=="" || a==null){
 						alert('Stock Item Must be selected..!!');
						return false;	
 					}
 					
				}
				
				function formValidate2(){
 					var b = document.botForms.pergroc.value;
 					if(b=="" || b==null){
 						alert('Stock Item Must be selected..!!');
 						return false;	
 					}
 					
				}
				
				function formValidate3(){
 					var y = document.maslForms.miscgroc.value;
					if(y=="" || y==null){
 						alert('Stock Item Must be selected..!!');
 						return false;	
 					}
					
				}
				
				function formValidate4(){
 					var c = document.cwgForms.miscgroc.value;
 					if(c=="" || c==null){
 						alert('Stock Item Must be selected..!!');
						return false;	
 					}
 					
				}
				
				function formValidate5(){
 					var d = document.miscForms.miscgroc.value;
 					if(d=="" || d==null){
 						alert('Stock Item Must be selected..!!');
 						return false;	
 					}
 					
 				}
		
		</script>

<%@ page import="connect.*" %>
<%@ page import="java.sql.*" %>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1>BOYS HOSTEL - Admin Panel</h1>
          <h2>Sir C R Reddy College of Engineering</h2>
        </div>
      </div>
      <nav>
        <div id="menu_container">
          <ul class="sf-menu" id="nav">
            <li><a href="index.html">&nbsp;Home</a></li>
            <li><a href="#">Mess Bills</a>
            	<ul>
                	<li><a href="start.jsp">Calculate Messbill</a></li>
                    <li><a href="#">View Messills</a></li>
                    <li><a href="#">Delete Messbills</a></li>
                </ul>
            </li>
            <li><a href="#">Groceries</a>
            	<ul>
                	<li><a href="" onclick="window.open('newenter.jsp','pavan','width=450,height=480,resizable=0,scrollbars=0,toolbar=no,status=no,notop=0,left=150'); return false;">Add New Grocery</a></li>
                    <li><a href="#">Modify Groceries</a></li>
                    <li><a href="#">Delete Groceries</a></li>
                </ul>
            </li>
            <li id="selected"><a href="#">Stock</a>
            	<ul>
                    <li><a href="enterstock.jsp">Enter Stock</a></li>
                    <li><a href="currentstock.jsp">View Stock</a></li>
                </ul>
            </li>
            <li><a href="#">Students</a>
              <ul>
                <li><a href="studentlist.jsp">View Students</a></li>
                <li><a href="#">Add Student</a></li>
                <li><a href="#">Modify Students</a></li>
                <li><a href="#">Delete Students</a></li>
                <li><a  href="mmdetails.jsp">Mess Members</a>
                
                </li>
              </ul>
            </li>
            <li><a href="#">Notice Board</a>
            	<ul>
                	<li><a href="#">Add Notices</a></li>
                    <li><a href="#">Modify Notices</a></li>
                    <li><a href="#">Delete Notices</a></li>
                </ul>
            </li>
            <li><a href="#">LogOut</a></li>
          </ul>
        </div>
      </nav>
    </header>
    <div id="site_content">
          <div class="content">

<h1 align="center">Choose a Category and Enter the Stock Details</h1>
	<div align="center">
		<form name="akgForms" action="stockcnfm.jsp" method="post">
		<h2 align="center"><u>Per KG Groceries</u></h2>
  		<select name="pergroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			Connection con = dcon.Connect_DB();
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM GROCERIES WHERE cgid='akg'";
			ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			
		%>	
			<option value="<%= rs.getString("gid") %>"><%= rs.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  <input type="number" min="1" max="2000" name="quantity" placeholder="Quantity" size="1" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		   <button type="submit" onclick="return formValidation()">Enter</button>
		</form>	
	</div>
	<br><br>
	
		<div align="center">
		<form name="pktForms" action="stockcnfm.jsp" method="post">
		<h2 align="center"><u>Per PACKET Groceries</u></h2>
  		<select name="pergroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt1 = con.createStatement();
			String sql1 = "SELECT * FROM GROCERIES WHERE cgid='pkt'";
			ResultSet rs1 = stmt.executeQuery(sql1);
		while(rs1.next()){
			
		%>	
			<option value="<%= rs1.getString("gid") %>"><%= rs1.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  <input type="number" min="1" max="2000" name="quantity" placeholder="Quantity" size="1" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit"  onclick="return formValidate1()">Enter</button>
		</form>	
	</div>
			<br><br>	
	
		<div align="center">
		<form name="botForms" action="stockcnfm.jsp" method="post">
		<h2 align="center"><u>Per BOTTLE Groceries</u></h2>
  		<select name="pergroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt2 = con.createStatement();
			String sql2 = "SELECT * FROM GROCERIES WHERE cgid='bot'";
			ResultSet rs2 = stmt.executeQuery(sql2);
		while(rs2.next()){
			
		%>	
			<option value="<%= rs2.getString("gid") %>"><%= rs2.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  <input type="number" min="1" max="2000" name="quantity" placeholder="Quantity" size="1" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit" onclick="return formValidate2()">Enter</button>
		</form>	
	</div>
		
		<br><br>	
		<div align="center">
		<form name="maslForms" action="misccnfrm.jsp" method="post">
		<h2 align="center"><u>MASALA Groceries</u></h2>
  		<select name="miscgroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt3 = con.createStatement();
			String sql3 = "SELECT * FROM GROCERIES WHERE cgid='msl'";
			ResultSet rs3 = stmt.executeQuery(sql3);
		while(rs3.next()){
			
		%>	
			<option value="<%= rs3.getString("gid") %>"><%= rs3.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit" onclick="return formValidate3()">Enter</button>
		</form>	
	</div>
	
		<br><br>	
		<div align="center">
		<form name="cwgForms" action="misccnfrm.jsp" method="post">
		<h2 align="center"><u>CLEANING & WORKERS Groceries</u></h2>
  		<select name="miscgroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt4 = con.createStatement();
			String sql4 = "SELECT * FROM GROCERIES WHERE cgid='cwg'";
			ResultSet rs4 = stmt.executeQuery(sql4);
		while(rs4.next()){
			
		%>	
			<option value="<%= rs4.getString("gid") %>"><%= rs4.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit" onclick="return formValidate4()">Enter</button>
		</form>	
	</div>
		
		
		<br><br>	
		<div align="center">
		<form name="miscForms" action="misccnfrm.jsp" method="post">
		<h2 align="center"><u>MISCELLANEOUS Groceries</u></h2>
  		<select name="miscgroc" id="lists">
    		<option value="" selected disabled>- - Select - -</option>	
	<%	
			Statement stmt5 = con.createStatement();
			String sql5 = "SELECT * FROM GROCERIES WHERE cgid='misc'";
			ResultSet rs5 = stmt.executeQuery(sql5);
		while(rs5.next()){
			
		%>	
			<option value="<%= rs5.getString("gid") %>"><%= rs5.getString("tname") %></option>
		<%	
		}
		%>
		</select>&nbsp;&nbsp;
		  
		  <input type="text" name="price" pattern="\d+(\.\d{2})?" placeholder="Price" size="1" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hidden" value="PavanMandava" />
		  <button type="submit" onclick="return formValidate5()">Enter</button>
		</form>	
	</div>
		<br>
		<br>
		<br>
		
		  </div>
    </div>
    <div id="scroll">
      <a title="Scroll to the top" class="top" href="#"><img src="top.png" alt="top" /></a>
    </div>
    <footer>
      <p><a href="index.html">Home</a> | <a href="examples.html">Examples</a> | <a href="page.html">A Page</a> | <a href="another_page.html">Another Page</a> | <a href="contact.php">Contact Us</a></p>
      <p>Copyright &copy; Dept of Computer Science and Engineering</p>
      <p><a href="http://www.sircrrengg.ac.in/" target="_blank">Sir C R Reddy College of Engineering,Eluru</a></p>
    </footer>
  </div>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="jquery.sooperfish.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
      $('.top').click(function() {$('html, body').animate({scrollTop:0}, 'fast'); return false;});
    });
  </script>
</body>
</html>