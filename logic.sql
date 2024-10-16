use corridas;

DELIMITER //

CREATE PROCEDURE sp_adicionarParticipante(
    IN firstname VARCHAR(20),
    IN lastname VARCHAR(20),
    IN dataN DATE,
    IN sex CHAR(1),
    IN country VARCHAR(3)
)
BEGIN
    INSERT INTO player (first_name, last_name, data_nascimento, sexo, country_code)
    VALUES (firstname, lastname, dataN, sex, country);
END //

DELIMITER ;

INSERT INTO pais (codigo, nome)
VALUES ('AOE', 'Angola');



call sp_adicionarParticipante('Eduardo','Vemba','2004-01-24','M','AOE');


select * from pais where nome like 'Angola';

select * from player;
