create view top_guide as
select r.guideid, e.lname, e.hiredate, count(r.guideid) "total count" from employee e, reservation r
where e.empid = r.guideid
group by r.guideid, e.lname, e.hiredate
having count(r.guideid) >10;
select * from top_guide;

Select distinct g.guestid, concat(fname,' ',lname) as "Name" from guest g, reservation r
where g.guestid = r.guestid
and r.guideid in
(select guideid from top_guide) order by g.guestid

Select g.guestid as GuestID, g.fname + ' ' + g.lname as GuestName, r.resid as ReservationID, rdate as ReservationDate, a.description as Activity
From reservation r, activity a, guest g
Where r.actid = a.actid
and g.guestid = r.guestid and year(r.rdate) = 2021 Order by rdate
Set statistics time off

