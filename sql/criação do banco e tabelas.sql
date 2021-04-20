create database livraria;

use livraria;

create table editora(

id int auto_increment,
nome varchar(60) not null,
cidade varchar(45) not null,

primary key(id)

);

create table livro(

id int not null auto_increment,
titulo varchar(120) not null,
autor varchar(60) not null,
ano int not null,
preco double,
foto varchar(45) not null,
idEditora  int not null,

primary key(id),
foreign key(idEditora) references editora(id)
);

create table usuario(

id int auto_increment,
nome varchar(45) not null,
senha varchar(32) not null,

primary key(id)

);