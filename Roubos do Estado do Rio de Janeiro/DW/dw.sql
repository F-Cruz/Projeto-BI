CREATE SCHEMA public;

--- Criando as Tabelas do DW

CREATE SEQUENCE public.dimtempo_sk_tempo_seq;

CREATE TABLE public.dimTempo (
                sk_tempo INTEGER NOT NULL DEFAULT nextval('public.dimtempo_sk_tempo_seq'),
                nk_tempo INTEGER NOT NULL,
                mes DATE NOT NULL,
                ano DATE NOT NULL,
                CONSTRAINT sk_tempo PRIMARY KEY (sk_tempo)
);


ALTER SEQUENCE public.dimtempo_sk_tempo_seq OWNED BY public.dimTempo.sk_tempo;

CREATE SEQUENCE public.dimlocalizacao_sk_loc_seq;

CREATE TABLE public.dimLocalizacao (
                sk_loc INTEGER NOT NULL DEFAULT nextval('public.dimlocalizacao_sk_loc_seq'),
                nk_loc INTEGER NOT NULL,
                municipio VARCHAR NOT NULL,
                regiao VARCHAR NOT NULL,
                CONSTRAINT sk_loc PRIMARY KEY (sk_loc)
);


ALTER SEQUENCE public.dimlocalizacao_sk_loc_seq OWNED BY public.dimLocalizacao.sk_loc;

CREATE SEQUENCE public.dimtiporoubo_sk_troubo_seq;

CREATE TABLE public.dimTipoRoubo (
                sk_troubo INTEGER NOT NULL DEFAULT nextval('public.dimtiporoubo_sk_troubo_seq'),
                nk_troubo INTEGER NOT NULL,
                total_roubo INTEGER NOT NULL,
                roubo_comercio INTEGER,
                roubo_residencia INTEGER NOT NULL,
                roubo_veiculo INTEGER NOT NULL,
                roubo_carga INTEGER NOT NULL,
                roubo_transeunte INTEGER NOT NULL,
                roubo_celular INTEGER NOT NULL,
                CONSTRAINT sk_troubo PRIMARY KEY (sk_troubo)
);


ALTER SEQUENCE public.dimtiporoubo_sk_troubo_seq OWNED BY public.dimTipoRoubo.sk_troubo;

CREATE TABLE public.fatoRoubo (
                sk_tempo INTEGER NOT NULL,
                sk_loc INTEGER NOT NULL,
                sk_troubo INTEGER NOT NULL,
                CONSTRAINT sk_fatoroubo PRIMARY KEY (sk_tempo, sk_loc, sk_troubo)
);


ALTER TABLE public.fatoRoubo ADD CONSTRAINT dimtempo_fatoroubo_fk
FOREIGN KEY (sk_tempo)
REFERENCES public.dimTempo (sk_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fatoRoubo ADD CONSTRAINT dimlocalizacao_fatoroubo_fk
FOREIGN KEY (sk_loc)
REFERENCES public.dimLocalizacao (sk_loc)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fatoRoubo ADD CONSTRAINT dimtiporoubo_fatoroubo_fk
FOREIGN KEY (sk_troubo)
REFERENCES public.dimTipoRoubo (sk_troubo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



--- Criando Fato Roubo


SELECT * FROM fatoroubo;

INSERT INTO fatoroubo (sk_tempo,sk_loc, sk_troubo)
SELECT  t.sk_tempo,l.sk_loc, r.sk_troubo
FROM dimlocalizacao l, dimtempo t, dimtiporoubo r
WHERE l.nk_loc = t.nk_tempo and l.nk_loc = r.nk_troubo












