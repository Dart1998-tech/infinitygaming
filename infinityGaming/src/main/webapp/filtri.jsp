<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>

<%
String dbURL = "jdbc:mysql://localhost:3306/infinity_gaming";
String dbUser = "root";
String dbPassword = "admin";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

    String sql = "SELECT id, titolo, prezzo, genere_id FROM giochi";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="sidebar">
    <a href="#" onclick="azzeraFiltri()" class="text-decoration-underline text-white mb-4" style="cursor: pointer">Azzera tutti i filtri</a>
    
    <h4 class="mb-3 text-white">Filtri</h4>
    <h5 class="mb-3 text-white">Generi:</h5>
    <div class="d-flex flex-wrap gap-2">
        <button class="btn btn-outline-light filter-btn" onclick="toggleFiltro('genere', 'tutti')">Tutti</button>
        <button class="btn btn-outline-light filter-btn" onclick="toggleFiltro('genere', '1')">FPS</button>
        <button class="btn btn-outline-light filter-btn" onclick="toggleFiltro('genere', '2')">RPG</button>
        <button class="btn btn-outline-light filter-btn" onclick="toggleFiltro('genere', '3')">Action</button>
        <button class="btn btn-outline-light filter-btn" onclick="toggleFiltro('genere', '4')">Platform</button>
        <button class="btn btn-outline-light filter-btn" onclick="toggleFiltro('genere', '5')">MOBA</button>
        <button class="btn btn-outline-light filter-btn" onclick="toggleFiltro('genere', '6')">Sport</button>
    </div>
    <h5 class="mt-4 mb-3 text-white">Prezzo:</h5>
    <div class="d-flex flex-wrap gap-2">
        <button class="btn btn-outline-light price-btn" onclick="toggleFiltro('prezzo', '0-20')">€0 - €20</button>
        <button class="btn btn-outline-light price-btn" onclick="toggleFiltro('prezzo', '20-50')">€20 - €50</button>
        <button class="btn btn-outline-light price-btn" onclick="toggleFiltro('prezzo', '50-100')">€50 - €100</button>
    </div>
    <h5 class="mt-4 mb-3 text-white">Ordina per:</h5>
    <div class="d-flex flex-wrap gap-2">
        <button class="btn btn-outline-light sort-btn" onclick="ordinaPerPrezzo('crescente')">Prezzo Crescente</button>
        <button class="btn btn-outline-light sort-btn" onclick="ordinaPerPrezzo('decrescente')">Prezzo Decrescente</button>
    </div>
</div>

    <section class="content">
        <h2 class="text-center mb-4"></h2>
        <div class="text-end mb-2">
        </div>
        <div class="row" id="catalogo-giochi">
            <% if (rs != null) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String titolo = rs.getString("titolo");
                    String prezzo = rs.getString("prezzo");
                    String genereId = rs.getString("genere_id");
            %>
            <div class="col-md-4 mb-4 elemento-da-filtrare" data-genere="<%= genereId %>" data-prezzo="<%= prezzo %>" data-id="<%= id %>">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= titolo %></h5>
                        <p class="card-text">Prezzo: €<%= prezzo %></p>
                        <a href="Gioco.jsp?id=<%= id %>" class="btn btn-primary w-100">Dettagli</a>
                    </div>
                </div>
            </div>
            <% } } %>
        </div>
    </section>

    <% 
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
    %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../filtri.js"></script>
</body>
</html>