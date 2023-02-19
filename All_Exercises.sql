set search_path = amazon_book_store;

--Exercise 4 - Modifying data

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

-- 3.	Add an existing author to a book
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

-- Question 4 - Modifying data - 4
--  Populate tables with books from "Space opera" category
INSERT INTO category(name, parentcategoryid)
VALUES ('Science Fiction and Fantasy', null);

INSERT INTO category(name, parentcategoryid)
VALUES ('Space opera', (SELECT id from category where name = 'Science Fiction and Fantasy'));

INSERT INTO book(isbn, title, description, rating, language)
VALUES ('0593135202', 'Project Hail Mary', 'All he knows is that he’s been asleep for a very, very long time. And he’s just been awakened to find himself millions of miles from home, with nothing but two corpses for company.', 4.7,'English'),
       ('979-8376385708', 'War Head', 'When Ben first bought his starship, he expected to spend the rest of his days joyriding through the universe with his best friend.', 4.7, 'English'),
       ('9780143111580', 'Dune (Penguin Galaxy', 'Science fiction’s supreme masterpiece, Dune will be forever considered a triumph of the imagination. Set on the desert planet Arrakis, it is the story of the boy Paul Atreides, who will become the mysterious man known as Muad’Dib.', 4.7, 'English');

INSERT INTO bookcategory(bookid, categoryid)
VALUES ('0593135202', (SELECT id from category where name = 'Space opera')),
       ('979-8376385708', (SELECT id from category where name = 'Space opera')),
       ('9780143111580', (SELECT id from category where name = 'Space opera'));

--  Retire "Space opera" and moving books from "Space opera" category to parent category
UPDATE bookcategory
SET categoryid = (SELECT id FROM category WHERE name = 'Science Fiction and Fantasy')
WHERE categoryid = (SELECT id FROM category WHERE name = 'Space opera');

DELETE FROM category
WHERE name = 'Space opera';

-- Exercise 4.5  Sell 3 copies of one book and 2 of another in a single order:
-- the sold books are hardcover types


-- this function allows to get the book's type based on the book's isbn
create or replace function get_type_given_book_isbn(a varchar(20))
returns integer
as $$
    declare
    typeId integer;
    BEGIN
        select id into typeId
            from type
            where type.bookid = a;
        return typeId;
    end;
$$ LANGUAGE plpgsql;

create or replace function create_order_for_customer(customerId int)
returns integer
as $$
    declare
    orderid integer;
    BEGIN
-- the sql below creates a new order for the first customer
        insert into itemorder( orderdate, totalprice, customerid)
        values (now(), 0, customerId) ;

        select currval('itemorder_id_seq') into orderid;
        return orderid;
    end;
$$ LANGUAGE plpgsql;





create or replace function make_order_customer_book(bookISBN varchar(20), orderId int )
returns void as $$
    declare
        typeId integer;
    BEGIN
    -- selling a hardcover copy
    --      this will return the id of the type of the book that has been sold
    --      in this example the book is of type hardcover
    select "get_type_given_book_isbn"('0241512425') into typeId;
            insert into itemordertype(typeid, orderid)
            select typeId, orderId;

    -- here we update the amount of hard cover copies(-1)
    update hardcover
        set availablecopies = availablecopies-1
        where hardcover.id =  typeId;

    -- here we update the total price of the item order that has been placed for the customer
    update itemorder i
    set totalprice = totalprice + t.price
    from itemordertype ot
    join type t on ot.typeid = t.id
    where i.id = ot.orderid;
        end;
$$
language plpgsql;

-- adding orders
select * from make_order_customer_book( '0241512425', create_order_for_customer(5));
-- using 44 here because we know what order was created
select * from make_order_customer_book( '0241512425', 45);
select * from make_order_customer_book( '0241512425', 45);
select * from make_order_customer_book( '9781338801910', 45);
select * from make_order_customer_book( '9781338801910', 45);


-- Exercise 4 - Querying data
-- 1. All books by an author

-- Creating author and books
INSERT INTO author(firstname, lastname)
VALUES ('Karel', 'Čapek');

INSERT INTO book(isbn, title, description, rating, language)
VALUES ('9780945774259', 'Tales from two pockets', null, 4.5, 'English'),
       ('9780486419268', 'R.U.R', 'One of the classics of twentieth-century theater, this brilliantly conceived and exquisitely executed play by Czech playwright Karel Čapek (1890–1938) looks to a future in which all workers are automatons, or "robots" — a word this play made a permanent part of the language.', 4.6, 'English'),
       ('0486817245', 'The Gardener''s Year', '"This very entertaining volume with its delightfully humorous pictures should be read by all gardeners." — Nature
"Mr. Čapek writes with sympathy, understanding, and humor." — The New York Times', 4.4, 'English');

INSERT INTO authorbooks(bookid, authorid)
VALUES ('9780945774259', (SELECT id from author where firstname = 'Karel' and lastname = 'Čapek')),
       ('9780486419268', (SELECT id from author where firstname = 'Karel' and lastname = 'Čapek')),
       ('0486817245', (SELECT id from author where firstname = 'Karel' and lastname = 'Čapek'));

INSERT INTO type(bookid, publisher, publishdate, price)
VALUES ('9780945774259', 'Faber & Faber, limited', '1.1.1932', 35),
       ('9780486419268', 'Dover Publications', '20.8.2001', 3),
       ('9780486419268', 'Dover Publications', '20.8.2001', 3.11),
       ('0486817245', 'Dover Publications', '13.9.2017', 2.62 ),
       ('0486817245', 'Dover Publications', '13.9.2017', 7.57);

INSERT INTO hardcover(id, availablecopies, printlength, condition)
VALUES ((SELECT id from type where bookid = '9780945774259'), 3, 2, 'used');

INSERT INTO paperback(id, availablecopies, printlength ,condition)
VALUES ((SELECT id from type where bookid = '9780486419268' and price = 3), 14, 64, 'used'),
       ((SELECT id from type where bookid = '9780486419268' and price = 3.11), 5, 64, 'new'),
       ((SELECT id from type where bookid = '0486817245' and price = 2.62), 24, 112, 'used'),
       ((SELECT id from type where bookid = '0486817245' and price = 7.57), 24, 112, 'new');

-- Getting all books for the specific author
SELECT * FROM book
WHERE isbn in (SELECT bookid from authorbooks where authorid = (SELECT id from author where firstname = 'Karel' and lastname = 'Čapek'));

-- 2. Total price of an order
-- Creating a customer and an order
INSERT INTO customer(firstname, lastname, city, zipcode, country, street, streetnumber)
VALUES ('Tanja', 'Shriram', 'Holbæk', '4300', 'Denmark', 'Albanivej', '17');

SELECT create_order_for_customer((SELECT id from customer where firstname = 'Tanja' and lastname = 'Shriram' and city = 'Holbæk' and zipcode = '4300' and country = 'Denmark' and street = 'Albanivej' and streetnumber = '17'));
SELECT create_order_for_customer((SELECT id from customer where firstname = 'Tanja' and lastname = 'Shriram' and city = 'Holbæk' and zipcode = '4300' and country = 'Denmark' and street = 'Albanivej' and streetnumber = '17'));

INSERT INTO itemordertype(typeid, orderid)
VALUES (10, 45),
       (11,46);

INSERT INTO itemordertype(typeid, orderid)
VALUES (12, 45),
       (12,45),
       (10,46);


UPDATE itemorder
SET totalprice = (SELECT SUM(price) sumPrice from type inner join itemordertype i on type.id = i.typeid where orderid = 1)
WHERE id = 45;

UPDATE itemorder
SET totalprice = (SELECT SUM(price) sumPrice from type inner join itemordertype i on type.id = i.typeid where orderid = 2)
WHERE id = 45;

-- Getting a total price
SELECT totalprice from itemorder  where id = 45;

--3. Total sales to a customer
SELECT SUM(totalprice) from itemorder where customerid = 46;

-- Exercise 4.4
-- Books that are categorized as neither science fiction nor fantasy

CREATE TEMP TABLE tbl AS
select * from book
    where book.isbn not in(
        select bookcategory.bookid
        from bookcategory
        join category c on bookcategory.categoryid = c.id
        where c.name not in ('science fiction', 'fantasy')
        );
select * from tbl;
drop table tbl;


-- Querying data
-- Exercise 4.5
-- Average page count by genre

-- create temp table
-- with averages of page length by each type(kindle, paperback, hardcover)
-- grouped by id of type they are related to
create temp table AvgByTypeId as
SELECT
  AVG(printlength) as average, id AS avg_column1
FROM (
  SELECT printlength, id FROM kindle
  UNION ALL
  SELECT printlength , id FROM paperback
  UNION ALL
  SELECT printlength, id FROM hardcover

) combined_data
group by id;
-- -----------------------------------------------------------
-- adding the bookid column to pre previous table
create temp table AvgPerBook as
select * from AvgByTypeId
    inner join type on AvgByTypeId.avg_column1 = type.id;

drop table AvgByTypeId;

-- joining genre, bookgenre and AvgPerBook based on bookId
select AvgPerBook.average, genre.name
    from  AvgPerBook
    inner join bookgenre  on bookgenre.bookid = AvgPerBook.bookid
    inner join genre on bookgenre.genreid = genre.id;

drop table AvgPerBook;


-- Querying data
-- Exercise 4.6
-- Categories that have no sub-categories

select cat1.id, cat1.name, cat1.parentcategoryid
from category cat1
left join category cat2 on cat1.id = cat2.parentcategoryid
where cat2.id is null

--ISBN number of the books that have more then one author
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

-- Question 5 - Querying data - 10


SELECT b.isbn, b.title, b.description, b.rating,b.language from book b join type t on b.isbn = t.bookid join itemordertype i on t.id = i.typeid group by b.isbn, b.title, b.description, b.rating,b.language order by count(i.typeid)desc limit 10;


-- Question 5 - Querying data - 11


SELECT g.name from genre g join bookgenre bg on g.id = bg.genreid join type t on t.bookid = bg.bookid join itemordertype i on t.id = i.typeid group by g.name order by count(i.typeid)desc limit 3;
