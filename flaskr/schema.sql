DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS entornos;


 CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

CREATE TABLE "entornos" (
	"id"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL UNIQUE,
	"peine"	INTEGER NOT NULL,
  "piso" INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);


INSERT INTO entornos(id, nombre, peine, piso) VALUES (1,101, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (2,102, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (3,103, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (4,104, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (5,105, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (6,111, 1, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (7,112, 1, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (8,113, 1, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (9,114, 1, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (10,115, 1, 2);

