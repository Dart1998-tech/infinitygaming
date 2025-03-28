<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="org.generationitaly.infinitygaming.entity.Gioco"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<title>Risultati della ricerca</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<% 
	String query = request.getParameter("query");
	List<Gioco> giochi = (List<Gioco>) request.getAttribute("giochi"); 
	%>
    <%@ include file="navbar.jsp" %>
    <div class="container mt-5">
        <h1>Risultati della ricerca</h1>
        <div class="row mt-4">
            <%
            if(!giochi.isEmpty()){
            for(Gioco gioco: giochi) {
            %>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="images/<%= gioco.getImmagine() %>" class="card-img-top" alt="<%= gioco.getTitolo() %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= gioco.getTitolo() %></h5>
                        <p><strong>Software House:</strong> <%= gioco.getSoftwareHouse() %></p>
                        <a href="Gioco.jsp?id=<%= gioco.getId() %>" class="btn btn-primary">Visualizza Dettagli</a>
                    </div>
                </div>
            </div>
            <%
             }
             } else {
            %>
            <p class="text-center">Nessun risultato trovato per "<%= query != null ? query : "" %>".</p>
            <a href="/infinityGaming/catalogo" class="btn btn-primary">Vai alla pagina principale dei giochi</a>
            <%
               }
            %>
        </div>
    </div>
</body>
</html>