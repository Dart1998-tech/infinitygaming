package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.OrdineRepository;
import org.generationitaly.infinitygaming.repository.UtenteRepository;

public class OrdineRepositoryImpl implements OrdineRepository {
    
    private static OrdineRepositoryImpl instance;
    private UtenteRepository utenteRepository;
    
    private OrdineRepositoryImpl() {
        //this.utenteRepository = UtenteRepositoryImpl.getInstance();
    }
    
    public static OrdineRepositoryImpl getInstance() {
        if (instance == null) {
            instance = new OrdineRepositoryImpl();
        }
        return instance;
    }

    @Override
    public List<Ordine> findByUtente(Utente utente) {
//        List<Ordine> ordini = new ArrayList<>();
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("SELECT * FROM ordini WHERE utente_id = ?")) {
//            ps.setLong(1, utente.getId());
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Ordine ordine = new Ordine();
//                ordine.setOrdineId(rs.getInt("ordine_id"));
//                ordine.setPrezzo(rs.getDouble("prezzo"));
//                ordine.setUtenteId(utente);
//                ordini.add(ordine);
//            }
//            return ordini;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return ordini;
//        }
        return null;
    }

    @Override
    public Ordine save(Ordine ordine) {
//        if (ordine.getOrdineId() == 0) {
//            // Insert new order
//            try (Connection connection = JdbcUtil.getConnection();
//                 PreparedStatement ps = connection.prepareStatement(
//                     "INSERT INTO ordini (prezzo, utente_id) VALUES (?, ?)", 
//                     Statement.RETURN_GENERATED_KEYS)) {
//                ps.setDouble(1, ordine.getPrezzo());
//                ps.setLong(2, ordine.getUtenteId().getId());
//                ps.executeUpdate();
//                ResultSet rs = ps.getGeneratedKeys();
//                if (rs.next()) {
//                    ordine.setOrdineId(rs.getInt(1));
//                }
//                return ordine;
//            } catch (SQLException e) {
//                e.printStackTrace();
//                return ordine;
//            }
//        } else {
//            // Update existing order
//            try (Connection connection = JdbcUtil.getConnection();
//                 PreparedStatement ps = connection.prepareStatement(
//                     "UPDATE ordini SET prezzo = ?, utente_id = ? WHERE ordine_id = ?")) {
//                ps.setDouble(1, ordine.getPrezzo());
//                ps.setLong(2, ordine.getUtenteId().getId());
//                ps.setInt(3, ordine.getOrdineId());
//                ps.executeUpdate();
//                return ordine;
//            } catch (SQLException e) {
//                e.printStackTrace();
//                return ordine;
//            }
//        }
        return null;
    }

    public Optional<Ordine> findByIdOrder(int id) {
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("SELECT * FROM ordini WHERE ordine_id = ?")) {
//            ps.setLong(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                Ordine ordine = new Ordine();
//                ordine.setOrdineId(rs.getInt("ordine_id"));
//                ordine.setPrezzo(rs.getDouble("prezzo"));
//                
//                int utenteId = rs.getInt("utente_id");
//                Optional<Utente> utenteOpt = utenteRepository.findByIdUser(utenteId);
//                if (utenteOpt.isPresent()) {
//                    ordine.setUtenteId(utenteOpt.get());
//                }
//                
//                return Optional.of(ordine);
//            }
//            return Optional.empty();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return Optional.empty();
//        }
    	return null;
    }

    @Override
    public List<Ordine> findAll() {
//        List<Ordine> ordini = new ArrayList<>();
//        try (Connection connection = JdbcUtil.getConnection();
//             PreparedStatement ps = connection.prepareStatement("SELECT * FROM ordini")) {
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Ordine ordine = new Ordine();
//                ordine.setOrdineId(rs.getInt("ordine_id"));
//                ordine.setPrezzo(rs.getDouble("prezzo")); 
//                
//                int utenteId = rs.getInt("utente_id");
//                Optional<Utente> utenteOpt = utenteRepository.findByIdUser(utenteId);
//                if (utenteOpt.isPresent()) {
//                    ordine.setUtenteId(utenteOpt.get());
//                }
//                
//                ordini.add(ordine);
//            }
//            return ordini;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return ordini;
//        }
    	return null;
    }

	@Override
	public Optional<Ordine> findById(int ordineId) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}
}
