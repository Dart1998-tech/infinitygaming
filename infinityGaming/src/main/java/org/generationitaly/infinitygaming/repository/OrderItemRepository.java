package org.generationitaly.infinitygaming.repository;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.OrderItem;
import org.generationitaly.infinitygaming.entity.Gioco;

public interface OrderItemRepository {
    

    List<OrderItem> findByOrder(Ordine ordine);
    

    OrderItem save(OrderItem orderItem);

    Optional<OrderItem> findById(Long id);
    
    Optional<OrderItem> findByOrderAndGioco(Ordine ordine, Gioco gioco);
}
