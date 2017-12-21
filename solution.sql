-- Joins #1
SELECT * 
FROM Invoice i
JOIN InvoiceLine il
ON i.InvoiceId = il.InvoiceId
WHERE UnitPrice > 0.99


-- Joins#2
SELECT i.invoiceDate, c.FirstName, c.LastName, i.Total
FROM Invoice i
JOIN customer c
ON i.CustomerId = c.CustomerId;

-- Joins#3
SELECT cu.FirstName, cu.LastName, em.FirstName, em.LastName
FROM Customer cu
JOIN Employee em
ON cu.customerid = em.employeeid

-- Join#4
SELECT al.title, ar.name
FROM Album al
JOIN Artist ar
ON  ar.artistid = al.artistid 

-- Join#5
SELECT plt.trackid 
FROM PlaylistTrack plt
JOIN Playlist pl
ON plt.playlistid = pl.playlistid
WHERE pl.name = 'Music' 

-- Join#6
SELECT t.Name, pt.playlistid
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5

-- Join#7
SELECT t.name, p.name
FROM  Track t
JOIN PlaylistTrack plt
ON t.trackid = plt.trackid
JOIN Playlist p
ON plt.playlistid = p.playlistid

-- Join#8
SELECT t.name, al.title
FROM Track t
JOIN album al
ON t.albumid = al.albumid
JOIN Genre g
ON g.genreid = t.genreid
WHERE g.name = "Alternative";

-- Nested#1
SELECT * 
FROM invoice
WHERE invoiceid
IN ( SELECT invoiceid FROM invoiceline where UnitPrice > 0.99)

-- Nested#2
SELECT 
FROM PlaylistTrack
WHERE PlaylistId = ( SELECT PlaylistId FROM Playlist WHERE Name = "Music" ); */

-- Nested#3
SELECT name
FROM track
WHERE trackid IN ( SELECT trackid FROM PlaylistTrack WHERE playlistid = 5 );

-- Nest#4
SELECT *
FROM Track
WHERE Genreid IN ( SELECT Genreid FROM Genre WHERE name = "Comedy"); 

-- Nest#5
SELECT * 
FROM track
WHERE albumid IN ( SELECT albumid FROM album WHERE title = "Fireball");

-- Nest#6
SELECT * 
FROM  track
WHERE albumid IN ( SELECT albumid FROM album WHERE artistid IN ( SELECT artistid FROM Artist WHERE name = "Queen"))

-- Update#1
UPDATE Customer
SET Fax = null

-- Update#2
UPDATE Customer
SET Company = "Self"
WHERE Company IS null;

-- Update#3
UPDATE Customer
SET LastName = "Thompson"
WHERE FirstName = "Julia" AND LastName = "Barnett";

-- Update#4
UPDATE Customer
SET SupportRepId = 4
WHERE Email = "luisrojas@yahoo.cl"

-- Update#5
UPDATE Track
SET Composer = "The darkness around us"
WHERE Genreid = ( SELECT Genreid FROM Genre WHERE Name = "Metal")
AND Composer IS null;

-- Group#1
SELECT COUNT(*), genre.Name
FROM Track
JOIN Genre
ON track.genreid = genre.genreid 
GROUP BY Genre.name

-- Group#2
SELECT COUNT(*), g.name
FROM Track t
JOIN Genre g
ON g.genreid = t.genreid
WHERE g.Name = "Pop" OR g.Name = "Rock"
GROUP BY g.name;

-- Group#3
SELECT ar.name, COUNT(*)
FROM Artist ar
JOIN Album al
ON ar.ArtistId = al.ArtistId
GROUP BY ar.name

-- Distinct#1
SELECT DISTINCT Composer
FROM Track;

-- Distinct#2
SELECT DISTINCT BillingPostalCode
FROM Invoice;

-- -- Distinct#3
SELECT DISTINCT Company
FROM Customer;

-- Delete#1
 DELETE FROM practice_delete WHERE Type = "bronze"
 
--  Delete#2
 DELETE FROM practice_delete WHERE Type = "silver"
 
--  Delete#3
 DELETE FROM practice_delete WHERE Value = "150"
 
CREATE TABLE Users (
UserID  INTEGER PRIMARY KEY,
Name varchar(50),
Email varchar(50)
)

CREATE TABLE Products (
ProductID INTEGER PRIMARY KEY,
Name varchar(55)
Price INTEGER
)
CREATE TABLE Orders (
  OrderID  INTEGER PRIMARY KEY,
  ProductID INTEGER , 
  FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

 INSERT INTO Users
(Name, Email)
values('John', 'email@gmail.com');

INSERT INTO Users
(Name, Email)
values('Gary', 'gary@gmail.com');

INSERT INTO Users
(Name, Email)
values('Kaia', 'email234@gmail.com');

INSERT INTO Products
(Name, Price)
VALUES ("hotdog", 312.23)
 


