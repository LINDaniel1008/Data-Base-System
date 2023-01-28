select c.condoid, c.bldgNum, b.bookid, b.startdate
from condo c, booking b
where c.condoid = b.condoid
and year(b.startdate) = 2020 and month(b.startdate) = 5


select c.condoid, c.datecleaned, concat(e.fame,'',e.lname) as Housekeeper
from cleaning c, condo, employee e 
where c.condoid = condoid
and c.hikd = e.empid
and condo.bldgnum = 'C'
and c.datecleaned between '08-01-2020' and '08-31-2020';

select g.guideid, e.fname, e.lame, g.cerdate, g.centrenewdate
from guide g, employee e
where g.guided = e.empid and datediff(year, g.CerDate, g.CerRenewDate) > 2;

select r.guide, e.lname, e.hiredate, count(r.resid) as "Reservation per guide"
from employee e, reservation r
where r.guideid = e.empid
group by r.guideid, e.lname, e.hiredate
having count(r.resid) > 8
order by 4 desc;

select g.guestid, g.fname + ' ' + g.lname as 'Guest Name', b.startdate, b.condoid from guest g, booking b
where g.guestid = b.guestid
and b.condoid in (
select condoid
from condo c
where c.bldgnum = 'A' and c.Bdrms = 3)
and year(b.startdate) = '2021'
order by 1,3

select g.guestid, g.fname + ' ' + g.lname as 'Guest Name', b.startdate, b.condoid from guest g, booking b, condo c
where g.guestid = b.guestid
and b.condoid = c.condoid
and c.bldgnum = 'A'
and c.Bdrms = 3
and year(b.startdate) = '2021'
order by 1,3

select datediff (year, birthdate, getdate()) as "Age", Relationship, count (*) as "No of Count" from family
group by datediff(year,birthdate, getdate()), relationship
order by 1, 2;

select distinct g.guestid, g.fname, g.lname, r.resid from guest g
left join reservation r
on g.guestid = r.guestid
where r.resid is null;

select concat(e.fname,' ',e.lname) as 'Employee Name', e.hiredate, concat (m.fname, ' ', m.lname) as 'Manager Name', m.hiredate
from employee e, employee m
where e.mgrnum = m.empid
and e.etype = 'G'

select 'Highest Weekly Fee' as Category, bldgnum as 'Building Number', max(weeklyfee) as "Weekly Fee" from condo
where bldgnum = 'A'
group by bldgnum
union
select 'Lowest Weekly Fee', bldgnum, min(weeklyfee) as "Weekly Fee" from condo
where bldgnum = 'B'
group by bldgnum
Union
select 'Average Weekly Fee', bldgnum, avg(weeklyfee) as "Weekly Fee" from condo
where bldgnum = 'C'
group by bldgnum
order by 2

Select * into New_Condo_C from condo
where BldgNum = 'C';
Update new_Condo_C SET WeeklyFee =
CASE
WHEN bdrms = 3 then weeklyfee*1.10 WHEN bdrms = 2 then weeklyfee*1.08 WHEN bdrms = 1 then weeklyfee*1.05
END
Select * from New_Condo_C;
