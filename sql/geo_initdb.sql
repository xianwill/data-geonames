
drop database if exists geo;
drop role if exists geo;
create user geo with password 'geo';
create database geo encoding 'utf8';
grant all privileges on database geo to geo;
