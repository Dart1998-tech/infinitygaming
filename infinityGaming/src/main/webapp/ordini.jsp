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
    
    <style type="text/css">

		.footer{
		
		  width: 100%;
		  height: 100px;
		  position: relative;
		  padding: 550px 0px 5px;
		  min-height:10vh;
			
		}

	</style>
    
</head>
<body>
    <%@ include file="navbar.jsp" %> 
    
    <section class="container my-5">
        <h1 class="text-center mb-4">I Tuoi Ordini</h1>
        
        <%
	 	List<Ordine> ordini = (List<Ordine>) request.getAttribute("ordini"); 
        if (ordini == null) {
        %>
            <div class="alert alert-info text-center">
                <p>Non hai ancora effettuato ordini.</p>
                <a href="<%=request.getContextPath()%>/home" class="btn btn-primary mt-3">Inizia lo shopping</a>
            </div>
        <% } else { %>
            <div class="table-responsive">
                <table class="table table-dark">
                    <thead>
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
                                <td>
                                	<form action="dettaglio-ordine" method="get">
                                	<input type="hidden" name="idOrdine" value="<%= ordine.getId()%>">
                                		<button  type="submit" class="btn btn-primary" >DETTAGLIO</button>
                                	</form>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <div class="d-flex justify-content-center mt-4">
                <a href="<%=request.getContextPath()%>/home" class="btn btn-secondary">Torna alla home</a>
            </div>
        <% } %>
    </section>
    
    <div class="footer">
    
    <%@ include file="footer.jsp" %>
    
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
