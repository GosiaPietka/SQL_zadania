SELECT * FROM titles;

--Podaj łączną liczbę możliwych do wypożyczenia książek każdego autora
SELECT Author_surname,COUNT(Author_surname) FROM simple_library_db GROUP BY Author_surname;

--Chcemy policzyć książki napisane przez każdego autora

SELECT author_id,COUNT(title) FROM titles GROUP BY author_id;

--Podaj łączną liczbę możliwych do wypożyczenia książek każdego autora
--baza Simple_library_db:

SELECT Author_surname,COUNT(Author_surname) FROM simple_library_db GROUP BY Author_surname;

--Podaj łączną liczbę tytułów każdego autora
SELECT Author_surname, count(DISTINCT Title) from simple_library_db group by Author_surname

--Oblicz liczbę książek pożyczonych przez każdego z użytkowników 
--library_db
SELECT user_id,COUNT(book_id) FROM borrowings 
GROUP BY user_id 
ORDER BY user_id;

--Chcemy policzyć książki napisane przez każdego autora, który ma ponad pięć książek
SELECT * FROM titles;

SELECT author_id,COUNT(title) FROM titles 
GROUP BY author_id;

SELECT author_id,COUNT(title) FROM titles 
GROUP BY author_id 
HAVING COUNT(title)>5;

--Podaj nazwy miast wraz z sumaryczną liczbą ich wystąpień, ale tylko takich, które występują więcej niż jeden raz
--CodeBrainers.db rw

select * FROM customer;

select city, count(city) from Customer 
group by city 
HAVING count(city)>1;

--Podaj id produktów z tabeli Order_product wraz z liczbą wszystkich zamówionych sztuk, jeśli liczba ta należy do zbioru {2,4}

SELECT product_id,SUM(amount) FROM order_product 
GROUP BY product_id 
HAVING SUM(amount) IN (2,4);