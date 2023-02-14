set search_path = amazon_book_store;

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

-- Querying data - return statements
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

INSERT INTO type(bookid, publisher, publishdate, price, condition)
VALUES ('9780945774259', 'Faber & Faber, limited', '1.1.1932', 35, 'used'),
       ('9780486419268', 'Dover Publications', '20.8.2001', 3, 'used'),
       ('9780486419268', 'Dover Publications', '20.8.2001', 3.11, 'new'),
       ('0486817245', 'Dover Publications', '13.9.2017', 2.62 ,'used'),
       ('0486817245', 'Dover Publications', '13.9.2017', 7.57, 'new');

INSERT INTO hardcover(id, availablecopies, printlength)
VALUES ((SELECT id from type where bookid = '9780945774259'), 3, 2);

INSERT INTO paperback(id, availablecopies, printlength)
VALUES ((SELECT id from type where bookid = '9780486419268' and condition = 'used'), 14, 64),
       ((SELECT id from type where bookid = '9780486419268' and condition = 'new'), 5, 64),
       ((SELECT id from type where bookid = '0486817245' and condition = 'used'), 24, 112),
       ((SELECT id from type where bookid = '0486817245' and condition = 'new'), 24, 112);

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
VALUES (1, 1),
       (2,1);

INSERT INTO itemordertype(typeid, orderid)
VALUES (3, 2),
       (4,2),
       (5,2);


UPDATE itemorder
SET totalprice = (SELECT SUM(price) sumPrice from type inner join itemordertype i on type.id = i.typeid where orderid = 1)
WHERE id = 1;

UPDATE itemorder
SET totalprice = (SELECT SUM(price) sumPrice from type inner join itemordertype i on type.id = i.typeid where orderid = 2)
WHERE id = 2;

-- Getting a total price
SELECT totalprice from itemorder  where id = 1;

--3. Total sales to a customer
SELECT SUM(totalprice) from itemorder where customerid = 1;
