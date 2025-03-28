<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Account e Sicurezza</title>
  
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

 
  <main class="container my-5">
  
    <div class="card mb-4">
      <div class="card-body text-center">
        <h1>Account e Sicurezza</h1>
      </div>
    </div>
    
   
    <div class="card mb-4">
      <div class="card-body">
        <h2>Problemi con l'Account?</h2>
        <p>Se hai domande o problemi relativi al tuo account o alla sicurezza, seleziona l'opzione che meglio descrive la tua situazione:</p>
      </div>
    </div>

   
    <div class="card mb-4">
      <div class="card-body">
        <h3>Hai difficoltÃ  ad accedere al tuo account?</h3>
        <p>Se non riesci ad accedere al tuo account, verifica di utilizzare le credenziali corrette. Se hai dimenticato la password, utilizza l'opzione di recupero password.</p>
      </div>
    </div>

   
    <div class="card mb-4">
      <div class="card-body">
        <h3>Quali dati vengono salvati su di me?</h3>
        <p>Salviamo solo i dati necessari per fornirti i nostri servizi, come il tuo indirizzo email e le informazioni di pagamento. Puoi consultare la nostra <a href="#">Privacy Policy</a> per maggiori dettagli.</p>
      </div>
    </div>

   
    <div class="card mb-4">
      <div class="card-body">
        <h3>Come posso proteggere il mio account?</h3>
        <p>Per mantenere il tuo account sicuro, ti consigliamo di:</p>
        <ul>
          <li>Utilizzare una password complessa e unica.</li>
          <li>Abilitare l'autenticazione a due fattori (2FA), se disponibile.</li>
          <li>Non condividere le tue credenziali con nessuno.</li>
        </ul>
      </div>
    </div>

   
    <div class="card mb-4">
      <div class="card-body">
        <h3>Come posso eliminare il mio account?</h3>
        <p>Se desideri eliminare il tuo account, contatta il supporto tramite l'email <a href="mailto:support@infinity-gaming.com">support@infinity-gaming.com</a>. Ti guideremo attraverso il processo.</p>
      </div>
    </div>

   
    <div class="card mb-4">
      <div class="card-body">
        <h3>Altri problemi</h3>
        <p>Per qualsiasi altro problema relativo al tuo account o alla sicurezza, non esitare a contattare il supporto.</p>
      </div>
    </div>
  </main>

 
<%@ include file="/footer.jsp" %>

 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
