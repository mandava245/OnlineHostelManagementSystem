<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DELETED MESSMEMBERS DETAILS</title>

<style>
	table{
		font-family: Cambria;
	}
	table th{
		font-size: 22px;
		color: #AF3096;
	}
	table td{
		font-size: 20px;
		color: #973E44;
	}
</style>

</head>
<body>

	<%@ page import="java.sql.*" %>
	<%@ page import="connect.*" %>

	<%
		
		Connect dcon = ConnectFactory.getConnToDB("Oracle");
		Connection con = dcon.Connect_DB();
		Statement smt = con.createStatement();
		String query = "SELECT count(*) FROM MESSMEMBERS";
		ResultSet rs1 = smt.executeQuery(query);
		int cnt = 0;
		if(rs1.next()){
			cnt = rs1.getInt(1);
		}
		Statement stmt = con.createStatement();
		String sql = "SELECT sid FROM MESSMEMBERS";
		ResultSet rs = stmt.executeQuery(sql);
		int i=0,j=0;
		String fsid[] = new String[cnt];
		String sid[] = new String[cnt];
		while(rs.next()){
			sid[i]=rs.getString("sid");
			if(request.getParameter(sid[i])!=null){
				
				fsid[j] = request.getParameter(sid[i]);	
				j++;
				
			}
			i++;
		}
		if(j==0){
			%>
				<script>
					alert('You must select atleast one Mess Member to Delete');
				</script>
				
			<%
			RequestDispatcher rd = application.getRequestDispatcher("/mmdelete.jsp");
			rd.include(request,response);
		}
		else{
			
		String sql1 = "DELETE FROM messmembers WHERE sid in ?";
		String query1 = "UPDATE month SET type='gen' WHERE sid in ?";
		PreparedStatement pst = con.prepareStatement(sql1);
		PreparedStatement pst1 = con.prepareStatement(query1);
		int p = 0,q = 0;
		for(int c=0;c<j;c++){
			
			pst1.setString(1,fsid[c]);
			pst.setString(1, fsid[c]);
			
			p = p + pst.executeUpdate();
			q = q + pst1.executeUpdate();
		}
		
		if(p==q)
		{
	%>
		<script>
			alert('Successfully deleted '+p+' Mess Member(s)');
		</script>
		<center><font size=7 color=green>Mess Member deleted Successfully</font></center>
			<br>
			<center>Please wait......</center>
			<br>
	<%
		response.setHeader("refresh","3; mmdetails.jsp");
		}
	%>
			<center><h2>Deleted List</h2></center>
	
		<table align="center" border=0 cellspacing=5 cellpadding=5>
		<tr>
			<th>SID</th>
			<th>Room No</th>
			<th>Student Name</th>
			<th>Branch</th>
			<th>Regd No</th>
			<th>Year</th>
		</tr>
		
		<%	
		
		String sql2 = "SELECT * FROM STUDENT WHERE sid  in ?";
		PreparedStatement pstmt = con.prepareStatement(sql2);
		ResultSet rSet = null;
		for(int f=0;f<j;f++){
			pstmt.setString(1, fsid[f]);
			  rSet = pstmt.executeQuery();
				while(rSet.next()){
					%>
						<tr>
							<td><%= rSet.getString("sid") %></td>
							<td><%= rSet.getString("roomno") %></td>
							<td><%= rSet.getString("sname") %></td>
							<td><%= rSet.getString("branch") %></td>
							<td><%= rSet.getString("regno") %></td>
							<td><%= rSet.getString("syear") %></td>
						</tr>
					<%
				}
		}
		}
	%>
	
	</table>
</body>
</html>