<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="connect.*" %>
<%
			Connect dcon = ConnectFactory.getConnToDB("Oracle"); 
			Connection con = dcon.Connect_DB();
			Statement stmt = con.createStatement();
			String query = "SELECT gid,quantity,price,total FROM tempgroceries";
			ResultSet rSet = stmt.executeQuery(query);
			String sql = "UPDATE groceries SET quantity=quantity-?,total=total-? WHERE gid=? ";
			PreparedStatement pst = con.prepareStatement(sql);
			int i=0;
			while(rSet.next()){
				pst.setInt(1,rSet.getInt("quantity"));
				pst.setDouble(2,rSet.getDouble("total"));
				pst.setString(3,rSet.getString("gid"));
				i=i+pst.executeUpdate();
			}
			dcon.closeConnection();
			con.close();

%>
<%= i %>

</body>
</html>