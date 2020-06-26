CREATE TABLE curso (
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE alumno (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  curso_id INT,
  rut INT,
  FOREIGN KEY (curso_id) REFERENCES curso (id)
);

CREATE TABLE profesor (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  departameto_id INT,
  FOREIGN KEY (departameto_id) REFERENCES departamento (id)
);

CREATE TABLE prueba (
  id SERIAL PRIMARY KEY
  score FLOAT,
  nota floar,
  alumno_id INT,
  profesor_id INT,
  FOREIGN KEY (alumno_id) REFERENCES alumno (id),
  FOREIGN KEY (profesor_id) REFERENCES profesor (id)
);
