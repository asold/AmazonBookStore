set search_path = amazon_book_store;


-- Iana's Inserts
insert into Book(ISBN, title, description, rating, language)
values (9781338801910, 'Dog Man: Twenty Thousand Fleas Under the Sea', 'A book for curious children', 4.6, 'English'),
       (9780385376716, 'The Wonderful Things You Will Be', 'A goodnight sleep book', 4.1, 'English'),
       (9780593486924, 'Grumpy Monkey Valentine Gross-Out', 'Funny story about a monkey', 4.4, 'English'),
       (9788498385489, 'Percy Jackson and the Olympians', 'A book for grownups actually', 4.8, 'English'),
       (9780147515599, 'Dragons Love Tacos', 'A valentines day book, but for children', 3.8, 'English');

insert into Customer(firstName, lastName, middleName, city, zipCode, country, street, streetNumber)
values ('Sarah', 'Lockwood', 'Bianka', 'Balti', '3101', 'Moldova', 'Stefan cel MAre si Sfant', 13),
       ('Alina', 'Johansen', null, 'Alborg', '9000', 'Denmark', 'Odinsgade', 43),
       ('Ralitsa', 'Petcova', 'Tina', 'Gdańsk', '80-007', 'Poland', 'Szeroka', 22);

insert into Category(name, parentCategoryId)
values ('Chidlrens books', null),
       ('From 6 to 8 years', 2);

insert into genre(name)
values ('Children''s Humorous Comics'),
       ('Graphic Novels');

insert into author(firstname, lastname, middlename)
values ('Dav', 'Pilkey', null),
       ('Emily', 'Martin', 'Winfield'),
       ('Suzanne', 'Lang', null),
       ('Max', 'Lang', null),
       ('Adam', 'Rubin', null),
       ('Rick', 'Riordan', null);

insert into AuthorBooks(bookid, authorid, datePosted)
values ('9781338801910', 1, '2018-12-12'),
       ('9780385376716', 2, '2019-07-19'),
       ('9780593486924', 3, '2021-02-28'),
       ('9780593486924', 4, '2021-02-28'),
       ('9788498385489', 5, '2006-03-18'),
       ('9780147515599', 6, '2021-02-28');

insert into character(name)
values ('Percy'),
       ('Monkey'),
       ('Dog Man');

insert into bookcharacters(bookid, characterid)
values ('9781338801910', 3),
       ('9780593486924', 2),
       ('9788498385489', 1),
       ('9780147515599', 4);

insert into bookcategory(bookid, categoryid)

values ('9781338801910', 4),
       ('9780385376716', 4),
       ('9780593486924', 4),
       ('9788498385489', 4),
       ('9780147515599', 4);

insert into bookgenre(bookid, genreid)
values ('9781338801910', 1),
       ('9780385376716', 2),
       ('9780593486924', 2),
       ('9788498385489', 1),
       ('9780147515599', 1);

insert into type(bookid, publisher, publishdate, price)
values ('9780385376716', 'Random House Books for Young Readers', '2015-08-25', 13.4),
       ('9781338801910', 'Graphix', '2023-03-28', 11.58),
       ('9780593486924', 'Random House Studio', '2022-11-29', 9.88),
       ('9780593486924', 'Random House Studio', '2022-11-29', 3.88),
       ('9788498385489', 'Disney-Hyperion', '2014-06-03', 19.30),
       ('9780147515599', 'Dial Books', '2012-06-13', 12.55);

insert into hardcover(id, availablecopies, printlength, condition)
values (3, 4, 200, 'Used'),
       (1, 22, 30, 'New'),
       (2, 11, 160, 'Used'),
       (6, 5, 120, 'New');

insert into audiobook(id, listeningtimeminutes, narrator)
values (6, 170, 'Adam Rubin'),
       (1, 97.1, 'Ari Meyers');

insert into kindle(id, filesize, printlength)
values (10, 1911, 40),
       (11, 2067, 130);

insert into paperback(id, availablecopies, printlength, condition)
values (5, 5, 1840, 'New');

insert into itemorder(orderdate, totalprice, customerid)
values ('2021-12-23', 120.4, 2),
       ('2022-05-04', 7.76, 1),
       ('2023-11-30', 11.58, 3);

insert into itemordertype(typeid, orderid)
values (4, 2),
       (1, 1),
       (5, 1),
       (2, 3);



-- Andrei's Inserts

insert into Book( ISBN ,
    title ,
    description,
    rating ,
    language )
values ('0241512425', 'The Bullet That Missed', 'THE THIRD NOVEL IN THE RECORD-BREAKING, MILLION-COPY BESTSELLING THURSDAY MURDER CLUB SERIES BY RICHARD OSMAN',4.7, 'English');

insert into Author(
    firstName ,
    lastname ,
    middleName )
values ('Richard', 'Osman', '');

insert into Character(name)
values('Elizabeth Best');

insert into category(name)
values('fiction');

insert into category(name, parentCategoryId)
values('Crime, thrillers & mystery', 1);

insert into category(name, parentCategoryId)
values('Thrillers', 2);

insert into Genre(name)
values('Rural Life Humor');

insert into BookCategory(bookId, categoryId)
values('0241512425', 2 );
insert into BookCategory(bookId, categoryId)
values('0241512425', 1 );
insert into BookCategory(bookId, categoryId)
values('0241512425', 3 );

insert into BookGenre(bookId, genreId)
values('0241512425', 1 );

insert into type(bookId, publisher, publishDate, price)
values('0241512425', 'Viking', '2022-09-15', 5.20);

insert into HardCover(id, availableCopies, printLength, condition)
values(10, 32, 432, 'Used');

insert into CustomerOrder(typeId, customerId, date, totalPrice)
values( 10, 1, '2023-02-13', '5.20')
;

insert into type(bookId, publisher, publishDate, price)
values('9781338801910', 'Viking', '2021-09-15', 15.20);

insert into hardcover(id, availableCopies, printLength, condition)
values(11, 13, 432, 'New');

-- Jan's Inserts

INSERT INTO book(isbn, title, description, rating, language)
VALUES ('1911687700', 'How to build a profitable and resilient brand', 'Most businesses today can readily access the required technology and talent to match competitors innovations and ideas quickly, making products and services similar to one another. In the modern business environment, companies instead need to build brands that consumers recognize and trust if theyre looking for sustainable, profitable growth. This book presents in a concise fashion the latest thinking and methods for successful branding.', 5, 'English'),
       ('161218605X', 'Stone Maidens', 'As the chief forensic anthropologist for the FBI’s Chicago field office, Christine Prusik has worked her fair share of bizarre cases. Yet this one trumps them all',4.8, 'English');

INSERT INTO author(firstname, lastname)
VALUES ('Dan', 'White');

INSERT INTO author(firstname, lastname, middlename)
VALUES ('Lloyd', 'Richards', 'Devereux');

INSERT INTO authorbooks(bookid, authorid, dateposted)
VALUES ('1911687700', (Select id from author where firstname = 'Dan' and lastname = 'White'), '6.6.2023'),
       ('161218605X', (Select id from author where firstname = 'Lloyd' and lastname = 'Richards' and middlename = 'Devereux'), '6.12.2012');

INSERT INTO character(name)
VALUES ('Dan White'),
       ('Christine Prusik');

INSERT INTO bookcharacters(bookid, characterid)
VALUES ('1911687700', (Select id from character where name = 'Dan White')),
       ('161218605X', (Select id from character where name = 'Christine Prusik'));

INSERT INTO genre(name)
VALUES ('Education'),
       ('Drama');

INSERT INTO category(name)
VALUES ('Business & Careers');

INSERT INTO category(name, parentcategoryid)
VALUES ('Sales & Marketing', (Select id from category where name = 'Business & Careers'));

INSERT INTO bookcategory(bookid, categoryid)
VALUES ('1911687700', (Select id from category where name = 'Business & Careers')),
       ('1911687700', (Select id from category where name = 'Sales & Marketing'));

INSERT INTO type(bookid, publisher, publishdate)
VALUES ('1911687700', 'Lid Publishing', '6.6.2023'),
       ('161218605X', 'Thomas & Mercer', '6.11.2012'),
       ('161218605X', 'Brilliance Audio', '10.11.2012');

INSERT INTO type(bookid, publisher, publishdate, price)
VALUES ('161218605X', 'Thomas & Mercer', '6.11.2012', 9 ),
       ('161218605X', 'Brilliance Audio', '6.11.2012', 17.99);

INSERT INTO type(bookid, publishdate, price)
values ('1911687700', '19.1.2023', 7.93);

INSERT INTO hardcover(id, printlength)
VALUES ((Select id from type where bookid = '1911687700' and publisher = 'Lid Publishing' and publishdate = '6.6.2023' and price IS NULL), 168);

INSERT INTO kindle(id, filesize, printlength)
VALUES ((Select id from type where bookid = '161218605X' and publisher = 'Thomas & Mercer' and publishdate = '6.11.2012' and price IS NULL), 5888, 182),
       ((Select id from type where bookid = '161218605X' and publisher = 'Brilliance Audio' and publishdate = '10.11.2012' and price IS NULL), 558, 343);

INSERT INTO audiobook(id, listeningtimeminutes, narrator)
VALUES ((Select id from type where bookid = '161218605X' and publisher = 'Thomas & Mercer' and publishdate = '6.11.2012' and price = 9), 611, 'Donna Postel');

INSERT INTO paperback(id, availablecopies, printlength, condition)
VALUES ((Select id from type where bookid = '161218605X' and publisher = 'Brilliance Audio' and publishdate = '6.11.2012' and price = 17.99), 2, 324, 'new');

INSERT INTO audiobook(id)
VALUES ((Select id from type where bookid = '1911687700' and publisher IS NULL and publishdate = '19.1.2023' and price = 7.93));

-- Martin's inserts
insert into Book(ISBN, title, description, rating, language)
values ('979-8987207215', 'Blue Ink Tears: A Collection of Poems', 'book about poems written by blue ink', 5, 'English'),
       ('0-6312-7348-4', 'We Over Me: The Counterintuitive Approach to Getting Everything You Want from Your Relationship', 'A goodnight sleep book about the perfect relationship they say', 4.5, 'English'),
       ('978-1250810038', 'Basketball Dreams', 'some book about basketball written buy some famous nba star that i dont know', 4.6, 'English'),
       ('0-2043-4052-7', 'Never Finished: Unshackle Your Mind and Win the War Within', 'A guy that never finishes', 4.8, 'English'),
       ('0-9546-5295-9', 'Straight Shooter: A Memoir of Second Chances and First Takes', 'Straight Shooter: A Memoir of Second Chances and First Takes', 4.5, 'English');

insert into Customer(firstName, lastName, middleName, city, zipCode, country, street, streetNumber)
values ('Franta', 'Uzasny', 'The3rd', 'Prague', '18400', 'Czech Republic', 'Boleborska', '553/9'),
       ('Lojza', 'Johansen', null, 'Horsens', '8700', 'Denmark', 'Tordensjklodsgade', 13),
       ('Nekdo', 'dalsi', null, 'Slapy', '39176', 'Czech Republic', null, 148);

insert into Category(name, parentCategoryId)
values ('Black Authors', null);

insert into genre( name)
values ( 'Fairytale'),
       ( 'Poem');

insert into author(firstname, lastname, middlename)
values ('Roberto', 'German', null),
       ('Khadeen', 'Ellis', null),
       ('Devale', 'Ellis', null),
       ('Chris', 'Paul', null),
       ('David', 'Goggins', null),
       ('Stehpen', 'Smith', 'Anthony');

insert into authorbooks(bookid, authorid, dateposted)
values ('979-8987207215', 1, '2023-01-31'),
       ('0-6312-7348-4', 2, '2023-02-07'),
       ('0-6312-7348-4', 3, '2023-02-07'),
       ('978-1250810038', 4, '2023-01-10'),
       ('0-2043-4052-7', 5, '2022-12-06'),
       ('0-9546-5295-9', 6, '2023-01-17');


insert into character(name)
values ('Grandpa Phill');

insert into bookcharacters(bookid, characterid)
values ('978-1250810038', 1);


insert into bookcategory(bookid, categoryid)
values ('979-8987207215', 1),
       ('0-6312-7348-4', 1),
       ('978-1250810038', 1),
       ('0-2043-4052-7', 1),
       ('0-9546-5295-9', 1);

insert into bookgenre(bookid, genreid)
values ('979-8987207215', 1),
       ('0-6312-7348-4', 2),
       ('978-1250810038', 1),
       ('0-2043-4052-7', 2),
       ('0-9546-5295-9', 2);

insert into type(bookid, publisher, publishdate, price)
values ('979-8987207215', 'Bowker', '2023-01-31', 1.09),
       ('979-8987207215', 'Bowker', '2023-01-31', 14.23),
       ('0-6312-7348-4', 'Rodale Books', '2023-02-07', 15.39),
       ('0-6312-7348-4', 'Rodale Books', '2023-02-07', 17.95),
       ('0-6312-7348-4', 'Rodale Books', '2023-02-07', 16.99),
       ('978-1250810038', 'Roaring Brook Press', '2023-01-10', 13.92),
       ('978-1250810038', 'Roaring Brook Press', '2023-01-10', 13.92),
       ('978-1250810038', 'Roaring Brook Press', '2023-01-10', 12.71),
       ('0-2043-4052-7', 'Nakej Franta', '2022-12-06', 10.44),
       ('0-9546-5295-9', 'Gallery/13A', '2023-01-17', 17.25);


insert into hardcover(id, availablecopies, printlength, condition)
values (4, 13, 456, 'New'),
       (5, 4, 456, 'Used'),
       (7, 26, 121, 'New'),
       (8, 26, 121, 'Used'),
       (10,24,222, 'New');

insert into audiobook(id, listeningtimeminutes, narrator)
values (9, 97.1, 'Franta Dobrej');

insert into kindle(id, filesize, printlength)
values (1,2211, 69),
       (6,2167, 121);

insert into paperback(id, availablecopies, printlength, condition)
values (2, 1, 69, 'New');

insert into itemorder(orderdate, totalprice, customerid)
values ('2023-02-14',13.8,2),
       ('2023-02-13',17.25,1),
       ('2023-02-12',13.92,3);

insert into itemordertype(typeid, orderid)
values (1,1),
       (6,1),
       (10,2),
       (7,3);
