SELECT * FROM pais;

SELECT * FROM estadio;

SELECT * FROM atleta;

SELECT * FROM jogo;

SELECT * FROM participacao_corrida;

SELECT * FROM error_log;

CALL sp_adicionarParticipante('João', 'Silva', '2000-01-01', 'M', 'BRA');
CALL sp_adicionarParticipante('Carlos', 'Pereira', '1995-05-20', 'M', 'POR');
CALL sp_adicionarParticipante('Ana', 'Souza', '1992-08-15', 'F', 'BRA');
CALL sp_adicionarParticipante('Maria', 'Fernandes', '1998-12-25', 'X', 'POR');

CALL sp_criar_prova('2024-07-20', '15:00:00', 1, 'M');
CALL sp_criar_prova('2024-07-21', '16:00:00', 2, 'F');
CALL sp_criar_prova('2024-07-22', '17:00:00', 3, 'M');
CALL sp_criar_prova('2024-07-23', '18:00:00', 4, 'F');

CALL sp_registar_resultado(1, 1, '2024-07-20', 8.5, 1);
CALL sp_registar_resultado(1, 2, '2024-07-20', 7.0, 2);
CALL sp_registar_resultado(2, 3, '2024-07-21', 9.0, 1);
CALL sp_registar_resultado(2, 4, '2024-07-21', 6.5, 2);


CALL sp_clonar_prova(1);
CALL sp_clonar_prova(2);

SELECT * FROM rank_jogador;

SELECT p.first_name, p.last_name, pc.pontos, pc.posicao
FROM atleta p
JOIN participacao_corrida pc ON p.id = pc.id;

SELECT j.data, j.time, j.estadio_id, pc.id, pc.pontos, pc.posicao
FROM jogo j
JOIN participacao_corrida pc ON j.race_id = pc.race_id;


Select
 atleta.first_name,atleta.last_name,pais.nome
from pais
join atleta on atleta.country_code = pais.codigo;

select * from rank_pais;

select * from rank_atleta


