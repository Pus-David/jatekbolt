CREATE DATABASE jatekbolt_db
	CHARACTER SET utf8mb4
	COLLATE utf8mb4_hungarian_ci;

CREATE TABLE jatekbolt_db.jatekok (
  id INT NOT NULL AUTO_INCREMENT,
  cim VARCHAR(100) NOT NULL,
  mufaj VARCHAR(50) NOT NULL,
  ar INT NOT NULL,
  ertekeles DECIMAL(2, 1) NOT NULL,
  raktaron TINYINT(1) DEFAULT 1,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 16,
AVG_ROW_LENGTH = 1092,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_hungarian_ci;

SET NAMES 'utf8mb4';

INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(1, 'The Witcher 3: Wild Hunt', 'RPG', 8990, 4.9, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(2, 'Cyberpunk 2077', 'RPG', 14990, 4.5, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(3, 'Elden Ring', 'RPG', 19990, 4.8, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(4, 'Baldur''s Gate 3', 'RPG', 21990, 5.0, 0);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(5, 'God of War Ragnarök', 'Akció', 22990, 4.9, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(6, 'Red Dead Redemption 2', 'Akció', 15990, 4.9, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(7, 'Grand Theft Auto V', 'Akció', 7990, 4.7, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(8, 'Hollow Knight', 'Akció', 4990, 4.8, 0);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(9, 'Civilization VI', 'Stratégia', 9990, 4.6, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(10, 'Age of Empires IV', 'Stratégia', 13990, 4.4, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(11, 'Cities: Skylines II', 'Stratégia', 17990, 3.9, 0);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(12, 'StarCraft II', 'Stratégia', 3990, 4.8, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(13, 'EA Sports FC 25', 'Sport', 24990, 4.1, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(14, 'F1 24', 'Sport', 18990, 4.2, 1);
INSERT INTO jatekbolt_db.jatekok(id, cim, mufaj, ar, ertekeles, raktaron) VALUES
(15, 'NBA 2K25', 'Sport', 21990, 3.8, 0);