package org.generationitaly.infinitygaming.repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.CartRepository;
import org.generationitaly.infinitygaming.util.JdbcUtil;

public class CartRepositoryImpl implements CartRepository {
    
    private static CartRepositoryImpl instance;
    
    private CartRepositoryImpl() {}
    
    public static CartRepositoryImpl getInstance() {
        if (instance == null) {
            instance = new CartRepositoryImpl();
        }
        return instance;
    }

    @Override
    public Cart findByUtente(Utente utente) {
		return null;

    }

    @Override
    public Cart save(Cart cart) {
        if (cart.getId() == 0) {
            try (Connection connection = JdbcUtil.getConnection();
                 PreparedStatement ps = connection.prepareStatement(
                     "INSERT INTO cart (utente_id) VALUES (?)", 
                     Statement.RETURN_GENERATED_KEYS)) {
                ps.setLong(1, cart.getUtente().getId());
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    cart.setId(rs.getInt(1));
                }
                return cart;
            } catch (SQLException e) {
                e.printStackTrace();
                return cart;
            }
        } else {
            try (Connection connection = JdbcUtil.getConnection();
                 PreparedStatement ps = connection.prepareStatement(
                     "UPDATE cart SET utente_id = ? WHERE id = ?")) {
                ps.setLong(1, cart.getUtente().getId());
                ps.setLong(2, cart.getId());
                ps.executeUpdate();
                return cart;
            } catch (SQLException e) {
                e.printStackTrace();
                return cart;
            }
        }
    }

    @Override
    public void delete(Cart cart) {
        try (Connection connection = JdbcUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement("DELETE FROM cart WHERE id = ?")) {
            ps.setLong(1, cart.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Cart findById(Long id) {
		return null;
    }
}
