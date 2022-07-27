SELECT * FROM customer;

SELECT id,name,city FROM customer;

--Wybieramy z tabeli Product nazwę, cenę i datę dodania produktu posortowane malejąco według daty dodania.
SELECT name,price,date FROM product ORDER BY date DESC;

--Wybieramy z tabeli Customer imiona klientów którzy mieszkają w Lublinie
SELECT name FROM customer WHERE city='Lublin';

--Usuwamy z tabeli Product wszystkie produkty których są dwie sztuki
SELECT * FROM product WHERE amount='2';
DELETE FROM product WHERE amount='2';

--Usuń wszystkie produkty których cena jest wyższa niż 20
DELETE FROM product WHERE price>20;

--Dodajemy do tabeli Product nowy przedmiot o nazwie Apaszka, cenie 35, liczba sztuk: 2 oraz dacie dodania: 2011-02-20
INSERT INTO product VALUES (11,'Spodnie',70,2,'2011-02-20');

--Dodaj do tabeli Product nowy przedmiot o nazwie Kapelusz, cenie 60, liczbie sztuk 4 oraz dacie dodania: 2011-02-28
INSERT INTO product VALUES (10,'Kapelusz',60,4,'2011-02-28');

--usówanie tabeli
DROP TABLE product;

--tworzenie tabeli
CREATE TABLE "Product" (
	"id"		SMALLINT UNSIGNED IDENTITY(1,1) NOT NULL,
	"name"		VARCHAR(50) NOT NULL,
	"price"		FLOAT NOT NULL,
	"amount"	TINYINT(2) NOT NULL,
	"date"		DATE NOT NULL,
	PRIMARY KEY("id")
);
INSERT INTO product VALUES (9,'Apaszka',35,2,'2011-02-20');

select * from Product

--Wybieramy dane użytkownika który ma na imię Katarzyna i mieszka w mieście Lublin
SELECT id,name,city,date 
FROM customer 
WHERE name='Katarzyna' AND city='Lublin';

--Wybierz wszystkie dane produktów z tabeli Product, których cena jest większa od 25 lub liczba sztuk jest nie mniejsza niż 5
SELECT id,name,price,amount,date 
FROM product 
WHERE price>25 OR amount>=5;

--Wybieramy dane użytkownika których imię rozpoczyna się literą M
SELECT * FROM Customer
WHERE name LIKE 'M%'

--Wybierz id, nazwę i cenę produktów z tabeli Product które zawierają w nazwie literę “a”
SELECT id, name, price FROM Product
WHERE name like '%a%'

--Wybieramy nazwy i ceny produktów których cena wynosi 60 lub 10 lub 25
SELECT name,price FROM product WHERE price IN (60,10,25);

--Wybierz nazwę, cenę i liczbę produktów z tabeli Product, których liczba to 3, 4, 5 lub 6
SELECT name,price,amount FROM product WHERE amount IN (3,4,5,6);

--Wybieramy nazwę i cenę produktów których cena należy do przedziału 40 do 60
SELECT name,price FROM product WHERE price BETWEEN 40 AND 60;

--Wybieramy id, nazwę i cenę jednego produktu którego cena jest wyższa niż 20
SELECT id,name,price FROM product WHERE price>20 LIMIT 1;

--Wybierz id i imię 4 pierwszych klientów korzystając z klauzuli LIMIT
SELECT id,name FROM customer LIMIT 0,4;

--Liczymy ile produktów jest w tabeli Product
SELECT COUNT(name) FROM product;

--Wybieramy sumę wszystkich sztuk z tabeli Product
SELECT SUM(amount) FROM product;

--Liczymy średnią cenę w tabeli Product
SELECT AVG(price) FROM product;

--Oblicz średnią liczbę produktów z tabeli Product, których cena jest wyższa od 40
SELECT AVG(amount) FROM product WHERE price>40;

--Wybieramy id i cenę produktu o najniższej cenie
SELECT id,MIN(price) FROM product;

--Wybieramy id i cenę produktu o najwyższej cenie
SELECT id,max(price) FROM product;

--Zwracamy w wyniku miasta bez powtórzeń
SELECT DISTINCT city FROM customer;

--Zwracamy w wyniku liczbę miast bez powtórzeń
SELECT COUNT(DISTINCT city) FROM customer;

--Wybieramy id, imiona i daty dodania klientów którzy zarejestrowali się w lutym
SELECT id,name,date FROM customer WHERE STRFTIME('%m',date)='02';

--Wybierz nazwę, cenę i datę dodania produktów z tabeli Product, których dzień dodania należy do przedziału od 01 do 10
SELECT name,price,date FROM product WHERE STRFTIME('%d',date) BETWEEN '01' AND '10';

SELECT DATE('now');