--Skorzystaj z bazy simple_library_db.csv

--Podaj listę wszystkich książek w bibliotece
select ID, title from titles

--Podaj listę książek napisanych przez Stanisława Lema
select title from titles where author_id ='1'

--Podaj listę książek zarejestrowanych w 2015 r.

select ID, registration_date from books WHERE STRFTIME('%y',registration_date)='2015';

--Oblicz liczbę książek w bibliotece
select count(ID) from books

--Oblicz, ilu różnych autorów stworzyło książki przechowywane w bibliotece
SELECT count(DISTINCT author_id) FROM titles;

--Oblicz liczbę książek starszych niż 10 lat
SELECT count (ID) from books WHERE STRFTIME('%Y',registration_date)<'2012';

--Dla każdego autora podaj liczbę tytułów przez niego napisanych
select author_id, count (title) from titles 
GROUP BY author_id;


--Znajdź nazwisko i tytuły książek napisanych przez autora o identyfikatorze 3
SELECT authors.surname, titles.title from authors 
JOIN titles ON authors.ID=titles.author_id 
WHERE titles.author_id ="3";

--Znajdź imiona, nazwiska i tytuły książek napisanych przez autorów o imieniu rozpoczynającym się na “S”
SELECT authors.name, authors.surname, titles.title FROM authors
JOIN titles on authors.ID=titles.author_id
WHERE authors.name like 'S%'