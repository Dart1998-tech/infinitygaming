<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%
String dbURL = "jdbc:mysql://localhost:3306/infinity_gaming";
String dbUser = "root";
String dbPassword = "Francesco@02";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;


try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
    String sql = "SELECT id, nome FROM generi";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();
} catch (Exception e) {
    e.printStackTrace();
    
 
}

%>
<!--  SI COLLEGA A WELCOME-HOME.JSP -->

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generi - InfinityGames</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Generi -->
    <section class="container genres my-5">
        <h2 class="text-center">Scegli il Genere</h2>
        <div class="row">
            <%
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nome = rs.getString("nome");
            %>
            <div class="col-md-4">
                <div class="p-4 border text-center font-bold">
                    <%= nome %>
                    <div class="mt-2">
                        <a href="genereDettagli.jsp?id=<%= id %>" class="btn btn-primary">Scopri di più</a>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
                out.println("<p>Errore: Impossibile recuperare i generi dal database.</p>");
            }
            %>
        </div>
    </section>

    
    <footer class="bg-dark text-white text-center p-4">
        <div class="row">
            <div class="col-md-6">
                <p>
                    <a href="https://trustpilot.com" target="_blank">Trustpilot</a> | 
                    <a href="https://facebook.com" target="_blank">Facebook</a> | 
                    <a href="https://twitter.com" target="_blank">Twitter</a>
                </p>
            </div>
            <div class="col-md-6">
                <p>Termini d'uso | Privacy Policy | Affiliati | Contatti</p>
                <p>&copy; 2025 InfinityGames. Tutti i diritti riservati.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>