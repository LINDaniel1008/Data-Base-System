/* This is an exerise to create a simple product table with 5 records. */

Create table PRODUCT
(ProdID      integer primary key,
 Description varchar(50) Not null,
 Price       decimal(5,2));

insert into PRODUCT values (100860, 'ace tennis racket I',65.00);
insert into PRODUCT values (100861, 'ace tennis racket II',58.00);
insert into PRODUCT values (100870, 'ace tennis balls-3 pack',15.80);
insert into PRODUCT values (100871, 'ace tennis balls-6 pack',10.00);
insert into PORDUCT values (100890, 'ace tennis net',74.00);

Select * from product;