<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="org.generationitaly.infinitygaming.entity.*" %>
<%@ page import="org.generationitaly.infinitygaming.repository.impl.UtenteRepositoryImpl"%>
<%@ page import="org.generationitaly.infinitygaming.repository.UtenteRepository"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>I Tuoi Ordini - Infinity Gaming</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
    
</head>
<body>
    <%@ include file="navbar.jsp" %> 
    
    <section class="container my-5">
        <h1 class="text-center mb-4">I Tuoi Ordini</h1>
        
        <%
        
       	UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();
        
        Utente utente = utenteRepository.findById(1L);
		List<Ordine> ordini = utente.getOrdini();
		for(Ordine ordine : ordini) {
			System.out.println(ordine);
			for(OrdineItem item : ordine.getItems()) {
				System.out.println(item);
			}
		}
        
        if (ordini == null) {
        %>
            <div class="alert alert-info text-center">
                <p>Non hai ancora effettuato ordini.</p>
                <a href="<%=request.getContextPath()%>/welcome-home.jsp" class="btn btn-primary mt-3">Inizia lo shopping</a>
            </div>
        <% } else { %>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Numero Ordine</th>
                            <th>Data</th>
                            <th>Totale</th>
                            <th>Azioni</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Ordine ordine : ordini) { %>
                            <tr>
                                <td>#<%= ordine.getId() %></td>
                                <td><%=  new java.util.Date()  %></td>
                                <td><%= ordine.getPrezzo() %></td>
                                <td></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <div class="d-flex justify-content-center mt-4">
                <a href="<%=request.getContextPath()%>/welcome-home.jsp" class="btn btn-secondary">Torna alla home</a>
            </div>
        <% } %>
    </section>
    
    <%@ include file="footer.jsp" %> 
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
