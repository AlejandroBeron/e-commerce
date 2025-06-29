create database negocio
go
use negocio
go
ALTER TABLE Categoria ALTER COLUMN Nombre VARCHAR(50) NULL;

create table Categoria(
Id smallint identity (1,1) not null,
Nombre varchar (50) not null unique,
ImagenCategoria varchar (1000) not null,
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
create table Usuario(
Id int identity (1,1) not null,
Usuario varchar (500) not null,
Contrase�a varchar (500) not null
)
go
CREATE TABLE Compra (
    OrdenC VARCHAR(200) NOT NULL PRIMARY KEY,
    NombreC VARCHAR(500) NOT NULL,
    ApellidoC VARCHAR(500) NOT NULL,
    DniC VARCHAR(20) NOT NULL,
    EmailC VARCHAR(200) NOT NULL
);
go

CREATE TABLE DetalleCompra (
    Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    OrdenC VARCHAR(200) NOT NULL,
    IdArticulo INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    PrecioTotal AS (Cantidad * PrecioUnitario),
    FOREIGN KEY (OrdenC) REFERENCES Compra(OrdenC),
    FOREIGN KEY (IdArticulo) REFERENCES Articulo(id_producto)
);
go

CREATE VIEW Factura AS
SELECT 
    c.NombreC, 
    c.ApellidoC, 
    c.DniC, 
    c.EmailC, 
    c.OrdenC, 
    dc.IdArticulo, 
    dc.Cantidad, 
    dc.PrecioUnitario, 
    dc.PrecioTotal
FROM Compra c
JOIN DetalleCompra dc ON c.Id = dc.IdCompra;

UPDATE Categoria 
SET ImagenCategoria = 'https://naldoar.vtexassets.com/arquivos/ids/180052-500-auto?v=638615877206230000&width=500&height=auto&aspect=true'
WHERE Nombre = 'Notebook';

DELETE FROM Categoria 
WHERE Id = '12';



insert into Marcas values  ('Samsung'), ('Motorola'), ('iPhone'),('P47'), ('speaker'), ('Sony'), ('kanji'), ('genius')
insert into Categoria values ('TV'), ('Notebook'),('Monitores'),('audio'),('mouse y teclados'), ('consolas'), ('celulares')
insert into Articulo values ('Auricular inalambrico', 'p47', 'Con bluetooth, luces multicolor, cable cargado y ranura tarjeta sd',10999, 1 ,1,1,1 ),
('Mouse Gammer', 'mg-3000', 'Inalambrico con luces de colores', 12118 ,5,2,1,1),
('Play station 5', 'Standar Edition', 'La Playstation 5 Standar Edition es la �ltima generaci�n de consolas de Sony',1275999, 3, 3,1,1),
('Teclado inalambrico', '�ptico 1600 Dpi', 'Kanji Mouse �ptico 1600 Dpi Color del teclado Negro',20460, 4, 2,1,1),
('Parlante Port�til Inal�mbrico', ' 8 Pulgadas Mti M3628', 'Bluetooth Color Negro',38250, 2, 1,1,1)
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

insert into Usuario  (Usuario,Contrase�a) values ('admin', 'admin')


delete from Compra

select * from Compra
select * from DetalleCompra
select * from Marcas
select * from Categoria
select * from DetalleCompra where OrdenC = '1EC79323'

SELECT * FROM Articulo ORDER BY precio asc;


UPDATE Articulo SET pausa = 0 WHERE id_producto = 1;
UPDATE Articulo SET pausa = 0 WHERE id_producto = 2;
UPDATE Articulo SET pausa = 0 WHERE id_producto = 3;
UPDATE Articulo SET pausa = 0 WHERE id_producto = 4;
UPDATE Articulo SET pausa = 0 WHERE id_producto = 5;
UPDATE Articulo SET pausa = 0 WHERE id_producto = 11;
UPDATE Articulo SET pausa = 0 WHERE id_producto = 12;


select A.id_producto As Id, A.codigo As Codigo,A.nombre As Nombre ,A.descripcion As Descripcion ,M.descripcion Marca, C.Id As IdCategoria, M.id As IdMarca ,A.precio  As Precio FROM  Articulo A left JOIN  Marcas M on M.id= A.id_marca left JOIN Categoria C on C.Id= A.id_categoria

select A.codigo,A.nombre,A.precio, A.id_producto , A.descripcion,M.descripcion Marca,A.id_marca idMarca,  A.id_categoria IdCategoria from Articulo A left JOIN Marcas M ON A.id_marca = M.id left JOIN Categoria C ON A.id_categoria = C.Id

select Codigo, Nombre, Precio, A.id_producto, A.descripcion, M.descripcion Marca, A.id_marca idMarca, A.id_categoria IdCategoria from Articulo A, MARCAS M, Categoria C where A.id_marca = @Id AND C.Id = A.id_categoria AND m.Id = @Id

select  A.nombre , I.Id , I.ImagenUrl,I.Id_articulo,A.id_producto from Imagen as I left join Articulo as A on I.Id_articulo = A.id_producto

select  A.nombre , I.Id , I.ImagenUrl,I.Id_articulo,A.id_producto from Imagen as I left join Articulo as A on I.Id_articulo = A.id_producto
select A.id_producto As Id, A.codigo As Codigo,A.nombre As Nombre ,C.Nombre as Categoria,A.descripcion As Descripcion ,M.descripcion Marca, C.Id As IdCategoria, M.id As IdMarca ,A.precio  As Precio FROM  Articulo A left JOIN  Marcas M on M.id= A.id_marca left JOIN Categoria C on C.Id= A.id_categoria