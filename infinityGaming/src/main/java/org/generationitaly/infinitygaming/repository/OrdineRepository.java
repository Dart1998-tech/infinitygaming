package org.generationitaly.infinitygaming.repository;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.Utente;

public interface OrdineRepository {
    
    List<Ordine> findByUtente(Utente utente);
    
    Ordine save(Ordine ordine);
    
    Optional<Ordine> findById(int ordineId);
    
    List<Ordine> findAll();
}
