package org.generationitaly.infinitygaming.entity;

import jakarta.persistence.*;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

//@Entity
//@Table(name = "cart_items")
public class CartItem {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "cart_id", nullable = false)
    private Cart cart;

    @ManyToOne
    @JoinColumn(name = "gioco_id", nullable = false)
    private Gioco gioco;

    @Column(name = "prezzo")
    private double prezzo;

    // Costruttori
    public CartItem() {
    	
    }

    public CartItem(Cart cart, Gioco gioco, double prezzo) {
        this.cart = cart;
        this.gioco = gioco;
        this.prezzo = prezzo;
    }

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Cart getCart() { return cart; }
    public void setCart(Cart cart) { this.cart = cart; }

    public Gioco getGioco() { return gioco; }
    public void setGioco(Gioco gioco) { this.gioco = gioco; }

    public double getPrezzo() { return prezzo; }
    public void setPrezzo(double price) { this.prezzo = price; }

}