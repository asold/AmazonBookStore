-- Question 4 - Modifying data - 3

set search_path = amazon_book_store;

insert into Book(ISBN, title, description, rating, language)
values ('0-1579-4703-3', 'Yellow Ink Tears: A Collection of Sweats', 'book about poems written by yellow ink', 4.5, 'English');


insert into bookcategory(bookid, categoryid)
values ('0-1579-4703-3', 1);

insert into bookgenre(bookid, genreid)
values ('0-1579-4703-3', 1);

insert into authorbooks(bookid, authorid, dateposted)
values ('0-1579-4703-3', 1, '2022-01-31');

insert into type(bookid, publisher, publishdate, price)
values ('0-1579-4703-3', 'Bowker', '2023-01-31', 15.09);

insert into hardcover(id, availablecopies, printlength, condition)
values (11, 150, 256, 'New');

-- Question 5 - Querying data - 10


SELECT b.isbn, b.title, b.description, b.rating,b.language from book b join type t on b.isbn = t.bookid join itemordertype i on t.id = i.typeid group by b.isbn, b.title, b.description, b.rating,b.language order by count(i.typeid)desc limit 10;


-- Question 5 - Querying data - 11


SELECT g.name from genre g join bookgenre bg on g.id = bg.genreid join type t on t.bookid = bg.bookid join itemordertype i on t.id = i.typeid group by g.name order by count(i.typeid)desc limit 3;
