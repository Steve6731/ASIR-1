-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-11-22 11:52:01 CET
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE administrador (
    nss VARCHAR2(16 BYTE) NOT NULL
)
LOGGING;

ALTER TABLE administrador ADD CONSTRAINT administrador_pk PRIMARY KEY ( nss );

CREATE TABLE autor (
    cod_autor   NUMBER NOT NULL,
    nombre      VARCHAR2(64 BYTE) NOT NULL,
    apellido_1  VARCHAR2(64 BYTE) NOT NULL,
    apellido_2  VARCHAR2(64 BYTE),
    fechanace   DATE NOT NULL,
    fechamuerte DATE
)
LOGGING;

ALTER TABLE autor ADD CONSTRAINT autor_pk PRIMARY KEY ( cod_autor );

CREATE TABLE autor_libro (
    autor NUMBER NOT NULL,
    libro NUMBER(13) NOT NULL
)
LOGGING;

ALTER TABLE autor_libro ADD CONSTRAINT autor_libro_pk PRIMARY KEY ( autor,
                                                                    libro );

CREATE TABLE colegio (
    nombre    VARCHAR2(64 BYTE) NOT NULL,
    cod_socio VARCHAR2(10 BYTE) NOT NULL,
    endereza  VARCHAR2(128 BYTE)
)
LOGGING;

ALTER TABLE colegio ADD CONSTRAINT colegio_pk PRIMARY KEY ( nombre );

ALTER TABLE colegio ADD CONSTRAINT colegio__un UNIQUE ( cod_socio );

CREATE TABLE direcctor (
    antiguardade VARCHAR2(32 BYTE) NOT NULL,
    nss          VARCHAR2(16 BYTE) NOT NULL
)
LOGGING;

ALTER TABLE direcctor ADD CONSTRAINT direcctor_pk PRIMARY KEY ( nss );

CREATE TABLE libro (
    isbn      NUMBER(13) NOT NULL,
    nome      VARCHAR2(64 BYTE) NOT NULL,
    cod_tipo  NUMBER,
    cod_autor NUMBER NOT NULL
)
LOGGING;

ALTER TABLE libro ADD CONSTRAINT libro_pk PRIMARY KEY ( isbn );

CREATE TABLE libro_exemplares (
    cod_exemplar NUMBER NOT NULL,
    isbn         NUMBER(13) NOT NULL
)
LOGGING;

ALTER TABLE libro_exemplares ADD CONSTRAINT libro_exemplares_pk PRIMARY KEY ( isbn,
                                                                              cod_exemplar );

CREATE TABLE lista_lib_prestamos (
    isbn         NUMBER(13) NOT NULL,
    cod_exemplar NUMBER NOT NULL,
    socio        VARCHAR2(10 BYTE) NOT NULL,
    fecha_inicia DATE NOT NULL
)
LOGGING;

ALTER TABLE lista_lib_prestamos
    ADD CONSTRAINT lista_lib_prestamos_pk PRIMARY KEY ( isbn,
                                                        cod_exemplar,
                                                        socio,
                                                        fecha_inicia );

CREATE TABLE personal (
    dni       VARCHAR2(12 BYTE) NOT NULL,
    cod_socio VARCHAR2(10 BYTE) NOT NULL,
    nombre    VARCHAR2(32 BYTE) NOT NULL
)
LOGGING;

ALTER TABLE personal ADD CONSTRAINT personal_pk PRIMARY KEY ( dni );

ALTER TABLE personal ADD CONSTRAINT personal__un UNIQUE ( cod_socio );

CREATE TABLE prestamos (
    nss          VARCHAR2(16 BYTE),
    socio        VARCHAR2(10 BYTE) NOT NULL,
    fecha_inicia DATE NOT NULL,
    fechai_fin   DATE,
    duracion     VARCHAR2(32 BYTE) NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX prestamos__idx ON
    prestamos (
        nss
    ASC );

ALTER TABLE prestamos ADD CONSTRAINT prestamos_pk PRIMARY KEY ( socio,
                                                                fecha_inicia );

CREATE TABLE socio (
    cod_socio VARCHAR2(10 BYTE) NOT NULL,
    nombre    VARCHAR2(64 BYTE) NOT NULL
)
LOGGING;

ALTER TABLE socio ADD CONSTRAINT socio_pk PRIMARY KEY ( cod_socio );

CREATE TABLE tipo_libro (
    cod_tipo NUMBER NOT NULL,
    nombre   VARCHAR2(64 BYTE) NOT NULL
)
LOGGING;

ALTER TABLE tipo_libro ADD CONSTRAINT tipo_libro_pk PRIMARY KEY ( cod_tipo );

CREATE TABLE trabajador (
    nss    VARCHAR2(16 BYTE) NOT NULL,
    nombre VARCHAR2(64 BYTE) NOT NULL
)
LOGGING;

ALTER TABLE trabajador ADD CONSTRAINT trabajador_pk PRIMARY KEY ( nss );

ALTER TABLE administrador
    ADD CONSTRAINT administrador_trabajador_fk FOREIGN KEY ( nss )
        REFERENCES trabajador ( nss )
    NOT DEFERRABLE;

ALTER TABLE colegio
    ADD CONSTRAINT colegio_socio_fk FOREIGN KEY ( cod_socio )
        REFERENCES socio ( cod_socio )
    NOT DEFERRABLE;

ALTER TABLE direcctor
    ADD CONSTRAINT direcctor_trabajador_fk FOREIGN KEY ( nss )
        REFERENCES trabajador ( nss )
    NOT DEFERRABLE;

ALTER TABLE libro_exemplares
    ADD CONSTRAINT libro_exemplares_libro_fk FOREIGN KEY ( isbn )
        REFERENCES libro ( isbn )
    NOT DEFERRABLE;

ALTER TABLE libro
    ADD CONSTRAINT libro_tipo_libro_fk FOREIGN KEY ( cod_tipo )
        REFERENCES tipo_libro ( cod_tipo )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE lista_lib_prestamos
    ADD CONSTRAINT lista_lib_prestamos_libro_exemplares_fk FOREIGN KEY ( isbn,
                                                                         cod_exemplar )
        REFERENCES libro_exemplares ( isbn,
                                      cod_exemplar )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE lista_lib_prestamos
    ADD CONSTRAINT lista_lib_prestamos_prestamos_fk FOREIGN KEY ( socio,
                                                                  fecha_inicia )
        REFERENCES prestamos ( socio,
                               fecha_inicia )
    NOT DEFERRABLE;

ALTER TABLE personal
    ADD CONSTRAINT personal_socio_fk FOREIGN KEY ( cod_socio )
        REFERENCES socio ( cod_socio )
    NOT DEFERRABLE;

ALTER TABLE prestamos
    ADD CONSTRAINT prestamos_administrador_fk FOREIGN KEY ( nss )
        REFERENCES administrador ( nss )
    NOT DEFERRABLE;

ALTER TABLE prestamos
    ADD CONSTRAINT prestamos_socio_fk FOREIGN KEY ( socio )
        REFERENCES socio ( cod_socio )
    NOT DEFERRABLE;

ALTER TABLE autor_libro
    ADD CONSTRAINT table_11_autor_fk FOREIGN KEY ( autor )
        REFERENCES autor ( cod_autor )
    NOT DEFERRABLE;

ALTER TABLE autor_libro
    ADD CONSTRAINT table_11_libro_fk FOREIGN KEY ( libro )
        REFERENCES libro ( isbn )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             1
-- ALTER TABLE                             27
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
-- ERRORS                                   3
-- WARNINGS                                 0
