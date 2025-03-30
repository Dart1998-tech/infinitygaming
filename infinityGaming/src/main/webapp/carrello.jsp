<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="org.generationitaly.infinitygaming.entity.CartItem" %>
<%@ page import="org.generationitaly.infinitygaming.entity.Cart" %>
<%@ page import="org.generationitaly.infinitygaming.entity.Utente" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello - Infinity Gaming</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %> 
    
    <section class="container my-5">
        <h1 class="text-center mb-4">Il tuo carrello</h1>
        
        <% 
        Utente utente = (Utente) session.getAttribute("utente");
        Cart cart = utente.getCart();
        List<CartItem> item = cart.getCartItems();
        if (cart == null) {
        %>
            <div class="alert alert-info text-center">
                <p>Il tuo carrello è vuoto.</p>
                <a href="<%=request.getContextPath()%>/welcome-home.jsp" class="btn btn-primary mt-3">Continua lo shopping</a>
            </div>
        <% } else { %>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Prodotto</th>
                            <th>Prezzo</th>
                            <th>Azioni</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CartItem items : item) { %>
                            <tr>
                                <td><%= items.getGioco().getTitolo() %></td>
                                <td><%= items.getGioco().getPrezzo() %></td>
                               <td></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <div class="d-flex justify-content-between mt-4">
                <a href="<%=request.getContextPath()%>/welcome-home.jsp" class="btn btn-secondary">Continua lo shopping</a>
                <div>
                    <a href="<%=request.getContextPath()%>/cart/clear" class="btn btn-outline-danger me-2">Svuota carrello</a>
                    <a href="<%=request.getContextPath()%>/checkout" class="btn btn-success">Procedi al checkout</a>
                </div>
            </div>
        <% } %>
    </section>
    
    <%@ include file="footer.jsp" %> 
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
