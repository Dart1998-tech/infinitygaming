<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="org.generationitaly.infinitygaming.entity.Gioco"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogo Giochi - InfinityGaming</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
        .card {
            margin-bottom: 20px;
            height: 100%;
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    
    <%@ include file="navbar.jsp" %>
    
    <div class="container my-5">
        <h1 class="text-center mb-4">Catalogo Giochi</h1>
        
        <div class="row">
            <% 
            List<?> giochiList = (List<?>) request.getAttribute("giochi");
            
            if (giochiList != null && !giochiList.isEmpty()) {
                for (Object obj : giochiList) {
                    // Utilizziamo reflection per accedere ai metodi dell'oggetto
                    java.lang.reflect.Method getTitolo = obj.getClass().getMethod("getTitolo");
                    java.lang.reflect.Method getSoftwareHouse = obj.getClass().getMethod("getSoftwareHouse");
                    java.lang.reflect.Method getGenere = obj.getClass().getMethod("getGenere");
                    java.lang.reflect.Method getAnno = obj.getClass().getMethod("getAnno");
                    java.lang.reflect.Method getPrezzo = obj.getClass().getMethod("getPrezzo");
                    java.lang.reflect.Method getVoto = obj.getClass().getMethod("getVoto");
                    java.lang.reflect.Method getImmagine = obj.getClass().getMethod("getImmagine");
                    java.lang.reflect.Method getId = obj.getClass().getMethod("getId");
                    
                    String titolo = (String) getTitolo.invoke(obj);
                    String softwareHouse = (String) getSoftwareHouse.invoke(obj);
                    String genere = (String) getGenere.invoke(obj);
                    Object anno = getAnno.invoke(obj);
                    Object prezzo = getPrezzo.invoke(obj);
                    Object voto = getVoto.invoke(obj);
                    String immagine = (String) getImmagine.invoke(obj);
                    Object id = getId.invoke(obj);
            %>
            <div class="col-md-4">
                <div class="card">
                    <img src="images/<%= immagine %>" class="card-img-top" alt="<%= titolo %>" onerror="this.src='images/placeholder.jpg'">
                    <div class="card-body">
                        <h5 class="card-title"><%= titolo %></h5>
                        <p class="card-text"><strong>Software House:</strong> <%= softwareHouse %></p>
                        <p class="card-text"><strong>Genere:</strong> <%= genere %></p>
                        <p class="card-text"><strong>Anno:</strong> <%= anno %></p>
                        <p class="card-text"><strong>Prezzo:</strong> € <%= String.format("%.2f", ((Number)prezzo).doubleValue()) %></p>
                        <p class="card-text"><strong>Voto:</strong> <%= voto %>/10</p>
                        <button class="btn btn-primary w-100" onclick="aggiungiAlCarrello('<%= id %>', '<%= titolo %>', <%= ((Number)prezzo).doubleValue() %>)">Aggiungi al Carrello</button>
                    </div>
                </div>
            </div>
            <% 
                }
            } else {
            %>
            <div class="col-12 text-center">
                <div class="alert alert-info">
                    Nessun gioco trovato nel database.
                </div>
            </div>
            <% } %>
        </div>
    </div>
    
    <footer class="bg-dark text-white py-3 mt-5">
        <div class="container text-center">
            <p>&copy; 2025 InfinityGaming. Tutti i diritti riservati.</p>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function aggiungiAlCarrello(id, titolo, prezzo) {
            alert("${titolo}" è stato aggiunto al carrello!);
        }
    </script>
</body>
</html>