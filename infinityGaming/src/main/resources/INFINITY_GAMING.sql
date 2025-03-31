DROP SCHEMA if exists infinity_gaming;

CREATE DATABASE infinity_gaming;
use infinity_gaming;

-- Tabella 'genere' (prerequisito per 'game')
CREATE TABLE genere(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) UNIQUE NOT NULL
);

-- Tabella 'utente'
CREATE TABLE utente (
    id INT(10) NOT NULL AUTO_INCREMENT ,
    nome VARCHAR(45) NOT NULL,
    cognome VARCHAR(45) NOT NULL,
    email VARCHAR(65) NOT NULL,
    username VARCHAR(45) UNIQUE NOT NULL,
    password VARCHAR(45) NOT NULL,
    regdate DATE NOT NULL,
    fondi DOUBLE DEFAULT 0,
    PRIMARY KEY (id)
);

-- Tabella 'game' (richiede 'genere')
CREATE TABLE game(
    id INT(12) PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(45) NOT NULL,
    software_house VARCHAR(45) NOT NULL,
    genere_id INT NOT NULL,
    anno INT NOT NULL,
    prezzo DOUBLE NOT NULL,
    immagine VARCHAR(255) NOT NULL,
    recensione TEXT NOT NULL,
    voto INT NOT NULL,
    FOREIGN KEY (genere_id) REFERENCES genere(id)
);

-- Tabella 'piattaforma'
CREATE TABLE piattaforma(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) UNIQUE NOT NULL
);

-- Tabella relazione 'game_piattaforma' (richiede 'game' e 'piattaforma')
CREATE TABLE game_piattaforma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT NOT NULL,
    piattaforma_id INT NOT NULL,
    FOREIGN KEY (game_id) REFERENCES game(id),
    FOREIGN KEY (piattaforma_id) REFERENCES piattaforma(id)
);

-- Tabella 'cart' (relazione opzionale con 'utente')
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utente_id INT NOT NULL,
    tot_prezzo DOUBLE NOT NULL DEFAULT 0
);

-- Tabella 'cart_items' (relazione con 'cart' e 'game')
CREATE TABLE cart_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    game_id INT NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (game_id) REFERENCES game(id)
);

-- Tabella 'ordine'
CREATe TABLE ordine (
	id int primary key auto_increment NOT NULL,
	prezzo DOUBLE,
    data_ordine DATE NOT NULL,
	utente_id int not null,
	FOREIGN KEY (utente_id) REFERENCES utente(id)
);

-- Tabella 'ordine_item' (relazione con 'cart' e 'game')
CREATE TABLE ordine_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ordine_id INT NOT NULL,
    game_id INT NOT NULL,
    prezzo DOUBLE NOT NULL,
    game_key VARCHAR(16) UNIQUE NOT NULL,  
    FOREIGN KEY (ordine_id) REFERENCES ordine(id),
    FOREIGN KEY (game_id) REFERENCES game(id)
);

-- Inserimento dati in 'genere'
INSERT INTO genere VALUES (1, 'FPS');
INSERT INTO genere VALUES (2, 'RPG');
INSERT INTO genere VALUES (3, 'ACTION');
INSERT INTO genere VALUES (4, 'PLATFORM');
INSERT INTO genere VALUES (5, 'MOBA');
INSERT INTO genere VALUES (6, 'SPORT');

-- Inserimento dati in 'piattaforma'
INSERT INTO piattaforma VALUES (1, 'PC');
INSERT INTO piattaforma VALUES (2, 'PZ');
INSERT INTO piattaforma VALUES (3, 'NOENTIENDO');
INSERT INTO piattaforma VALUES (4, 'YBOX');

-- Inserimento dati in 'game' (ordinati cronologicamente)
INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Grand Theft Bus', 'TRAPSTAR GAMES', 3, 2015, 29.00, 'bestseller7.jpg', 'Un classico di azione e caos urbano.', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('FortCrash', 'Giochi Epici', 1, 2018, 0.00, 'bestseller4.jpg', 'Costruisci per proteggerti dai nemici.', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Metal Gear Salad', 'KONCIMA', 3, 2020, 19.00, 'popular2.jpg', 'Un capolavoro di azione e stealth.', 9);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Minegrape', 'MICROHARD', 3, 2020, 29.00, 'minegrape.jpg', 'Crea e costruisci senza limiti.', 8);
UPDATE game SET immagine = 'minegrape.jpeg' WHERE id=4;

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Red Decaded Redemption', 'TRAPSTAR GAMES', 3, 2021, 50.00, 'recommended1.jpg', 'Un’avventura epica nel selvaggio West.', 9);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Super Malio Bros', 'NO ENTIENDO', 4, 2022, 30.00, 'bestseller5.jpg', 'Una piattaforma divertente per tutte le età.', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('FIFA 25', 'AE SPORK', 6, 2024, 59.00, 'fifa25', 'Un simulatore di calcio realistico.', 9);
UPDATE game SET immagine = 'fifa25.jpg' WHERE id=7;
select* from game;

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('LOL', 'RION GAMES', 5, 2025, 50.00, 'bestseller8.jpg', 'Il miglior MOBA di strategia!', 10);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES('Street Feeder', 'Urban Game Studio', 1, 2023, 49.99, 'trending1.jpg', 'Un gioco competitivo di lotta e cibo di strada.', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES('Murderer\'s Creed', 'Assassin Studio', 2, 2022, 59.99, 'trending2.jpg', 'Un’avventura stealth con misteri intriganti.', 9);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('The Elderly Scrolls', 'FantasySoft', 1, 2021, 44.99, 'trending3.jpg', 'Esplora un mondo magico con personaggi indimenticabili.', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Pac-Moan', 'Retro Games Corp', 3, 2020, 29.99, 'trending4.jpg', 'Un revival horror del classico arcade.', 9);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('The Tomb Stalker', 'Mystery Games', 4, 2022, 54.99, 'trending5.jpg', 'Un gioco d’avventura con enigmi e antichi segreti.', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Cattlefield', 'Farm Combat Studio', 5, 2023, 39.99, 'trending6.jpg', 'Un FPS unico con animali e combattimenti nelle fattorie.', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Need for Sheep', 'Wild Race Studio', 3, 2021, 24.99, 'trending7.jpg', 'Un gioco di corsa in cui le pecore sono protagoniste.', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Left 4 Snacks', 'Zombie Snack Studio', 6, 2020, 34.99, 'trending8.jpg', 'Sopravvivi raccogliendo snack e sfuggendo ai zombie.', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Final Fiasco VII', 'Epic Fail Games', 2, 2023, 69.99, 'trending9.jpg', 'Un RPG epico pieno di caos e storie avvincenti.', 10);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES('Neon Horizon', 'Pinko Games', 1, 2022, 20.99, 'bestseller1.jpg', 'Cyberpunk mozzafiato, gameplay travolgente', 8); 

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES('The Lame Lame of','Failsoft Entertainment', 2, 2023, 9.99, 'bestseller3.jpg', 'La "leggenda" di cui nessuno voleva parlare.', 3); 

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES('The Itchìng', 'BugCD Projekt', 2, 2023, 39.99, 'bestseller2.jpg', 'Un horror dove la vera minaccia non sono i mostri', 6); 

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES('Don Matteo', 'Pinki Games', 1, 2022, 20.99, 'bestseller6.jpg', 'Don Matteo non ha preso bene la pensione anticipata', 9); 

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Light Souls', 'FromSoftBrioschi', 5, 2023, 19.99, 'bestseller9.jpg', 'Perfetto per chi vuole la soddisfazione senza il trauma!', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Clumsy Knight Chronicle', 'TripFall Studio', 2, 2023, 12.99, 'offer1.jpg','Combatti draghi goffi, risolvi puzzle maldestri e salva il regno... per puro caso.', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Haunted Farm Tycoon', 'SpookSoft', 4, 2023, 14.99, 'offer2.jpg',
'Gestisci una fattoria infestata: coltiva zucche parlanti, alleva galline zombi e contratta con fantasmi per la raccolta',7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Underwater Mafia', 'FishCrime Studio', 2, 2024, 24.99, 'offer3.jpg', 'Un GTA sottomarino',8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Alien Veggie War', 'GreenPixel Games', 4, 2023, 18.99, 'popular1.jpg','Un frenetico platform in cui gli alieni si contenderanno la Terra e il futura della razza... vegetale', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Prince Rescue Simulator', 'Fairytale Fail Studios', 6, 2023, 9.99, 'popular3.jpg',
'Simulatore di incompetenza reale: salva principesse che NON vogliono essere salvate!', 6);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('BioShockwave Civilis', 'Irrational Waves', 1, 2024, 29.99, 'popular4.jpg', 'La tua arma è un''onda sonora che riscrive la storia!',9);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Call of Booty', 'MICROHARD', 3, 2024, 59.00, 'popular5.jpg', 'Un emozionante sparatutto!', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Pirate Pancake Planver', 'Fluffy Parrot Games', 6, 2023, 16.99, 'popular6.jpg', 'Simulatore di pirati pasticceri', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Furocalypse Sigoe', 'Purrfect Storm Games', 5, 2024, 29.99, 'preorder2.jpg', 'crea il tuo felino post-apocalittico', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('ScaffoldField', 'Purret Game', 3, 2024, 39.99, 'preorder1.jpg', 'Gioco di guerra molto avvincente', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('X', 'Hashtag Games', 2, 2024, 0.00, 'preorder3.jpg','Lotta contro i tuoi nemici e vinci!', 6);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('The Elder Stolls VI', 'Bethesdont', 2, 2026, 79.99, 'ps1.jpg', 'i draghi si addormentano durante i combattimenti.', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Murdrer''s Creed: Instear Steaker Russ', 'Ubisof', 1, 2025, 69.99, 'ps2.jpg', 'Un’avventura stealth con misteri intriganti.', 9); 

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Spider-Pork', 'Insomniac Don', 3, 2024, 59.99, 'ps3.jpeg', 'L''eroe del quartiere al tuo servizio!', 6);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Among SUS', 'Innersloth', 6, 2023, 4.99, 'recommended2.jpg',
'Un gioco di inganni dove l''impostore è SEMPRE quel tipo che dice "Tranquillo, non sono io".', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Lara' , 'Square Enix Per Caso', 2, 2023, 49.99, 'recommended3.jpg', 'Avventura in cui Lara non trova MAI il manufatto giusto.',7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto) 
VALUES ('Apex: Respawn', 'Respawn Entertainment', 5, 2023, 0.00, 'recommended4.jpg', 'Battle Royale: il caos più divertente che abbiate mai visto', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto) 
VALUES ('Among Farts', 'InnerGas', 6, 2023, 3.99, 'recommended5.jpg', 'Un social deduction game dove l''impostore è chi ha mangiato i fagioli.', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('The Legend of Elda: Losteyes', 'Hayasan (fake)', 2, 2024, 59.99, 'recommended6.jpg','La principessa Elda non trova MAI le sue lenti a contatto magiche. Esplora dungeon oscuri... perché non vedi nulla.', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Eclipstichonicles: L''Ombra del Destino', 'Destino Games', 2, 2023, 49.99, 'recommended7.jpg', 'Dove il tuo destino è scritto... ma il copione è pieno di errori di battitura.', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Steel Horizon: La Battaglia dei Confini', 'IronDad Games', 6, 2024, 39.99, 'recommended8.jpg',
'Dove comandi eserciti di mecha con problemi di confine.', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Candy Kart', 'Sugar Rush Studios', 4, 2023, 29.99, 'reviewed1.jpg','Un kart arcade dove corredi su piste di gelato e lanci caramelle esplosive!', 9); 

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Cooking Mayhem', 'Chaos Kitchen Studio', 4, 2023, 24.99, 'reviewed2.jpg', 'Simulatore di cucina dove il tuo obiettivo è sopravvivere alla tua stessa incompetenza!', 8);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Silent Hill', 'Konami Country', 3, 2024, 49.99, 'reviewed3.jpg',
'Survival horror ambientato nelle campagne emiliane', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Resident Peanuts', 'Crunchy Capcom', 5, 2023, 29.99, 'reviewed4.jpg',
'Survival horror arachide: fuggi da zombie allergici al burro d''arachidi', 9); 

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Kingdom Come Delivery', 'Warhorse Express', 6, 2024, 34.99, 'reviewed5.jpg',
'Il vero dark souls è la logistica medievale!', 7);

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Duck Hunter: Apocalypse', 'Nintendont', 1, 2023, 14.99, 'reviewed6.jpg', 'Gioco di mira dove i paperi sono sostituiti da: anatre zombi', 7); 

INSERT INTO game (titolo, software_house, genere_id, anno, prezzo, immagine, recensione, voto)
VALUES ('Lemmings On Vacation', 'Psygnosis Tours', 5, 2024, 19.99, 'reviewed7.jpg',
'Puzzle-game dove devi salvare lemming in crisi esistenziale in vacanza', 7);

SELECT * FROM game;
SELECT * FROM piattaforma;

-- Inserimento dati in game_piattaforma
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (1, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (1, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (1, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (2, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (3, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (4, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (5, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (5, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (5, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (5, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (6, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (7, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (7, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (7, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (7, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (8, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (9, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (9, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (10, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (10, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (10, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (10, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (10, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (11, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (11, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (12, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (13, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (13, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (13, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (13, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (14, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (14, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (14, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (14, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (15, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (15, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (15, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (16, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (17, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (17, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (18, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (18, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (18, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (19, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (20, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (20, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (20, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (21, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (22, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (23, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (23, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (23, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (24, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (25, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (26, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (27, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (28, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (29, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (29, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (29, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (29, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (30, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (31, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (32, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (33, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (34, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (35, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (36, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (37, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (38, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (38, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (38, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (38, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (39, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (39, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (39, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (40, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (41, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (42, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (43, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (44, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (45, 3);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (46, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (46, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (46, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (47, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (48, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (49, 1);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (49, 2);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (49, 4);
INSERT INTO game_piattaforma (game_id, piattaforma_id) VALUES (50, 1);

 SELECT id, titolo, software_house FROM game WHERE titolo LIKE '?%';
 
UPDATE utente u SET fondi = fondi + 100 WHERE u.id = 1 ;