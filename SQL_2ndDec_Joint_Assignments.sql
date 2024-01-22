create database SQL_Joins_Assignments
use SQL_Joins_Assignments
create table Event (EventID int,Duration int,StatusCode varchar(max),ReasonCode varchar(max))
create table Status (StatusCode varchar(max),Name varchar(max))
create table Ready_Reason (ReasonCode varchar(max),Name varchar(max))
create table Delay_Reason (ReasonCode varchar(max),Name varchar(max))
create table Spare_Reason (ReasonCode varchar(max),Name varchar(max))
create table Down_Reason (ReasonCode varchar(max),Name varchar(max))
alter table down_Reason drop column ReasonName
sp_rename 'Status.statusNam','StatusName'

select*from Event
select*from Status
select*from Ready_Reason
select*from Delay_Reason
select*from Spare_Reason
select*from Down_Reason

select E.EventID,E.Duration,S.StatusName as 'Status Name' from Event as E
left join Status as S
on E.statuscode=S.statuscode

select Reasoncode,ReasonName from Ready_Reason
union all
select ReasonCode,ReasonName from Delay_Reason
union all
select ReasonCode,ReasonName from Spare_Reason
union all
select ReasonCode,ReasonName from Down_Reason

select E.EventID,E.Duration,SR.ReasonName from Event as E
inner join
(select 'R' as StatusCode,Ready_Reason.ReasonCode,Ready_Reason.reasonName from Ready_Reason
union all
select 'D1',ReasonCode,reasonName from Delay_Reason
union all
select 'S',ReasonCode,reasonName from Spare_Reason
union all
select 'D2',ReasonCode,reasonName from Down_Reason) as SR
on E.statuscode=SR.statuscode and E.ReasonCode=SR.ReasonCode


select E.EventID,E.Duration,S.StatusName as 'Status Name',SR.ReasonName as 'Reason Name' from Event as E
inner join Status as S
on E.StatusCode=S.statuscode
inner join
(select 'R' as StatusCode,ReasonCode,ReasonName from Ready_Reason
union
select 'D1',ReasonCode,ReasonName from Delay_Reason
union
select 'S',ReasonCode,ReasonName from Spare_Reason
union
select 'D2',ReasonCode,ReasonName from Down_Reason) as SR
on E.StatusCode=SR.StatusCode and E.ReasonCode=SR.ReasonCode