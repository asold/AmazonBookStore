set search_path = amazon_book_store;

create table Book(
    ISBN varchar(20) PRIMARY KEY,
    title varchar(50) not null ,
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

create table CustomerOrder(
    id serial primary key,
    bookId varchar(20) references Book(ISBN),
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

create table BookGenreCategory(
    bookId varchar(20) references Book(ISBN),
    categoryId int references Category(id),
    genreId int references Genre(id)
);

create table Type(
    id serial primary key ,
    publisher varchar(50),
    publishDate date,
    price numeric(6,2),
    condition varchar(20)
);

create table AudioBook(
    listeningTimeMinutes numeric(7,2),
    narrator varchar(50)
) inherits (Type);

create table AudioCD(
    availableCopies int
) inherits (Type);

create table Kindle(
    fileSize numeric(6,2),
    printLength int
) inherits (Type);

create table HardCover(
    availableCopies int,
    printLength int
) inherits (Type);

create table PaperBack(
    availableCopies int,
    printLength int
) inherits (Type);

drop schema amazon_book_store;
