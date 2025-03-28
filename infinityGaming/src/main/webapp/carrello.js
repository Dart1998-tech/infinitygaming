let carrello = [];
let totale = 0;

function aggiungiAlCarrello(nome, prezzo) {
    carrello.push({ nome, prezzo });
    totale += prezzo;
    aggiornaCarrello();
    alert(`${nome} è stato aggiunto al carrello!`);
}

function aggiornaCarrello() {
    const listaCarrello = document.getElementById('lista-carrello');
    const totaleCarrello = document.getElementById('totale-carrello');
    listaCarrello.innerHTML = '';
    carrello.forEach(item => {
        const li = document.createElement('li');
        li.textContent = `${item.nome} - €${item.prezzo.toFixed(2)}`;
        listaCarrello.appendChild(li);
    });
    totaleCarrello.textContent = totale.toFixed(2);
}

function svuotaCarrello() {
    carrello = [];
    totale = 0;
    aggiornaCarrello();
    alert('Carrello svuotato!');
}

function resocontoFinale() {
    if (carrello.length === 0) {
        alert('Il carrello è vuoto!');
        return;
    }
    let resoconto = "Resoconto finale:\n";
    carrello.forEach(item => {
        resoconto += `${item.nome} - €${item.prezzo.toFixed(2)}\n`;
    });
    resoconto += `Totale: €${totale.toFixed(2)}`;
    alert(resoconto);
}

console.log('Il file carrello.js è caricato correttamente');

document.getElementById('carrello-btn').addEventListener('click', function () {
    console.log('Clic sull’icona rilevato');
    document.getElementById('carrello').classList.toggle('visible');
});