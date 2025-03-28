<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo Utente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<%
    // Inizializza le variabili
    String nome = "";
    String cognome = "";
    String username = "";
    int count = 0;
    boolean userFound = false;
    Timestamp regdate = null;
    String formattedRegDate = "";
    String membershipDuration = "";
    
    // Prova a recuperare l'ID dalla sessione
    String usernameFromSession = (String) session.getAttribute("id");
    System.out.println("ID nella sessione: " + usernameFromSession);
    
    if (usernameFromSession != null && !usernameFromSession.isEmpty()) {
        // Recupera l'utente dal database usando l'username
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinity_gaming", "root", "admin");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM utente WHERE username = ?");
            ps.setString(1, usernameFromSession);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                // Estrai i valori direttamente dal ResultSet
                nome = rs.getString("nome");
                cognome = rs.getString("cognome");
                username = rs.getString("username");
                
                // Recupera la data di registrazione
                regdate = rs.getTimestamp("regdate");
                
                if (nome != null && cognome != null) {
                    count = nome.length() + cognome.length() + username.length();
                }
                
                userFound = true;
                System.out.println("Utente recuperato dal database");
                
                // Formatta la data di registrazione
                if (regdate != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("d MMMM yyyy", Locale.ITALIAN);
                    formattedRegDate = sdf.format(regdate);
                    
                    // Calcola da quanto tempo l'utente è membro
                    LocalDate regLocalDate = regdate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                    LocalDate today = LocalDate.now();
                    
                    long days = ChronoUnit.DAYS.between(regLocalDate, today);
                    long months = ChronoUnit.MONTHS.between(regLocalDate, today);
                    long years = ChronoUnit.YEARS.between(regLocalDate, today);
                    
                    if (days == 0) {
                        membershipDuration = "oggi";
                    } else if (days == 1) {
                        membershipDuration = "ieri";
                    } else if (days < 30) {
                        membershipDuration = days + " giorni fa";
                    } else if (months == 1) {
                        membershipDuration = "1 mese fa";
                    } else if (months < 12) {
                        membershipDuration = months + " mesi fa";
                    } else if (years == 1) {
                        membershipDuration = "1 anno fa";
                    } else {
                        membershipDuration = years + " anni fa";
                    }
                } else {
                    formattedRegDate = "Data non disponibile";
                    membershipDuration = "Data non disponibile";
                }
            } else {
                System.out.println("Utente non trovato nel database con username: " + usernameFromSession);
            }
            
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Errore nel recupero dell'utente dal database: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    // Verifica se abbiamo recuperato i dati dell'utente
    if (!userFound) {
        System.out.println("Non è stato possibile recuperare i dati dell'utente");
        response.sendRedirect("index.jsp");
        return;
    }
    
    // Debug: stampa i valori per verificare
    System.out.println("Nome: " + nome);
    System.out.println("Cognome: " + cognome);
    System.out.println("Username: " + username);
    System.out.println("Count: " + count);
    System.out.println("Data registrazione: " + formattedRegDate);
    System.out.println("Membro da: " + membershipDuration);
%>

<%@ include file="navbar.jsp" %> <!-- INCLUDE LA NAVBAR -->

<div class="carrello" id="carrello">
<!-- Contenuto del carrello -->
<h3>Il tuo carrello</h3>
<p>Non ci sono articoli nel carrello.</p>
<button class="btn btn-primary">Vai al catalogo</button>
</div>


<section class="container my-5">
    <h1 class="text-center mb-4">Profilo Utente</h1>

    <!-- * SEZIONE DETTAGLI PROFILO * -->
    <div class="row">
        <div class="col-md-4">
            <div class="card text-center">
                <img src="./images/man.png" alt="Foto Profilo" class="card-img-top rounded-circle p-4">
                <div class="card-body">
                    <h4 class="card-title"><%= username %></h4> <!-- NOME UTENTE -->
                    <hr>
                    <p style="color: #fff !important">Livello: <strong style="color: rgba(51, 129, 255, 1) !important"><%= count %></strong></p> <!-- LIVELLO -->
                    <p style="color: #fff !important">Membro dal: <strong style="color: rgba(51, 129, 255, 1) !important"><%= formattedRegDate %></strong></p> <!-- DATA ISCRIZIONE -->
                    <p style="color: #fff !important">Iscritto: <strong style="color: rgba(51, 129, 255, 1) !important"><%= membershipDuration %></strong></p> <!-- DURATA ISCRIZIONE -->
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card">
<div class="card-body">
    <h2 class="card-title">Panoramica</h2>
    <hr>
    <div class="panoramica-item">
        <span class="label" style="color: #fff !important">Amici:</span>
        <span class="value" >0</span>
    </div>
    <div class="panoramica-item">
        <span class="label" style="color: #fff !important">Recensioni:</span>
        <span class="value">0</span>
    </div>
    <div class="panoramica-item">
        <span class="label" style="color: #fff !important">Wishlist:</span>
        <span class="value">0</span>
    </div>
    <div class="panoramica-item">
        <span class="label" style="color: #fff !important">Giochi:</span>
        <span class="value">19</span>
    </div>
</div>
            </div>
        </div>
    </div>

    <!-- * SEZIONE PORTAFOGLIO * -->
    <div class="row my-5">
        <div class="col-md-6">
            <div class="card text-center">
                <div class="card-body">
                    <h2 class="card-title">Portafoglio</h2>
                    <hr>
                    <br>
                    <p style="color: #fff !important">Guadagni affiliazione: <strong style="color: rgba(51, 129, 255, 1) !important">0€</strong></p>
                    <p style="color: #fff !important">Saldo: <strong style="color: rgba(51, 129, 255, 1) !important">0.00€</strong></p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card text-center">
                <div class="card-body">
                    <h2 class="card-title">Risparmi totali</h2>
                    <hr>
                    <p><strong style="color: rgba(51, 129, 255, 1) !important">332.27€</strong></p>
                </div>
            </div>
        </div>
    </div>

    <!-- * SEZIONE OBIETTIVI * -->
    <div class="card my-5">
        <div class="card-body">
            <h2>Ultimi Obiettivi</h2>
            <hr>
            <ul>
                <li style="color: #fff !important">"I want more" - Compra un DLC</li>
                <li style="color: #fff !important">"Hello world!" - Aggiungi un'immagine profilo</li>
            </ul>
        </div>
    </div>

    <!-- * SEZIONE WISHLIST * -->
    <div class="card my-5">
        <div class="card-body">
            <h2>Wishlist Giochi</h2>
            <hr>
            <p style="color: #fff !important">Nessun gioco aggiunto alla wishlist.</p>
        </div>
    </div>

    <!-- * SEZIONE LINK AFFILIAZIONE * -->
    <div class="card my-5">
        <div class="card-body">
            <h2>Link Affiliazione</h2>
            <hr>
            <a style="color: rgba(255, 123, 0, 1);" href="https://www.instant-gaming.com/?igr=mounba98" target="_blank">
                Instant Gaming
            </a>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %> <!-- INCLUDE IL FOOTER -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/infinityGaming/carrello.js"></script>
</body>
</html>
