create database SQL_Joins_Assignments
use SQL_Joins_Assignments
create table Event (EventID int,Duration int,StatusCode varchar(max),ReasonCode varchar(max))
create table Status (StatusCode varchar(max),Name varchar(max))
create table Ready_Reason (ReasonCode varchar(max),Name varchar(max))
create table Delay_Reason (ReasonCode varchar(max),Name varchar(max))
create table Spare_Reason (ReasonCode varchar(max),Name varchar(max))
create table Down_Reason (ReasonCode varchar(max),Name varchar(max))
alter table down_Reason drop column ReasonName

select*from Event
select*from Status
select*from Ready_Reason
select*from Delay_Reason
select*from Spare_Reason
select*from Down_Reason

select E.EventID,E.Duration,S.StatusName as 'Status Name' from Event as E
left join Status as S
on E.statuscode=S.statuscode

select E.EventID as 'Event ID',E.Duration,ST.StatusName as 'Status Name',ST.ReasonName as 'Reason name' from Event as E
left join
(select S.StatusCode,S.StatusName,SR.ReasonCode,SR.ReasonName from Status as S
left join
(select 'R' as StatusCode,Reasoncode,ReasonName from Ready_Reason
union all
select 'D1',ReasonCode,ReasonName from Delay_Reason
union all
select 'S',ReasonCode,ReasonName from Spare_Reason
union all
select 'D2',ReasonCode,ReasonName from Down_Reason) as SR
on S.StatusCode=SR.StatusCode) as ST
on E.Statuscode=ST.Statuscode and E.ReasonCode=ST.ReasonCode