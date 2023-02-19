set search_path = amazon_book_store;

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

insert into type(bookid, publisher, publishdate, price, condition)
values ('9780385376716', 'Random House Books for Young Readers', '2015-08-25', 13.4, 'New'),
       ('9781338801910', 'Graphix', '2023-03-28', 11.58, 'New'),
       ('9780593486924', 'Random House Studio', '2022-11-29', 9.88, 'New'),
       ('9780593486924', 'Random House Studio', '2022-11-29', 3.88, 'Used'),
       ('9788498385489', 'Disney-Hyperion', '2014-06-03', 19.30, 'New'),
       ('9780147515599', 'Dial Books', '2012-06-13', 12.55, 'Used');

insert into hardcover(id, availablecopies, printlength)
values (3, 4, 200),
       (1, 22, 30),
       (2, 11, 160),
       (6, 5, 120);

insert into audiobook(id, listeningtimeminutes, narrator)
values (6,170,'Adam Rubin'),
       (1, 97.1, 'Ari Meyers');

insert into kindle(id, filesize, printlength)
values (10,1911,40),
       (11,2067,130);

insert into paperback(id, availablecopies, printlength)
values (5,5,1840);

insert into itemorder(orderdate, totalprice, customerid)
values ('2021-12-23',120.4,2),
       ('2022-05-04',7.76,1),
       ('2023-11-30',11.58,3);

insert into itemordertype(typeid, orderid)
values (4,2),
       (1,1),
       (5,1),
       (2,3);



