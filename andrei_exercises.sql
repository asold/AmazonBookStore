set search_path = amazon_book_store;

-- Modifying data
-- Exercise 4.5  Sell 3 copies of one book and 2 of another in a single order:
-- the sold books are hardcover types


-- this function allows to get the book's type based on the book's isbn
create or replace function get_type_given_book_isbn(a varchar(20))
returns integer
as $$
    declare
    typeId integer;
    BEGIN
        select id into typeId
            from type
            where type.bookid = a;
        return typeId;
    end;
$$ LANGUAGE plpgsql;

create or replace function create_order_for_customer(customerId int)
returns integer
as $$
    declare
    orderid integer;
    BEGIN
-- the sql below creates a new order for the first customer
        insert into itemorder( orderdate, totalprice, customerid)
        values (now(), 0, customerId) ;

        select currval('itemorder_id_seq') into orderid;
        return orderid;
    end;
$$ LANGUAGE plpgsql;





create or replace function make_order_customer_book(bookISBN varchar(20), orderId int )
returns void as $$
    declare
        typeId integer;
    BEGIN
    -- selling a hardcover copy
    --      this will return the id of the type of the book that has been sold
    --      in this example the book is of type hardcover
    select "get_type_given_book_isbn"('0241512425') into typeId;
            insert into itemordertype(typeid, orderid)
            select typeId, orderId;

    -- here we update the amount of hard cover copies(-1)
    update hardcover
        set availablecopies = availablecopies-1
        where hardcover.id =  typeId;

    -- here we update the total price of the item order that has been placed for the customer
    update itemorder i
    set totalprice = totalprice + t.price
    from itemordertype ot
    join type t on ot.typeid = t.id
    where i.id = ot.orderid;
        end;
$$
language plpgsql;

-- adding orders
select * from make_order_customer_book( '0241512425', create_order_for_customer(5));
-- using 44 here because we know what order was created
select * from make_order_customer_book( '0241512425', 45);
select * from make_order_customer_book( '0241512425', 45);
select * from make_order_customer_book( '9781338801910', 45);
select * from make_order_customer_book( '9781338801910', 45);




-- Querying data
-- Exercise 4.4
-- Books that are categorized as neither science fiction nor fantasy

CREATE TEMP TABLE tbl AS
select * from book
    where book.isbn not in(
        select bookcategory.bookid
        from bookcategory
        join category c on bookcategory.categoryid = c.id
        where c.name not in ('fiction', 'fantasy')
        );
select * from tbl;
drop table tbl;

/*or c.name  like '%thrillers%'*/

-- Querying data
-- Exercise 4.5
-- Average page count by genre

-- create temp table
-- with averages of page length by each type(kindle, paperback, hardcover)
-- grouped by id of type they are related to
create temp table AvgByTypeId as
SELECT
  AVG(printlength) as average, id AS avg_column1
FROM (
  SELECT printlength, id FROM kindle
  UNION ALL
  SELECT printlength , id FROM paperback
  UNION ALL
  SELECT printlength, id FROM hardcover

) combined_data
group by id;
select * from AvgByTypeId;
-- -----------------------------------------------------------
-- adding the bookid column to pre previous table
create temp table AvgPerBook as
select * from AvgByTypeId
    inner join type on AvgByTypeId.avg_column1 = type.id;

drop table AvgByTypeId;

-- joining genre, bookgenre and AvgPerBook based on bookId
select AvgPerBook.average, genre.name
    from  AvgPerBook
    inner join bookgenre  on bookgenre.bookid = AvgPerBook.bookid
    inner join genre on bookgenre.genreid = genre.id;

drop table AvgPerBook;
