--------------------------------------------------------
--  File created - Wednesday-February-27-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CLIENTES
--------------------------------------------------------

  CREATE TABLE "AUTOS"."CLIENTES" 
   (	"DNI" VARCHAR2(50 CHAR), 
	"NOMBRE" VARCHAR2(50 CHAR), 
	"APELLIDOS" VARCHAR2(50 CHAR), 
	"CIUDAD" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COCHES
--------------------------------------------------------

  CREATE TABLE "AUTOS"."COCHES" 
   (	"CODCOCHE" NUMBER, 
	"CODMARCA" NUMBER, 
	"NOMBRE" VARCHAR2(50 CHAR), 
	"MODELO" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CONCESIONARIOS
--------------------------------------------------------

  CREATE TABLE "AUTOS"."CONCESIONARIOS" 
   (	"CODCONC" NUMBER, 
	"NOMBRE" VARCHAR2(50 CHAR), 
	"CIUDAD" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DISTRIBUCION
--------------------------------------------------------

  CREATE TABLE "AUTOS"."DISTRIBUCION" 
   (	"CODCONC" NUMBER, 
	"CODCOCHE" NUMBER, 
	"CANTIDAD" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MARCAS
--------------------------------------------------------

  CREATE TABLE "AUTOS"."MARCAS" 
   (	"CODMARCA" NUMBER, 
	"NOMBRE" VARCHAR2(50 CHAR), 
	"CIUDAD" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VENTAS
--------------------------------------------------------

  CREATE TABLE "AUTOS"."VENTAS" 
   (	"CODVENTA" NUMBER, 
	"CODCONC" NUMBER, 
	"DNI" VARCHAR2(50 CHAR), 
	"CODCOCHE" NUMBER, 
	"COLOR" VARCHAR2(50 CHAR), 
	"FECHA" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into AUTOS.CLIENTES
SET DEFINE OFF;
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000007','LUIS','GARCIA','MADRID');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000008','ANTONIO','LOPEZ','VALENCIA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000009','JUAN','MARTIN','MADRID');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000011','MARIA','GARCIA','MADRID');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000015','JAVIER','GONZALEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000016','ANA','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000106','NANA','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00001006','NAN','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00010006','NANE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00100006','NNE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('01000006','NONE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('10000006','NNOE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('20000006','NNAE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('02000006','NNmE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00200006','NNn','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00020006','NNrnE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00002006','NAdNE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000206','NAsE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000026','NAaE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000036','NApE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000306','NAoE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00003006','NAiE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00030006','NAuE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00300006','NAyE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('03000006','NAtE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('30000006','NArE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('40000006','NAeE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('04000006','NAwE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00400006','NAqE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00040006','NAaE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00004006','NAsE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000406','NAdE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000046','NAfE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000446','NAgE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00004446','NAhE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00044446','NAjE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00444446','NAkE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('04444446','NAlE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('44444446','NA�E','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('50000006','NAmE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('05000006','NAnE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00500006','NAbE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00050006','NAvE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00005006','NAcE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000506','NAxE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000056','NAzE','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000066','NA1E','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00000606','NA2E','LOPEZ','BARCELONA');
Insert into AUTOS.CLIENTES (DNI,NOMBRE,APELLIDOS,CIUDAD) values ('00066006','NA3EE','LOPEZ','BARCELONA');
REM INSERTING into AUTOS.COCHES
SET DEFINE OFF;
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('1','1','IBIZA','GLX');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('2','1','IBIZA','GTI');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('3','1','IBIZA','GTD');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('4','1','TOLEDO','GTD');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('5','1','CORDOBA','GTI');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('6','2','MEGANE','1.6');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('7','2','MEGANE','GTI');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('8','2','LAGUNA','GTD');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('9','2','LAGUNA','TD');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('10','3','ZX','16V');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('11','3','ZX','TD');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('12','3','XANTIA','GTD');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('13','4','A4','1.8');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('14','4','A4','2.8');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('15','5','ASTRA','CARAVAN');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('16','5','ASTRA','GTI');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('17','5','CORSA','1.4');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('18','6','300','316i');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('19','6','500','525i');
Insert into AUTOS.COCHES (CODCOCHE,CODMARCA,NOMBRE,MODELO) values ('20','6','700','750i');
REM INSERTING into AUTOS.CONCESIONARIOS
SET DEFINE OFF;
Insert into AUTOS.CONCESIONARIOS (CODCONC,NOMBRE,CIUDAD) values ('1','ACAR','MADRID');
Insert into AUTOS.CONCESIONARIOS (CODCONC,NOMBRE,CIUDAD) values ('2','BCAR','MADRID');
Insert into AUTOS.CONCESIONARIOS (CODCONC,NOMBRE,CIUDAD) values ('3','CCAR','BARCELONA');
Insert into AUTOS.CONCESIONARIOS (CODCONC,NOMBRE,CIUDAD) values ('4','DCAR','VALENCIA');
Insert into AUTOS.CONCESIONARIOS (CODCONC,NOMBRE,CIUDAD) values ('5','ECAR','BILBAO');
REM INSERTING into AUTOS.DISTRIBUCION
SET DEFINE OFF;
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('1','1','3');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('1','5','7');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('1','6','7');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('2','6','5');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('2','8','10');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('2','9','10');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('3','10','5');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('3','11','3');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('3','12','5');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('4','13','10');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('4','14','5');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('5','15','10');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('5','16','20');
Insert into AUTOS.DISTRIBUCION (CODCONC,CODCOCHE,CANTIDAD) values ('5','17','8');
REM INSERTING into AUTOS.MARCAS
SET DEFINE OFF;
Insert into AUTOS.MARCAS (CODMARCA,NOMBRE,CIUDAD) values ('1','SEAT','MADRID');
Insert into AUTOS.MARCAS (CODMARCA,NOMBRE,CIUDAD) values ('2','RENAULT','BARCELONA');
Insert into AUTOS.MARCAS (CODMARCA,NOMBRE,CIUDAD) values ('3','CITROEN','VALENCIA');
Insert into AUTOS.MARCAS (CODMARCA,NOMBRE,CIUDAD) values ('4','AUDI','MADRID');
Insert into AUTOS.MARCAS (CODMARCA,NOMBRE,CIUDAD) values ('5','OPEL','BILBAO');
Insert into AUTOS.MARCAS (CODMARCA,NOMBRE,CIUDAD) values ('6','BMW','BARCELONA');
REM INSERTING into AUTOS.VENTAS
SET DEFINE OFF;
Insert into AUTOS.VENTAS (CODVENTA,CODCONC,DNI,CODCOCHE,COLOR,FECHA) values ('1','1','00000011','1','BLANCO',to_date('05/03/00','DD/MM/RR'));
Insert into AUTOS.VENTAS (CODVENTA,CODCONC,DNI,CODCOCHE,COLOR,FECHA) values ('2','1','00000008','5','ROJO',to_date('12/03/00','DD/MM/RR'));
Insert into AUTOS.VENTAS (CODVENTA,CODCONC,DNI,CODCOCHE,COLOR,FECHA) values ('3','2','00000009','8','BLANCO',to_date('15/04/00','DD/MM/RR'));
Insert into AUTOS.VENTAS (CODVENTA,CODCONC,DNI,CODCOCHE,COLOR,FECHA) values ('4','2','00000011','6','ROJO',to_date('25/05/00','DD/MM/RR'));
Insert into AUTOS.VENTAS (CODVENTA,CODCONC,DNI,CODCOCHE,COLOR,FECHA) values ('5','3','00000007','11','ROJO',to_date('03/06/00','DD/MM/RR'));
Insert into AUTOS.VENTAS (CODVENTA,CODCONC,DNI,CODCOCHE,COLOR,FECHA) values ('6','4','00000015','14','VERDE',to_date('18/06/00','DD/MM/RR'));
--------------------------------------------------------
--  DDL for Index CLIENTES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTOS"."CLIENTES_PK" ON "AUTOS"."CLIENTES" ("DNI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COCHES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTOS"."COCHES_PK" ON "AUTOS"."COCHES" ("CODCOCHE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CONCESIONARIOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTOS"."CONCESIONARIOS_PK" ON "AUTOS"."CONCESIONARIOS" ("CODCONC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DISTRIBUCION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTOS"."DISTRIBUCION_PK" ON "AUTOS"."DISTRIBUCION" ("CODCONC", "CODCOCHE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MARCAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTOS"."MARCAS_PK" ON "AUTOS"."MARCAS" ("CODMARCA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VENTAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTOS"."VENTAS_PK" ON "AUTOS"."VENTAS" ("CODVENTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CLIENTES
--------------------------------------------------------

  ALTER TABLE "AUTOS"."CLIENTES" ADD CONSTRAINT "CLIENTES_PK" PRIMARY KEY ("DNI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COCHES
--------------------------------------------------------

  ALTER TABLE "AUTOS"."COCHES" ADD CONSTRAINT "COCHES_PK" PRIMARY KEY ("CODCOCHE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CONCESIONARIOS
--------------------------------------------------------

  ALTER TABLE "AUTOS"."CONCESIONARIOS" ADD CONSTRAINT "CONCESIONARIOS_PK" PRIMARY KEY ("CODCONC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DISTRIBUCION
--------------------------------------------------------

  ALTER TABLE "AUTOS"."DISTRIBUCION" ADD CONSTRAINT "DISTRIBUCION_PK" PRIMARY KEY ("CODCONC", "CODCOCHE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MARCAS
--------------------------------------------------------

  ALTER TABLE "AUTOS"."MARCAS" ADD CONSTRAINT "MARCAS_PK" PRIMARY KEY ("CODMARCA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VENTAS
--------------------------------------------------------

  ALTER TABLE "AUTOS"."VENTAS" ADD CONSTRAINT "VENTAS_PK" PRIMARY KEY ("CODVENTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COCHES
--------------------------------------------------------

  ALTER TABLE "AUTOS"."COCHES" ADD CONSTRAINT "COCHES_FK" FOREIGN KEY ("CODMARCA")
	  REFERENCES "AUTOS"."MARCAS" ("CODMARCA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DISTRIBUCION
--------------------------------------------------------

  ALTER TABLE "AUTOS"."DISTRIBUCION" ADD CONSTRAINT "DISTRIBUCION2_FK" FOREIGN KEY ("CODCONC")
	  REFERENCES "AUTOS"."CONCESIONARIOS" ("CODCONC") ENABLE;
  ALTER TABLE "AUTOS"."DISTRIBUCION" ADD CONSTRAINT "DISTRIBUCION_FK" FOREIGN KEY ("CODCOCHE")
	  REFERENCES "AUTOS"."COCHES" ("CODCOCHE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VENTAS
--------------------------------------------------------

  ALTER TABLE "AUTOS"."VENTAS" ADD CONSTRAINT "VENTAS2_FK" FOREIGN KEY ("CODCOCHE")
	  REFERENCES "AUTOS"."COCHES" ("CODCOCHE") ENABLE;
  ALTER TABLE "AUTOS"."VENTAS" ADD CONSTRAINT "VENTAS3_FK" FOREIGN KEY ("CODCONC")
	  REFERENCES "AUTOS"."CONCESIONARIOS" ("CODCONC") ENABLE;
  ALTER TABLE "AUTOS"."VENTAS" ADD CONSTRAINT "VENTAS_FK" FOREIGN KEY ("DNI")
	  REFERENCES "AUTOS"."CLIENTES" ("DNI") ENABLE;
