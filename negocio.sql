create database negocio
go
use negocio
go
create table Categoria(
Id smallint identity (1,1) not null,
Nombre varchar (50) not null unique,
primary key (Id)
)
create table Marcas(
id smallint identity (1,1) not null,
descripcion varchar (100) not null,
primary key (id)
)
go
create table Articulo(
id_producto int identity (1,1) not null primary key,
nombre varchar (100) not null,
codigo varchar (100) not null,
descripcion varchar (1000) not null,
precio money not null,
id_marca smallint not null foreign key references Marcas (id),
id_categoria smallint not null foreign key references Categoria (id),
estado bit,
pausa bit
)
go
create table Imagen(
Id int identity (1,1) not null,
ImagenUrl varchar (1000) not null,
Id_articulo int not null foreign key references Articulo (id_producto)
)
go
insert into Marcas values ('P47'), ('speaker'), ('Sony'), ('kanji'), ('genius')
insert into Categoria values ('audio'),('mouse y teclados'), ('consolas'), ('celulares')
insert into Articulo values ('Auricular inalambrico', 'p47', 'Con bluetooth, luces multicolor, cable cargado y ranura tarjeta sd',10999, 1 ,1,1,1 ),
('Mouse Gammer', 'mg-3000', 'Inalambrico con luces de colores', 12118 ,5,2,1,1),
('Play station 5', 'Standar Edition', 'La Playstation 5 Standar Edition es la última generación de consolas de Sony',1275999, 3, 3,1,1),
('Teclado inalambrico', 'Óptico 1600 Dpi', 'Kanji Mouse Óptico 1600 Dpi Color del teclado Negro',20460, 4, 2,1,1),
('Parlante Portátil Inalámbrico', ' 8 Pulgadas Mti M3628', 'Bluetooth Color Negro',38250, 2, 1,1,1)
go
insert into Imagen (Id_articulo,ImagenUrl) values
(1,'https://http2.mlstatic.com/D_NQ_NP_759670-MLU70711473274_072023-O.webp'),
(1,'https://http2.mlstatic.com/D_NQ_NP_678903-MLU72749127598_112023-O.webp'),
(2, 'https://http2.mlstatic.com/D_NQ_NP_917727-MLU74873028868_032024-O.webp'),
(3, 'https://http2.mlstatic.com/D_NQ_NP_970261-MLU74424378377_022024-O.webp'),
(3, 'https://http2.mlstatic.com/D_NQ_NP_866604-MLU74424358523_022024-O.webp'),
(4, 'https://http2.mlstatic.com/D_NQ_NP_792718-MLU74927819915_032024-O.webp'),
(5, 'https://http2.mlstatic.com/D_NQ_NP_926293-MLU77218957555_062024-O.webp')
go
select * from Articulo

select A.id_producto As Id, A.codigo As Codigo,A.nombre As Nombre ,A.descripcion As Descripcion ,M.descripcion Marca, C.Id As IdCategoria, M.id As IdMarca ,A.precio  As Precio FROM  Articulo A left JOIN  Marcas M on M.id= A.id_marca left JOIN Categoria C on C.Id= A.id_categoria

select A.codigo,A.nombre,A.precio, A.id_producto , A.descripcion,M.descripcion Marca,A.id_marca idMarca,  A.id_categoria IdCategoria from Articulo A left JOIN Marcas M ON A.id_marca = M.id left JOIN Categoria C ON A.id_categoria = C.Id

select Codigo, Nombre, Precio, A.id_producto, A.descripcion, M.descripcion Marca, A.id_marca idMarca, A.id_categoria IdCategoria from Articulo A, MARCAS M, Categoria C where A.id_marca = @Id AND C.Id = A.id_categoria AND m.Id = @Id

select  A.nombre , I.Id , I.ImagenUrl,I.Id_articulo,A.id_producto from Imagen as I left join Articulo as A on I.Id_articulo = A.id_producto

select  A.nombre , I.Id , I.ImagenUrl,I.Id_articulo,A.id_producto from Imagen as I left join Articulo as A on I.Id_articulo = A.id_producto
select A.id_producto As Id, A.codigo As Codigo,A.nombre As Nombre ,C.Nombre as Categoria,A.descripcion As Descripcion ,M.descripcion Marca, C.Id As IdCategoria, M.id As IdMarca ,A.precio  As Precio FROM  Articulo A left JOIN  Marcas M on M.id= A.id_marca left JOIN Categoria C on C.Id= A.id_categoria