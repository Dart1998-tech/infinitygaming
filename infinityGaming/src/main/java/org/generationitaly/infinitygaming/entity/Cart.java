package org.generationitaly.infinitygaming.entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cart")
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne
	@JoinColumn(name = "utente_id", nullable = false)
	private Utente utente;

	@Column(name = "tot_prezzo", nullable = false)
	private double totPrezzo;

	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	private List<CartItem> cartItems = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public double getTotPrezzo() {
		return totPrezzo;
	}

	public void setTotPrezzo(double totPrezzo) {
		this.totPrezzo = totPrezzo;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + "]";
	}
}
