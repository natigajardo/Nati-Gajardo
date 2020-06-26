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
\copy movie FROM 'peliculas2.csv' csv header;
\copy actor(movie_id, name) FROM 'reparto.csv' csv;

--Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, año de estreno, director y todo el reparto. (0.5 puntos)
SELECT M.name, M.year, M.director, A.name FROM movie AS M INNER JOIN actor AS A ON M.id = A.movie_id WHERE M.name ='Titanic';

--Listar los titulos de las películas donde actúe Harrison Ford.(0.5 puntos)
SELECT M.name FROM movie AS M INNER JOIN actor AS A ON M.id = A.movie_id WHERE A.name ='Harrison Ford';

--Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.(1 puntos)
SELECT director, COUNT(*) AS n_movies FROM movie GROUP BY director ORDER BY n_movies DESC LIMIT 10;

--Indicar cuantos actores distintos hay (1 puntos)
SELECT COUNT(DISTINCT(name)) FROM actor;

--Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.(1 punto)
SELECT year, name FROM movie WHERE year BETWEEN 1990 AND 2000 ORDER BY year ASC;

--Listar el reparto de las películas lanzadas el año 2001 (1 punto)
SELECT M.name, A.name FROM movie as M INNER JOIN actor AS A ON m.id = a.movie_id WHERE M.year = 2001;

-- Otra opción: SELECT M.name, A.name FROM (SELECT id, name FROM movie WHERE year = 2001) as M INNER JOIN actor as A ON M.id = A.movie_id;

--Listar los actores de la película más nueva (1 punto)
SELECT A.name, M.name, M.year FROM movie AS M INNER JOIN actor AS A ON M.id = A.movie_id WHERE M.year = (SELECT MAX(year) FROM movie);
