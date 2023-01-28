select * from Condo;
select * info New_Condo_A
from New_Condo_A
where BldgNum = 'A';
select * from New_Condo_A;

select * from New_Condo_A;
update New_Condo_A
	set WeeklyFee = (WeeklyFee * 1.15), SqrtFt = (SqrFt + 200)
		where CondoID = '5' OR CondoID = '10' OR CondoID = '15';
select * from New_Condo_A
where CondoID = '5' OR CondoID = '10' OR CondoID = '15';

select * from New_Condo_A;
delete from New_Condo_A
	where WeeklyFee < 900 AND Baths = 1;

select * from Condo;
select CondoID, BldgNum, WeeklyFee AS 'Expensive Building A'
	from Condo
		where BldgNum = 'A' AND WeeklyFee > 800
order by WeeklyFee DESC, CondoID ASC;

select * from reservation;
select * from reservation
	where ActID like 'HB%' AND NOT(GuideID = 'RH01' OR GuideID = 'MR01') AND (RDate between '2020-1-1' AND '2020-12-31');

select * from employee;
select MAX(datediff(year, Hiredate, GETDATE())) AS 'Most Years',
	   MIN(datediff(year, Hiredate, GETDATE())) AS 'Least Years',
	   AVG(datediff(year, Hiredate, GETDATE())) AS 'Average Years',
from employee;

select * from activity;
select
cast(AVG(PPP) AS Decimal(5,2)) AS 'Avg PPP in Decimal',
cast(ROUND(AVG(PPP),0) AS int) AS 'Avg PPP in Integer'
from activity;

select GuestID, year(StartDate) AS 'Year', count(GuestID) AS 'No of visits'
from booking
group by GuestID, year(StartDate)
having count(GuestID) > 5
order by 'No of visits' Desc;