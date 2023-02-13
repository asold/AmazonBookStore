set search_path = amazon_book_store;

create table Book(
    ISBN varchar(20) PRIMARY KEY,
    title varchar(100) not null ,
    description varchar(500),
    rating numeric(2, 1),
    language varchar(20)
);

create table Author(
    id serial PRIMARY KEY,
    firstName varchar(50) not null ,
    lastname varchar(50) not null,
    middleName varchar(50)
);

create table AuthorBooks(
    bookId varchar(20),
    authorId int,
    datePosted date,
    foreign key (authorId) references Author(id),
    foreign key (bookId) references Book(ISBN)
);

create table Character(
    id serial primary key,
    name varchar (100)
);

create table BookCharacters(
    bookId varchar(20),
    characterId int,
    foreign key (bookId) references Book(ISBN),
    foreign key (characterId) references Character(id)
);
-- drop table Customer;

create table Customer(
    id serial primary key ,
    firstName varchar (30),
    lastName varchar (30),
    middleName varchar (30),
    city varchar(50),
    zipCode varchar(10),
    country  varchar(30),
    street varchar (50),
    streetNumber int
);
-- drop table CustomerOrder;

create table CustomerOrder(
    id serial primary key,
    typeId  int  references Type(id) ,
    customerId int references Customer(id),
    date date,
    totalPrice numeric(8,2)
);

create table Genre(
    id serial primary key ,
    name varchar(30)
);



create table Category(
    id serial primary key ,
    name varchar(30),
    parentCategoryId int references Category(id)
);
-- drop table bookcategory;
create table BookCategory(
    bookId varchar(20) references Book(ISBN),
    categoryId int references Category(id)
);
create table BookGenre(
    bookId varchar(20) references Book(ISBN),
    genreId int references Genre(id)
);


drop  table Type cascade;
create table Type(
    id serial primary key ,
    bookId varchar(20),
    publisher varchar(50),
    publishDate date,
    price numeric(6,2),
    condition varchar(20),

    foreign key (bookId) references Book(ISBN)

);
-- drop table AudioBook;
create table AudioBook(
    id int  primary key  references Type(id),
    listeningTimeMinutes numeric(7,2),
    narrator varchar(50)
) ;

-- drop table AudioCD;

create table AudioCD(
    id int  primary key  references Type(id),

    availableCopies int
) ;

drop table Kindle;

create table Kindle(
    id int  primary key  references Type(id),
    fileSize numeric(6,2),
    printLength int
) ;

-- drop table HardCover;

create table HardCover(
    id int  primary key  references Type(id),
    availableCopies int,
    printLength int
) ;

-- drop table PaperBack;

create table PaperBack(
    id int  primary key  references Type(id),
    availableCopies int,
    printLength int
);



-- Insert statements
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

-- insert into AudioCD(bookId)
-- values ('0241512425');
--
-- insert into HardCover( , availableCopies, printLength)
-- values('Viking', '0241512425', '2022-09-15', '5.20', 'Used', 32, 432);
--
-- insert into HardCover(publisher,bookId, publishDate, price, condition, availableCopies, printLength)
-- values('Viking', '0241512425', '2022-09-15', '10.00', 'New', 23, 432);
--
-- insert into paperback(publisher,bookId, publishDate, price, condition, availableCopies, printLength)
-- values('Penguin', '0241512425', '2022-09-15', '8.79', 'New', 1, 400);

insert into Customer(firstName, lastName, middleName, city, zipCode, country, street, streetNumber)
values('Andrei', 'soldan', null,'Horsens', '8700', 'Denmark', 'Kamtjatka', 10);

insert into CustomerOrder(typeId, customerId, date, totalPrice)
values( 9, 1, '2023-02-13', '5.20');


select * from type
where id = 2