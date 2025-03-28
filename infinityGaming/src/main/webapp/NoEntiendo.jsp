<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="org.generationitaly.infinitygaming.entity.Gioco"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NoEntiendo Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        .neon-white-red {
            color: white;
            text-shadow: 0 0 2px #fff, 0 0 5px #f00, 0 0 10px #f00, 0 0 20px #f00;
            font-weight: bold;
        }
        
        .neonText {
            color: #fff;
            text-shadow:
              0 0 7px #fff,
              0 0 10px #fff,
              0 0 21px #fff,
              0 0 42px #f00,
              0 0 82px #f00,
              0 0 92px #f00,
              0 0 102px #f00,
              0 0 151px #f00;
        }

        body.nintendo {
            background: url('images/sfondoNintendo.jpg') no-repeat center center fixed;
            background-size: cover;
            font-size: 18px;
            font-family: "Vibur", sans-serif;
        }

        h1, h2 {
            text-align: center;
            font-weight: 400;
            line-height: 1;
        }
          
        h1 {
            font-size: 6.2rem;
        }
          
        h2 {
            font-size: 1.8rem;
        }

        .container {
            margin-top: 20vh;
        }

        .filtri-container {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: rgba(46, 30, 30, 0.8);
            border: 1px solid #f00;
            backdrop-filter: blur(5px);
        }

        .filtri-container .btn-outline-light {
            transition: all 0.3s ease;
            border-color: #f00;
            color: #f8f9fa;
        }

        .filtri-container .btn-outline-light:hover {
            background-color: rgba(255, 0, 0, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 0, 0, 0.3);
        }

        .filtri-container .btn-light {
            background-color: #f00;
            color: #212529;
            font-weight: 500;
        }

        .text-decoration-underline {
            transition: all 0.2s ease;
        }

        .text-decoration-underline:hover {
            color: #f00 !important;
            text-decoration: none !important;
        }

        .filter-btn:hover {
            background-color: rgba(255, 0, 0, 0.3) !important;
            box-shadow: 0 4px 12px rgba(255, 0, 0, 0.3) !important;
            border-color: #f00 !important;
        }

        .price-btn:hover {
            background-color: rgba(25, 135, 84, 0.3) !important;
            box-shadow: 0 4px 12px rgba(25, 135, 84, 0.3) !important;
            border-color: #198754 !important;
        }

        .sort-btn:hover {
            background-color: rgba(220, 53, 69, 0.3) !important;
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.3) !important;
            border-color: #dc3545 !important;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            background-color: rgba(46, 30, 30, 0.8);
            color: white;
            border: 1px solid #f00;
            backdrop-filter: blur(3px);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(255, 0, 0, 0.3);
        }

        .btn-outline-light {
            border-width: 2px;
        }

        .btn:hover {
            filter: brightness(110%);
        }

        .card-img-top {
            transition: filter 0.3s ease;
        }

        .card:hover .card-img-top {
            filter: brightness(105%);
        }

        .btn-primary {
            background-color: #f00;
            border-color: #f00;
        }

        .btn-primary:hover {
            background-color: #c00;
            border-color: #c00;
        }

        .add-to-cart-btn[disabled] {
            opacity: 0.7;
            cursor: not-allowed;
        }

        footer {
            background-color: rgba(46, 30, 30, 0.8);
            color: white;
            border-top: 1px solid #f00;
            backdrop-filter: blur(5px);
        }

        .text-white {
            color: white !important;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        .carrello {
            background-color: rgba(46, 30, 30, 0.9);
            border: 1px solid #f00;
            padding: 20px;
            border-radius: 10px;
            color: white;
            backdrop-filter: blur(5px);
        }

        .carrello button {
            margin: 5px;
            background-color: #f00;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .carrello button:hover {
            background-color: #c00;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(255, 0, 0, 0.3);
        }
    </style>
</head>
<body class="nintendo">
    <div class="overlay"></div>

    <% request.setAttribute("currentPage", "nintendo"); %>
    <% List<Gioco> giochi = (List<Gioco>) request.getAttribute("giochi"); %>
    <%@ include file="navbar.jsp" %>
    
    <div id="carrello" class="carrello">
        <h2>Il tuo carrello</h2>
        <ul id="lista-carrello"></ul>
        <p>Totale: €<span id="totale-carrello">0.00</span></p>
        <button onclick="svuotaCarrello()">Svuota carrello</button>
        <button onclick="resocontoFinale()">Resoconto finale</button>
    </div>

    <section class="container text-center my-5">
        <h1 class="neonText">Benvenuto su NoEntiendo Store</h1>
        <p class="text-white">Scopri i migliori giochi per la piattaforma NoEntiendo!</p>
    </section>

    <section id="catalogo" class="container text-center my-5">
        <h2 class="fw-bold neon-white-red">Catalogo Videogiochi NoEntiendo</h2>

        <div class="text-end mb-2">
            <a href="#" onclick="azzeraFiltri()"
                class="text-decoration-underline text-white"
                style="cursor: pointer;">Azzera tutti i filtri</a>
        </div>

        <div class="filtri-container bg-dark text-white p-4 rounded-3 mb-4">
            <div class="row g-3">
                <div class="col-md-4">
                    <h5 class="mb-3">Generi:</h5>
                    <div class="d-flex flex-wrap gap-2">
                        <button class="btn btn-outline-light filter-btn"
                            onclick="toggleFiltro('genere', 'tutti')">Tutti</button>
                        <button class="btn btn-outline-light filter-btn"
                            onclick="toggleFiltro('genere', '1')">FPS</button>
                        <button class="btn btn-outline-light filter-btn"
                            onclick="toggleFiltro('genere', '2')">RPG</button>
                        <button class="btn btn-outline-light filter-btn"
                            onclick="toggleFiltro('genere', '3')">Action</button>
                        <button class="btn btn-outline-light filter-btn"
                            onclick="toggleFiltro('genere', '4')">Platform</button>
                        <button class="btn btn-outline-light filter-btn"
                            onclick="toggleFiltro('genere', '5')">MOBA</button>
                        <button class="btn btn-outline-light filter-btn"
                            onclick="toggleFiltro('genere', '6')">Sport</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5 class="mb-3">Prezzo:</h5>
                    <div class="d-flex flex-wrap gap-2">
                        <button class="btn btn-outline-light price-btn"
                            onclick="toggleFiltro('prezzo', '0-20')">€0 - €20</button>
                        <button class="btn btn-outline-light price-btn"
                            onclick="toggleFiltro('prezzo', '20-50')">€20 - €50</button>
                        <button class="btn btn-outline-light price-btn"
                            onclick="toggleFiltro('prezzo', '50-100')">€50 - €100</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5 class="mb-3">Ordina per:</h5>
                    <div class="d-flex flex-wrap gap-2">
                        <button class="btn btn-outline-light sort-btn"
                            onclick="ordinaPerPrezzo('crescente')">Prezzo Crescente</button>
                        <button class="btn btn-outline-light sort-btn"
                            onclick="ordinaPerPrezzo('decrescente')">Prezzo Decrescente</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" id="catalogo-giochi">
			<% for(Gioco gioco: giochi) { %>
            <div class="col-md-4 mb-4" data-genere="<%=gioco.getGenere().getId()%>"
                data-prezzo="<%=gioco.getPrezzo()%>" data-id="<%=gioco.getId()%>">
                <div class="card">
                    <img
                        src="images/<%=gioco.getImmagine() != null ? gioco.getImmagine() : "placeholder.jpg"%>"
                        class="card-img-top"
                        alt="<%=gioco.getTitolo() != null ? gioco.getTitolo() : "Immagine non disponibile"%>">
                    <div class="card-body">
                        <h5 class="card-title"><%=gioco.getTitolo() != null ? gioco.getTitolo() : "Titolo non disponibile"%></h5>
                        <p class="card-text">
                            Prezzo: €<%=gioco.getPrezzo() != 0 ? gioco.getPrezzo() : "0.00"%></p>
                        <a href="gioco?id=<%=gioco.getId()%>" class="btn btn-primary w-100 mb-2">Info</a>
                        <button class="btn btn-success w-100 add-to-cart-btn">Aggiungi al Carrello</button>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </section>

    <section class="container faq my-5 text-center">
        <h2 class="neon-white-red">Domande Frequenti</h2>
        <p class="text-white">Scopri di più su di noi nella <a style="color: #f00" href="about.jsp">sezione About</a>.</p>
    </section>

    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/infinityGaming/carrello.js"></script>
    <script>
        let filtriAttivi = {
            generi: new Set(),
            prezzi: new Set()
        };

        function azzeraFiltri() {
            filtriAttivi.generi.clear();
            filtriAttivi.prezzi.clear();
            aggiornaStileBottoni();
            applicaFiltri();
        }

        function toggleFiltro(tipo, valore) {
            if (tipo === 'genere') {
                if (valore === 'tutti') {
                    filtriAttivi.generi.clear();
                } else {
                    filtriAttivi.generi.has(valore) ? filtriAttivi.generi.delete(valore) : filtriAttivi.generi.add(valore);
                }
            } else if (tipo === 'prezzo') {
                filtriAttivi.prezzi.has(valore) ? filtriAttivi.prezzi.delete(valore) : filtriAttivi.prezzi.add(valore);
            }
            aggiornaStileBottoni();
            applicaFiltri();
        }

        function aggiornaStileBottoni() {
            document.querySelectorAll('[onclick*="toggleFiltro(\'genere\'"]').forEach(btn => {
                const genere = btn.getAttribute('onclick').match(/'([^']+)'/)[1];
                btn.className = genere === 'tutti' ?
                    (filtriAttivi.generi.size === 0 ? 'btn btn-light' : 'btn btn-outline-light') :
                    (filtriAttivi.generi.has(genere) ? 'btn btn-light' : 'btn btn-outline-light');
            });
            document.querySelectorAll('[onclick*="toggleFiltro(\'prezzo\'"]').forEach(btn => {
                const prezzo = btn.getAttribute('onclick').match(/'([^']+)'/)[1];
                btn.className = filtriAttivi.prezzi.has(prezzo) ? 'btn btn-light' : 'btn btn-outline-light';
            });
        }

        function ordinaPerPrezzo(ordine) {
            const container = document.getElementById('catalogo-giochi');
            const giochi = Array.from(container.querySelectorAll('.col-md-4'));
            giochi.sort((a, b) => ordine === 'crescente' ? parseFloat(a.getAttribute('data-prezzo')) - parseFloat(b.getAttribute('data-prezzo')) : parseFloat(b.getAttribute('data-prezzo')) - parseFloat(a.getAttribute('data-prezzo')));
            container.innerHTML = '';
            giochi.forEach(gioco => container.appendChild(gioco));
            document.querySelectorAll('[onclick*="ordinaPerPrezzo("]').forEach(btn => {
                const tipoOrdine = btn.getAttribute('onclick').match(/'([^']+)'/)[1];
                btn.className = tipoOrdine === ordine ? 'btn btn-light' : 'btn btn-outline-light';
            });
        }

        function applicaFiltri() {
            const giochi = document.querySelectorAll('#catalogo-giochi .col-md-4');
            giochi.forEach(gioco => {
                const genereGioco = gioco.getAttribute('data-genere');
                const prezzoGioco = parseFloat(gioco.getAttribute('data-prezzo'));
                const passaFiltroGenere = filtriAttivi.generi.size === 0 || filtriAttivi.generi.has(genereGioco);
                let passaFiltroPrezzo = filtriAttivi.prezzi.size === 0;
                if (!passaFiltroPrezzo) {
                    for (const fascia of filtriAttivi.prezzi) {
                        const [min, max] = fascia.split('-').map(Number);
                        if (prezzoGioco >= min && prezzoGioco <= max) {
                            passaFiltroPrezzo = true;
                            break;
                        }
                    }
                }
                gioco.style.display = (passaFiltroGenere && passaFiltroPrezzo) ? 'block' : 'none';
            });
        }

        // Gestione dell'aggiunta al carrello
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.add-to-cart-btn').forEach(button => {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    const originalText = button.textContent;
                    
                    // Cambia l'aspetto del bottone durante l'invio
                    button.textContent = 'Aggiungendo...';
                    button.disabled = true;
                    button.classList.remove('btn-success');
                    button.classList.add('btn-secondary');
                    
                    // Simula l'aggiunta al carrello
                    setTimeout(() => {
                        button.textContent = 'Aggiunto!';
                        setTimeout(() => {
                            button.textContent = originalText;
                            button.disabled = false;
                            button.classList.remove('btn-secondary');
                            button.classList.add('btn-success');
                        }, 1000);
                    }, 1000);
                });
            });
        });
    </script>
</body>
</html>