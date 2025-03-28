<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page
	import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, 
                  java.sql.ResultSet, java.sql.SQLException, java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale, java.util.Date"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Storico Ordini - Infinity Gaming</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<style>
:root {
	--primary-color: #2c3e50;
	--secondary-color: #34495e;
	--accent-color: #3498db;
}

body {
	background-color: #f8f9fa;
}

.container {
	margin-top: 30px;
	margin-bottom: 50px;
}

.page-header {
	border-bottom: 2px solid var(--primary-color);
	padding-bottom: 15px;
	margin-bottom: 30px;
}

.order-card {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	margin-bottom: 20px;
	border-radius: 8px;
	overflow: hidden;
	border: none;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.order-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.order-header {
	background-color: var(--primary-color);
	color: white;
	padding: 15px;
}

.order-body {
	padding: 20px;
}

.order-id {
	font-weight: 700;
	color: var(--primary-color);
}

.order-date {
	color: #6c757d;
}

.order-payment {
	display: flex;
	align-items: center;
}

.payment-icon {
	margin-right: 8px;
	font-size: 1.2rem;
}

.btn-view {
	background-color: var(--accent-color);
	border: none;
	padding: 8px 20px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.btn-view:hover {
	background-color: #2980b9;
}

.no-orders {
	text-align: center;
	padding: 50px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.status-badge {
	padding: 5px 10px;
	border-radius: 20px;
	font-size: 0.8rem;
	font-weight: 600;
}

.status-completed {
	background-color: #2ecc71;
	color: white;
}

.status-pending {
	background-color: #f39c12;
	color: white;
}

.status-cancelled {
	background-color: #e74c3c;
	color: white;
}

@media ( max-width : 768px) {
	.order-card {
		margin-bottom: 15px;
	}
	.order-body {
		padding: 15px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1 class="text-center">
				<i class="bi bi-list-check"></i> Storico Ordini
			</h1>
			<p class="text-center text-muted">Visualizza tutti i tuoi ordini
				effettuati</p>
		</div>

		<%
		
		String dbURL = "jdbc:mysql://localhost:3306/infinity_gaming";
		String dbUser = "root";
		String dbPassword = "admin";

		
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

			
			String sql = "SELECT o.id, o.data, o.metodo_pagamento, o.stato, "
			+ "COUNT(og.game_id) as num_game, SUM(g.prezzo * og.quantita) as totale " + "FROM ordini o "
			+ "LEFT JOIN ordini o ON o.id = og.ordine_id " + "LEFT JOIN game g ON og.gioco_id = g.id "
			+ "GROUP BY o.id ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			boolean hasOrders = false;
		%>

		<div class="row">
			<%
			while (rs.next()) {
				hasOrders = true;
				int id = rs.getInt("id");
				Date data = rs.getTimestamp("data");
				String metodoPagamento = rs.getString("metodo_pagamento");
				String stato = rs.getString("stato");
				int numProdotti = rs.getInt("num_prodotti");
				double totale = rs.getDouble("totale");

				
				String paymentIcon = "";
				String paymentText = metodoPagamento;


			%>
			<div class="col-md-6 col-lg-4">
				<div class="card order-card">
					<div class="card-header order-header">
						<div class="d-flex justify-content-between align-items-center">
							<span class="order-id">Ordine #<%=id%></span> 
					</div>
					<div class="card-body order-body">
						<div class="mb-3">
							<small class="order-date"><i class="bi bi-calendar"></i>
								<%=dateFormat.format(data)%></small>
						</div>



						<div class="d-flex justify-content-between align-items-center">
							<h5 class="mb-0">
								Totale: <strong>€<%=String.format("%.2f", totale)%></strong>
							</h5>
							<a href="dettaglio_ordine.jsp?id=<%=id%>"
								class="btn btn-primary btn-view"> <i class="bi bi-eye"></i>
								Dettagli
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}

			if (!hasOrders) {
			%>
			<div class="col-12">
				<div class="no-orders">
					<i class="bi bi-cart-x" style="font-size: 3rem; color: #adb5bd;"></i>
					<h3 class="mt-3">Nessun ordine trovato</h3>
					<p class="text-muted">Non hai ancora effettuato alcun ordine</p>
					<a href="negozio.jsp" class="btn btn-primary mt-3"> <i
						class="bi bi-shop"></i> Vai al negozio
					</a>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<%
		} catch (ClassNotFoundException e) {
		%>
		<div class="alert alert-danger mt-4">
			<i class="bi bi-exclamation-triangle"></i> Errore: Driver database
			non trovato
		</div>
		<%
		e.printStackTrace();
		} catch (SQLException e) {
		%>
		<div class="alert alert-danger mt-4">
			<i class="bi bi-database-exclamation"></i> Errore durante l'accesso
			al database
		</div>
		<%
		e.printStackTrace();
		} finally {
		
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException e) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
			}
		}
		%>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
