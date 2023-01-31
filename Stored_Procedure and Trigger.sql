CREATE TABLE INVOICE 
InvoiceID      Int            identity(100,1) Primary Key,
InvoiceDate    date           default getdate(),
BookID         Int            Not Null,
GuestID        varchar(4)     Not Null,
StartDate      date           Not Null,
CondoFee       decimal(7,2),
ActivityFee    decimal(7,2),
InvoiceTotal   decimal(7,2),
SalesTax       decimal(5,2),
GrandTotal     decimal(7,2),
Foreign key (BookID) REFERENCES BOOKING (BookID)
Foreign Key (GuestID) REFERENCES GUEST (GuestID)
select * from invoice;


select (datediff(week, b.StartDate, b.EndDate) * c.WeeklyFee) AS 'Condofee'
from booking b, guest g, condo condo c 
where b.GuestID = g.GuestID
and b.GuestID = '65'
and StartDate = '2021-08-03'
and b.CondoID = c.CondoID;

select(SUM(r.NumberInParty * a.PPP)) AS 'Activityfee'
from reservation r, activity a, guest g
where a.ActID = r.ActID
and r.RDate > '2021-08-03'
and r.GuestID = g.GuestID
and g.GuestID = '65';

create procedure CreateInvoice
(@GuestID varchar(4), @Startdate date)
AS
BEGIN TRY
      BEGIN TRANSACTION
      INSERT INTO Invoice(BookID, GuestID, StartDate, CondoFee, ActivityFee)
      values
      ((select BookID from booking where GuestID = @GuestID and StartDate = @Startdate),
      @GuestID,
      @Startdate,
      (select(datediff(week, b.StartDate, b.EndDate)*c.WeeklyFee)
      from booking b, guest g, condo 
      where b.GuestID = g.GuestID
      and b.GuestID = @GuestID
      and StartDate = '2021-08-03')
      and b.CondoID = c.CondoID),
      (select (SUM(r.NumberInParty * a.PPP)))
      from reservation r, activity a, guest g 
      where a.ActID = r.ActID
      and r.RDate > r.ActID
      and r.GuestID = g.GuestID
      and g.GuestID = '65')
      )
      COMMIT TRANSACTION
END TRY
BEGIN CATCH
      ROLLBACK
END CATCH


create trigger Calculate_Invoice_Total
on invoice
after insert 
as 
update invoice 
       set invoicetotal = condofee + activityfee 
       where activityfee = (selcet activityfee from inserted)
update invoice
       set salestax = invoicetotal * 0.09
update invoice 
       set grandtotal = invoicetotal + salestax;


Exec Create_Invoice '65', '2021-08-03';
select * from invoice;
