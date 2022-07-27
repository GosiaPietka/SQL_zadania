--Skorzystaj z bazy library_db.sql
--Dodatkowe informacje:
--maksymalny czas wypożyczenia - 25 dni
--opłata za każdy dzień zwłoki - 0,50 PLN

--1) Oblicz liczbę użytkowników biblioteki
select count(ID) as 'Liczba użytkowników' FROM users

--2) Oblicz liczbę użytkowników biblioteki aktywnych w 2018 r.
select count(DISTINCT user_id) as 'Użytkownicy w 2018' FROM borrowings WHERE STRFTIME('%Y',borrow_date)='2018'

--3) Podaj listę użytkowników, którzy w 2010 r. pożyczyli więcej niż 3 książki
select user_id as 'Id uzytkownika', count(user_id) as 'Ilosc wypożyczonych książek' FROM borrowings 
WHERE STRFTIME('%Y',borrow_date)='2010' 
GROUP by user_id
HAVING count (user_id) > 3
 
--4) Oblicz liczbę książek pożyczonych przez każdego z użytkowników.
select user_id, count (book_id) as 'Ilosc wypozyczonych książek' FROM borrowings
GROUP by user_id
ORDER by count(book_id)

--5) Oblicz liczbę książek pożyczonych przez każdego z użytkowników w 2017 r.
select user_id, count (book_id) as 'Ilosc ksiazek' from borrowings
WHERE STRFTIME('%Y',borrow_date)='2017' 
GROUP by user_id
ORDER by count(book_id)

--6) Podaj łączną liczbę wypożyczeń każdego egzemplarza
select book_id, count(book_id) as 'Ilosc wypożyczeń' from borrowings
GROUP By book_id
ORDER by count(book_id)

--7) Podaj łączną liczbę wypożyczeń każdego tytułu

select books.title_id, count(books.title_id) as 'ilosc wypozyczen' from books 
JOIN borrowings on books.ID=borrowings.book_id
GROUP by books.title_id
order By count(books.title_id)

--8) Podaj 10 najpopularniejszych tytułów w 2016 r.
select books.title_id, count(books.title_id) as 'ilosc wypozyczen' from books 
JOIN borrowings on books.ID=borrowings.book_id 
WHERE STRFTIME('%Y',borrow_date)='2010' 
GROUP by books.title_id
order By count(books.title_id) DESC LIMIT 0,10

--9) Podaj listę pozycji (tytuł, ID egzemplarza, imię i nazwisko użytkownika) oddanych po terminie 
select titles.title as 'Tytuł', books.id as 'ID egzemplarza', users.name as 'Imie', users.surname as 'Nazwisko' from borrowings
JOIN users on borrowings.user_id= users.ID 
join books on borrowings.book_id = books.ID
JOIN titles on books.title_id = titles.ID
where (JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date))>25

--10) Podaj listę pozycji (tytuł, ID egzemplarza, imię i nazwisko użytkownika, liczba dni) oddanych po terminie
select titles.title as 'Tytuł', 
books.id as 'ID egzemplarza', 
users.name as 'Imie', 
users.surname as 'Nazwisko', 
(JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date)) as 'ilosc dni' from borrowings
JOIN users on borrowings.user_id= users.ID 
join books on borrowings.book_id = books.ID
JOIN titles on books.title_id = titles.ID
where (JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date))>25

--11) Podaj listę pozycji (tytuł, ID egzemplarza, imię i nazwisko użytkownika) nieoddanych
select * from borrowings where return_date=''

select titles.title as 'Tytuł', books.id as 'ID egzemplarza', users.name as 'Imie', users.surname as 'Nazwisko' from borrowings
JOIN users on borrowings.user_id= users.ID 
join books on borrowings.book_id = books.ID
JOIN titles on books.title_id = titles.ID
where borrowings.return_date=''

--12) Podaj 20 najdłużyszych zakończonych wypożyczeń
select titles.title as 'Tytuł', 
books.id as 'ID egzemplarza', 
users.name as 'Imie', 
users.surname as 'Nazwisko', 
(JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date)) as 'dni' from borrowings
JOIN users on borrowings.user_id= users.ID 
join books on borrowings.book_id = books.ID
JOIN titles on books.title_id = titles.ID
where (JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date))>25
order By dni DESC LIMIT 0,20

-- 13) Oblicz średnią liczbę dni wypożyczenia dla każdego użytkownika
select users.ID, users.name, users.surname, avg(JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date)) as 'Średnia'
from borrowings JOIN users on borrowings.user_id=users.ID
GROUP By borrowings.user_id
ORDER by Średnia


--14) Oblicz łączną liczbę dni wypożyczenia ponad termin dla każdego użytkownika
select users.ID, users.name, users.surname, sum(JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date)) as 'Suma'
from borrowings JOIN users on borrowings.user_id=users.ID
GROUP By borrowings.user_id
HAVING sum(JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date))>25
ORDER by Suma

--15) Podaj 10 tytułów, które średnio są wypożyczane na największą liczbę dni
select titles.ID, titles.title, avg(JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date)) as 'Srednia' from titles 
JOIN books on books.title_id=titles.ID
JOIN borrowings on borrowings.book_id = books.ID
GROUP by titles.ID
ORDER by Srednia DESC LIMIT 0,10

--16) Podaj 10 tytułów, które były najdłużej wypożyczone
select titles.ID, titles.title, sum(JULIANDAY(borrowings.return_date)-JULIANDAY(borrowings.borrow_date)) as 'Dni' from titles 
JOIN books on books.title_id=titles.ID
JOIN borrowings on borrowings.book_id = books.ID
GROUP by titles.ID
ORDER by Dni DESC LIMIT 0,10;

--17) Oblicz łączną kwotę zapłaconą przez każdego z użytkowników

select users.ID, users.name, users.surname, sum(fines.fine) as 'Zadluzenie' from fines
join users on fines.user_id=users.ID
GROUP by fines.user_id
ORDER by Zadluzenie;




