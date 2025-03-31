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
}
