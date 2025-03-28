<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dettagli Gioco</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
	<link rel="stylesheet" href="style.css">
	<style>
		
		*{
			font-family: "Poppins", sans-serif;
		}
		
		.wrapper{
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
        
        .wrapper img{
        	width: 500px;
        	height: 600px;
        }
        
        .wrapper .info{
        	display: flex;
        	flex-direction: column;
        }
        
        .wrapper .info h5{
        	font-size: 50px;
        }
        
        .bottone button{
        	border-color: white;
        	accent-color: #fff;
        	margin-right: 3px;
        	margin-left: 15px;
        	margin: 2px;
        }
        
        .wrapper .bottone button{
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
        	
        .wrapper .bottone button:hover{
			background: rgba(70, 71, 71, 0.80);
			color: #fff;
        }
		
	</style>
</head>
<body>
	<%@ include file="navbar.jsp" %>
	<div>
		<%
		String id = request.getParameter("id");
		String titolo = "";
		String softwareHouse = "";
		int genere = 0;
		String nomeGenere ="";
		int anno = 0;
		double prezzo = 0.0;
		boolean giocoFound = false;
		String immagine = "";
		String recensione = "";
		int voto = 0;

		if (id != null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinity_gaming", "root", "admin");
				PreparedStatement ps = con.prepareStatement("SELECT * FROM game WHERE id = ?");
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
			id = rs.getString("id");
			titolo = rs.getString("titolo");
			immagine = rs.getString("immagine");
			softwareHouse = rs.getString("software_house");
			genere = rs.getInt("genere_id");
			anno = rs.getInt("anno");
			prezzo = rs.getDouble("prezzo");
			recensione = rs.getString("recensione");
			voto = rs.getInt("voto");
			giocoFound = true;
			
			 // query per recupo nome genere dalla tabella 'genere'
            PreparedStatement psGenere = con.prepareStatement("SELECT nome_genere FROM genere WHERE genere_id = ?");
            psGenere.setInt(1, genere);  // genere per recuperare il nome
            ResultSet rsGenere = psGenere.executeQuery();

            if (rsGenere.next()) {
                nomeGenere = rsGenere.getString("nome_genere");  // Memorizza il nome del genere
            }
			
            rsGenere.close();
            psGenere.close();
				
			System.out.println("Gioco recuperato dal database");
				} else {
			System.out.println("Gioco non trovato nel database con ID: " + id);
				}

				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println("Errore nel recupero del gioco dal database: " + e.getMessage());
				e.printStackTrace();
			}
		} else {
			Object giocoObj = request.getAttribute("game");

			if (giocoObj != null) {
				try {
					java.lang.reflect.Method getId = giocoObj.getClass().getMethod("getId");

			java.lang.reflect.Method getTitolo = giocoObj.getClass().getMethod("getTitolo");
			java.lang.reflect.Method getImmagine = giocoObj.getClass().getMethod("getImmagine");
			java.lang.reflect.Method getSoftwareHouse = giocoObj.getClass().getMethod("getSoftwareHouse");
			java.lang.reflect.Method getGenere = giocoObj.getClass().getMethod("getGenere");
			java.lang.reflect.Method getAnno = giocoObj.getClass().getMethod("getAnno");
			java.lang.reflect.Method getPrezzo = giocoObj.getClass().getMethod("getPrezzo");
			java.lang.reflect.Method getRecensione = giocoObj.getClass().getMethod("getRecensione");
			java.lang.reflect.Method getVoto = giocoObj.getClass().getMethod("getVoto");

			id= (String) getId.invoke(giocoObj);
			titolo = (String) getTitolo.invoke(giocoObj);
			immagine = (String) getImmagine.invoke(giocoObj);
			softwareHouse = (String) getSoftwareHouse.invoke(giocoObj);
			genere = (Integer) getGenere.invoke(giocoObj);
			anno = (Integer) getAnno.invoke(giocoObj);
			prezzo = (Double) getPrezzo.invoke(giocoObj);
			recensione = (String) getRecensione.invoke(giocoObj);
			voto = (Integer) getVoto.invoke(giocoObj);
			
			 // Recupero del nome del genere
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infinity_gaming", "root", "admin");
            PreparedStatement psGenere = con.prepareStatement("SELECT nome_genere FROM genere WHERE genere_id = ?");
            psGenere.setInt(1, genere);
            ResultSet rsGenere = psGenere.executeQuery();
            
            if (rsGenere.next()) {
                nomeGenere = rsGenere.getString("nome");
            }

            rsGenere.close();
            psGenere.close();
            con.close();
			

			giocoFound = true;
				} catch (Exception e) {
			System.out.println("Errore nella reflection: " + e.getMessage());
			e.printStackTrace();
				}
			}
		}
		%>
		<div>
	    <% if (giocoFound) { %>
          	
            <div class="col-md-4 mb-4" data-genere="<%=genere%>"
                data-prezzo="<%=prezzo%>" data-id="<%=id%>">
                <div class="wrapper">
                
                    <img src="images/<%=immagine != null ? immagine : "placeholder.jpg"%>"
                        alt="<%=titolo != null ? titolo : "Immagine non disponibile"%>">
                    <div class="info">
                        <h5><%=titolo != null ? titolo : "Titolo non disponibile"%></h5>
                        <hr>
                        <p><strong>Prezzo: </strong>€<%=prezzo != 0 ? prezzo : "0.00"%></p>
                        <p><strong>Software House:</strong> <%= softwareHouse %></p>
	        			<p><strong>Genere:</strong> <%= nomeGenere %></p>
	        			<p><strong>Anno di uscita:</strong> <%= anno %></p>
				        <p><strong>Recensione:</strong> <%= recensione %></p>
				        <p><strong>Voto:</strong> <%= voto %>/10</p>
				        <div class="bottone">
    						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#grazieModal">
        						Compra ora
    						</button>
						</div>
						<div class="modal fade" id="grazieModal" tabindex="-1" aria-labelledby="grazieModalLabel" aria-hidden="true">
						    <div class="modal-dialog">
						        <div class="modal-content">
						            <div class="modal-header" style="background-color: #f8f9fa; color: #000;">
						                <h5 class="modal-title" id="grazieModalLabel" style="color: #000;">Grazie per il tuo acquisto!</h5>
						                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Chiudi"></button>
						            </div>
						            <div class="modal-body" style="color: #000; background-color: #f8f9fa;">
						                Il tuo ordine è stato confermato con successo. Ti invieremo presto una conferma via email.
						            </div>
						            <div class="modal-footer" style="background-color: #f8f9fa;">
						                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
						            </div>
						        </div>
						    </div>
						</div>
                    </div>
                </div>
            </div>
            <%
	     } else { %>
	        <p>Gioco non trovato.</p>
	    <% } %>
	</div>	
	</div>
	<jsp:include page="footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

