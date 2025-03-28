package org.generationitaly.infinitygaming.repository;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.OrdineItem;
import org.generationitaly.infinitygaming.entity.Gioco;

public interface OrderItemRepository {
    

    List<OrdineItem> findByOrder(Ordine ordine);
    

    OrdineItem save(OrdineItem orderItem);

    Optional<OrdineItem> findById(Long id);
    
    Optional<OrdineItem> findByOrderAndGioco(Ordine ordine, Gioco gioco);
}
