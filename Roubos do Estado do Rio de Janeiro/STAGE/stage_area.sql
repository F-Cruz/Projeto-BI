
CREATE SCHEMA st;
--- Criando stage
CREATE TABLE st.stage_area(
	ID  SERIAL PRIMARY KEY, fmun_cod integer, fmun varchar(50),
	vano int, mes int, mes_ano varchar(10),
	regiao int, roubo_comercio int,roubo_residencia int,
	roubo_veiculo int, roubo_carga int, roubo_transeunte int,
	roubo_celular int, total_roubos int 

);
--- Populando a stage
INSERT INTO st.stage_area (fmun_cod , fmun ,
	vano , mes , mes_ano,
	regiao , roubo_comercio ,roubo_residencia ,
	roubo_veiculo , roubo_carga , roubo_transeunte ,
	roubo_celular , total_roubos)

SELECT * 
FROM stage_dados;

SELECT * FROM st.stage_area;

--- Criando Tempo