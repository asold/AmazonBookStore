set search_path = amazon_book_store;


create table Book(
    ISBN varchar(20) PRIMARY KEY,
    title varchar(100) not null ,
    description varchar(500),
    rating numeric(2, 1),
    language varchar(20)
);

-- alter table Book alter column title type varchar(100);

create table Author(
    id serial PRIMARY KEY,
    firstName varchar(50) not null ,
    lastname varchar(50) not null,
    middleName varchar(50)
);
-- drop table AuthorBooks;
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
    streetNumber varchar(15)
);
alter table customer alter column streetNumber type varchar(15);


-- drop  table Type cascade;
create table Type(
    id serial primary key ,
    bookId varchar(20),
    publisher varchar(50),
    publishDate date,
    price numeric(6,2),
    condition varchar(20),

    foreign key (bookId) references Book(ISBN)

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

-- drop table Kindle;

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

create table ItemOrder(
    id serial primary key ,
    orderDate date,
    totalprice numeric(10,2),
    customerId int,
    foreign key (customerId) references Customer(id)
);

create table ItemOrderType(
    typeId int references Type(id),
    orderId int references ItemOrder(id)
)




