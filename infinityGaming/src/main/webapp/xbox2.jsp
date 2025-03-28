<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Infinity - E-commerce di Videogiochi</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font  -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #7FFF00, #006400); 
	color: #ffffff; 
	font-family: 'Arial', sans-serif;
}

h1, h2, h3, h4, h5, h6, p, a {
	color: #ffffff; 
}

a:hover {
	color: #7FFF00; 
}

.navbar {
	height: 100px;
	background-color: rgba(0, 100, 0, 0.9); /* Verde scuro trasparente */
	padding: 10px;
	font-size: 1.5rem;
}

.navbar-brand img {
	height: 80px;
	width: auto;
}

.carousel {
	max-width: 80%;
	margin: 0 auto;
	background-color: transparent;
}

.carousel-inner img {
	width: 100%;
	height: auto;
	max-height: 500px;
	object-fit: contain;
}

.section-title {
	text-align: center;
	margin-bottom: 40px;
	font-size: 2.5rem;
	color: #7FFF00; 
}

.game-card img {
	border-radius: 10px;
	transition: transform 0.3s ease-in-out;
}

.game-card img:hover {
	transform: scale(1.05);
}

footer {
	background-color: rgba(0, 100, 0, 0.9); 
	padding: 20px;
	text-align: center;
	margin-top: 40px;
}

.card {
	transition: transform 0.2s, box-shadow 0.2s;
	border: none;
	border-radius: 10px;
	overflow: hidden;
	background-color: rgba(0, 100, 0, 0.8); 
	color: #fff;
	margin-bottom: 40px;
	margin-right: 20px;
	margin-left: 20px;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.card-img-top {
	height: 200px;
	object-fit: cover;
}

.btn-primary {
	background-color: #7FFF00; 
	color: #000; 
	border: none;
	padding: 0.5rem 1rem;
	border-radius: 5px;
}

.btn-primary:hover {
	background-color: #6cc700; 
}

.btn-danger {
	background-color: #e74c3c; 
	border: none;
	padding: 0.5rem 1rem;
	border-radius: 5px;
}

.btn-danger:hover {
	background-color: #c0392b; 
}

.carrello {
	position: fixed;
	top: 60px;
	right: 20px;
	background: rgba(0, 100, 0, 0.9); 
	border: 1px solid #006400;
	padding: 1rem;
	width: 300px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: none;
	border-radius: 10px;
	z-index: 1000;
	color: #fff;
}

.carrello.visible {
	display: block;
}

.carrello ul {
	list-style: none;
	padding: 0;
}

.carrello ul li {
	padding: 0.5rem 0;
	border-bottom: 1px solid #006400;
}

.carrello ul li:last-child {
	border-bottom: none;
}

footer {
	background-color: rgba(0, 100, 0, 0.9); 
	color: #fff;
	padding: 1rem 0;
	margin-top: 2rem;
}

.filtri {
	margin-bottom: 20px;
}

.filtri button {
	margin-right: 10px;
}

.recensioni {
	margin-top: 20px;
	padding: 15px;
	background-color: rgba(0, 100, 0, 0.8); 
	border-radius: 10px;
}

.recensioni h5 {
	margin-bottom: 10px;
}

.recensioni p {
	margin: 5px 0;
}
</style>
</head>
<body>

	
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img src="images/logo.png"
				alt="Logo" class="logo">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">Chi
							Siamo</a></li>
					<li class="nav-item"><a class="nav-link" href="games.jsp">Giochi</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contatti</a></li>
				</ul>
				<div class="d-flex">
					<a href="profile.jsp"> <img src="images/profilo.png"
						alt="Profilo" class="icon">
					</a> <a href="cart.jsp"> <img src="images/cart.png" alt="Carrello"
						class="icon">
					</a>
				</div>
			</div>
		</div>
	</nav>

	<!-- Carosello (Giochi Popolari) -->
	<section class="mt-5">
		<div id="gameCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<%
				for (int i = 0; i < 5; i++) {
				%>
				<button type="button" data-bs-target="#gameCarousel"
					data-bs-slide-to="<%=i%>" class="<%=(i == 0) ? "active" : ""%>"></button>
				<%
				}
				%>
			</div>
			<div class="carousel-inner">
				<%
				for (int i = 1; i <= 5; i++) {
				%>
				<div class="carousel-item <%=(i == 1) ? "active" : ""%>">
					<img src="images/popular<%=i%>.jpg" class="d-block w-100"
						alt="Popular Game <%=i%>">
				</div>
				<%
				}
				%>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#gameCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#gameCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
	</section>

	<!-- Giochi in Trending -->
	<section class="container mt-5">
		<h2 class="section-title">Giochi in Trending</h2>
		<div class="row" id="trending-games">
			<%
			List<String> trendingGames = new ArrayList<>();
			trendingGames.add("trending1.jpg");
			trendingGames.add("trending2.jpg");
			trendingGames.add("trending3.jpg");
			trendingGames.add("trending4.jpg");
			trendingGames.add("trending5.jpg");
			trendingGames.add("trending6.jpg");
			trendingGames.add("trending7.jpg");
			trendingGames.add("trending8.jpg");
			trendingGames.add("trending9.jpg");

			for (String game : trendingGames) {
			%>
			<div class="col-md-4 mb-4">
				<div class="game-card">
					<img src="images/<%=game%>" class="img-fluid rounded"
						alt="Trending Game">
				</div>
			</div>
			<%
			}
			%>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<p>&copy; 2024 Infinity. Tutti i diritti riservati.</p>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Custom JavaScript -->
	<script>
		// Funzione per gestire l'interattività del carrello
		document.addEventListener("DOMContentLoaded", function() {
			const cartButton = document.querySelector('a[href="cart.jsp"]');
			const cartCount = document.createElement('span');
			cartCount.id = 'cart-count';
			cartCount.textContent = '0';
			cartButton.appendChild(cartCount);

			// Aggiungi un prodotto al carrello
			function addToCart(productName, price) {
				alert(`"${productName}" è stato aggiunto al carrello!`);
				const count = parseInt(cartCount.textContent);
				cartCount.textContent = count + 1;
			}

			// Esempio di utilizzo
			addToCart("FortCrash", 0);
		});
	</script>
</body>
</html>