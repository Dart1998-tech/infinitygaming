<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="org.generationitaly.infinitygaming.entity.Ordine" %>
<%@ page import="org.generationitaly.infinitygaming.entity.OrdineItem" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conferma Ordine - Infinity Gaming</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %> 
    
    <section class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card border-success">
                    <div class="card-header bg-success text-white">
                        <h3 class="mb-0">Ordine Confermato</h3>
                    </div>
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
                            <h4 class="mt-3">Grazie per il tuo ordine!</h4>
                            <p>Il tuo ordine è stato ricevuto e verrà elaborato al più presto.</p>
                        </div>
                        
                        <%
                                                Ordine ordine = (Ordine) request.getAttribute("ordine");
                                                                        List<OrdineItem> orderItems = (List<OrdineItem>) request.getAttribute("orderItems");
                                                                        
                                                                        if (ordine != null) {
                                                %>
                            <div class="mb-4">
                                <h5>Dettagli dell'ordine</h5>
                                <p><strong>Numero ordine:</strong> #<%=ordine.getOrdineId()%></p>
                                <p><strong>Data:</strong> <%=new java.util.Date()%></p>
                                <p><strong>Totale:</strong> <%=String.format("%.2f €", ordine.getPrezzo())%></p>
                            </div>
                            
                            <div class="mb-4">
                                <h5>Prodotti acquistati</h5>
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Prodotto</th>
                                                <th>Prezzo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            for (OrdineItem item : orderItems) {
                                            %>
                                                <tr>
                                                    <td><%= item.getGioco().getTitolo() %></td>
                                                    <td><%= String.format("%.2f €", item.getPrezzo()) %></td>
                                                </tr>
                                            <% } %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td class="text-end"><strong>Totale:</strong></td>
                                                <td><strong><%= String.format("%.2f €", ordine.getPrezzo()) %></strong></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        <% } %>
                        
                        <div class="text-center mt-4">
                            <a href="<%=request.getContextPath()%>/welcome-home.jsp" class="btn btn-primary me-2">Torna alla home</a>
                            <a href="<%=request.getContextPath()%>/ordini" class="btn btn-outline-secondary">Visualizza i tuoi ordini</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="footer.jsp" %> 
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
