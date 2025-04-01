<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="org.generationitaly.infinitygaming.entity.*"%>
<%@ page
	import="org.generationitaly.infinitygaming.repository.impl.UtenteRepositoryImpl"%>
<%@ page
	import="org.generationitaly.infinitygaming.repository.UtenteRepository"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>I Tuoi Ordini - Infinity Gaming</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="style.css">

	<style type="text/css">
	
		.footer{
		
		  width: 100%;
		  height: 100px;
		  position: relative;
		  padding: 650px 0px 5px;
		  min-height:10vh;
			
		}
	
	</style>

</head>
<body>
	<%@ include file="navbar.jsp"%>

	<section class="container my-5">
		<h1 class="text-center mb-4">Dettaglio ordine</h1>

		<%
		Ordine ordine = (Ordine) request.getAttribute("ordine");

		List<OrdineItem> orderItems = ordine.getItems();
		%>
		<div class="table-responsive">
			<table class="table table-dark">
				<thead>
					<tr>
						<th>Game-id</th>
						<th>Titolo</th>
						<th>Game-Key</th>
						<th>Prezzo</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (OrdineItem orderItem : orderItems) {
					%>
					<tr>
						<td>#<%=orderItem.getId()%></td>
						<td><%=orderItem.getGioco().getTitolo()%></td>
						<td><%=orderItem.getGameKey()%></td>
						<td><%=orderItem.getPrezzo()%></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</div>

		<div class="d-flex justify-content-center mt-4">
			<a href="/infinityGaming/ordini" class="btn btn-secondary">Torna
				agli ordini</a>
		</div>
	</section>
	
	<div class="footer">
	
	<%@ include file="footer.jsp"%>
	
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
