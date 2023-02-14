set search_path = amazon_book_store;


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

insert into type(bookId, publisher, publishDate, price, condition)
values('0241512425', 'Viking', '2022-09-15', 5.20, 'Used');

insert into HardCover(id, availableCopies, printLength)
values(10, 32, 432);

insert into CustomerOrder(typeId, customerId, date, totalPrice)
values( 10, 1, '2023-02-13', '5.20');


insert into type(bookId, publisher, publishDate, price, condition)
values('9781338801910', 'Viking', '2021-09-15', 15.20, 'New');

insert into hardcover(id, availableCopies, printLength)
values(11, 13, 432);