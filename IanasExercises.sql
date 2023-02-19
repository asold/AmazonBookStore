set search_path = amazon_book_store;

--Sell a book to a customer
insert into itemorder(orderdate, totalprice, customerid)
values ('2021-12-23', 120.4, 2);

insert into itemordertype(typeid, orderid)
values (5, 1),
       (1.1);

update paperback
set availablecopies = availablecopies - 1
where id = 5;

update hardcover
set availablecopies = availablecopies - 1
where id = 1;


--Change the address of a customer
update customer
set city = 'Aarhus' and zipcode = '8000' and street = 'Banegard' and street = 44
where id = 2;

--ISBN numbers of the books that have more then one author
select isbn from book
join authorbooks a on book.isbn = a.bookid
group by isbn
having count(isbn) > 1;

--ISBN number of books that sold at least X copies
select isbn from book
join type t on book.isbn = t.bookid
join itemordertype i on t.id = i.typeid
group by i.typeid, book.isbn
having i.typeid notnull;


--Not showing the books that haven't sold any copies((
--Number of copies of each book sold – unsold books should show as 0 sold copies
select count(isbn) as number_of_books_sold, title from book
join type t on book.isbn = t.bookid
join itemordertype i on t.id = i.typeid
group by isbn;



