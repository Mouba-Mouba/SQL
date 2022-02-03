drop table Top_Management;

create table Top_Management
(Name varchar (25) not null,
ManagerId char (3),
primary key (ManagerId));

insert into Top_Management
values('Dr. Top Manager', 'M01');
insert into Top_Management
values ('Hashim', 'M17');
insert into Top_Management
values ('Karim', 'M16');
insert into Top_Management
values ('harim', 'M15');
insert into Top_Management
values ('lokram', 'M14');


drop table Organaizer;

create table Organizer
(
OrganizerId char(5) not null,
OrgType varchar(10),
NoOfEvents integer,
ManagerId char(3),
primary key (OrganizerId), foreign key (ManagerId) references Top_Management (ManagerId)
);

insert into Organizer
values('OR001', 'External', 3,'M01');
insert into Organizer
values('OR999', 'Internal', 1,'M01');
insert into Organizer
values('OR002', 'External', 2,'M01');
insert into Organizer
values('OR115', 'Internal', 3,'M14');
insert into Organizer
values('OR005', 'External', 3,'M16');
insert into Organizer
values('OR200', 'Internal', 1,'M17');

drop table Event;

create table Event
(EventId char(6) not null,
EventType varchar (10),
ManagerId char(3),
EventDate date not null,
StartTime date,
FinishTime date,
ApprovalStatus char (1),
EventStatus varchar (10),
primary key (EventId),
foreign key (ManagerId) references Top_Management (ManagerId));

insert into Event
values('EV5025', 'Workshop','M14', '03-jan-19', to_date('03-jan-19 09:00', 'dd-mon-yyyy hh:mi'), to_date('03-jan-19 11:00', 'dd-mon-yyyy hh:mi'),'Y', 'Done');
insert into Event
values('EV5015', 'Seminer','M15', '13-dec-19', to_date('13-jan-19 10:00', 'dd-mon-yyyy hh:mi'), to_date('14-jan-19 11:00', 'dd-mon-yyyy hh:mi'),'Y', 'Done');
insert into Event
values('EV3025', 'Drama','M17', '03-jan-20', to_date('03-jan-20 09:00', 'dd-mon-yyyy hh:mi'), to_date('04-jan-19 09:00', 'dd-mon-yyyy hh:mi'),'N', 'Upcoming');
insert into Event
values('EV1025', 'Debate','M01', '05-aug-19', to_date('05-aug-19 11:00', 'dd-mon-yyyy hh:mi'), to_date('06-aug-19 12:00', 'dd-mon-yyyy hh:mi'),'Y', 'Done');
insert into Event
values('EV5125', 'Culture','M16', '18-may-19', to_date('18-may-19 09:00', 'dd-mon-yyyy hh:mi'), to_date('18-may-19 11:30', 'dd-mon-yyyy hh:mi'),'Y', 'Done');



drop table Facilities;

create table Facilities 
(
FacilityCode char(4) not null,
FacilityType varchar(20),
NoOfSeat integer,
Status char(7),
EventId char (6),
BlockDate date,
primary key (FacilityCode),
foreign key (EventId) references Event(EventId)
);

insert into Facilities
values('F45', 'Lecture theaters', '35', 'Block','EV5025', '20-dec-19');
insert into Facilities
values('F100', 'Lecture Classes', '50', 'open','EV5015', '05-nov-20');
insert into Facilities
values('F99', 'Laboratory', '20', 'open','EV3025', '15-nov-19');
insert into Facilities
values('F79', 'Mini auditiorium', '75', 'open','EV1025', '25-nov-19');
insert into Facilities
values('F23', 'Sports Center', '40', 'open','EV5125', '15-may-19');


drop table Rent;

create table Rent
(RentNo char(6) not null,
OrganizerId char(5) not null,
EventId char(6) not null,
Amount integer,
PaymentStatus char(8),
primary key (RentNo),
foreign key (OrganizerId) references Organizer(OrganizerId),
foreign key (EventId) references Event (EventId));

insert into Rent
values('RN1001', 'OR001','EV5025','5500', 'Done');
insert into Rent
values('RN2001', 'OR999','EV5015','1100', 'Done');
insert into Rent
values('RN3001', 'OR002','EV3025','500', 'Pending');
insert into Rent
values('RN2101', 'OR115','EV1025','2700', 'Pending');
insert into Rent
values('RN2301', 'OR005','EV5125','700', 'Done');


drop table Feedback;

create table Feedback 
(FeedbackNo char (6) not null,
OrganizerId char(5) not null,
FeedbackType varchar (20),
FeedbackDetails varchar(25),
EventId char(6),
FacilityCode char(4) not null,
primary key (FeedbackNo),
foreign key (OrganizerId) references Organizer (OrganizerId),
foreign key (EventId) references Event (EventId),
foreign key (FacilityCode) references Facilities (FacilityCode));

insert into Feedback
values('FB1001', 'OR001','lighting exposure', 'inadequate','EV5025','F45');
insert into Feedback
values('FB2001', 'OR999','Ac', 'Proper','EV5015','F100');
insert into Feedback
values('FB3001', 'OR002','Seating', 'Enough','EV3025','F99');
insert into Feedback
values('FB2201', 'OR115','Seating', 'Insufficient','EV1025','F79');
insert into Feedback
values('FB1101', 'OR005','Temperature', 'Too cold','EV5125','F23');




