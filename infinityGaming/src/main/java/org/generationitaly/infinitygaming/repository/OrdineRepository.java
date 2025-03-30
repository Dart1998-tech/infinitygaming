package org.generationitaly.infinitygaming.repository;

import java.util.List;
import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.Utente;

public interface OrdineRepository extends JpaRepository<Ordine, Long>{
    
    List<Ordine> findByUtente(Utente utente);
    
    void save(Ordine ordine);
        
    List<Ordine> findAll();
}
