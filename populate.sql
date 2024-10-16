use corridas;

INSERT INTO pais (codigo, nome)
VALUES 
('BEL', 'Bélgica'),
('BRA', 'Brasil'),
('ENG', 'Inglaterra'),
('ESP', 'Espanha'),
('POR', 'Portugal'),
('GER', 'Alemanha'),
('ITA', 'Itália'),
('FRA', 'França'),
('MEX', 'México'),
('RSA', 'África do Sul'),
('USA', 'Estados Unidos'),
('AGO','Angola'),
('PER', 'Peru'),
('CHL', 'Chile'),
('ARG', 'Argentina'),
('COL', 'Colômbia'),
('JPN', 'Japão'),
('KOR', 'Coreia do Sul'),
('AUS', 'Austrália'),
('CAN', 'Canadá');

INSERT INTO estadio (nome,capacidade,localizacao,country_code)
values  ('OLYMPIC',100000,'Belgica','BEL'),
		('Maracanã', 78838, 'Rio de Janeiro', 'BRA'),
		('Wembley', 90000, 'Londres', 'ENG'),
		('Camp Nou', 99354, 'Barcelona', 'ESP'),
		('Estádio da Luz', 64642, 'Lisboa', 'POR'),
		('Allianz Arena', 75000, 'Munique', 'GER'),
		('San Siro', 80018, 'Milão', 'ITA'),
		('Santiago Bernabéu', 81044, 'Madrid', 'ESP'),
		('Old Trafford', 74879, 'Manchester', 'ENG'),
		('Signal Iduna Park', 81365, 'Dortmund', 'GER'),
		('Parc des Princes', 47929, 'Paris', 'FRA'),
		('Estádio Azteca', 87523, 'Cidade do México', 'MEX'),
		('FNB Stadium', 94736, 'Johannesburgo', 'RSA'),
		('Olympiastadion', 74000, 'Berlim', 'GER'),
		('Stadio Olimpico', 70634, 'Roma', 'ITA'),
		('MetLife Stadium', 82500, 'East Rutherford', 'USA'),
        ('Estádio José Alvalade', 50000, 'Lisboa', 'POR'),
		('Estádio do Dragão', 50828, 'Porto', 'POR'),
		('Estadio Monumental', 80000, 'Lima', 'PER'),
		('Estadio Nacional', 50000, 'Santiago', 'CHL');
		

CALL sp_adicionarParticipante('Ana', 'Rita', '2004-01-24', 'F', 'AGO');
CALL sp_adicionarParticipante('Maria', 'Silva', '1995-05-15', 'F', 'BRA');
CALL sp_adicionarParticipante('Joana', 'Pereira', '1988-12-11', 'F', 'POR');
CALL sp_adicionarParticipante('Luana', 'Santos', '2001-03-09', 'F', 'ESP');
CALL sp_adicionarParticipante('Vanessa', 'Costa', '1999-07-23', 'F', 'FRA');
CALL sp_adicionarParticipante('Ruth', 'Vemba', '2000-02-14', 'F', 'AGO');
CALL sp_adicionarParticipante('Ines', 'Pinto', '2002-11-05', 'F', 'POR');
CALL sp_adicionarParticipante('Clara', 'Oliveira', '1997-06-28', 'F', 'BRA');
CALL sp_adicionarParticipante('Mariana', 'Mendes', '1993-04-20', 'F', 'ESP');
CALL sp_adicionarParticipante('Beatriz', 'Moreira', '1985-10-30', 'F', 'POR');
CALL sp_adicionarParticipante('Isabela', 'Fernandes', '2003-09-12', 'F', 'BRA');
CALL sp_adicionarParticipante('Juliana', 'Araujo', '1992-01-17', 'F', 'POR');
CALL sp_adicionarParticipante('Patricia', 'Sousa', '1998-08-08', 'F', 'ESP');
CALL sp_adicionarParticipante('Sandra', 'Freitas', '1991-07-07', 'F', 'FRA');
CALL sp_adicionarParticipante('Catarina', 'Martins', '1994-03-25', 'F', 'POR');
CALL sp_adicionarParticipante('Larissa', 'Gomes', '1996-12-29', 'F', 'BRA');
CALL sp_adicionarParticipante('Natalia', 'Reis', '1989-11-10', 'F', 'ESP');
CALL sp_adicionarParticipante('Gabriela', 'Barbosa', '2000-04-04', 'F', 'POR');
CALL sp_adicionarParticipante('Renata', 'Cardoso', '1986-05-21', 'F', 'BRA');
CALL sp_adicionarParticipante('Tatiana', 'Alves', '1990-06-18', 'F', 'POR');

CALL sp_adicionarParticipante('Pedro', 'Costa', '1995-01-02', 'M', 'AGO');
CALL sp_adicionarParticipante('Joao', 'Silva', '1990-03-14', 'M', 'BRA');
CALL sp_adicionarParticipante('Miguel', 'Pereira', '1988-05-23', 'M', 'POR');
CALL sp_adicionarParticipante('Carlos', 'Santos', '1999-02-20', 'M', 'ESP');
CALL sp_adicionarParticipante('Ricardo', 'Ferreira', '1996-07-15', 'M', 'FRA');
CALL sp_adicionarParticipante('Manuel', 'Vemba', '2002-09-09', 'M', 'AGO');
CALL sp_adicionarParticipante('Rafael', 'Pinto', '1993-12-12', 'M', 'POR');
CALL sp_adicionarParticipante('Antonio', 'Oliveira', '1997-11-22', 'M', 'BRA');
CALL sp_adicionarParticipante('Bruno', 'Mendes', '1991-04-19', 'M', 'ESP');
CALL sp_adicionarParticipante('Gustavo', 'Moreira', '1989-10-11', 'M', 'POR');
CALL sp_adicionarParticipante('Henrique', 'Fernandes', '1994-01-27', 'M', 'BRA');
CALL sp_adicionarParticipante('Leonardo', 'Araujo', '1998-05-08', 'M', 'POR');
CALL sp_adicionarParticipante('Marcos', 'Sousa', '1985-07-29', 'M', 'ESP');
CALL sp_adicionarParticipante('Eduardo', 'Freitas', '1992-09-17', 'M', 'FRA');
CALL sp_adicionarParticipante('Tiago', 'Martins', '1991-02-04', 'M', 'POR');
CALL sp_adicionarParticipante('Andre', 'Gomes', '2000-06-18', 'M', 'BRA');
CALL sp_adicionarParticipante('Felipe', 'Reis', '1993-03-05', 'M', 'ESP');
CALL sp_adicionarParticipante('Vitor', 'Barbosa', '1990-08-21', 'M', 'POR');
CALL sp_adicionarParticipante('Rodrigo', 'Cardoso', '1987-11-11', 'M', 'BRA');
CALL sp_adicionarParticipante('Daniel', 'Alves', '2001-12-25', 'M', 'POR');


CALL sp_criar_prova('2024-07-17', '12:00:00', 1, 'M');
CALL sp_criar_prova('2024-07-18', '13:00:00', 2, 'F');
CALL sp_criar_prova('2024-04-07', '14:00:00', 3, 'M');
CALL sp_criar_prova('2024-01-30', '12:00:00', 4, 'F');
CALL sp_criar_prova('2023-07-01', '20:00:00', 5, 'M');
CALL sp_criar_prova('2022-02-27', '10:00:00', 6, 'F');
CALL sp_criar_prova('2019-09-20', '11:00:00', 7, 'M');
CALL sp_criar_prova('2024-08-05', '12:30:00', 8, 'F');
CALL sp_criar_prova('2024-07-17', '13:30:00', 9, 'M');
CALL sp_criar_prova('2024-07-17', '18:30:00', 10, 'F');
CALL sp_criar_prova('2024-07-17', '10:00:00', 11, 'M');
CALL sp_criar_prova('2024-07-17', '20:00:00', 12, 'F');
CALL sp_criar_prova('2024-07-17', '15:30:00', 13, 'M');
CALL sp_criar_prova('2024-07-17', '18:50:00', 14, 'F');
CALL sp_criar_prova('2024-07-17', '19:00:00', 15, 'M');
CALL sp_criar_prova('2024-07-17', '21:30:00', 16, 'F');
CALL sp_criar_prova('2024-07-17', '22:00:00', 17, 'M');
CALL sp_criar_prova('2024-07-17', '09:00:00', 18, 'F');
CALL sp_criar_prova('2024-07-17', '16:00:00', 19, 'M');
CALL sp_criar_prova('2024-07-17', '14:00:00', 20, 'F');

call sp_registar_resultado(2,1,'2024-07-18',7);
call sp_registar_resultado(2,2,'2024-07-18',8);
call sp_registar_resultado(2,3,'2024-07-18',6);
call sp_registar_resultado(2,4,'2024-07-18',5);
call sp_registar_resultado(2,5,'2024-07-18',9.4);
call sp_registar_resultado(2,6,'2024-07-18',3);
call sp_registar_resultado(2,7,'2024-07-18',2);
call sp_registar_resultado(2,8,'2024-07-18',8);
call sp_registar_resultado(2,9,'2024-07-18',8.7);
call sp_registar_resultado(2,10,'2024-07-18',9.1);
call sp_registar_resultado(1,21,'2024-07-17',10);
call sp_registar_resultado(1,22,'2024-07-17',5.5);
call sp_registar_resultado(1,23,'2024-07-17',6.4);
call sp_registar_resultado(1,24,'2024-07-17',7.5);
call sp_registar_resultado(1,25,'2024-07-17',5);
call sp_registar_resultado(1,26,'2024-07-17',9);
call sp_registar_resultado(1,27,'2024-07-17',9.9);
call sp_registar_resultado(1,28,'2024-07-17',3);
call sp_registar_resultado(1,29,'2024-07-17',0);
call sp_registar_resultado(1,30,'2024-07-17',5.9);



    

