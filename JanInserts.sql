SET search_path = amazon_book_store;

INSERT INTO book(isbn, title, description, rating, language)
VALUES ('1911687700', 'How to build a profitable and resilient brand', 'Most businesses today can readily access the required technology and talent to match competitors innovations and ideas quickly, making products and services similar to one another. In the modern business environment, companies instead need to build brands that consumers recognize and trust if theyre looking for sustainable, profitable growth. This book presents in a concise fashion the latest thinking and methods for successful branding.', 5, 'English'),
       ('161218605X', 'Stone Maidens', 'As the chief forensic anthropologist for the FBI’s Chicago field office, Christine Prusik has worked her fair share of bizarre cases. Yet this one trumps them all',4.8, 'English');

INSERT INTO author(firstname, lastname)
VALUES ('Dan', 'White');

INSERT INTO author(firstname, lastname, middlename)
VALUES ('Lloyd', 'Richards', 'Devereux');

INSERT INTO authorbooks(bookid, authorid, dateposted)
VALUES ('1911687700', (Select id from author where firstname = 'Dan' and lastname = 'White'), '6.6.2023'),
       ('161218605X', (Select id from author where firstname = 'Lloyd' and lastname = 'Richards' and middlename = 'Devereux'), '6.12.2012');

INSERT INTO character(name)
VALUES ('Dan White'),
       ('Christine Prusik');

INSERT INTO bookcharacters(bookid, characterid)
VALUES ('1911687700', (Select id from character where name = 'Dan White')),
       ('161218605X', (Select id from character where name = 'Christine Prusik'));

INSERT INTO genre(name)
VALUES ('Education'),
       ('Drama');

INSERT INTO category(name)
VALUES ('Business & Careers');

INSERT INTO category(name, parentcategoryid)
VALUES ('Sales & Marketing', (Select id from category where name = 'Business & Careers'));

INSERT INTO bookcategory(bookid, categoryid)
VALUES ('1911687700', (Select id from category where name = 'Business & Careers')),
       ('1911687700', (Select id from category where name = 'Sales & Marketing'));

INSERT INTO type(bookid, publisher, publishdate)
VALUES ('1911687700', 'Lid Publishing', '6.6.2023'),
       ('161218605X', 'Thomas & Mercer', '6.11.2012'),
       ('161218605X', 'Brilliance Audio', '10.11.2012');

INSERT INTO type(bookid, publisher, publishdate, price, condition)
VALUES ('161218605X', 'Thomas & Mercer', '6.11.2012', 9 ,'new'),
       ('161218605X', 'Brilliance Audio', '6.11.2012', 17.99, 'new');

INSERT INTO type(bookid, publishdate, price)
values ('1911687700', '19.1.2023', 7.93);

INSERT INTO hardcover(id, printlength)
VALUES ((Select id from type where bookid = '1911687700' and publisher = 'Lid Publishing' and publishdate = '6.6.2023' and price IS NULL and condition IS NULL), 168);

INSERT INTO kindle(id, filesize, printlength)
VALUES ((Select id from type where bookid = '161218605X' and publisher = 'Thomas & Mercer' and publishdate = '6.11.2012' and price IS NULL and condition IS NULL), 5888, 182),
       ((Select id from type where bookid = '161218605X' and publisher = 'Brilliance Audio' and publishdate = '10.11.2012' and price IS NULL and condition IS NULL), 558, 343);

INSERT INTO audiobook(id, listeningtimeminutes, narrator)
VALUES ((Select id from type where bookid = '161218605X' and publisher = 'Thomas & Mercer' and publishdate = '6.11.2012' and price = 9 and  condition = 'new'), 611, 'Donna Postel');

INSERT INTO paperback(id, availablecopies, printlength)
VALUES ((Select id from type where bookid = '161218605X' and publisher = 'Brilliance Audio' and publishdate = '6.11.2012' and price = 17.99 and  condition = 'new'), 2, 324);

INSERT INTO audiobook(id)
VALUES ((Select id from type where bookid = '1911687700' and publisher IS NULL and publishdate = '19.1.2023' and price = 7.93 and condition IS NULL));