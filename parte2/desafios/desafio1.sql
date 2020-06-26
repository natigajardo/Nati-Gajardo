CREATE TABLE departamento (
  id SERIAL,
  nombre VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE trabajador (
  id SERIAL,
  nombre VARCHAR,
  rut INT,
  direccion VARCHAR,
  departamento_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (departamento_id) REFERENCES departamento (id)
);

CREATE TABLE liquidacion (
  id SERIAL,
  codigo_liquidacion INT,
  fecha_liquidacion DATE,
  URL_drive_liquidacion VARCHAR,
  trabajador_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (trabajador_id) REFERENCES trabajador (id)
);
