create table pais (
    cod_pais number not null,
    nombre varchar(32) not null
);

alter table pais 
    add CONSTRAINT pais_pk primary key (cod_pais);

create table autor (
    cod_autor number not null,
    fechaNace date not null,
    paisNace paisNace number not null
);

alter table autor
    add CONSTRAINT autor_pk PRIMARY KEY (cod_autor)
    add CONSTRAINT autor_fk foreign key (paisNace) 
        REFERENCES pais (cod_pais);

create table obra(
    cod_obra number not null,
    descripcion varchar2(256) not null,
);

alter table obra
    add CONSTRAINT obra_pk PRIMARY KEY (cod_obra);
    
create table autor_obra(
    cod_autor number not null,
    cod_obra number not null,
    fecha date not null
);

alter table autor_obra
    add CONSTRAINT autor_obra_pk PRIMARY KEY (cod_autor,cod_obra)
    add CONSTRAINT autor_obra_fk FOREIGN KEY (cod_autor) 
        REFERENCE autor (cod_autor)
    add CONSTRAINT obra_autor_fk FOREIGN KEY (cod_obra) 
        REFERENCE obra (cod_obra);

create table pintura (
    cod_obra number not null,
    tipo varchar2(64) not null,
    estilo varchar2(64) not null
);

alter table pintura
    add CONSTRAINT pintura_pk PRIMARY KEY (cod_obra)
    add CONSTRAINT pintura_fk FOREIGN KEY (cod_obra)
        REFERENCE obra (cod_obra);

create table escultura (
    cod_obra number not null,
    materia varchar2(64) not null,
    estilo varchar2(64) not null
);

alter table escultura
    add CONSTRAINT escultura_pk PRIMARY KEY (cod_obra)
    add CONSTRAINT escultura_fk FOREIGN KEY (cod_obra)
        REFERENCES obra (cod_obra);

create table tomas (
    cod_tomas number not null,
    museo_Origen varchar2(128),
    fechaToma date not null,
    fechaRevolver date not null,    
);

alter table tomas
    add CONSTRAINT tomas_pk PRIMARY KEY (cod_tomas);

create table obra_tomas (
    cod_obra number not null,
    cod_tomas number not null
);

alter table obra_tomas
    add CONSTRAINT obra_tomas_pk PRIMARY KEY (cod_obra,cod_tomas)
    add CONSTRAINT obra_tomas_fk FOREIGN KEY (cod_obra)
        REFERENCES obra (cod_obra)
    add CONSTRAINT tomas_obra_fk FOREIGN KEY (cod_tomas)
        REFERENCES tomas (cod_tomas);

create table exposiciones(
    cod_exp NUMBER not null,
    fecha date not null
);

alter table exposiciones
    add CONSTRAINT exposiciones_pk PRIMARY KEY (cod_exp)
    add CONSTRAINT exposiciones_u unique (fecha);

craete table obra_exposicion (
    cod_obra number not null,
    cod_exp number not null
);

alter table obra_exposicion
    add CONSTRAINT obra_exposicion_pk PRIMARY KEY (cod_obra,cod_exp)
    add CONSTRAINT obra_exposicion_fk FOREIGN KEY (cod_obra)
        REFERENCES obra (cod_obra)
    add CONSTRAINT exposicion_obra_fk FOREIGN KEY (cod_exp)
        REFERENCES exposiciones (cod_exp);