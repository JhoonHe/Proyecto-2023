
select id_compra, correo_usuario, compras.id_prenda, prendas.precio from compras,prendas where compras.id_prenda = prendas.id_prenda and compras.correo_usuario = 'JuliaTorres@gmail.com';

select imagen, nombre, precio from compras,prendas where compras.id_prenda = prendas.id_prenda and compras.correo_usuario = 'JuliaTorres@gmail.com';
select sum(precio) from compras,prendas where compras.id_prenda = prendas.id_prenda and compras.correo_usuario = 'JuliaTorres@gmail.com';

    

/*Creacion de BD*/
create database db_proyecto;
use db_proyecto;
drop database db_proyecto;




/*Creacion de tablas*/
CREATE TABLE usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  correo VARCHAR(30) UNIQUE,
  nombre VARCHAR(30),
  clave VARCHAR(30)
);
    
  create table categoria (
    nombre_Categoria varchar (20) primary key
	);
create table categoria_Prenda (
	id_categoria_Prenda int  auto_increment primary key,
	nombre varchar (30));
    
    create table prendas(
	id_prenda int auto_increment primary key,
	nombre varchar(30),
    precio float,
    imagen text,
    talla varchar (10),
    color varchar(20),
    descripcion varchar (150),
    estado int,
    disponible boolean,
    nombre_Categoria varchar (20), foreign key (nombre_Categoria) references categoria (nombre_Categoria),
    id_categoria_Prenda int, foreign key (id_categoria_Prenda) references categoria_Prenda (id_categoria_Prenda)
    );
    
create table compras (id_compra int auto_increment primary key, correo_usuario varchar (100) not null, foreign key (correo_usuario) references usuario(correo) , 
id_prenda int, foreign key (id_prenda) references prendas (id_prenda));
    
 
 /*Insercion*/
 
 
    
insert into categoria values ("Dama");
insert into categoria values ("Caballero");
insert into categoria values ("Niños");

truncate categoria_Prenda;

insert into categoria_Prenda (nombre) values ("Camiseta");
insert into categoria_Prenda (nombre) values ("Pantalon");
insert into categoria_Prenda (nombre) values ("Zapatos");
insert into categoria_Prenda (nombre) values ("Sueter");
insert into categoria_Prenda (nombre) values ("Vestido");
insert into categoria_Prenda (nombre) values ("Accesorios");
insert into categoria_Prenda (nombre) values ("Camisa");
insert into categoria_Prenda (nombre) values ("Falda");
insert into categoria_Prenda (nombre) values ("Short");
insert into categoria_Prenda (nombre) values ("Blusa");
insert into categoria_Prenda (nombre) values ("Pijama");
insert into categoria_Prenda (nombre) value ("Guantes");
select * from categoria_Prenda;    


truncate prendas;

insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Nike Air", 30000,"https://res.cloudinary.com/dpwihnxve/image/upload/v1687636312/Defaulth/Hombre/nike-azules_zv5fdw.png", "40", "Azul","Tennis En Excelente Estado", 10,true,"Caballero",3);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Jean Marcopolo", 15000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636312/Defaulth/Hombre/Pantalon_Azul_uie9jz.png", "28", "Azul", "Pantalon De Poco Uso", 9, true, "Caballero", 2);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Camisa Anna Matuozzo", 30000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636310/Defaulth/Hombre/Camisa-Rosada_ammfyq.png", "S", "Rosa", "Camisa Original En Perfecto Estado", 10, true, "Caballero", 7);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Sueter Addidas", 40000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636310/Defaulth/Hombre/sueter-negro_uebztp.png", "XL", "Negro", "Saco De Muy Poco Uso Y Perefecto Para Las Oleadas De Frio", 10, true, "Caballero", 4 );
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Sueter Gucci", 50000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636310/Defaulth/Hombre/sueter-naranja_vjqlcq.png", "L", "Naranja", "Sueter De Solo Dos Puestas, Se vende Por Temas De Falta De Dinero", 10,true, "Caballero", 4);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Nike Jordan Air 1 ", 60000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636309/Defaulth/Hombre/jordan-rojos_aipnel.png", "42", "Rojo-Negro", "Sneakers En Excelente Estado", 10, true, "Caballero",3);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Corbatin Arturo Calle", 15000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636308/Defaulth/Hombre/corbatin-azul_kcjuu5.png", "L", "Azul-Celeste", "Corbatin Perfecto para Ocaciones Formales", 10, true, "Caballero", 6 );
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Corbata Charvet. DRAKE'S:", 20000,"https://res.cloudinary.com/dpwihnxve/image/upload/v1687636308/Defaulth/Hombre/corbata-roja_lrb8qj.png", "M", "Roja-Blanca", "Corbata De Muy Poco Uso", 10, true, "Caballero",6);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Camiseta Polo", 30000,"https://res.cloudinary.com/dpwihnxve/image/upload/v1687636307/Defaulth/Hombre/Camisa-blanca_fwstyb.png", "M", "Blanca", "Camiseta En Condiciones casi nueva", 10, true, "Caballero", 1);


/*Mujeres*/

insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Falda Booins", 10000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636357/Defaulth/Mujer/falda-jean_iouqit.png", "M", "Jean-Azul", "Falda Muy Hermosa Perfecta Para Ii A Cine", 10, true, "Dama", 8 );
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Vestido Laura Clennss", 50000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636357/Defaulth/Mujer/vestido-rojo_inften.png", "L", "Rojo Vivo", "Vestido De Poco Uso",10, true, "Dama",5) ;
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Pantalon Luois-Vouitton", 40000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636357/Defaulth/Mujer/short-azulM_reseh2.png", "28", "Azul Celeste", "Jean De Mujer Con Rotos", 10, true, "Dama" ,2);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Short Cartier", 30000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636357/Defaulth/Mujer/short-jean_fp8yzy.png", "30", "Azul-Oscuro", "Prenda En Perfecto Estado", 10,true, "Dama", 9);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Blusa Nini Ping", 15000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636356/Defaulth/Mujer/Blusa.Rosada_ifx9f8.png", "L", "Rosa-Claro", "Blusa Con Escote Cerrado y Mangas Cortas", 10, true ,"Dama", 10);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Sueter LALA", 30000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636356/Defaulth/Mujer/sueter-jean_r13jhe.png", "L", "Jean-Claro", "Sueter Manga Larga, Botones Ajustables", 10, true, "Dama" ,4);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Sueter Suprime", 50000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636357/Defaulth/Mujer/sueter-rosa_j80efa.png", "XL", "Rosado-Rey", "Sueter Perfecto Para Toda Ocasion", 10, true, "Dama",4);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Short Versace", 25000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636355/Defaulth/Mujer/short-azul_e5fnkl.png", "30","Azul-Celeste", "Short Perfecto Y Juvenil Con Correa Decorativa", 10, true, "Dama", 9);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Jean Cartier", 30000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636354/Defaulth/Mujer/Jean-Azul_avgiko.png", "32", "Azul", "Pantalon Con bolsillos traseros", 10, true, "Dama", 2);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Blusa Gucci", 15000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636352/Defaulth/Mujer/BlusaRoja_t2gdf4.png", "M","Rojo", "Blusa En Excelente Estado Para Cualquier Ocasion", 10, true, "Dama", 10);


/*Niños*/

select * from prendas;

insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Pijama Boy Toys", 15000,"https://res.cloudinary.com/dpwihnxve/image/upload/v1687636387/Defaulth/Ni%C3%B1os/mameluco-rosa_vzhzt6.png", "L-Pequeños", "Rosado", "Pijama En Excelente Estado", 10, true, "Niños",11);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Guantes Para Frio", 10000,"https://res.cloudinary.com/dpwihnxve/image/upload/v1687636386/Defaulth/Ni%C3%B1os/guantes-rojos_zljnma.png", "M-Pequeño", "Rojo", "Guantes Excelentes Para El Frio",10, true, "Niños",12);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Pijamas Boy Toys", 30000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636386/Defaulth/Ni%C3%B1os/pijama-azul_likrc2.png", "XL-Pequeño", "Azul-Rojo", "Dos Pijamas Para Niño Y Niña En Excelente Estado", 10,true, "Niños", 11 );
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Pijama Kids Frair", 20000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636386/Defaulth/Ni%C3%B1os/conjunto-gris_imrbmo.png", "L-Pequeño","Negro-Blanco", "Pijama Negra De Niño Para Dormir Comodamente",10, true, "Niños", 11);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Pijama Four Toys", 15000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636385/Defaulth/Ni%C3%B1os/blusa-rosa_xcwhmj.png", "M-Peuqeño", "Rosado-Blanco", "Pijama De Buen Estado, Se Vende Porque Mi Hijo Fallecio", 10, true, "Niños", 11);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Sueters LinKoing", 50000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636385/Defaulth/Ni%C3%B1os/sueter-ninos_nvseu5.png", "L-Pequeño", "Diverso Color", "Sueters De Buena Calidad", 10, true, "Niños", 4);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Sueter KidJunior", 20000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636385/Defaulth/Ni%C3%B1os/sueter-gris_m6cev4.png", "M-Pequeño", "Negro", "Saco Excelente Calidad",10, true, "Niños", 4);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Vestido KidNice", 30000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636385/Defaulth/Ni%C3%B1os/vestido-rosa_wza0uk.png", "L-Pequeño", "Rosado", "Vestido Para Niña En Excelnte Estado", 10, true, "Niños", 5);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Pijama Bebé", 20000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636385/Defaulth/Ni%C3%B1os/camisa-bebe_uf6fcz.png", "M-Pequeño", "Azul", "Pijama En Excelente Estado", 10, true, "Niños",11);
insert into prendas (nombre,precio,imagen,talla,color,descripcion,estado,disponible, nombre_Categoria,id_categoria_Prenda)values ("Pijama LolSito", 30000, "https://res.cloudinary.com/dpwihnxve/image/upload/v1687636382/Defaulth/Ni%C3%B1os/pijama-cafe_iwfkdb.png", "L-Peuqeño", "Cafe", "Pijama Perfecta Para El Frio", 10, true, "Niños", 11);


INSERT INTO usuario (correo,nombre,clave) VALUES ('JuanPerez@gmail.com', 'Juan Pérez', 'password123');
INSERT INTO usuario (correo,nombre,clave) VALUES ('MariaGomez@yahoo.com', 'María Gómez', 'securepass');
INSERT INTO usuario (correo,nombre,clave) VALUES ('CarlosLópez@gmail.com', 'Carlos López', 'abc123');
INSERT INTO usuario (correo,nombre,clave) VALUES ('AnaMartínez@gmail.com', 'Ana Martínez', 'passw0rd');
INSERT INTO usuario (correo,nombre,clave) VALUES ('LuisRodríguez@gmail.com', 'Luis Rodríguez', 'qwerty');
INSERT INTO usuario (correo,nombre,clave) VALUES ('LauraSánchez@hotmail.com', 'Laura Sánchez', 'password456');
INSERT INTO usuario (correo,nombre,clave) VALUES ('PedroRamírez@gmail.com', 'Pedro Ramírez', 'hello123');
INSERT INTO usuario (correo,nombre,clave) VALUES ('SofíaMorales@yahoo.com', 'Sofía Morales', 'ilovecats');
INSERT INTO usuario (correo,nombre,clave) VALUES ('DiegoCastro@hotmail.com', 'Diego Castro', 'letmein');
INSERT INTO usuario (correo,nombre,clave) VALUES ('JuliaTorres@gmail.com', 'Julia Torres', 'pass1234');

truncate usuario;


INSERT INTO compras (correo_usuario, id_prenda) VALUES ('JuanPerez@gmail.com', 1);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('MariaGomez@yahoo.com', 2);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('CarlosLópez@gmail.com', 3);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('AnaMartínez@gmail.com', 4);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('LuisRodríguez@gmail.com', 5);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('LauraSánchez@hotmail.com', 6);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('PedroRamírez@gmail.com', 7);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('SofíaMorales@yahoo.com', 8);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('DiegoCastro@hotmail.com', 9);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('JuliaTorres@gmail.com', 8);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('JuanPerez@gmail.com', 1);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('MariaGomez@yahoo.com', 2);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('CarlosLópez@gmail.com', 3);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('AnaMartínez@gmail.com', 4);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('LuisRodríguez@gmail.com', 5);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('LauraSánchez@hotmail.com', 6);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('PedroRamírez@gmail.com', 7);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('SofíaMorales@yahoo.com', 8);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('DiegoCastro@hotmail.com', 9);
INSERT INTO compras (correo_usuario, id_prenda) VALUES ('JuliaTorres@gmail.com', 5);

select * from compras;
truncate compras;