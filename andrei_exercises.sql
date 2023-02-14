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

select * from book
inner join bookcategory b on book.isbn = b.bookid
join category c on c.id = b.categoryid
where c.name not like '%fiction%' and c.name not like 'Crime, thrillers & mystery'
-- group by bookid

/*or c.name  like '%thrillers%'*/














-- create or replace function make_order_customer_book(customersId integer, bookISBN varchar(20), orderId int )
-- returns void as $$
--     BEGIN
--     -- selling a hardcover copy
--     --      this will return the id of the type of the book that has been sold
--     --      in this example the book is of type hardcover
--     with new_itemOrderType as(
--             insert into itemordertype(typeid, orderid)
--             select (select "get_type_given_book_isbn"('0241512425')), 41
--             from   itemorder, type
--             join hardcover on type.id = hardcover.id
--             returning itemordertype.typeid
--     )
--     -- here we update the amount of hard cover copies(-1)
--     update hardcover
--         set availablecopies = availablecopies-1
--         from new_itemOrderType
--         where hardcover.id =  new_itemOrderType.typeid;
--
--     -- here we update the total price of the item order that has been placed for the customer
--     update itemorder i
--     set totalprice = totalprice + t.price
--     from itemordertype ot
--     join type t on ot.typeid = t.id
--     where i.id = ot.orderid;
--
--         end;
-- $$
-- language plpgsql;



