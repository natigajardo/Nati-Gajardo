CREATE TABLE editorial (
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE lector (
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE autor (
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE libro (
  id SERIAL PRIMARY KEY,
  codigo INT,
  titulo VARCHAR,
  editorial_id INT,
  FOREIGN KEY (editorial_id) REFERENCES editorial (id)
);

CREATE TABLE prestamo (
  id SERIAL PRIMARY KEY,
  fecha_devolucion DATE,
  lector_id INT,
  libro_id INT,
  FOREIGN KEY (lector_id) REFERENCES lector (id),
  FOREIGN KEY (libro_id) REFERENCES libro (id)
);

CREATE TABLE libro_autor (
  id SERIAL PRIMARY KEY,
  lector_id INT,
  autor_id INT,
  FOREIGN KEY (lector_id) REFERENCES lector (id),
  FOREIGN KEY (autor_id) REFERENCES autor (id)
);
