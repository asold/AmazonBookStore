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

insert into genre( name)
values ( 'Children''s Humorous Comics'),
       ( 'Graphic Novels');

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
values ('9780147515599', 4),
       ('9780385376716', 4),
       ('9780593486924', 4),
       ('9788498385489', 4),
       ('9780147515599', 4);



