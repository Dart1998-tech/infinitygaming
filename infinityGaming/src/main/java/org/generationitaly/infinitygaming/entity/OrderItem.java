package org.generationitaly.infinitygaming.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

//@Entity
//@Table(name = "order_items")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "ordine_id", nullable = false)
    private Ordine order;
    
    @ManyToOne
    @JoinColumn(name = "gioco_id", nullable = false)
    private Gioco gioco;
    
    @Column(nullable = false)
    private double prezzo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Ordine getOrder() {
		return order;
	}

	public void setOrder(Ordine order) {
		this.order = order;
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

	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", order=" + order + ", gioco=" + gioco + ", prezzo=" + prezzo + "]";
	}
    
    
}