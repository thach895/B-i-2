create database customerManager;
use customerManager;

create table Customers(
customerId int primary key,
fullName varchar(100),
email varchar(100),
age int
);

alter table Customers
modify email varchar(255) not null unique,
add constraint chk_age check(age>0);

