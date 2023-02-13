insert into Book(ISBN, title, description, rating, language)
values (9781338801910, 'Dog Man: Twenty Thousand Fleas Under the Sea', 'A book for curious children', 4.6, 'English'),
       (9780385376716, 'The Wonderful Things You Will Be', 'A goodnight sleep book', 4.1, 'English'),
       (9780593486924, 'Grumpy Monkey Valentine Gross-Out', 'Funny story about a monkey', 4.4, 'English'),
       (9788498385489, 'Percy Jackson and the Olympians', 'A book for grownups actually', 4.8, 'English'),
       (9780147515599, 'Dragons Love Tacos', 'A valentines day book, but for children', 3.8, 'English');

insert into Customer(firstName, lastName, middleName, city, zipCode, country, street, streetNumber)
values ('Sarah','Lockwood','Bianka','Balti','3101','Moldova','Stefan cel MAre si Sfant',13),
       ('Alina','Johansen', null,'Alborg','9000','Denmark','Odinsgade',43),
       ('Ralitsa','Petcova','Tina','Gdańsk','80-007','Poland','Szeroka',22);

insert into Category(name, parentCategoryId)
values ('Chidlrens books',null )