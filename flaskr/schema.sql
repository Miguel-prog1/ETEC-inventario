DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS entornos;
DROP TABLE IF EXISTS items;


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

CREATE TABLE entornos (
	"id"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL UNIQUE,
	"peine"	INTEGER NOT NULL,
  "piso" INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE items (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"nombre"	TEXT NOT NULL,
	"marca" TEXT,
  "numero_serie" TEXT,
  "ubicacion"	INTEGER NOT NULL,
  FOREIGN KEY (ubicacion) REFERENCES entornos(id)
);

INSERT INTO entornos(id, nombre, peine, piso) VALUES (0, "biblioteca",0,1);
-- ITEMS en la biblioteca
INSERT INTO items(nombre, ubicacion, marca, numero_serie)  
  VALUES ("monitor", 0, "philips"),
          ("monitor", 0, "philips"),
          ("teclado", 0, "logitech"),
          ("teclado", 0, "logitech"),
          ("mouse", 0, "logitech"),
          ("mouse", 0, " logitech"),
          ("computadora", 0,),
          ("computadora", 0); 

INSERT INTO entornos(id, nombre, peine, piso) VALUES (1,101, 1, 1);
-- ITEMS en la 101
INSERT INTO items(nombre, ubicacion) 
  VALUES ("mesa", 1),
          ("pizarrón", 1); 


INSERT INTO entornos(id, nombre, peine, piso) VALUES (2,102, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (3,103, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (4,104, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (5,105, 1, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (6,111, 1, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (7,112, 1, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (8,113, 1, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (9,114, 1, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (10,115, 1, 2);

INSERT INTO entornos(id, nombre, peine, piso) VALUES (11,201, 2, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (12,202, 2, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (13,203, 2, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (14,204, 2, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (15,205, 2, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (16,211, 2,2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (17,212, 2,2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (18,213, 2,2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (19,214, 2,2);

INSERT INTO entornos(id, nombre, peine, piso) VALUES (20, 301, 3, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (21, 302, 3, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (22, 303, 3, 1);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (23, 311, 3, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (24, 312, 3, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (25, 313, 3, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (26, 314, 3, 2);
INSERT INTO entornos(id, nombre, peine, piso) VALUES (27, 315, 3, 2);
