package org.generationitaly.infinitygaming.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

/*
	 * -- Tabella 'piattaforma'
	CREATE TABLE piattaforma(
	    id INT AUTO_INCREMENT PRIMARY KEY,
	    nome VARCHAR(20) NOT NULL
);
 */
@Entity
@Table(name = "piattaforma")
public class Piattaforma {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private long id;

	@Column(name = "nome", unique = true, nullable = false, length = 20)
	private String nome;
	
	@OneToMany(mappedBy = "piattaforma")
	private List<GamePiattaforma> piattaforme = new ArrayList<>();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		return "Piattaforma [id=" + id + ", nome=" + nome + "]";
	}

}
