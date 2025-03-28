package org.generationitaly.infinitygaming.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "ordine_item")
public class OrdineItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "ordine_id", nullable = false)
	private Ordine ordine;

	@ManyToOne
	@JoinColumn(name = "game_id", nullable = false)
	private Gioco gioco;

	@Column(name = "prezzo")
	private double prezzo;

	@Column(name = "game_key", unique = true, length = 16, nullable = false)
	private String gameKey;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Ordine getOrdine() {
		return ordine;
	}

	public void setOrdine(Ordine ordine) {
		this.ordine = ordine;
	}

	public Gioco getGioco() {
		return gioco;
	}

	public void setGioco(Gioco gioco) {
		this.gioco = gioco;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getGameKey() {
		return gameKey;
	}

	public void setGameKey(String gameKey) {
		this.gameKey = gameKey;
	}

	@Override
	public String toString() {
		return "OrdineItem [id=" + id + ", prezzo=" + prezzo + ", gameKey=" + gameKey + "]";
	}

}