<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.generationitaly.infinitygaming.entity.Gioco"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dettagli Gioco</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Poppins'
	rel='stylesheet'>
<link rel="stylesheet" href="style.css">
<style>
* {
	font-family: "Poppins", sans-serif;
}

.wrapper {
	display: flex;
	gap: 15px;
	width: 1650px;
	height: 670px;
	background: rgba(51, 71, 91, 0.8);
	color: #fff;
	border-radius: 10px;
	padding: 30px 30px;
	margin-left: 120px;
	margin-bottom: 30px;
	margin-top: 30px;
}

.wrapper img {
	width: 500px;
	height: 600px;
}

.wrapper .info {
	display: flex;
	flex-direction: column;
}

.wrapper .info h5 {
	font-size: 50px;
}

.bottone button {
	border-color: white;
	accent-color: #fff;
	margin-right: 3px;
	margin-left: 15px;
	margin: 2px;
}

.wrapper .bottone button {
	width: 100%;
	heigth: 100%;
	background: rgba(70, 71, 71, 0.2);
	outline: white;
	border-radius: 40px;
	box-shadows: 0 0 10px rgba(0, 0, 0, .1);
	cursor: pointer;
	font-size: 30px;
	color: #fff;
	font-weigth: 600;
	margin-down: 5px;
}

.wrapper .bottone button:hover {
	background: rgba(70, 71, 71, 0.80);
	color: #fff;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%
		
	Gioco gioco = (Gioco) request.getAttribute("gioco");
	
	%>
	<form action="carrello" method="post">
	<input type="hidden" name = "idGioco" value = "<%= gioco.getId()%>">
		<div>
			<div>
				<div class="col-md-4 mb-4" data-genere="<%=gioco.getGenere()%>"
					data-prezzo="<%=gioco.getPrezzo()%>" data-id="<%=gioco.getId()%>">
					<div class="wrapper">

						<img
							src="images/<%=gioco.getImmagine() != null ? gioco.getImmagine() : "placeholder.jpg"%>"
							alt="<%=gioco.getTitolo() != null ? gioco.getTitolo() : "Immagine non disponibile"%>">
						<div class="info">
							<h5><%=gioco.getTitolo() != null ? gioco.getTitolo() : "Titolo non disponibile"%></h5>
							<hr>
							<p>
								<strong>Prezzo: </strong>€<%=gioco.getPrezzo() != 0 ? gioco.getPrezzo() : "0.00"%></p>
							<p>
								<strong>Software House:</strong>
								<%=gioco.getSoftwareHouse()%></p>
							<p>
								<strong>Genere:</strong>
								<%=gioco.getGenere().getNome()%></p>
							<p>
								<strong>Anno di uscita:</strong>
								<%=gioco.getAnno()%></p>
							<p>
								<strong>Descrizione:</strong>
								<%=gioco.getRecensione()%></p>
							<p>
								<strong>Voto:</strong>
								<%=gioco.getVoto()%>/10
							</p>
							<div class="bottone">
								<button type="submit" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#grazieModal">
									Aggiungi al carrello</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	</form>
</body>
</html>

