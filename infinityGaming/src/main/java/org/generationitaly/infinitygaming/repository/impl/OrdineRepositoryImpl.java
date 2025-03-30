package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;

import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.OrdineRepository;
import org.generationitaly.infinitygaming.repository.UtenteRepository;

import jakarta.servlet.http.HttpSession;

public class OrdineRepositoryImpl extends JpaRepositoryImpl<Ordine, Long> implements OrdineRepository {
    
    private static OrdineRepositoryImpl instance;
    private UtenteRepository utenteRepository;
    
    public static OrdineRepositoryImpl getInstance() {
        if (instance == null) {
            instance = new OrdineRepositoryImpl();
        }
        return instance;
    }
    public OrdineRepositoryImpl() {
        super(Ordine.class);
    }

    @Override
    public List<Ordine> findByUtente(Utente utente) {
		return null;
       
    }

   @Override
    public void save(Ordine ordine) {

       
    }


    @Override
    public List<Ordine> findAll() {

    	return null;
    }

}
