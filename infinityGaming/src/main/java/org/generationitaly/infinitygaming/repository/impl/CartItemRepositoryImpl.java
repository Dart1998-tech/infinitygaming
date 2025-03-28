package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.entity.Gioco;
import org.generationitaly.infinitygaming.repository.CartItemRepository;
import org.generationitaly.infinitygaming.repository.GiocoRepository;

public class CartItemRepositoryImpl implements CartItemRepository {
    
    private static CartItemRepositoryImpl instance;
    private GiocoRepository giocoRepository;
    
    private CartItemRepositoryImpl() {
       // this.giocoRepository = GiocoRepositoryImpl.getInstance();
    }
    
    public static CartItemRepositoryImpl getInstance() {
        if (instance == null) {
            instance = new CartItemRepositoryImpl();
        }
        return instance;
    }

    @Override
    public List<CartItem> findByCart(Cart cart) {
//        List<CartItem> cartItems = new ArrayList<>();
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("SELECT * FROM cart_items WHERE cart_id = ?")) {
//            ps.setInt(1, cart.getId());
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                CartItem cartItem = new CartItem();
//                cartItem.setId(rs.getInt("id"));
//                cartItem.setCart(cart);
//                cartItem.setPrezzo(rs.getDouble("prezzo"));
//                
//                int giocoId = rs.getInt("gioco_id");
//                //giocoRepository.findByIdGioco(giocoId).ifPresent(cartItem::setGioco);
//                
//                cartItems.add(cartItem);
//            }
//            return cartItems;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return cartItems;
//        }
    	return null;
    }

    @Override
    public Optional<CartItem> findByCartAndGioco(Cart cart, Gioco gioco) {
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement(
//                 "SELECT * FROM cart_items WHERE cart_id = ? AND gioco_id = ?")) {
//            ps.setLong(1, cart.getId());
//            ps.setLong(2, gioco.getId());
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                CartItem cartItem = new CartItem();
//                cartItem.setId(rs.getInt("id"));
//                cartItem.setCart(cart);
//                cartItem.setGioco(gioco);
//                cartItem.setPrezzo(rs.getFloat("prezzo"));
//                return Optional.of(cartItem);
//            }
//            return Optional.empty();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return Optional.empty();
//        }
    	return null;
    }

    @Override
    public CartItem save(CartItem cartItem) {
//        if (cartItem.getId() == 0) {
//            try (Connection connection = JdbcUtil.getConnection();
//                 PreparedStatement ps = connection.prepareStatement(
//                     "INSERT INTO cart_items (cart_id, gioco_id, quantity, prezzo) VALUES (?, ?, ?, ?)", 
//                     Statement.RETURN_GENERATED_KEYS)) {
//                ps.setLong(1, cartItem.getCart().getId());
//                ps.setLong(2, cartItem.getGioco().getId());
//                ps.setDouble(4, cartItem.getPrezzo());
//                ps.executeUpdate();
//                ResultSet rs = ps.getGeneratedKeys();
//                if (rs.next()) {
//                    cartItem.setId(rs.getInt(1));
//                }
//                return cartItem;
//            } catch (SQLException e) {
//                e.printStackTrace();
//                return cartItem;
//            }
//        } else {
//            try (Connection connection = JdbcUtil.getConnection();
//                 PreparedStatement ps = connection.prepareStatement(
//                     "UPDATE cart_items SET cart_id = ?, gioco_id = ?, quantity = ?, prezzo = ? WHERE id = ?")) {
//                ps.setLong(1, cartItem.getCart().getId());
//                ps.setLong(2, cartItem.getGioco().getId());
//                ps.setDouble(4, cartItem.getPrezzo());
//                ps.setInt(5, cartItem.getId());
//                ps.executeUpdate();
//                return cartItem;
//            } catch (SQLException e) {
//                e.printStackTrace();
//                return cartItem;
//            }
//        }
    	return null;
    }

    @Override
    public void delete(CartItem cartItem) {
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("DELETE FROM cart_items WHERE id = ?")) {
//            ps.setLong(1, cartItem.getId());
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
    }

    @Override
    public Optional<CartItem> findById(Long id) {
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("SELECT * FROM cart_items WHERE id = ?")) {
//            ps.setLong(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                CartItem cartItem = new CartItem();
//                cartItem.setId(rs.getInt("id"));
//                cartItem.setPrezzo(rs.getFloat("prezzo"));
//                
//                return Optional.of(cartItem);
//            }
//            return Optional.empty();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return Optional.empty();
//        }
    	return null;
    }

    @Override
    public void deleteByCart(Cart cart) {
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("DELETE FROM cart_items WHERE cart_id = ?")) {
//            ps.setLong(1, cart.getId());
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
    }

	@Override
	public Optional<CartItem> findByIdCart(int cartItemId) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}
}
