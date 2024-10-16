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
      if sex not in('F','M') then
			SIGNAL SQLSTATE '45000'
	       SET MESSAGE_TEXT = 'Sexo inválido, use M de masculino ou F de feminino.';
		end if;
        
    INSERT INTO atleta (first_name, last_name, data_nascimento, sexo, country_code)
    VALUES (firstname, lastname, dataN, sex, country);
    
    
END //

DELIMITER ;


DELIMITER // 

CREATE PROCEDURE sp_criar_prova(
      in p_data date,
      in p_time time,
      in p_estadio_id int,
      in p_sexo varchar(1)
) 
   BEGIN
      declare v_race_id int;
      
       if p_sexo not in ('M','F') then
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Sexo inválido, use M de masculino ou F de feminino.';
		end if;
        insert into jogo(data,time,estadio_id)
        values (p_data,p_time,p_estadio_id);
        
        set v_race_id = last_insert_id();
        
        create temporary table temp_players as
        select id  from atleta where sexo = p_sexo;
        
        insert into participacao_corrida(id,race_id,data)
        select id as player_ID,v_race_id,p_data
        from temp_players;
        
        drop temporary table if exists temp_players;
        
	
  END //
DELIMITER ;

DELIMITER //
create procedure sp_clonar_prova(in prova_id int)
    begin
      declare new_race_id int;
       
       if not exists(select race_id from jogo where race_id = prova_id)then
         signal sqlstate '46000'
         set message_text = 'Prova não encontrada';
	   end if;
       INSERT INTO jogo (data, time, estadio_id)
       SELECT data, time, estadio_id
       FROM jogo
       WHERE race_id = prova_id;
       
       set new_race_id = last_insert_id();
       
       INSERT INTO participacao_corrida (data, pontos, posicao, id, race_id)
		SELECT pc.data, pc.pontos, pc.posicao, pc.id, new_race_id
		FROM participacao_corrida pc
		WHERE pc.race_id = prova_id;
        
		SELECT new_race_id AS 'corrida clonada';
         
    end //
    DELIMITER ;
    
    
    DELIMITER //
    create procedure sp_registar_resultado(
           IN id_prova int,
           in id_participante int,
           in c_data date,
           in p_pontos float
         --  in p_posicao int
    )
    begin
        declare p_race_id int;
        declare nova_posicao int;
        
        
        if p_pontos < 0 or p_pontos > 10 then
        signal sqlstate '47000'
        set message_text = 'Os pontos devem estar entre 0 a 10';
        end if;
        
        select race_id into p_race_id
        from participacao_corrida
        where race_id = id_prova and id = id_participante;
        
        if found_rows() > 0 then
        set nova_posicao = (
             select count(*) + 1 
             from participacao_corrida pc
             where pc.race_id = id_prova and pc.pontos > p_pontos
         );
         
        update participacao_corrida
        set pontos = p_pontos, posicao = nova_posicao, data = c_data
        where race_id = id_prova and id = id_participante;
        end if;
        
    end //
    DELIMITER ;
    
    
    DELIMITER // 
    
    create function calcular_idade(data_nascimento date)
    returns int
    deterministic
    begin
        declare idade int;
        set idade = timestampdiff(year,data_nascimento,curdate());
        return idade;
    end // 
    DELIMITER ;
    
    DELIMITER //
CREATE FUNCTION full_name(p_first_name VARCHAR(50), p_last_name VARCHAR(50))
RETURNS VARCHAR(101)
deterministic
BEGIN
    RETURN CONCAT(p_first_name, ' ', p_last_name);
END //
DELIMITER ;
    

delimiter //
create trigger sexo_autorizado
  after insert on atleta
  for each row
Begin
    declare msg varchar(50);
    
      if new.sexo not in('M','F') then
      set msg = 'Tentou usar um sexo incorreto.';
      insert into error_log (error_message) values (msg);
      SIGNAL SQLSTATE '45000'
	  SET MESSAGE_TEXT = 'Sexo inválido, use M de masculino ou F de feminino.';
      end if;
end //
  delimiter ;
  
delimiter //
    create trigger jogo_clonado
      after insert on jogo
      for each row
      begin
       declare msg varchar(30);
       if not exists(select 1 from jogo where race_id = new .race_id) then
       set msg = 'ID da prova não encontrado';
       insert into error_log (error_message) values (msg);
       signal sqlstate '49000'
       set message_text = 'ID da prova não encontrado.';
       end if;
      end // 
delimiter ;
      
  create view estadio_categoria as
        select 
          id,nome,capacidade,
		case 
		when capacidade >= 100000 then 'Mega estadio'
        when capacidade >= 50000 then 'Estadio Grande'
        when capacidade >= 20000 then 'Estadio Médio'
        end as categoria
	from estadio;
    
    create view rank_atleta as
    select p.id,p.first_name,p.last_name,avg(pc.pontos) as avg_pontos,
      case 
      when  avg(pontos) >= 8 then 'Rank Mundial'
      when avg(pontos) >= 6 then 'Rank Nacional'
      when avg(pontos) >= 4 then 'Rank Capital'
      else 'Rank Regional'
      end as TOP
      from participacao_corrida pc
      join atleta p
      on pc.id = p.id
      group by p.id, p.first_name, p.last_name;
      
      create view rank_pais as
      select p.country_code,avg(pc.pontos) as media_pontos,
        if(avg(pc.pontos) >= 8, 'TOP10',
	    if(avg(pc.pontos) >= 6, 'TOP50',
        if(avg(pc.pontos) >= 4, 'TOP100','Neutro')))
        as TOP
        from  participacao_corrida pc
        join atleta p 
        on pc.id = p.id
        group by p.country_code;
      
      create view experiencia_jogador as
      select first_name,last_name,data_nascimento,
      if 
       ( data_nascimento < '2000-01-01' , 'Senior','Junior') as experiencia
       from atleta;
       