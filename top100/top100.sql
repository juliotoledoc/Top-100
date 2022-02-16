DROP DATABASE peliculas;

--1 Crear base de dato peliculas
CREATE DATABASE peliculas;
\c peliculas;

CREATE TABLE peliculas(
    id INT,
    pelicula VARCHAR (80),
    año_estreno VARCHAR (4)
    director VARCHAR (25),
    PRIMARY KEY (id)
);

CREATE TABLE reparto(
    id_pelicula INT,
    nombre_actores VARCHAR(25),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id),
);

--2 Cargar ambos archivos en su tabla correspondiente
\copy peliculas FROM 'peliculas.csv' csv header;
\copy reparto FROM 'reparto.csv' csv header;

--3 Obtener el ID de la película "Titanic"
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

--4 Listar a todos los actores que aparecen en la película "Titanic"
SELECT peliculas.pelicula, reparto.nombre_actores
FROM reparto
LEFT JOIN peliculas ON peliculas.id = reparto.id_pelicula
WHERE pelicula = 'Titanic';

--5 Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT COUNT (id_pelicula)
FROM reparto
WHERE nombre_actores = 'Harrison Ford';

--6 Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente
SELECT * FROM peliculas
WHERE año_estreno BETWEEN '1990' AND '1999'
ORDER BY pelicula ASC;

--7 Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”
SELECT pelicula, LENGHT(pelicula)
AS longitud_titulo FROM peliculas;

--8 Consultar cual es la longitud más grande entre todos los títulos de las películas
SELECT pelicula, LENGHT(pelicula)
AS titulo_mayor_logitud FROM peliculas
ORDER BY 2 DESC LIMIT 1;