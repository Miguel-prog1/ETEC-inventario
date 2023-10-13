DROP TABLE IF EXISTS entornos;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS sectores;
DROP TABLE IF EXISTS depositos;
DROP TABLE IF EXISTS items_en_deposito;
DROP TABLE IF EXISTS items_en_entorno;

CREATE TABLE sectores (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"nombre"	TEXT NOT NULL,
  "piso" INTEGER NOT NULL,
  UNIQUE ("nombre", "piso")
);

CREATE TABLE entornos (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"nombre"	TEXT NOT NULL UNIQUE,
	"sector"	INTEGER NOT NULL,

  FOREIGN KEY (sector) REFERENCES sectores(id)
);

CREATE TABLE depositos (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"nombre"	TEXT NOT NULL UNIQUE, 
	"sector"	INTEGER NOT NULL,
  FOREIGN KEY (sector) REFERENCES sectores(id)
);

CREATE TABLE items (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"nombre"	TEXT NOT NULL,
	"marca" TEXT,
  "numero_serie" TEXT
);

CREATE TABLE items_en_entorno (
  "item_id" INTEGER,
  "entorno_id" INTEGER,
  "cantidad" INTEGER,
  PRIMARY KEY (item_id, entorno_id),
  FOREIGN KEY (item_id) REFERENCES items(id),
  FOREIGN KEY (entorno_id) REFERENCES entornos(id)
);

CREATE TABLE items_en_deposito (
  "item_id" INTEGER,
  "deposito_id" INTEGER,
  "cantidad" INTEGER,
  PRIMARY KEY (item_id, deposito_id),
  FOREIGN KEY (item_id) REFERENCES depositos(id),
  FOREIGN KEY (deposito_id) REFERENCES depositos(id)
);



INSERT INTO sectores(nombre, piso) VALUES ("biblioteca", 0), ("peine 1", 0), ("peine 1", 1),
        ("peine 2", 0), ("peine 2", 1), ("peine 3", 0), ("peine 3", 1),
        ("peine 2/3", 0), ("peine 2/3", 1);
INSERT INTO entornos(nombre,sector) VALUES ("ttr", (SELECT id from sectores where nombre = "biblioteca"));
INSERT INTO entornos(nombre,sector) VALUES ("101", (SELECT id from sectores where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("102", (SELECT id from sectores where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("103", (SELECT id from sectores where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("104", (SELECT id from sectores where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("105", (SELECT id from sectores where nombre = "peine 1" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("111", (SELECT id from sectores where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("112", (SELECT id from sectores where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("113", (SELECT id from sectores where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("114", (SELECT id from sectores where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("115", (SELECT id from sectores where nombre = "peine 1" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("ODS", (SELECT id from sectores where nombre = "peine 1" and piso = 1));
-- "ODS: oficina de soporte"
INSERT INTO entornos(nombre,sector) VALUES ("201", (SELECT id from sectores where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("202", (SELECT id from sectores where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("203", (SELECT id from sectores where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("204", (SELECT id from sectores where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("205", (SELECT id from sectores where nombre = "peine 2" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("211", (SELECT id from sectores where nombre = "peine 2" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("212", (SELECT id from sectores where nombre = "peine 2" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("213", (SELECT id from sectores where nombre = "peine 2" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("214", (SELECT id from sectores where nombre = "peine 2" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("215", (SELECT id from sectores where nombre = "peine 2" and piso = 1));

INSERT INTO entornos(nombre,sector) VALUES ("301", (SELECT id from sectores where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("302", (SELECT id from sectores where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("303", (SELECT id from sectores where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("304", (SELECT id from sectores where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("305", (SELECT id from sectores where nombre = "peine 3" and piso = 0));
INSERT INTO entornos(nombre,sector) VALUES ("311", (SELECT id from sectores where nombre = "peine 3" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("312", (SELECT id from sectores where nombre = "peine 3" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("313", (SELECT id from sectores where nombre = "peine 3" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("314", (SELECT id from sectores where nombre = "peine 3" and piso = 1));
INSERT INTO entornos(nombre,sector) VALUES ("315", (SELECT id from sectores where nombre = "peine 3" and piso = 1));

INSERT INTO depositos(nombre, sector) VALUES ("auxiliar-ciclobasico", (SELECT id from sectores where nombre = "peine 1" and piso = 0));
INSERT INTO depositos(nombre, sector) VALUES ("auxiliar-tic", (SELECT id from sectores where nombre = "peine 2" and piso = 0));
INSERT INTO depositos(nombre, sector) VALUES ("auxiliar-meca", (SELECT id from sectores where nombre = "peine 3" and piso = 0));
INSERT INTO depositos(nombre, sector) VALUES ("principal-tic", (SELECT id from sectores where nombre = "peine 2/3" and piso = 1));
INSERT INTO depositos(nombre, sector) VALUES ("principal-meca", (SELECT id from sectores where nombre = "peine 2/3" and piso = 0));

-- ITEMS en la biblioteca
INSERT INTO items(nombre, marca, numero_serie)  
  VALUES ("monitor", "philips", "1235"),
          ("monitor", "philips", "1236"),
          ("teclado", "logitech", "1237"),
          ("teclado", "logitech", "1238"),
          ("mouse", "logitech", "1239"),
          ("mouse", " logitech", "1224"),
          ("computadora", "lenovo", "1214"),
          ("computadora", "lenovo", "1294");

-- ITEMS en la 101
INSERT INTO items(nombre) 
  VALUES ("mesa"),
          ("pizarrón");

-- agregar algunos items en depositos