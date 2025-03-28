<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagamenti - Infinity Games</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body> 
 <%@ include file="./navbar.jsp" %>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="welcome-home.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="catalogo-giochi.jsp">Catalogo</a></li>
          <li class="nav-item"><a class="nav-link active" href="support.html">Supporto</a></li>
        </ul>
      </div>

 
  <section class="hero text-center text-white py-5">
    <div class="container">
      <h1 class="display-4">Pagamenti</h1>
      <p class="lead">Assistenza per i tuoi pagamenti e transazioni.</p>
    </div>
  </section>

 
  <main class="container my-5">
    <div class="card">
      <div class="card-body">
        <h2>Problemi con i Pagamenti?</h2>
        <p>Se hai riscontrato problemi con i pagamenti, vedi l'opzione che meglio descrive la tua situazione:</p>
      </div>
    </div>

    <div class="card">
      <div class="card-body">
        <h3>Denaro addebitato ma nessun prodotto ricevuto</h3>
        <p>Se il denaro Ã¨ stato addebitato ma non hai ricevuto il prodotto, contatta il supporto per assistenza.</p>
      </div>
    </div>

    <div class="card">
      <div class="card-body">
        <h3>Non riesco a completare il pagamento</h3>
        <p>Se hai difficoltÃ  a completare il pagamento, verifica la connessione internet o il metodo di pagamento utilizzato.</p>
      </div>
    </div>

    <div class="card">
      <div class="card-body">
        <h3>Hai trovato una transazione che non hai effettuato?</h3>
        <p>Se noti una transazione non riconosciuta, contatta immediatamente il supporto.</p>
      </div>
    </div>
  </main>

 
<%@ include file="/footer.jsp" %>

 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
