package org.generationitaly.infinitygaming.entity;

import jakarta.persistence.*;
import java.util.List;

//@Entity
//@Table(name = "carts")
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    @JoinColumn(name = "utente_id", nullable = false, unique = true)
    private Utente utente;

    @OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
    private List<CartItem> cartItems;

    // Costruttori
    public Cart() {}

    public Cart(Utente utente) {
        this.utente = utente;
    }

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Utente getUtente() { return utente; }
    public void setUtente(Utente utente) { this.utente = utente; }

    public List<CartItem> getCartItems() { return cartItems; }
    public void setCartItems(List<CartItem> cartItems) { this.cartItems = cartItems; }

    public double getTotalPrice() {
        return cartItems.stream()
                .mapToDouble(gioco -> gioco.getPrezzo())
                .sum();
    }
}
