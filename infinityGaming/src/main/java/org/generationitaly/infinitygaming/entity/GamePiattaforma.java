package org.generationitaly.infinitygaming.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "game_piattaforma")
public class GamePiattaforma {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;

	@ManyToOne
	@JoinColumn(name = "game_id", nullable = false)
	private Gioco gioco;

	@ManyToOne
	@JoinColumn(name = "piattaforma_id", nullable = false)
	private Piattaforma piattaforma;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Gioco getGioco() {
		return gioco;
	}

	public void setGioco(Gioco gioco) {
		this.gioco = gioco;
	}

	public Piattaforma getPiattaforma() {
		return piattaforma;
	}

	public void setPiattaforma(Piattaforma piattaforma) {
		this.piattaforma = piattaforma;
	}

	@Override
	public String toString() {
		return "GamePiattaforma [id=" + id + ", gioco=" + gioco + ", piattaforma=" + piattaforma + "]";
	}

}
