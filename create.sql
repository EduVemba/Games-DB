CREATE DATABASE IF NOT EXISTS  Corridas;
use corridas;

create table pais(
     codigo varchar(3) primary key not null,
     nome varchar(30) not null 
);

create table atleta(
    id int auto_increment primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    data_nascimento date not null,
    sexo char(1)  not null,
    country_code varchar(3),
    foreign key (country_code) references pais(codigo)
);

create table estadio(
   id int auto_increment primary key,
   nome varchar(30)not null unique,
   capacidade int not null,
   localizacao varchar(30) not null,
   country_code  varchar(3)not null,
   foreign key (country_code) references pais(codigo)
);

create table jogo(
     race_id int auto_increment primary key,
     data date not null,
     time time not null,
     estadio_id int,
     foreign key (estadio_id) references estadio(id)
);

create table participacao_corrida(
     data date,
     pontos float,
     posicao int,
     id int,
     race_id int,
     foreign key (id) references atleta(id),
     foreign key (race_id) references jogo(race_id)
);

Create table error_log(
    error_message varchar(50)
);

