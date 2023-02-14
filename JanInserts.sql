SET search_path = amazon_book_store;

INSERT INTO book(isbn, title, description, rating, language)
VALUES ('1911687700', 'How to build a profitable and resilient brand', 'Most businesses today can readily access the required technology and talent to match competitors innovations and ideas quickly, making products and services similar to one another. In the modern business environment, companies instead need to build brands that consumers recognize and trust if theyre looking for sustainable, profitable growth. This book presents in a concise fashion the latest thinking and methods for successful branding.', 5, 'English'),
       ('161218605X', 'Stone Maidens', 'As the chief forensic anthropologist for the FBI’s Chicago field office, Christine Prusik has worked her fair share of bizarre cases. Yet this one trumps them all',4.8, 'English');

INSERT INTO author(firstname, lastname)
VALUES ('Dan', 'White');

INSERT INTO author(firstname, lastname, middlename)
VALUES ('Lloyd', 'Richards', 'Devereux');

INSERT INTO authorbooks(bookid, authorid, dateposted)
VALUES ('1911687700', 1, '6.6.2023'),
       ('161218605X', 2, '6.12.2012');

INSERT INTO character(name)
VALUES ('Dan White'),
       ('Christine Prusik');

INSERT INTO bookcharacters(bookid, characterid)
VALUES ('1911687700', 1),
       ('161218605X', 2);

INSERT INTO genre(name)
VALUES ('Education'),
       ('Drama');

INSERT INTO category(name)
VALUES ('Business & Careers');

INSERT INTO category(name, parentcategoryid)
VALUES ('Sales & Marketing', 1);

INSERT INTO bookcategory(bookid, categoryid)
VALUES ('1911687700', 1),
       ('1911687700', 2);

INSERT INTO type(bookid, publisher, publishdate)
VALUES ('1911687700', 'Lid Publishing', '6.6.2023'),
       ('161218605X', 'Thomas & Mercer', '6.11.2012'),
       ('161218605X', 'Brilliance Audio', '10.11.2012');

INSERT INTO type(bookid, publisher, publishdate, price, condition)
VALUES ('161218605X', 'Thomas & Mercer', '6.11.2012', 9 ,'new'),
       ('161218605X', 'Brilliance Audio', '6.11.2012', 17.99, 'new');

INSERT INTO hardcover(id, printlength)
VALUES (1, 168);

INSERT INTO type(bookid, publishdate, price)
values ('1911687700', '19.1.2023', 7.93);

INSERT INTO kindle(id, filesize, printlength)
VALUES (2, 5888, 182),
       (3, 558, 343);

INSERT INTO audiobook(id, listeningtimeminutes, narrator)
VALUES (4, 611, 'Donna Postel');

INSERT INTO paperback(id, availablecopies, printlength)
VALUES (5, 2, 324);

INSERT INTO audiobook(id)
VALUES (6);