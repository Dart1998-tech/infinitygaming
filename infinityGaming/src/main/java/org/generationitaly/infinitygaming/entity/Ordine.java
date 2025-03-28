package org.generationitaly.infinitygaming.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "ordine")
public class Ordine {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private int id;

	@Column(name = "prezzo")
	private double prezzo;

	@Temporal(TemporalType.DATE)
	@Column(name = "data_ordine", nullable = false)
	private Date dataOrdine;

	@ManyToOne
	@JoinColumn(name = "utente_id", nullable = false)
	private Utente utente;

	@OneToMany(mappedBy = "ordine", fetch = FetchType.EAGER)
	private List<OrdineItem> items = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public Date getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(Date dataOrdine) {
		this.dataOrdine = dataOrdine;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public List<OrdineItem> getItems() {
		return items;
	}

	public void setItems(List<OrdineItem> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "Ordine [id=" + id + ", prezzo=" + prezzo + ", dataOrdine=" + dataOrdine + "]";
	}

}
