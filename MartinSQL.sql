set search_path = amazon_book_store;

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
values ('Dav', 'Pilkey', null),
       ('Emily', 'Martin', 'Winfield'),
       ('Suzanne', 'Lang', null),
       ('Max', 'Lang', null),
       ('Adam', 'Rubin', null),
       ('Rick', 'Riordan', null);

insert into authorbooks(bookid, authorid, dateposted)
values ('9781338801910', 1, '2018-12-12'),
       ('9780385376716', 2, '2019-07-19'),
       ('9780593486924', 3, '2021-02-28'),
       ('9780593486924', 4, '2021-02-28'),
       ('9788498385489', 5, '2006-03-18'),
       ('9780147515599', 6, '2021-02-28');

