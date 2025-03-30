<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="org.generationitaly.infinitygaming.entity.Utente"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profilo Utente</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	Utente utente = (Utente) session.getAttribute("utente");
	int count = utente.getNome().length() + utente.getCognome().length() + utente.getUsername().length();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	String formattedRegDate = sdf.format(utente.getRegdate());
	%>

	<%@ include file="navbar.jsp"%>

	<form action="utente" method="get">
		<section class="container my-5">
			<h1 class="text-center mb-4">Profilo Utente</h1>

			<div class="row">
				<div class="col-md-4">
					<div class="card text-center">
						<img src="./images/man.png" alt="Foto Profilo"
							class="card-img-top rounded-circle p-4">
						<div class="card-body">
							<h4 class="card-title"><%=utente.getUsername()%></h4>
							<hr>
							<p style="color: #fff !important">
								Livello: <strong style="color: rgba(51, 129, 255, 1) !important"><%=count%></strong>
							</p>
							<p style="color: #fff !important">
								Membro dal: <strong
									style="color: rgba(51, 129, 255, 1) !important"><%=formattedRegDate%></strong>
							</p>
						</div>
					</div>
				</div>
				
				
				<%-- modifica panoramica rivedi logica per la libreria (DINAMICA) --%>
				
				
				<div class="col-md-8">
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">Panoramica</h2>
							<hr>
							<div class="panoramica-item">
								<span class="label" style="color: #fff !important">Amici:</span>
								<span class="value">0</span>
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
		</section>
	</form>


	<section class="container my-5">
		<div class="card my-5">
			<div class="card-body">
				<h2 class="card-title">Portafoglio</h2>
				<hr>
				<br>
				<p style="color: #fff !important">
					Saldo: <strong style="color: rgba(51, 129, 255, 1) !important"><%=utente.getFondi()%>
						€</strong>
				</p>
				<form action="update-fondi" method="get">
					<button type="submit" class="btn btn-outline-light ms-2"
						aria-label="update-fondi">Aggiungi fondi</button>
				</form>
			</div>
		</div>

		<div class="card my-5">
			<div class="card-body">
				<h2>Ultimi Obiettivi</h2>
				<hr>
				<ul>
					<li style="color: #fff !important">"I want more" - Compra un
						DLC</li>
					<li style="color: #fff !important">"Hello world!" - Aggiungi
						un'immagine profilo</li>
				</ul>
			</div>
		</div>

		<div class="card my-5">
			<div class="card-body">
				<h2>Wishlist Giochi</h2>
				<hr>
				<p style="color: #fff !important">Nessun gioco aggiunto alla
					wishlist.</p>
			</div>
		</div>

		<div class="card my-5">
			<div class="card-body">
				<h2>Link Affiliazione</h2>
				<hr>
				<a style="color: rgba(255, 123, 0, 1);"
					href="https://www.instant-gaming.com/?igr=mounba98" target="_blank">
					Instant Gaming </a>
			</div>
		</div>
	</section>



	<%@ include file="footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/infinityGaming/carrello.js"></script>
</body>
</html>
