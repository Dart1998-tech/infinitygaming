package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Gioco;
import org.generationitaly.infinitygaming.entity.OrderItem;
import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.repository.GiocoRepository;
import org.generationitaly.infinitygaming.repository.OrderItemRepository;

public class OrderItemRepositoryImpl implements OrderItemRepository {
    
    private static OrderItemRepositoryImpl instance;
    private GiocoRepository giocoRepository;
    
    private OrderItemRepositoryImpl() {
        //this.giocoRepository = GiocoRepositoryImpl.getInstance();
    }
    
    public static OrderItemRepositoryImpl getInstance() {
        if (instance == null) {
            instance = new OrderItemRepositoryImpl();
        }
        return instance;
    }

    @Override
    public List<OrderItem> findByOrder(Ordine ordine) {
//        List<OrderItem> orderItems = new ArrayList<>();
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("SELECT * FROM order_items WHERE order_id = ?")) {
//            ps.setInt(1, ordine.getOrdineId());
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                OrderItem orderItem = new OrderItem();
//                orderItem.setId(rs.getInt("id"));
//                orderItem.setOrder(ordine);
//                orderItem.setPrezzo(rs.getFloat("prezzo"));
//                
//                // Carica il gioco
//                int giocoId = rs.getInt("gioco_id");
//                //giocoRepository.findByIdGioco(giocoId).ifPresent(orderItem::setGioco);
//                
//                orderItems.add(orderItem);
//            }
//            return orderItems;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return orderItems;
//        }
    	return null;
    }

    @Override
    public OrderItem save(OrderItem orderItem) {
//        if (orderItem.getId() == 0) {
//            try (Connection connection = JdbcUtil.getConnection();
//                 PreparedStatement ps = connection.prepareStatement(
//                     "INSERT INTO order_items (order_id, gioco_id, prezzo) VALUES (?, ?, ?)", 
//                     Statement.RETURN_GENERATED_KEYS)) {
//                ps.setInt(1, orderItem.getOrder().getOrdineId());
//                ps.setLong(2, orderItem.getGioco().getId());
//                ps.setDouble(3, orderItem.getPrezzo());
//                ps.executeUpdate();
//                ResultSet rs = ps.getGeneratedKeys();
//                if (rs.next()) {
//                    orderItem.setId(rs.getInt(1));
//                }
//                return orderItem;
//            } catch (SQLException e) {
//                e.printStackTrace();
//                return orderItem;
//            }
//        } else {
//            // Update existing order item
//            try (Connection connection = JdbcUtil.getConnection();
//                 PreparedStatement ps = connection.prepareStatement(
//                     "UPDATE order_items SET order_id = ?, gioco_id = ?, prezzo = ? WHERE id = ?")) {
//                ps.setInt(1, orderItem.getOrder().getOrdineId());
//                ps.setLong(2, orderItem.getGioco().getId());
//                ps.setDouble(3, orderItem.getPrezzo());
//                ps.setInt(4, orderItem.getId());
//                ps.executeUpdate();
//                return orderItem;
//            } catch (SQLException e) {
//                e.printStackTrace();
//                return orderItem;
//            }
//        }
    	return null;
    }

    @Override
    public Optional<OrderItem> findById(Long id) {
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("SELECT * FROM order_items WHERE id = ?")) {
//            ps.setLong(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                OrderItem orderItem = new OrderItem();
//                orderItem.setId(rs.getInt("id"));
//                orderItem.setPrezzo(rs.getFloat("prezzo"));
//                
//                return Optional.of(orderItem);
//            }
//            return Optional.empty();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return Optional.empty();
//        }
    	return null;
    }

    @Override
    public Optional<OrderItem> findByOrderAndGioco(Ordine ordine, Gioco gioco) {
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement(
//                 "SELECT * FROM order_items WHERE order_id = ? AND gioco_id = ?")) {
//            ps.setInt(1, ordine.getOrdineId());
//            ps.setLong(2, gioco.getId());
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                OrderItem orderItem = new OrderItem();
//                orderItem.setId(rs.getInt("id"));
//                orderItem.setOrder(ordine);
//                orderItem.setGioco(gioco);
//                orderItem.setPrezzo(rs.getFloat("prezzo"));
//                return Optional.of(orderItem);
//            }
//            return Optional.empty();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return Optional.empty();
//        }
    	return null;
    }
}
