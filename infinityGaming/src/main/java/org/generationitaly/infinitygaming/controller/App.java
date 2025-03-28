package org.generationitaly.infinitygaming.controller;

import java.util.List;

import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.OrdineItem;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.UtenteRepository;
import org.generationitaly.infinitygaming.repository.impl.UtenteRepositoryImpl;

public class App {

	private static UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();
	
	public static void main(String[] args) {
		
		Utente utente = utenteRepository.findById(1L);
		List<Ordine> ordini = utente.getOrdini();
		for(Ordine ordine : ordini) {
			System.out.println(ordine);
			for(OrdineItem item : ordine.getItems()) {
				System.out.println(item);
			}
		}
		
		
	}

}
