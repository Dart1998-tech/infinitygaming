package org.generationitaly.infinitygaming.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

/*

-- Tabella 'game' (richiede 'genere')
CREATE TABLE game(
    id INT(12) PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(45) NOT NULL,
    software_house VARCHAR(45) NOT NULL,
    genere_id INT,
    anno INT NOT NULL,
    prezzo DOUBLE,
    immagine VARCHAR(255) NOT NULL,
    recensione TEXT NOT NULL,
    voto INT NOT NULL,
    FOREIGN KEY (genere_id) REFERENCES genere(genere_id)
);
 */
@Entity
@Table(name = "game")
public class Gioco {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private int id;

	@Column(name = "titolo", length = 45)
	private String titolo;

	@Column(name = "software_house", nullable = false, length = 45)
	private String softwareHouse;

	@ManyToOne
	@JoinColumn(name = "genere_id", nullable = false)
	private Genere genere;

	@Column(name = "anno", nullable = false)
	private int anno;

	@Column(name = "prezzo", nullable = false)
	private double prezzo;

	@Column(name = "immagine", nullable = false, length = 255)
	private String immagine;

	@Column(name = "recensione", nullable = false)
	private String recensione;

	@Column(name = "voto", nullable = false)
	private int voto;

	@OneToMany(mappedBy = "gioco")
	private List<GamePiattaforma> piattaforme = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getSoftwareHouse() {
		return softwareHouse;
	}

	public void setSoftwareHouse(String softwareHouse) {
		this.softwareHouse = softwareHouse;
	}

	public Genere getGenere() {
		return genere;
	}

	public void setGenere(Genere genere) {
		this.genere = genere;
	}

	public int getAnno() {
		return anno;
	}

	public void setAnno(int anno) {
		this.anno = anno;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public String getRecensione() {
		return recensione;
	}

	public void setRecensione(String recensione) {
		this.recensione = recensione;
	}

	public int getVoto() {
		return voto;
	}

	public void setVoto(int voto) {
		this.voto = voto;
	}

	public List<GamePiattaforma> getPiattaforme() {
		return piattaforme;
	}

	public void setPiattaforme(List<GamePiattaforma> piattaforme) {
		this.piattaforme = piattaforme;
	}

	@Override
	public String toString() {
		return "Gioco [id=" + id + ", titolo=" + titolo + ", softwareHouse=" + softwareHouse + ", anno=" + anno
				+ ", prezzo=" + prezzo + ", immagine=" + immagine + ", recensione=" + recensione + ", voto=" + voto
				+ "]";
	}

}
