package org.generationitaly.infinitygaming.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

/*
-- Tabella 'utente'
CREATE TABLE utente (
    id INT(10) NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cognome VARCHAR(45) NOT NULL,
    email VARCHAR(65) NOT NULL,
    username VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    regdate DATE NOT NULL,
    fondi FLOAT DEFAULT 0,
    PRIMARY KEY (id)
);
 * 
 */

@Entity
@Table(name = "utente")
public class Utente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private int id;

	@Column(name = "nome", nullable = false, length = 45)
	private String nome;

	@Column(name = "cognome", nullable = false, length = 45)
	private String cognome;

	@Column(name = "email", nullable = false, length = 65)
	private String email;

	@Column(name = "username", nullable = false, length = 45, unique = true)
	private String username;

	@Column(name = "fondi", nullable = false)
	private double fondi;

	@Column(name = "password", nullable = false, length = 45)
	private String password;

	@Temporal(TemporalType.DATE)
	@Column(name = "regdate", nullable = false)
	private Date regdate;

	public long getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public double getFondi() {
		return fondi;
	}

	public void setFondi(double d) {
		this.fondi = d;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Utente [id=" + id + ", nome=" + nome + ", cognome=" + cognome + ", email=" + email + ", username="
				+ username + ", fondi=" + fondi + "]";
	}

}
