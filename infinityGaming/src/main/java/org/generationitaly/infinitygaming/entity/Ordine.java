package org.generationitaly.infinitygaming.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

//	@Entity
//	@Table(name = "ordini")
public class Ordine {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ordine_id", nullable = false)
	private int ordineId;

	@Column(name = "prezzo", length = 55)
	private double prezzo;

	@Column(name = "utente_id", nullable = false, length = 45)
	private Utente utenteId;

	public int getOrdineId() {
		return ordineId;
	}

	public void setOrdineId(int ordineId) {
		this.ordineId = ordineId;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public Utente getUtenteId() {
		return utenteId;
	}

	public void setUtenteId(Utente utenteId) {
		this.utenteId = utenteId;
	}

	@Override
	public String toString() {
		return "Ordine [ordineId=" + ordineId + ", prezzo=" + prezzo + ", utente id=" + utenteId + "]";
	}

}
