<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="org.generationitaly.infinitygaming.entity.Ordine" %>
<%@ page import="org.generationitaly.infinitygaming.entity.OrderItem" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettaglio Ordine - Infinity Gaming</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %> 
    
    <section class="container my-5">
        <% 
        Ordine ordine = (Ordine) request.getAttribute("ordine");
        List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");
        
        if (ordine == null) {
        %>
            <div class="alert alert-danger text-center">
                <p>Ordine non trovato.</p>
                <a href="<%=request.getContextPath()%>/ordini" class="btn btn-primary mt-3">Torna ai tuoi ordini</a>
            </div>
        <% } else { %>
            <div class="card mb-4">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h3 class="mb-0">Dettaglio Ordine #<%= ordine.getOrdineId() %></h3>
                    <a href="<%=request.getContextPath()%>/ordini" class="btn btn-light btn-sm">
                        <i class="bi bi-arrow-left"></i> Torna agli ordini
                    </a>
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h5>Informazioni Ordine</h5>
                            <p><strong>Numero ordine:</strong> #<%= ordine.getOrdineId() %></p>
                            <p><strong>Data:</strong> <%= new java.util.Date() %></p>
                            <p><strong>Totale:</strong> <%= String.format("%.2f €", ordine.getPrezzo()) %></p>
                        </div>
                        <div class="col-md-6">
                            <h5>Informazioni Cliente</h5>
                            <p><strong>Nome:</strong> <%= ordine.getUtenteId().getNome() %> <%= ordine.getUtenteId().getCognome() %></p>
                            <p><strong>Email:</strong> <%= ordine.getUtenteId().getEmail() %></p>
                        </div>
                    </div>
                    
                    <h5>Prodotti Acquistati</h5>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>Prodotto</th>
                                    <th>Prezzo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (orderItems != null && !orderItems.isEmpty()) { %>
                                    <% for (OrderItem item : orderItems) { %>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="<%= item.getGioco().getImmagine() %>" alt="<%= item.getGioco().getTitolo() %>" class="img-thumbnail me-3" style="width: 60px;">
                                                    <div>
                                                        <h6 class="mb-0"><%= item.getGioco().getTitolo() %></h6>
                                                        <small class="text-muted"><%= item.getGioco().getSoftwareHouse() %></small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td><%= String.format("%.2f €", item.getPrezzo()) %></td>
                                        </tr>
                                    <% } %>
                                <% } else { %>
                                    <tr>
                                        <td colspan="2" class="text-center">Nessun prodotto trovato per questo ordine.</td>
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
                    
                    <div class="mt-4 text-center">
                        <a href="<%=request.getContextPath()%>/welcome-home.jsp" class="btn btn-primary">Torna alla home</a>
                    </div>
                </div>
            </div>
        <% } %>
    </section>
    
    <%@ include file="footer.jsp" %> 
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
