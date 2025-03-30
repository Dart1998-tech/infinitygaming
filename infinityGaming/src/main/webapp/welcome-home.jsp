<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome Home - InfinityGames</title>
<link href='https://fonts.googleapis.com/css?family=Poppins'
	rel='stylesheet'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
<style>
.neon-white-blue {
	color: white;
	text-shadow: 0 0 2px #fff, 0 0 5px #08f, 0 0 10px #08f, 0 0 20px #08f;
	font-weight: bold;
	animation: flicker 1.5s infinite alternate;
}

 .carousel-control-prev, 
 .carousel-control-next{ 
 	margin: 600px;
 	
 } 

</style>
</head>
<body>
	<%@ include file="/navbar.jsp"%>



	<section class="mt-5">
		<div id="gameCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#gameCarousel"
					data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#gameCarousel"
					data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#gameCarousel"
					data-bs-slide-to="2"></button>
				<button type="button" data-bs-target="#gameCarousel"
					data-bs-slide-to="3"></button>
				<button type="button" data-bs-target="#gameCarousel"
					data-bs-slide-to="4"></button>
				<button type="button" data-bs-target="#gameCarousel"
					data-bs-slide-to="5"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="/infinityGaming/gioco?id=26"> <img
						src="images/popular1.jpg" class="d-block w-100"
						alt="Alien Veggie War">
					</a>
				</div>
				<div class="carousel-item">
					<a href="/infinityGaming/gioco?id=3"> <img
						src="images/popular2.jpg" class="d-block w-100"
						alt="Metal Gear Salad">
					</a>
				</div>
				<div class="carousel-item">
					<a href="/infinityGaming/gioco?id=27"> <img
						src="images/popular3.jpg" class="d-block w-100"
						alt="Prince Rescue Simulator">
					</a>
				</div>
				<div class="carousel-item">
					<a href="/infinityGaming/gioco?id=28"> <img
						src="images/popular4.jpg" class="d-block w-100"
						alt="BioShockwave Civilis">
					</a>
				</div>
				<div class="carousel-item">
					<a href="/infinityGaming/gioco?id=29"> <img
						src="images/popular5.jpg" class="d-block w-100"
						alt="Call of Booty">
					</a>
				</div>
				<div class="carousel-item">
					<a href="/infinityGaming/gioco?id=30"> <img
						src="images/popular6.jpg" class="d-block w-100"
						alt="Pirate Pancake Planver">
					</a>
				</div>
			</div>
			<div style = "background-color: blue !important">
				<button class="carousel-control-prev" type="button"
					data-bs-target="#gameCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#gameCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon"></span>
				</button>
			</div>
		</div>
	</section>

	<section class="container platforms my-5">
		<h2 class="text-center neon-white-blue">Piattaforme Disponibili</h2>
		<div class="row">
			<div class="col-md-3">
				<a href="/infinityGaming/catalogo?piattaforma=PZ"
					class="text-decoration-none"> <img
					src="/infinityGaming/images/logoPs.jpg"
					class="img-fluid rounded mb-4" alt="PlayStation">
				</a>
				<p class="text-center">PlayZtation</p>
			</div>
			<div class="col-md-3">
				<a href="/infinityGaming/catalogo?piattaforma=YBOX"
					class="text-decoration-none"> <img
					src="/infinityGaming/images/logoXbox.jpeg"
					class="img-fluid rounded mb-4" alt="Xbox">
				</a>
				<p class="text-center">Ybox</p>
			</div>
			<div class="col-md-3">
				<a href="/infinityGaming/catalogo?piattaforma=PC"
					class="text-decoration-none"> <img
					src="/infinityGaming/images/copertinaPC.jpg"
					class="img-fluid rounded mb-4" alt="PC">
				</a>
				<p class="text-center">PC</p>
			</div>
			<div class="col-md-3">
				<a href="/infinityGaming/catalogo?piattaforma=NOENTIENDO"
					class="text-decoration-none"> <img
					src="/infinityGaming/images/sfondoNintendo.jpg"
					class="img-fluid rounded mb-4" alt="Nintendo">
				</a>
				<p class="text-center">NoEntiendo</p>
			</div>
		</div>
	</section>

	<section class="container bestseller my-5">
		<h2 class="text-center neon-white-blue">Giochi Bestseller</h2>
		<div class="row">
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=18"> <img
					src="images/bestseller1.jpg" class="img-fluid rounded mb-4"
					alt="Neon Horizon">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=20"> <img
					src="images/bestseller2.jpg" class="img-fluid rounded mb-4"
					alt="A The Utchìng">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=19"> <img
					src="images/bestseller3.jpg" class="img-fluid rounded mb-4"
					alt="The Lame Lame of">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=2"> <img
					src="images/bestseller4.jpg" class="img-fluid rounded mb-4"
					alt="FortCrash">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=6"> <img
					src="images/bestseller5.jpg" class="img-fluid rounded mb-4"
					alt="Super Malio Bros">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=21"> <img
					src="images/bestseller6.jpg" class="img-fluid rounded mb-4"
					alt="Don Matteo">
				</a>
			</div>
		</div>
	</section>
	<section class="container recommended my-5">
		<h2 class="text-center neon-white-blue">Giochi Consigliati</h2>
		<div class="row">
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=5"> <img
					src="images/recommended1.jpg" class="img-fluid rounded mb-4"
					alt="Red Decaded Redemption">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=37"> <img
					src="images/recommended2.jpg" class="img-fluid rounded mb-4"
					alt="Among SUS">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=38"> <img
					src="images/recommended3.jpg" class="img-fluid rounded mb-4"
					alt="Lara">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=39"> <img
					src="images/recommended4.jpg" class="img-fluid rounded mb-4"
					alt="Apex Respawn">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=40"> <img
					src="images/recommended5.jpg" class="img-fluid rounded mb-4"
					alt="Among Farts">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=41"> <img
					src="images/recommended6.jpg" class="img-fluid rounded mb-4"
					alt="The Legend of Elda: Losteyes">
				</a>
			</div>
		</div>
	</section>

	<section class="container reviewed my-5">
		<h2 class="text-center neon-white-blue">Giochi Recensiti</h2>
		<div class="row">
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=44"> <img
					src="images/reviewed1.jpg" class="img-fluid rounded mb-4"
					alt="Candy Kart">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=45"> <img
					src="images/reviewed2.jpg" class="img-fluid rounded mb-4"
					alt="Cooking Mayhem">
				</a>
			</div>
			<div class="col-md-4">
				<a href="/infinityGaming/gioco?id=46"> <img
					src="images/reviewed3.jpg" class="img-fluid rounded mb-4"
					alt="Silent Hill">
				</a>
			</div>
		</div>
	</section>

	<section class="container trust text-center my-5">
		<h2 class="text-center neon-white-blue">La Nostra Affidabilità</h2>
		<div class="row">
			<%
			for (int i = 1; i <= 3; i++) {
			%>
			<div class="col-md-4">
				<img src="images/trust<%=i%>.jpeg" class="img-fluid"
					alt="Trust Image <%=i%>">
			</div>
			<%
			}
			%>
		</div>
	</section>
	<br>
	<br>
	<%@ include file="footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>