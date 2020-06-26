--PARTE 1:

-- Crear base de datos posts:

CREATE DATABASE posts;

\c posts


-- Crear tabla posts, con los atributos id, nombre de usuario, fecha de creación, contenido, descripción

CREATE TABLE posts (id SERIAL, username VARCHAR(20), created_at DATE, content VARCHAR, description VARCHAR(225), PRIMARY KEY (id));


--Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"

INSERT INTO posts (username, created_at, content, description) VALUES
('Pamela', '06-09-2020', 'Lorem ipsum 1', 'Lorem ipsum 2');

INSERT INTO posts (username, created_at, content, description) VALUES
('Pamela', '06-09-2020', 'Lorem ipsum 1.2', 'Lorem ipsum 2.2');

INSERT INTO posts (username, created_at, content, description) VALUES
('Carlos', '06-09-2020', 'Lorem ipsum 1', 'Lorem ipsum 2');

SELECT * FROM posts;


-- Modificar la tabla post, agregando la columna título

ALTER TABLE posts
ADD titulo VARCHAR(30);

SELECT * FROM posts;


-- Agregar título a las publicaciones ya ingresadas

UPDATE posts SET titulo = 'Titulo 1' WHERE id =1;

UPDATE posts SET titulo = 'Titulo 2' WHERE id =2;

UPDATE posts SET titulo = 'Titulo 3' WHERE id =3;

SELECT * FROM posts;


-- Insertar 2 post para el usuario "Pedro"

INSERT INTO posts (username, created_at, content, description) VALUES
('Pedro', '06-09-2020', 'Lorem ipsum 1', 'Lorem ipsum 2');

INSERT INTO posts (username, created_at, content, description) VALUES
('Pedro', '06-09-2020', 'Lorem ipsum 1.2', 'Lorem ipsum 2.2');


-- Eliminar el post de Carlos

DELETE FROM posts WHERE username='Carlos';


-- Ingresar un nuevo post para el usuario "Carlos"

INSERT INTO posts (username, created_at, content, description) VALUES
('Carlos', '06-09-2020', 'Lorem ipsum 3', 'Lorem ipsum 4');

SELECT * FROM posts;

UPDATE posts SET titulo = 'Titulo 3' WHERE id =4;

UPDATE posts SET titulo = 'Titulo 4' WHERE id =5;

UPDATE posts SET titulo = 'Titulo 5' WHERE id =6;

SELECT * FROM posts;


--PARTE 2

-- Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación, contenido, que se relacione con la tabla posts.

CREATE TABLE comentarios (
id SERIAL, post_id INT, created_at TIMESTAMP, content VARCHAR(225),
FOREIGN KEY (post_id) REFERENCES posts(id),
PRIMARY KEY (id));

SELECT * FROM comentarios;


-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"

INSERT INTO comentarios (post_id, created_at, content) VALUES
(1, '06-09-2020 20:21:42', 'Comentario 1 para Pamela');

INSERT INTO comentarios (post_id, created_at, content) VALUES
(2, '06-09-2020 20:21:42', 'Comentario 2 para Pamela');


INSERT INTO comentarios (post_id, created_at, content) VALUES
(6, '06-09-2020 20:21:42', 'Comentario 1 para Carlos');

INSERT INTO comentarios (post_id, created_at, content) VALUES
(6, '06-09-2020 20:21:42', 'Comentario 2 para Carlos');

INSERT INTO comentarios (post_id, created_at, content) VALUES
(6, '06-09-2020 20:21:42', 'Comentario 3 para Carlos');

INSERT INTO comentarios (post_id, created_at, content) VALUES
(6, '06-09-2020 20:21:42', 'Comentario 4 para Carlos');

SELECT * FROM comentarios;


-- Crear un nuevo post para "Margarita"

INSERT INTO posts (username, created_at, content, description, titulo) VALUES
('Margarita', '06-09-2020', 'contenido de prueba', 'descripcion de prueba', 'titulo margarita');


-- Ingresar 5 comentarios para el post de Margarita

INSERT INTO comentarios (post_id, created_at, content) VALUES
(7, '06-09-2020 20:29:20', 'Comentario 1 para Margarita');

INSERT INTO comentarios (post_id, created_at, content) VALUES
(7, '06-09-2020 20:29:20', 'Comentario 2 para Margarita');

INSERT INTO comentarios (post_id, created_at, content) VALUES
(7, '06-09-2020 20:29:20', 'Comentario 3 para Margarita');

INSERT INTO comentarios (post_id, created_at, content) VALUES
(7, '06-09-2020 20:29:20', 'Comentario 4 para Margarita');

INSERT INTO comentarios (post_id, created_at, content) VALUES
(7, '06-09-2020 20:29:20', 'Comentario 5 para Margarita');


SELECT * FROM comentarios;
