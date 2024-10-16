CREATE DATABASE IF NOT EXISTS  Corridas;
use corridas;


create table pais(
     codigo varchar(3) primary key not null,
     nome varchar(30) not null,
     rank_ int
);

create table player(
    id int auto_increment primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    data_nascimento date not null,
    sexo char(1)  not null,
    rank_ int,
    country_code varchar(3),
    foreign key (country_code) references pais(codigo)
);

create table estadio(
   nome varchar(30)not null,
   capacidade int not null,
   localizacao varchar(30) not null,
   country_code  varchar(3)not null,
   foreign key (country_code) references pais(codigo)
);

create table jogo(
     race_id int auto_increment primary key,
     data date not null,
     score float not null,
     time time not null
);

create table participates(
     data date,
     id int,
     race_id int,
     foreign key (id) references player(id),
     foreign key (race_id) references jogo(race_id)
);

