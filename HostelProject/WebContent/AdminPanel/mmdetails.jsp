<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOWING MESS MEMBERS</title>

<style type="text/css">
table {
	text-align: center;
	border: 2px groove #EF9ADA;
	border-radius: 5px;
}

table td {
height: 25px;
	border: 1px groove;
	border-radius: 5px;
	color: #253D1F;
	background-color: #FBFBFB;
}

table th {
height: 35px;
	color: #824E48;
	background-color: #FFFFB9;
	border: 1px groove #D6B649;
	border-radius: 5px;
	font-size: 24px;
}

center h2 {
	font-family: Cambria;
	font-weight: bold;
	color: #6A884A;
}
form{
	display: inline-block;
}
button{
	font-family: Cambria;
	font-size: 22px;
	font-weight: bold;
	border: 2px groove green;
	border-radius: 5px;
	color: yellow;
	background-color: black;
}
button:hover{
	border: 2px groove yellow;
	cursor: pointer;
	background-color: #5A2929;
}
</style>

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
  


</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="connect.*"%>

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
            <li id="selected"><a href="index.html">&nbsp;Home</a></li>
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
            <li><a href="#">Stock</a>
            	<ul>
                    <li><a href="enterstock.jsp">Enter Stock</a></li>
                    <li><a href="currentstock.jsp">View Stock</a></li>
                </ul>
            </li>
            <li><a href="#">Students</a>
              <ul>
                <li><a href="studentlist.jsp">View Students</a></li>
                <li><a href=""  onclick="window.open('newstuenter.jsp','mandava','width=450,height=560,resizable=0,scrollbars=0,toolbar=no,status=no,notop=0,left=150'); return false;">Add Student</a></li>
                <li><a href="#">Modify Students</a></li>
                <li><a href="#">Delete Students</a></li>
                <li><a  href="#">Mess Members</a>
                	
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


	<%
		Connect dcon = ConnectFactory.getConnToDB("Oracle");
		Connection con = dcon.Connect_DB();
		Statement stmt = con.createStatement();
		String sql = "SELECT s.sid,s.sname,s.roomno,s.branch,s.regno,s.syear,m.percentage FROM student s,messmembers m WHERE s.sid=m.sid";
		ResultSet rs = stmt.executeQuery(sql);
	%>
	<center>
		<h2>Mess Members List</h2>
	</center>
	<div align="center">
	<table align="center" border=1>
		<tr>
			<th>SNo</th>
			<th>SID</th>
			<th>Room No</th>
			<th>Student Name</th>
			<th>Branch</th>
			<th>Regd No</th>
			<th>Year</th>
			<th>Percentage</th>

		</tr>

		<%
			int i = 1;
			while (rs.next()) {
		%>

		<tr>
			<td><%=i%></td>
			<td><%=rs.getString("sid")%></td>
			<td><%=rs.getString("roomno")%></td>
			<td align="left"><%=rs.getString("sname")%></td>
			<td><%=rs.getString("branch")%></td>
			<td><%=rs.getString("regno")%></td>
			<td><%=rs.getString("syear")%></td>
			<td><%=rs.getDouble("percentage")%>%</td>
		</tr>

		<%
			i++;
			}
			con.close();
			dcon.closeConnection();
		%>
		</table>
		</div>
		<br>
		<center>
			<form action="messmembs.jsp" method="post">
				<button type="submit">&nbsp;&nbsp;&nbsp;Add&nbsp;&nbsp;&nbsp;</button>
			</form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<form action="modifymm.jsp" method="post">
				<button type="submit">&nbsp;Modify&nbsp;</button>
			</form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<form action="mmdelete.jsp" method="post">
				<button type="submit">&nbsp;Delete&nbsp;</button>
			</form>
		</center>
<br><br><br>

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