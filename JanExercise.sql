set search_path = amazon_book_store;

-- Question 4 - Modifying data - 4
--  Populate tables with books from "Space opera" category
INSERT INTO category(name, parentcategoryid)
VALUES ('Science Fiction and Fantasy', null);

INSERT INTO category(name, parentcategoryid)
VALUES ('Space opera', (SELECT id from category where name = 'Science Fiction and Fantasy'));

INSERT INTO book(isbn, title, description, rating, language)
VALUES ('0593135202', 'Project Hail Mary', 'All he knows is that he’s been asleep for a very, very long time. And he’s just been awakened to find himself millions of miles from home, with nothing but two corpses for company.', 4.7,'English'),
       ('979-8376385708', 'War Head', 'When Ben first bought his starship, he expected to spend the rest of his days joyriding through the universe with his best friend.', 4.7, 'English'),
       ('9780143111580', 'Dune (Penguin Galaxy', 'Science fiction’s supreme masterpiece, Dune will be forever considered a triumph of the imagination. Set on the desert planet Arrakis, it is the story of the boy Paul Atreides, who will become the mysterious man known as Muad’Dib.', 4.7, 'English');

INSERT INTO bookcategory(bookid, categoryid)
VALUES ('0593135202', (SELECT id from category where name = 'Space opera')),
       ('979-8376385708', (SELECT id from category where name = 'Space opera')),
       ('9780143111580', (SELECT id from category where name = 'Space opera'));

--  Retire "Space opera" and moving books from "Space opera" category to parent category
UPDATE bookcategory
SET categoryid = (SELECT id FROM category WHERE name = 'Science Fiction and Fantasy')
WHERE categoryid = (SELECT id FROM category WHERE name = 'Space opera');

DELETE FROM category
WHERE name = 'Space opera';

