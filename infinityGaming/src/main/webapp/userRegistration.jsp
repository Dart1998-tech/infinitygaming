<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    String firstName = request.getParameter("nome");
    String lastName = request.getParameter("cognome");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinity_gaming",
            "root", "admin");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into utente(nome, cognome, email, username, password, regdate) values ('" + firstName + "','" 
    + lastName + "','" + email + "','" + userName + "','" + password + "', CURDATE())");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
       
    } else {
    	
        response.sendRedirect("index.jsp");
    }
%>