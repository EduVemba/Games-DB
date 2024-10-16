use corridas;

call sp_adicionarParticipante('Eduardo','Vemba','2004-01-24','C','AGO');

select * from error_log;

call sp_clonar_prova(30);

select * from error_log;