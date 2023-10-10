DROP TABLE IF EXISTS entornos;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS sector;
DROP TABLE IF EXISTS deposito;

CREATE TABLE entornos (
	"id"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL UNIQUE,
	"sector"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT), 
  FOREIGN KEY (sector) REFERENCES sector(id)
);

CREATE TABLE items (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"nombre"	TEXT NOT NULL,
	"marca" TEXT,
  "numero_serie" TEXT
);

CREATE TABLE sector (
	"id"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL,
  "piso" INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT), 
  UNIQUE ("nombre", "piso")
);

CREATE TABLE deposito (
	"id"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL UNIQUE, 
  "sector" TEXT NOT NULL UNIQUE
);

INSERT INTO sector(nombre, piso) VALUES ("biblioteca", 0), ("peine 1", 0), ("peine 1", 1),
        ("peine 2", 0), ("peine 2", 1), ("peine 3", 0), ("peine 3", 1);
INSERT INTO entornos(nombre, sector) VALUES ("ttr", (SELECT id from sector where nombre = "biblioteca"));
INSERT INTO entornos(nombre, sector) VALUES ("101", (SELECT id from sector where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("102", (SELECT id from sector where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("103", (SELECT id from sector where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("104", (SELECT id from sector where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("105", (SELECT id from sector where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("111", (SELECT id from sector where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("112", (SELECT id from sector where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("113", (SELECT id from sector where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("114", (SELECT id from sector where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("115", (SELECT id from sector where nombre = "peine 1" and piso = 1));

INSERT INTO entornos(nombre, sector) VALUES ("201", (SELECT id from sector where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("202", (SELECT id from sector where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("203", (SELECT id from sector where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("204", (SELECT id from sector where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("205", (SELECT id from sector where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("211", (SELECT id from sector where nombre = "peine 2" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("212", (SELECT id from sector where nombre = "peine 2" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("213", (SELECT id from sector where nombre = "peine 2" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("214", (SELECT id from sector where nombre = "peine 2" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("215", (SELECT id from sector where nombre = "peine 2" and piso = 1));

INSERT INTO entornos(nombre, sector) VALUES ("301", (SELECT id from sector where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("302", (SELECT id from sector where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("303", (SELECT id from sector where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("304", (SELECT id from sector where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("305", (SELECT id from sector where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre, sector) VALUES ("311", (SELECT id from sector where nombre = "peine 3" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("312", (SELECT id from sector where nombre = "peine 3" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("313", (SELECT id from sector where nombre = "peine 3" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("314", (SELECT id from sector where nombre = "peine 3" and piso = 1));
INSERT INTO entornos(nombre, sector) VALUES ("315", (SELECT id from sector where nombre = "peine 3" and piso = 1));

-- ITEMS en la biblioteca
INSERT INTO items(nombre, ubicacion, marca, numero_serie)  
  VALUES ("monitor", 1, "philips", "1235"),
          ("monitor", 1, "philips", "1236"),
          ("teclado", 1, "logitech", "1237"),
          ("teclado", 1, "logitech", "1238"),
          ("mouse", 1, "logitech", "1239"),
          ("mouse", 1, " logitech", "1224"),
          ("computadora", 1, "lenovo", "1214"),
          ("computadora", 1, "lenovo", "1294");

-- ITEMS en la 101
INSERT INTO items(nombre, ubicacion) 
  VALUES ("mesa", 2),
          ("pizarrón", 2);

