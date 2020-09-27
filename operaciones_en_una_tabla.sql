--PARTE 1

--Crear Base de datos posts
CREATE DATABASE posts;

--Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido,
--descripción
CREATE TABLE post
(   
    id_post SERIAL PRIMARY KEY, 
    user_name_post VARCHAR(25), 
    date_of_creation_post DATE, 
    content_post VARCHAR(50), 
    description_post VARCHAR(50)
);

--Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"
INSERT INTO post(user_name_post, content_post, description_post) VALUES('Pamela', 'lorem ipsum...', 'lorem ipsum...'), ('Pamela', 'lorem ipsum...', 'lorem ipsum...');

INSERT INTO post(user_name_post, content_post, description_post) VALUES('Carlos', 'lorem ipsum...', 'lorem ipsum...');

--Modificar la tabla post, agregando la columna título
ALTER TABLE post ADD COLUMN title_post VARCHAR(25);

--Agregar título a las publicaciones ya ingresadas
UPDATE post SET titulo='Pamela first post' WHERE id=1;
UPDATE post SET titulo='Pamela second post' WHERE id=2;
UPDATE post SET titulo='Carlos first post' WHERE id=3;

--Insertar 2 post para el usuario "Pedro"
INSERT INTO post(user_name_post, content_post, description_post, title_post) VALUES('Pedro', 'lorem ipsum...', 'lorem ipsum...', 'pedro first post'), ('pedro', 'lorem ipsum...', 'lorem ipsum...', 'Pedro second post');

--Eliminar el post de Carlos
DELETE FROM post WHERE user_name_post='Carlos';

--Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO post(user_name_post, content_post, description_post, title_post) VALUES('Carlos', 'lorem ipsum...', 'lorem ipsum...', 'carlos new post');


--PARTE 2

--Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,
--contenido, que se relacione con la tabla posts.
CREATE TABLE comments 
(
    id_comments SERIAL PRIMARY KEY,  
    date_of_creation_comments DATE, 
    time_of_creation_comments TIME,
    content_comments  VARCHAR(50), 
    FOREIGN KEY (id_comments) REFERENCES post(id_post)
);


--Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"
INSERT INTO comments(id_comments, content_comments) VALUES(1, 'pame first comment'), (1, 'pame second commment');
INSERT INTO comments(id_comments, content_comments) VALUES(5, 'carlos first comment'), (5, 'carlos second comment'), (5, 'carlos third comment'), (5, 'carlos fourth comment');

--Crear un nuevo post para "Margarita"
INSERT INTO post(user_name_post, content_post, description_post, title_post) VALUES('Margarita', 'lorem ipsum...', 'lorem ipsum...', 'margarita first post'), ('margarita', 'lorem ipsum...', 'lorem ipsum...', 'margarita first post');

--Ingresar 5 comentarios para el post de Margarita
INSERT INTO comments(id_comments, content_comments) VALUES(6, 'margarita first comment'), (6, 'margarita second comment'), (6, 'margarita third comment'), (6, 'margarita fourth comment'), (6, 'margarita fifth comment');





