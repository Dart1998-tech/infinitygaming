<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinity_gaming",
            "root", "admin");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from utente where username='" + userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("id", userName);
        response.sendRedirect("welcome-home.jsp");
    } else {
    	response.sendRedirect("login-error.jsp");
    }
%>