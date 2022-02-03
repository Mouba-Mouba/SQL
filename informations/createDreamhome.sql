drop table Branch;

create table Branch
(branchno char(5) not null,
street varchar(35),
city varchar(10),
postcode varchar(10),
primary key(branchno)
);

insert into Branch
values('B005','22 Deer Rd','London','SW1 4EH');
insert into Branch
values('B007','16 Argyll St','Aberdeen','AB2 3SU');
insert into Branch
values('B003','163 Main St','Glasgow','G11 9QX');
insert into Branch
values('B004','32 Manse Rd','Bristol','BS99 1NZ');
insert into Branch
values('B002','56 Clover Dr','London','NW10 6EU');

drop table Staff;

create table Staff
(staffno char(5) not null,
fname varchar(10),
lname varchar(10),
position varchar(10),
sex char(1),
dob date,
salary smallint,
branchno char(5),
primary key(staffno)
);

insert into Staff
values('SL21','John','White','Manager','M','1-Oct-45',30000,'B005'); 
insert into Staff
values('SG37','Ann','Beech','Assistant','F','10-Nov-60',12000,'B003');
insert into Staff
values('SG14','David','Ford','Supervisor','M','24-Mar-58',18000,'B003');
insert into Staff
values('SA9','Mary','Howe','Assistant','F','19-Feb-70',9000,'B007');
insert into Staff
values('SG5','Susan','Brand','Manager','F','3-Jun-40',24000,'B003');
insert into Staff
values('SL41','Julie','Lee','Assistant','F','13-Jun-65',9000,'B005');

drop table PropertyForRent;

create table PropertyForRent 
(propertyno char(5) not null, 
street varchar(35), 
city varchar(10),
postcode varchar(10),
type varchar(10),
rooms smallint,
rent int,
ownerno char(5),
staffno char(5),
branchno char(5),
primary key(propertyno)
);

insert into PropertyForRent
values('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007'); 
insert into PropertyForRent
values('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005'); 
insert into PropertyForRent
values('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350,'CO40',NULL,'B003'); 
insert into PropertyForRent
values('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003'); 
insert into PropertyForRent
values('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003'); 
insert into PropertyForRent
values('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003'); 

drop table Client;

create table Client
(clientno char(5) not null,
fname varchar(10),
lname varchar(10),
telno char(15),
preftype varchar(10),
maxrent int,
primary key(clientno)
);

insert into Client
values('CR76','John','Kay','0171-774-5632','Flat',425); 
insert into Client
values('CR56','Aline','Steward','0141-848-1825','Flat',350);
insert into Client
values('CR74','Mike','Ritchie','01475-392178','House',750); 
insert into Client
values('CR62','Mary','Tregear','01224-196720','Flat',600);

drop table PrivateOwner;

create table PrivateOwner 
(ownerno char(5) not null,
fname varchar(10),
lname varchar(10),
address varchar(50),
telno char(15),
primary key(ownerno)
);

insert into PrivateOwner
values('CO46','Joe','Keogh','2 Fergus Dr. Aberdeen AB2 7SX','01224-861212');
insert into PrivateOwner
values('CO87','Carol','Farrel','6 Achray St. Glasgow G32 9DX','0141-357-7419');
insert into PrivateOwner
values('CO40','Tina','Murphy','63 Well St. Glasgow G42','0141-943-1728');
insert into PrivateOwner
values('CO93','Tony','Shaw','12 Park Pl. Glasgow G4 0QR','0141-225-7025');

drop table Viewing;

create table Viewing
(clientno char(5) not null,
propertyno char(5) not null,
viewdate date,
comments varchar(15),
primary key(clientno,propertyno)
);

insert into Viewing
values('CR56','PA14','24-May-95','too small');
insert into Viewing
values('CR76','PG4','20-Apr-95','too remote');
insert into Viewing
values('CR56','PG4','26-May-95',NULL);
insert into Viewing
values('CR62','PA14','14-May-95','no dining room');
insert into Viewing
values('CR56','PG36','28-Apr-95',NULL);

drop table Registration;

create table Registration
(clientNo char(5) not null,
branchNo char(5) not null,
staffNo char(5),
dateJoined date,
primary key(clientNo,branchNo)
);

insert into Registration
values('CR76','B005','SL41','2-Jan-01');
insert into Registration
values('CR56','B003','SG37','11-Apr-00');
insert into Registration
values('CR74','B003','SG37','16-Nov-99');
insert into Registration
values('CR62','B007','SA9','7-Mar-00');
