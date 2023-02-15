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
values ('979-8987207215', 5),
       ('0-6312-7348-4', 5),
       ('978-1250810038', 5),
       ('0-2043-4052-7', 3),
       ('0-9546-5295-9', 3);

insert into type(bookid, publisher, publishdate, price, condition)
values ('979-8987207215', 'Bowker', '2023-01-31', 1.09, null),
       ('979-8987207215', 'Bowker', '2023-01-31', 14.23, 'New'),
       ('0-6312-7348-4', 'Rodale Books', '2023-02-07', 15.39, null),
       ('0-6312-7348-4', 'Rodale Books', '2023-02-07', 17.95, 'New'),
       ('0-6312-7348-4', 'Rodale Books', '2023-02-07', 16.99, 'Used'),
       ('978-1250810038', 'Roaring Brook Press', '2023-01-10', 13.92, null),
       ('978-1250810038', 'Roaring Brook Press', '2023-01-10', 13.92, 'New'),
       ('978-1250810038', 'Roaring Brook Press', '2023-01-10', 12.71, 'Used'),
       ('0-2043-4052-7', 'Nakej Franta', '2022-12-06', 10.44, null),
       ('0-9546-5295-9', 'Gallery/13A', '2023-01-17', 17.25, 'New');


insert into hardcover(id, availablecopies, printlength)
values (4, 13, 456),
       (5, 4, 456),
       (7, 26, 121),
       (8, 26, 121),
       (10,24,222);

insert into audiobook(id, listeningtimeminutes, narrator)
values (9, 97.1, 'Franta Dobrej');

insert into kindle(id, filesize, printlength)
values (1,2211, 69),
       (6,2167, 121);

insert into paperback(id, availablecopies, printlength)
values (2, 1, 69);

insert into itemorder(orderdate, totalprice, customerid)
values ('2023-02-14',13.8,2),
       ('2023-02-13',17.25,1),
       ('2023-02-12',13.92,3);

insert into itemordertype(typeid, orderid)
values (1,1),
       (6,1),
       (10,2),
       (7,3);
