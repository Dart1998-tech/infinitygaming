<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="org.generationitaly.infinitygaming.entity.Gioco"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Catalogo Giochi - InfinityGames</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp"%>
	<% List<Gioco> giochi = (List<Gioco>) request.getAttribute("giochi"); %>
    <section id="home" class="hero text-center py-5">
        <div class="container">
            <h1 class="display-4">Benvenuto su InfinityGames</h1>
            <p class="lead">Il miglior e-commerce per acquistare videogiochi
                online!</p>
            <a href="#catalogo" class="btn btn-primary btn-lg">Scopri di più</a>
        </div>
    </section>

    <section id="catalogo" class="container my-5">
        <h2 class="text-center mb-4">Catalogo Videogiochi</h2>

        <div class="text-end mb-2">
            <a href="#" onclick="azzeraFiltri()"
                class="text-decoration-underline text-white"
                style="cursor: pointer;">Azzera tutti i filtri</a>
        </div>

        
        <div class="filtri-container text-white p-4 rounded-3 mb-4" style="background: rgba(51, 71, 91, 0.8); backdrop-filter: blur(5px);">
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
                            onclick="ordinaPerPrezzo('decrescente')">Prezzo
                            Decrescente</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" id="catalogo-giochi">
        	<% for(Gioco gioco: giochi) { %>
            <div class="col-md-4 mb-4" data-genere="<%=gioco.getGenere().getId()%>"
                data-prezzo="<%=gioco.getPrezzo()%>" data-id="<%=gioco.getId()%>">
                <div class="card h-100 border-0" style="background: rgba(51, 71, 91, 0.6);">
                    <img
                        src="images/<%=gioco.getImmagine() != null ? gioco.getImmagine() : "placeholder.jpg"%>"
                        class="card-img-top p-3 rounded-4"
                        alt="<%=gioco.getTitolo() != null ? gioco.getTitolo() : "Immagine non disponibile"%>"
                        style="object-fit: contain; height: 200px;">
                    <div class="card-body text-white">
                        <h5 class="card-title"><%=gioco.getTitolo() != null ? gioco.getTitolo() : "Titolo non disponibile"%></h5>
                        <p class="card-text">
                            Prezzo: <span class="badge bg-success">€<%=gioco.getPrezzo() != 0 ? gioco.getPrezzo() : "0.00"%></span></p>
                        <div class="d-grid gap-2">
                            <a href="gioco?id=<%=gioco.getId()%>" class="btn btn-primary">Info</a>
                            <button type="button" class="btn btn-success add-to-cart-btn">Aggiungi al Carrello</button>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </section>

    <footer class="text-center py-3">
        <p>&copy; 2025 InfinityGames. Tutti i diritti riservati.</p>
    </footer>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
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

        
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.add-to-cart-btn').forEach(button => {
                button.addEventListener('click', function() {
                    const originalText = button.textContent;
                    
                  
                    button.textContent = 'Aggiungendo...';
                    button.disabled = true;
                    button.classList.remove('btn-success');
                    button.classList.add('btn-secondary');
                    
                   
                    setTimeout(() => {
                        button.textContent = 'Aggiunto!';
                        setTimeout(() => {
                            button.textContent = originalText;
                            button.disabled = false;
                            button.classList.remove('btn-secondary');
                            button.classList.add('btn-success');
                        }, 1500);
                    }, 1000);
                });
            });
        });
    </script>

    <style>
        .filtri-container {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .filtri-container .btn-outline-light {
            transition: all 0.3s ease;
            border-color: rgba(255, 255, 255, 0.3);
            color: #f8f9fa;
        }

        .filtri-container .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .filtri-container .btn-light {
            background-color: rgba(255, 255, 255, 0.9);
            color: #333;
            font-weight: 500;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-radius: 12px !important;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            transition: transform 0.3s ease;
            background-color: rgba(255, 255, 255, 0.05);
        }

        .card:hover .card-img-top {
            transform: scale(1.03);
        }

        .btn-outline-light {
            border-width: 2px;
            font-weight: 500;
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .add-to-cart-btn {
            transition: all 0.3s ease;
        }

        .add-to-cart-btn:hover {
            background-color: #198754 !important;
            box-shadow: 0 4px 12px rgba(25, 135, 84, 0.3);
        }

        .text-decoration-underline {
            transition: all 0.2s ease;
        }

        .text-decoration-underline:hover {
            color: #0dcaf0 !important;
            text-decoration: none !important;
        }

        .filter-btn:hover {
            background-color: rgba(13, 110, 253, 0.2) !important;
            box-shadow: 0 4px 12px rgba(13, 110, 253, 0.2) !important;
            border-color: #0d6efd !important;
        }

        .price-btn:hover {
            background-color: rgba(25, 135, 84, 0.2) !important;
            box-shadow: 0 4px 12px rgba(25, 135, 84, 0.2) !important;
            border-color: #198754 !important;
        }

        .sort-btn:hover {
            background-color: rgba(220, 53, 69, 0.2) !important;
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.2) !important;
            border-color: #dc3545 !important;
        }

        
        .add-to-cart-btn[disabled] {
            opacity: 0.7;
            cursor: not-allowed;
        }
    </style>
</body>
</html>