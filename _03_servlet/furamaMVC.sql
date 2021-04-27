drop database if exists furamaMVC;
create database furamaMVC;

use furamaMVC;

drop table if exists position;
create table position (
position_id int primary key auto_increment,
position_name varchar(45)
);

drop table if exists education_degree;
create table education_degree (
education_degree_id int primary key auto_increment,
education_degree_name varchar(45)
);

drop table if exists division;
create table division (
division_id int primary key auto_increment,
division_name varchar(45)
);

drop table if exists `role`;
create table `role`(
role_id int primary key auto_increment,
role_name varchar(255)
);


drop table if exists `user`;
create table `user`(
username varchar(255) primary key,
`password` varchar(255)

);
drop table if exists `user_role`;
create table `user_role`(
role_id int not null,
username varchar(255) not null,
primary key (role_id,role_name),
constraint fk_role
	foreign key (role_id)
    references `role` (role_id),
constraint fk_user
	foreign key (username)
    references `user` (username)
);
drop table if exists employee;
create table employee (
employee_id int primary key auto_increment,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(225),
constraint fk_employee_position
	foreign key (position_id)
    references position (position_id),
constraint fk_employee_education_degree
	foreign key (education_degree_id)
    references education_degree (education_degree_id),
constraint fk_employee_division
	foreign key (division_id)
    references division (division_id),
constraint fk_employee_username
	foreign key (username)
    references `user` (username)

);


drop table if exists attach_service;
create table attach_service (
attach_service_id int primary key auto_increment,
attach_service_name varchar(45),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);

drop table if exists customer_type;
create table customer_type (
customer_type_id int primary key auto_increment,
customer_type_name varchar(45)
);
drop table if exists customer;
create table customer (
customer_id int primary key auto_increment,
customer_type_id int,
customer_name varchar(45),
customer_birthday date,
customer_gender bit(1),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45),
constraint fk_customer_type
	foreign key (customer_type_id)
    references customer_type (customer_type_id)

);

drop table if exists service_type;
create table service_type (
service_type_id int primary key auto_increment,
service_type_name varchar(45)
);
drop table if exists rent_type;
create table rent_type (
rent_type_id int primary key auto_increment,
rent_type_name varchar(45),
rent_type_cost double
);




drop table if exists service;
create table service (
service_id int primary key auto_increment,
service_name varchar(45),
service_area int,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
standard_room varchar(45),
description_orther_convenience varchar(45),
pool_area double,
number_of_floors int,
constraint fk_service_type
	foreign key (service_type_id)
    references service_type (service_type_id),
constraint fk_service_rent_type
	foreign key (rent_type_id)
    references rent_type (rent_type_id)
);


drop table if exists contract;
create table contract (
contract_id int primary key auto_increment,
contract_start_date datetime,
contract_end_date datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id int,
service_id int,
constraint fk_contract_customer
	foreign key (customer_id)
    references customer (customer_id),
constraint fk_contract_employee
	foreign key (employee_id)
    references customer (customer_id),
constraint fk_contract_service
	foreign key (service_id)
    references service (service_id)
);


drop table if exists contract_detail;
create table contract_detail (
contract_detail_id int primary key auto_increment,
contract_id int,
attach_service_id int,
quantity int,
constraint fk_contractdetail_attach_service
	foreign key (attach_service_id)
    references attach_service (attach_service_id)
);









