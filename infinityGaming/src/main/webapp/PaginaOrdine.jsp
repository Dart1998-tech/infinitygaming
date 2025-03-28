<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page
	import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, 
                  java.sql.ResultSet, java.sql.SQLException, java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dettaglio Ordine - Infinity Gaming</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.container {
	margin-top: 50px;
	margin-bottom: 50px;
}

.product-card {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	padding: 15px;
	border-radius: 8px;
	background-color: #f8f9fa;
	transition: transform 0.2s;
}

.product-card:hover {
	transform: translateY(-3px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.product-img {
	max-width: 120px;
	margin-right: 20px;
	border-radius: 5px;
}

.order-header {
	background-color: #343a40;
	color: white;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 30px;
}

.total-section {
	background-color: #e9ecef;
	padding: 20px;
	border-radius: 8px;
	margin-top: 30px;
}

.error-alert {
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="container">
		<%
		// Configurazione del database (dovrebbe essere in un file di configurazione)
		String dbURL = "jdbc:mysql://localhost:3306/infinity_gaming";
		String dbUser = "root";
		String dbPassword = "admin";

		// Formattatore per i prezzi
		NumberFormat formatter = NumberFormat.getCurrencyInstance(Locale.ITALY);

		// Ottenere l'ID ordine dal parametro
		String ordineIdParam = request.getParameter("id");
		int ordineId = 0;

		if (ordineIdParam != null && !ordineIdParam.isEmpty()) {
			try {
				ordineId = Integer.parseInt(ordineIdParam);
			} catch (NumberFormatException e) {
				out.println("<div class='alert alert-danger error-alert'>ID ordine non valido</div>");
			}
		} else {
			out.println("<div class='alert alert-danger error-alert'>Nessun ID ordine specificato</div>");
		}

		if (ordineId > 0) {
			Connection conn = null;
			PreparedStatement stmtOrdine = null;
			PreparedStatement stmtGiochi = null;
			ResultSet rsOrdine = null;
			ResultSet rsGiochi = null;

			try {
				// Connessione al database
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

				// Query per i dettagli dell'ordine
				String sqlOrdine = "SELECT id, data, metodo_pagamento, stato FROM ordini WHERE id = ?";
				stmtOrdine = conn.prepareStatement(sqlOrdine);
				stmtOrdine.setInt(1, ordineId);
				rsOrdine = stmtOrdine.executeQuery();

				// Query per i giochi associati all'ordine con quantità
				String sqlGiochi = "SELECT g.id, g.nome, g.prezzo, g.immagine, og.quantita "
				+ "FROM giochi g INNER JOIN ordine_gioco og ON g.id = og.gioco_id " + "WHERE og.ordine_id = ?";
				stmtGiochi = conn.prepareStatement(sqlGiochi);
				stmtGiochi.setInt(1, ordineId);
				rsGiochi = stmtGiochi.executeQuery();
		%>

		<%-- Sezione intestazione ordine --%>
		<div class="order-header">
			<h1 class="mb-3">Dettaglio Ordine</h1>
			<%
			if (rsOrdine.next()) {
				String statoOrdine = rsOrdine.getString("stato");
				String badgeClass = "badge ";

				switch (statoOrdine.toLowerCase()) {
				case "completato":
					badgeClass += "bg-success";
					break;
				case "spedito":
					badgeClass += "bg-primary";
					break;
				case "in elaborazione":
					badgeClass += "bg-warning";
					break;
				case "cancellato":
					badgeClass += "bg-danger";
					break;
				default:
					badgeClass += "bg-secondary";
				}
			%>
			<div
				class="d-flex justify-content-between align-items-center flex-wrap">
				<div>
					<p class="mb-1">
						<strong>Numero Ordine:</strong> #<%=rsOrdine.getInt("id")%></p>
					<p class="mb-1">
						<strong>Data:</strong>
						<%=rsOrdine.getDate("data")%></p>
					<p class="mb-1">
						<strong>Pagamento:</strong>
						<%=rsOrdine.getString("metodo_pagamento")%></p>
				</div>
				<div>
					<span class="<%=badgeClass%>"><%=statoOrdine%></span>
				</div>
			</div>
			<%
			} else {
			%>
			<div class="alert alert-warning">Ordine non trovato</div>
			<%
			}
			%>
		</div>

		<%-- Sezione prodotti --%>
		<h2 class="mb-4">Prodotti acquistati</h2>
		<div class="product-list">
			<%
			double totale = 0.0;
			boolean hasProducts = false;

			while (rsGiochi.next()) {
				hasProducts = true;
				String nome = rsGiochi.getString("nome");
				double prezzo = rsGiochi.getDouble("prezzo");
				String immagine = rsGiochi.getString("immagine");
				int quantita = rsGiochi.getInt("quantita");
				double subtotale = prezzo * quantita;
				totale += subtotale;
			%>
			<div class="product-card">
				<img
					src="<%=immagine != null ? immagine : "https://via.placeholder.com/120"%>"
					alt="<%=nome%>" class="product-img">
				<div class="flex-grow-1">
					<h5 class="mb-1"><%=nome%></h5>
					<div class="d-flex justify-content-between flex-wrap">
						<div>
							<span class="text-muted">Quantità: <%=quantita%></span>
						</div>
						<div>
							<span class="text-muted">Prezzo unitario: <%=formatter.format(prezzo)%></span>
						</div>
						<div>
							<strong>Subtotale: <%=formatter.format(subtotale)%></strong>
						</div>
					</div>
				</div>
			</div>
			<%
			}

			if (!hasProducts) {
			%>
			<div class="alert alert-info">Nessun prodotto trovato per
				questo ordine</div>
			<%
			}
			%>
		</div>

		<%-- Sezione totale --%>
		<div class="total-section">
			<div class="d-flex justify-content-between align-items-center">
				<h4 class="mb-0">Totale ordine</h4>
				<h3 class="mb-0"><%=formatter.format(totale)%></h3>
			</div>
		</div>

		<%
		} catch (ClassNotFoundException e) {
		out.println("<div class='alert alert-danger error-alert'>Driver database non trovato</div>");
		e.printStackTrace();
		} catch (SQLException e) {
		out.println("<div class='alert alert-danger error-alert'>Errore durante l'accesso al database</div>");
		e.printStackTrace();
		} finally {
		// Chiusura delle risorse
		if (rsOrdine != null)
			try {
				rsOrdine.close();
			} catch (SQLException e) {
			}
		if (rsGiochi != null)
			try {
				rsGiochi.close();
			} catch (SQLException e) {
			}
		if (stmtOrdine != null)
			try {
				stmtOrdine.close();
			} catch (SQLException e) {
			}
		if (stmtGiochi != null)
			try {
				stmtGiochi.close();
			} catch (SQLException e) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
			}
		}
		}
		%>

		<%-- Link per tornare indietro --%>
		<div class="mt-4">
			<a href="Storico Ordine.jsp" class="btn btn-outline-secondary">
				&larr; Torna ai tuoi ordini </a>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>