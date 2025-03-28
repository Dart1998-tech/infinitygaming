<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us - Infinity Games</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  
  <link rel="stylesheet" href="style.css">
  
</head>
<body>
 
 <%@ include file="./navbar.jsp" %>

  
  <section class="hero text-center">
    <div class="container">
      <h1 class="display-4">Contact Us</h1>
      <p class="lead">Hai bisogno di aiuto? Scegli una categoria per trovare la soluzione.</p>
    </div>
  </section>

  
  <main class="container my-5">
   
    <div class="card mb-4">
      <div class="card-body">
        <h2 class="card-title"><i class="fas fa-shopping-cart"></i> Ordini e Prodotti</h2>
        <p>Supporto per l'attivazione di chiavi e informazioni sui prodotti.</p>
       <a href="ordini.jsp" class="btn btn-primary">Scopri di più</a>
      </div>
    </div>

  
    <div class="card mb-4">
      <div class="card-body">
        <h2 class="card-title"><i class="fas fa-credit-card"></i> Pagamenti</h2>
        <p>Aiuto per problemi o domande relative ai pagamenti.</p>

<a href="pagamenti.jsp" class="btn btn-primary">Scopri di più</a>

      </div>
    </div>

  
    <div class="card mb-4">
      <div class="card-body">
        <h2 class="card-title">
        <i class="fas fa-user-shield"></i> Account e Sicurezza</h2>
        <p>Assistenza per la gestione dell'account e problemi di sicurezza.</p>
        <a href="account.jsp" class="btn btn-primary">Scopri di più</a>
      </div>
    </div>

   
    <div class="card mb-4">
      <div class="card-body">
        <h2 class="card-title"><i class="fas fa-envelope"></i> Contatti</h2>
        <p>Contattaci direttamente per ulteriori informazioni.</p>
        <ul class="list-unstyled">
          <li><i class="fas fa-map-marker-alt"></i> Via dei Giochi, 123, 00110 Roma, Italia</li>
          <li><i class="fas fa-envelope"></i> supporto@infinitygames.com</li>
          <li><i class="fas fa-phone"></i> +39 123 456 789</li>
        </ul>
      </div>
    </div>
    
  </main>

  
<%@ include file="/footer.jsp" %>

 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>