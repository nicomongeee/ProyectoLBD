SYS/ORACLE AS SYSDBA

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE TABLESPACE "APPDAT" LOGGING DATAFILE 'C:\desarrollo\PROYECTO_LBD\APPDAT.dbf' SIZE 1024M EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

CREATE TABLESPACE "APPIDX" LOGGING DATAFILE 'C:\desarrollo\PROYECTO_LBD\APPIDX.dbf' SIZE 512M EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

CREATE USER "PROYECTO" PROFILE "DEFAULT" IDENTIFIED BY "APPPWD" DEFAULT TABLESPACE "APPDAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK; 

GRANT CREATE SESSION TO PROYECTO;

CREATE INDEX mi_indice ON mi_tabla(mi_campo) TABLESPACE APPIDX;

GRANT "CONNECT" TO "PROYECTO";
GRANT "RESOURCE" TO "PROYECTO";

GRANT ALTER ANY INDEX TO "PROYECTO";
GRANT ALTER ANY SEQUENCE TO "PROYECTO";
GRANT ALTER ANY TABLE TO "PROYECTO";
GRANT ALTER ANY TRIGGER TO "PROYECTO";
GRANT CREATE ANY INDEX TO "PROYECTO";
GRANT CREATE ANY SEQUENCE TO "PROYECTO";
GRANT CREATE ANY SYNONYM TO "PROYECTO";
GRANT CREATE ANY TABLE TO "PROYECTO";
GRANT CREATE ANY TRIGGER TO "PROYECTO";
GRANT CREATE ANY VIEW TO "PROYECTO";
GRANT CREATE PROCEDURE TO "PROYECTO";
GRANT CREATE PUBLIC SYNONYM TO "PROYECTO";
GRANT CREATE TRIGGER TO "PROYECTO";
GRANT CREATE VIEW TO "PROYECTO";
GRANT DELETE ANY TABLE TO "PROYECTO";
GRANT DROP ANY INDEX TO "PROYECTO";
GRANT DROP ANY SEQUENCE TO "PROYECTO";
GRANT DROP ANY TABLE TO "PROYECTO";
GRANT DROP ANY TRIGGER TO "PROYECTO";
GRANT DROP ANY VIEW TO "PROYECTO";
GRANT INSERT ANY TABLE TO "PROYECTO";
GRANT QUERY REWRITE TO "PROYECTO";
GRANT SELECT ANY TABLE TO "PROYECTO";
GRANT UNLIMITED TABLESPACE TO "PROYECTO";
