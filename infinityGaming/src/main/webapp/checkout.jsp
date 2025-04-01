<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="org.generationitaly.infinitygaming.entity.CartItem"%>
<%@ page import="org.generationitaly.infinitygaming.entity.Cart"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout - Infinity Gaming</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<section class="container my-5">
		<h1 class="text-center mb-4">Checkout</h1>

		<%
		Cart cart = (Cart) request.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		if (cartItems.isEmpty()) {
		%>
		<div class="alert alert-info text-center">
			<p>Il tuo carrello è vuoto. Non puoi procedere al checkout.</p>
			<a href="/infinityGaming/home" class="btn btn-primary mt-3">Torna
				allo shopping</a>
		</div>
		<%
		} else {
		%>
		<div class="row">
			<div class="col-md-8">
				<div class="card mb-4">
					<div class="card-header">
						<h5 class="mb-0">Dati di fatturazione</h5>
					</div>
					<div class="card-body">
						<form action="<%=request.getContextPath()%>/checkout"
							method="post" id="checkout-form">
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="nome" class="form-label">Nome</label> <input
										type="text" class="form-control" id="nome" name="nome"
										required>
								</div>
								<div class="col-md-6">
									<label for="cognome" class="form-label">Cognome</label> <input
										type="text" class="form-control" id="cognome" name="cognome"
										required>
								</div>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" id="email" name="email"
									required>
							</div>

							<div class="mb-3">
								<label for="indirizzo" class="form-label">Indirizzo</label> <input
									type="text" class="form-control" id="indirizzo"
									name="indirizzo" required>
							</div>

							<div class="row mb-3">
								<div class="col-md-4">
									<label for="citta" class="form-label">Città</label> <input
										type="text" class="form-control" id="citta" name="citta"
										required>
								</div>
								<div class="col-md-4">
									<label for="provincia" class="form-label">Provincia</label> <input
										type="text" class="form-control" id="provincia"
										name="provincia" required>
								</div>
								<div class="col-md-4">
									<label for="cap" class="form-label">CAP</label> <input
										type="text" class="form-control" id="cap" name="cap" required>
								</div>
							</div>

							<hr class="my-4">

							<h5 class="mb-3">Metodo di pagamento</h5>

							<div class="form-check mb-3">
								<input class="form-check-input" type="radio"
									name="metodoPagamento" id="carta" value="carta" checked>
								<label class="form-check-label" for="carta"> Carta di
									credito </label>
							</div>

							<div class="card mb-3" id="carta-details">
								<div class="card-body">
									<div class="mb-3">
										<label for="numeroCarta" class="form-label">Numero
											carta</label> <input type="text" class="form-control"
											id="numeroCarta" name="numeroCarta"
											placeholder="1234 5678 9012 3456" >
									</div>

									<div class="row mb-3">
										<div class="col-md-6">
											<label for="scadenza" class="form-label">Data di
												scadenza</label> <input type="text" class="form-control"
												id="scadenza" name="scadenza" placeholder="MM/AA" >
										</div>
										<div class="col-md-6">
											<label for="cvv" class="form-label">CVV</label> <input
												type="text" class="form-control" id="cvv" name="cvv"
												placeholder="123" >
										</div>
									</div>

									<div class="mb-3">
										<label for="intestatario" class="form-label">Intestatario
											carta</label> <input type="text" class="form-control"
											id="intestatario" name="intestatario" >
									</div>
								</div>
							</div>

							<div class="form-check mb-3">
								<input class="form-check-input" type="radio"
									name="metodoPagamento" id="paypal" value="paypal"> <label
									class="form-check-label" for="paypal"> PayPal </label>
							</div>

							<div class="card mb-3 d-none" id="paypal-details">
								<div class="card-body">
									<div class="mb-3">
										<label for="emailPaypal" class="form-label">Email
											PayPal</label> <input type="email" class="form-control"
											id="emailPaypal" name="emailPaypal">
									</div>
								</div>
							</div>
							<div class="form-check mb-3">
								<input class="form-check-input" type="radio"
									name="metodoPagamento" id="fondi" value="fondi"> <label
									class="form-check-label" for="fondi"> Paga con i fondi
									del portafoglio </label>
							</div>

							<div class="form-check mb-3">
								<input class="form-check-input" type="checkbox" id="termini"
									name="termini" required> <label
									class="form-check-label" for="termini"> Accetto i
									termini e le condizioni </label>
							</div>


							<button type="submit" class="btn btn-primary btn-lg w-100">Completa
								l'ordine</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0">Riepilogo ordine</h5>
					</div>
					<div class="card-body">
						<ul class="">
							<%
							double cartTotal = 0;
							for (CartItem item : cartItems) {
								cartTotal += item.getGioco().getPrezzo();
							%>
							<li class="list-group-item d-flex justify-content-between lh-sm">
								<div>
									<h6 class="my-0"><%=item.getGioco().getTitolo()%>
										|
										<%=String.format("%.2f €", item.getGioco().getPrezzo())%></h6>
								</div>
							</li>
							<%
							}
							%>
							<li class="list-group-item d-flex justify-content-between">
								<span>Totale</span> <strong><%=String.format("%.2f €", cartTotal)%></strong>
							</li>
						</ul>
						<br>
						<div class="mt-3">
							<a href="<%=request.getContextPath()%>/carrello"
								class="btn btn-outline-secondary w-100">Torna al carrello</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</section>

	<%@ include file="footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const cartaRadio = document.getElementById('carta');
            const paypalRadio = document.getElementById('paypal');
            const fondiRadio = document.getElementById('fondi')
            const cartaDetails = document.getElementById('carta-details');
            const paypalDetails = document.getElementById('paypal-details');
            const fondiDetails = document.getElementById('fondi-details')
            
            cartaRadio.addEventListener('change', function() {
                if (this.checked) {
                    cartaDetails.classList.add('d-none');
                    paypalDetails.classList.remove('d-none');
                    fondiDetails.classList.remove('d-none');
            });
            
            cartaFondi.addEventListener('change', function() {
                if (this.checked) {
                    cartaDetails.classList.remove('d-none');
                    paypalDetails.classList.remove('d-none');
                    fondiDetails.classList.add('d-none');
                }
            });
            
            paypalRadio.addEventListener('change', function() {
                if (this.checked) {
                    cartaDetails.classList.remove('d-none');
                    paypalDetails.classList.add('d-none');
                    fondiDetails.classList.remove('d-none');
                    
                }
            });
        });
    </script>
</body>
</html>
