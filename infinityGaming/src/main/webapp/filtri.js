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