--Crear base de datos llamada películas (1 punto)

CREATE DATABASE movies
\c movies

--Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes, determinando la relación entre ambas tablas. (2 puntos)

CREATE TABLE movie (
id SERIAL,
name VARCHAR,
year INT,
director VARCHAR,
PRIMARY KEY (id)
)

CREATE TABLE actor (
  id SERIAL,
  name VARCHAR,
  movie_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (movie_id) REFERENCES movie(id)
)

--Cargar ambos archivos a su tabla correspondiente (1 punto)

--Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, año de estreno, director y todo el reparto. (0.5 puntos)

--Listar los titulos de las películas donde actúe Harrison Ford.(0.5 puntos)

--Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.(1 puntos)

--Indicar cuantos actores distintos hay (1 puntos)


--Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.(1 punto)

--Listar el reparto de las películas lanzadas el año 2001 (1 punto)

--Listar los actores de la película más nueva (1 punto)
