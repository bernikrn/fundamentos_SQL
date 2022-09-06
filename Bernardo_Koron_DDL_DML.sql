-- Create schema
create schema bernardo_koron authorization epxaxmlk;

---- Create tables ----
-- brand_groups table
create table bernardo_koron.brand_groups(
		id_group varchar(10) not null, --PK
		name varchar(128) not null,
		description varchar (256) null
);
alter table bernardo_koron.brand_groups
add constraint brand_groups_PK primary key(id_group);

-- brands table
create table bernardo_koron.brands(
		id_brand varchar(10) not null, --PK
		id_group varchar(10) not null, --FK
		name varchar(128) not null,
		description varchar (256) null
);
alter table bernardo_koron.brands
add constraint brands_PK primary key(id_brand);

alter table bernardo_koron.brands
add constraint brands_id_group_FK foreign key(id_group) references bernardo_koron.brand_groups(id_group);

-- models table
create table bernardo_koron.models(
		id_model varchar(10) not null, --PK
		id_brand varchar(10) not null, --FK
		name varchar(128) not null,
		description varchar (256) null
);
alter table bernardo_koron.models
add constraint models_PK primary key(id_model);

alter table bernardo_koron.models
add constraint models_id_brand_FK foreign key(id_brand) references bernardo_koron.brands(id_brand);

-- colors table
create table bernardo_koron.colors(
		id_color varchar(10) not null, --PK
		name varchar(128) not null,
		description varchar (256) null
);
alter table bernardo_koron.colors
add constraint colors_PK primary key(id_color);

-- insurances table
create table bernardo_koron.insurances(
		id_insurance varchar(10) not null, --PK
		name varchar(128) not null,
		description varchar (256) null
);
alter table bernardo_koron.insurances
add constraint insurances_PK primary key(id_insurance);

-- currencies table
create table bernardo_koron.currencies(
		id_currency varchar(10) not null, --PK
		name varchar(128) not null,
		description varchar (256) null
);
alter table bernardo_koron.currencies
add constraint currencies_PK primary key(id_currency);


-- cars table
create table bernardo_koron.cars(
		id_car varchar(10) not null, --PK
		id_model varchar(10) not null, --FK
		id_color varchar(10) not null, --FK
		id_insurance varchar(10) not null, --FK
		total_km integer not null,
		policy_n varchar(30) not null,
		dt_buy date not null,
		dt_termination date not null default '4000-01-01',
		plate_number varchar(20) not null,
		description varchar (256) null
);
alter table bernardo_koron.cars
add constraint cars_PK primary key(id_car);

alter table bernardo_koron.cars
add constraint cars_id_model_FK foreign key(id_model) references bernardo_koron.models(id_model);

alter table bernardo_koron.cars
add constraint cars_id_color_FK foreign key(id_color) references bernardo_koron.colors(id_color);

alter table bernardo_koron.cars
add constraint cars_id_insurance_FK foreign key(id_insurance) references bernardo_koron.insurances(id_insurance);

-- maintenances table
create table bernardo_koron.maintenances(
	id_car varchar(10) not null, --PK, FK
	dt_maintenance date not null, --PK 
	km_maintenance integer not null,
	cost_maintenance numeric(10,2) not null,
	id_currency varchar(10) not null, --FK
	description varchar (256) null
);

alter table bernardo_koron.maintenances
add constraint maintenances_PK primary key(id_car, dt_maintenance);

alter table bernardo_koron.maintenances
add constraint maintenances_id_car_FK foreign key(id_car) references bernardo_koron.cars(id_car);

alter table bernardo_koron.maintenances
add constraint maintenances_id_currency_FK foreign key(id_currency) references bernardo_koron.currencies(id_currency);




---- Data entry ----
-- brand_groups
insert into bernardo_koron.brand_groups(id_group, name)
values ('1','Volkswagen Group');
insert into bernardo_koron.brand_groups(id_group, name)
values ('2','Renault Group');
insert into bernardo_koron.brand_groups(id_group, name)
values ('3','Nissan Group');

-- brands
insert into bernardo_koron.brands(id_brand, id_group, name)
values ('1','1','Volkswagen');
insert into bernardo_koron.brands(id_brand, id_group, name)
values ('2','1','Seat');
insert into bernardo_koron.brands(id_brand, id_group, name)
values ('3','1','Porsche');
insert into bernardo_koron.brands(id_brand, id_group, name)
values ('4','1','Audi');

insert into bernardo_koron.brands(id_brand, id_group, name)
values ('5','2','Renault');
insert into bernardo_koron.brands(id_brand, id_group, name)
values ('6','2','Lada');
insert into bernardo_koron.brands(id_brand, id_group, name)
values ('7','2','Dacia');

insert into bernardo_koron.brands(id_brand, id_group, name)
values ('8','3','Nissan');
insert into bernardo_koron.brands(id_brand, id_group, name)
values ('9','3','Mitsubishi');

-- models
insert into bernardo_koron.models(id_model, id_brand, name)
values ('1','1','Golf');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('2','1','Polo');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('3','1','Passat');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('4','2','Ibiza');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('5','2','Arona');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('6','3','911');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('7','3','Panamera');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('8','4','A3');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('9','4','A4');

insert into bernardo_koron.models(id_model, id_brand, name)
values ('10','5','Clio');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('11','5','Megane');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('12','6','Niva');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('13','7','Duster');

insert into bernardo_koron.models(id_model, id_brand, name)
values ('14','8','Micra');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('15','8','Leaf');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('16','9','Eclipse');
insert into bernardo_koron.models(id_model, id_brand, name)
values ('17','9','L200');

-- colors
insert into bernardo_koron.colors(id_color, name)
values ('1','black');
insert into bernardo_koron.colors(id_color, name)
values ('2','red');
insert into bernardo_koron.colors(id_color, name)
values ('3','grey');
insert into bernardo_koron.colors(id_color, name)
values ('4','white');

-- insurances
insert into bernardo_koron.insurances(id_insurance, name)
values ('1','Mapfre');
insert into bernardo_koron.insurances(id_insurance, name)
values ('2','MMT');
insert into bernardo_koron.insurances(id_insurance, name)
values ('3','AXA');

-- currencies
insert into bernardo_koron.currencies(id_currency, name)
values ('1','Euro');
insert into bernardo_koron.currencies(id_currency, name)
values ('2','Dolar');
insert into bernardo_koron.currencies(id_currency, name)
values ('3','Libra');

--cars
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('1','1','1','1',2000,'P9514798','2022-02-01','4787GHE');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('2','2','1','2',20000,'P8424','2021-01-01','7457ERT');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, dt_termination, plate_number)
values ('3','3','2','2',150000,'P12345','2010-02-01', '2021-02-01','7523ODS');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('4','4','4','1',32000,'P23458','2018-04-01','7452ASD');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('5','5','4','3',29000,'P755577','2020-02-01','1545FDS');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('6','6','4','3',72000,'P9822288','2020-11-01','1222TRE');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('7','7','3','1',62000,'P5698','2011-02-01','7789DWS');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('8','8','2','2',52000,'P008898','2014-12-01','8765GHT');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, dt_termination, plate_number)
values ('9','9','1','1',320000,'P9505898','2012-02-01', '2020-02-01','4343TRT');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, dt_termination, plate_number)
values ('10','10','3','3',320000,'P715008','2008-02-01', '2019-02-01','9980IUY');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, dt_termination, plate_number)
values ('11','11','1','3',92000,'P85598','2007-02-01', '2021-02-01','5432RTY');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('12','12','1','3',12000,'P7878087','2015-02-01','5646YUM');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('13','13','4','3',12000,'P00118','2009-02-01','4321TYN');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('14','14','2','1',52000,'P1112598','2001-02-01','9805TYU');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('15','15','2','1',2000,'P9778098','2021-02-01','8745GHJ');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, dt_termination, plate_number)
values ('16','16','1','1',772000,'P8898','2000-02-01', '2021-02-01','0012XCX');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('17','17','4','1',82000,'P780638','2004-09-01','7896QAS');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('18','1','1','1',442000,'P9333','2007-04-01','7768HGN');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, dt_termination, plate_number)
values ('19','1','3','2',482000,'P978338','2017-12-01', '2020-02-01','7677TMN');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('20','2','2','2',302000,'P97851','2019-02-01','1209GHP');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('21','2','2','2',1000,'P7798','2020-06-01','1123CFV');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('22','1','1','2',5000,'P83398','2022-02-01','5848HGZ');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('23','10','1','1',5000,'P553398','2022-02-01','1948BBN');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('24','10','2','1',9000,'P95598','2022-08-01','7840HHJ');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('25','11','2','1',72000,'P951098','2021-02-01','9987DDF');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('26','11','3','1',72000,'P9008','2022-02-01','6678IPL');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('27','1','1','1',32000,'P9578698','2016-02-01','1235GCV');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('28','8','3','1',75000,'P1011298','2015-07-01','5672NES');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('29','9','1','1',48000,'P17998','2014-02-01','5404YUW');
insert into bernardo_koron.cars(id_car, id_model, id_color, id_insurance, total_km, policy_n, dt_buy, plate_number)
values ('30','8','4','1',45000,'P17448','2013-02-01','4457PPO');

-- maintenances
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('1','2022-03-03', 1000, 678.60 ,'1');
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('3','2015-06-03', 90000, 1263.87 ,'1');
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('3','2020-06-03', 140000, 900.12 ,'1');
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('9','2014-07-09', 160000, 802.10 ,'1');
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('9','2019-07-09', 300000, 1601.10 ,'1');
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('26','2019-07-09', 40000, 804.50 ,'1');
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('26','2020-07-09', 60000, 300.50 ,'1');
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('28','2019-07-09', 40000, 600.00 ,'2');
insert into bernardo_koron.maintenances(id_car, dt_maintenance, km_maintenance, cost_maintenance, id_currency)
values('20','2020-07-09', 150000, 1000.00 ,'1');

















