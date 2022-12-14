-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2022-11-15 23:38:46 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_fth_email (
    cd_email             NUMBER(5) NOT NULL,
    t_fth_usuario_cd_cpf NUMBER(5) NOT NULL,
    ds_email             VARCHAR2(60) NOT NULL,
    ds_tipo_email        VARCHAR2(20)
);

ALTER TABLE t_fth_email ADD CONSTRAINT t_fth_email_pk PRIMARY KEY ( t_fth_usuario_cd_cpf,
                                                                    cd_email );

CREATE TABLE t_fth_endereco (
    cd_endereco          NUMBER(5) NOT NULL,
    t_fth_usuario_cd_cpf NUMBER(5) NOT NULL,
    ds_tipo_endereco     VARCHAR2(20) NOT NULL,
    ds_tipo_logradouro   VARCHAR2(20) NOT NULL,
    nm_logradouro        VARCHAR2(60) NOT NULL,
    nr_cep               VARCHAR2(10) NOT NULL,
    nr_numero            NUMBER(5) NOT NULL,
    nm_pais              VARCHAR2(60),
    nm_bairro            VARCHAR2(60),
    nm_cidade            VARCHAR2(60),
    ds_complemento       VARCHAR2(60)
);

ALTER TABLE t_fth_endereco ADD CONSTRAINT t_fth_endereco_pk PRIMARY KEY ( cd_endereco,
                                                                          t_fth_usuario_cd_cpf );

CREATE TABLE t_fth_gasto (
    cd_gasto                   NUMBER(5) NOT NULL,
    t_fth_usuario_cd_cpf       NUMBER(5) NOT NULL,
    t_fth_tp_gasto_cd_tp_gasto NUMBER(5) NOT NULL,
    ds_gasto                   VARCHAR2(60) NOT NULL,
    vl_gasto                   NUMBER(7, 2) NOT NULL,
    dt_gasto                   DATE NOT NULL
);

ALTER TABLE t_fth_gasto ADD CONSTRAINT t_fth_gasto_pk PRIMARY KEY ( cd_gasto );

CREATE TABLE t_fth_invest (
    cd_invest                    NUMBER(5) NOT NULL,
    t_fth_usuario_cd_cpf         NUMBER(5) NOT NULL,
    t_fth_tp_invest_cd_tp_invest NUMBER(5) NOT NULL,
    ds_invest                    VARCHAR2(60) NOT NULL,
    vl_invest                    NUMBER(7, 2) NOT NULL,
    dt_invest                    DATE NOT NULL
);

ALTER TABLE t_fth_invest ADD CONSTRAINT t_fth_invest_pk PRIMARY KEY ( cd_invest );

CREATE TABLE t_fth_recebimento (
    cd_recebimento                         NUMBER(5) NOT NULL,
    t_fth_usuario_cd_cpf                   NUMBER(5) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    t_fth_tp_recebimento_cd_tp_recebimento NUMBER(5) NOT NULL,
    t_fth_invest_cd_invest                 NUMBER(5),
    ds_recebimento                         VARCHAR2(60) NOT NULL,
    vl_recebimento                         NUMBER(7, 2) NOT NULL,
    dt_recebimento                         DATE NOT NULL
);

ALTER TABLE t_fth_recebimento ADD CONSTRAINT t_fth_recebimento_pk PRIMARY KEY ( cd_recebimento );

CREATE TABLE t_fth_telefone (
    nr_ddi               NUMBER(3) NOT NULL,
    nr_ddd               NUMBER(3) NOT NULL,
    nr_telefone          VARCHAR2(20) NOT NULL,
    t_fth_usuario_cd_cpf NUMBER(5) NOT NULL,
    ds_tipo_telefone     VARCHAR2(20) NOT NULL
);

ALTER TABLE t_fth_telefone
    ADD CONSTRAINT t_fth_telefone_pk PRIMARY KEY ( nr_ddi,
                                                   nr_ddd,
                                                   t_fth_usuario_cd_cpf,
                                                   nr_telefone );

CREATE TABLE t_fth_tp_gasto (
    cd_tp_gasto NUMBER(5) NOT NULL,
    ds_tp_gasto VARCHAR2(20) NOT NULL
);

ALTER TABLE t_fth_tp_gasto ADD CONSTRAINT t_fth_tp_gasto_pk PRIMARY KEY ( cd_tp_gasto );

CREATE TABLE t_fth_tp_invest (
    cd_tp_invest NUMBER(5) NOT NULL,
    ds_tp_invest VARCHAR2(20) NOT NULL
);

ALTER TABLE t_fth_tp_invest ADD CONSTRAINT t_fth_tp_invest_pk PRIMARY KEY ( cd_tp_invest );

CREATE TABLE t_fth_tp_recebimento (
    cd_tp_recebimento NUMBER(5) NOT NULL,
    ds_tp_recebimento VARCHAR2(20) NOT NULL
);

ALTER TABLE t_fth_tp_recebimento ADD CONSTRAINT t_fth_tp_recebimento_pk PRIMARY KEY ( cd_tp_recebimento );

CREATE TABLE t_fth_usuario (
    cd_cpf        NUMBER(5) NOT NULL,
    nm_usuario    VARCHAR2(60) NOT NULL,
    dt_nascimento DATE NOT NULL,
    ds_senha      VARCHAR2(8) NOT NULL,
    ds_sexo       VARCHAR2(20)
);

ALTER TABLE t_fth_usuario ADD CONSTRAINT t_fth_usuario_pk PRIMARY KEY ( cd_cpf );

ALTER TABLE t_fth_email
    ADD CONSTRAINT t_fth_email_t_fth_usuario_fk FOREIGN KEY ( t_fth_usuario_cd_cpf )
        REFERENCES t_fth_usuario ( cd_cpf );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_fth_endereco
    ADD CONSTRAINT t_fth_endereco_t_fth_usuario_fk FOREIGN KEY ( t_fth_usuario_cd_cpf )
        REFERENCES t_fth_usuario ( cd_cpf );

ALTER TABLE t_fth_gasto
    ADD CONSTRAINT t_fth_gasto_t_fth_tp_gasto_fk FOREIGN KEY ( t_fth_tp_gasto_cd_tp_gasto )
        REFERENCES t_fth_tp_gasto ( cd_tp_gasto );

ALTER TABLE t_fth_gasto
    ADD CONSTRAINT t_fth_gasto_t_fth_usuario_fk FOREIGN KEY ( t_fth_usuario_cd_cpf )
        REFERENCES t_fth_usuario ( cd_cpf );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_fth_invest
    ADD CONSTRAINT t_fth_invest_t_fth_tp_invest_fk FOREIGN KEY ( t_fth_tp_invest_cd_tp_invest )
        REFERENCES t_fth_tp_invest ( cd_tp_invest );

ALTER TABLE t_fth_invest
    ADD CONSTRAINT t_fth_invest_t_fth_usuario_fk FOREIGN KEY ( t_fth_usuario_cd_cpf )
        REFERENCES t_fth_usuario ( cd_cpf );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_fth_recebimento
    ADD CONSTRAINT t_fth_recebimento_t_fth_invest_fk FOREIGN KEY ( t_fth_invest_cd_invest )
        REFERENCES t_fth_invest ( cd_invest );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_fth_recebimento
    ADD CONSTRAINT t_fth_recebimento_t_fth_tp_recebimento_fk FOREIGN KEY ( t_fth_tp_recebimento_cd_tp_recebimento )
        REFERENCES t_fth_tp_recebimento ( cd_tp_recebimento );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_fth_recebimento
    ADD CONSTRAINT t_fth_recebimento_t_fth_usuario_fk FOREIGN KEY ( t_fth_usuario_cd_cpf )
        REFERENCES t_fth_usuario ( cd_cpf );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_fth_telefone
    ADD CONSTRAINT t_fth_telefone_t_fth_usuario_fk FOREIGN KEY ( t_fth_usuario_cd_cpf )
        REFERENCES t_fth_usuario ( cd_cpf );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   7
-- WARNINGS                                 0
