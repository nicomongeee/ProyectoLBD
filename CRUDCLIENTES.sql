SELECT * FROM CLIENTES;

---CRUD CLIENTES---

CREATE TABLE clientes (
    id               NUMBER NOT NULL,
    nombre           VARCHAR2(30) NOT NULL,
    primer_apellido  VARCHAR2(50) NOT NULL,
    segundo_apellido VARCHAR2(50) NOT NULL,
    correo           VARCHAR2(100) NOT NULL,
    telefono         NUMBER NOT NULL
);

----CRUD CLIENTES----


--CREATE--

CREATE OR REPLACE PROCEDURE INSERTclientes (
	p_id CLIENTES.ID%TYPE,
	p_nombre CLIENTES.NOMBRE%TYPE,
	p_primer_apellido CLIENTES.PRIMER_APELLIDO%TYPE,
	p_segundo_apellido CLIENTES.SEGUNDO_APELLIDO%TYPE,
	p_correo CLIENTES.CORREO%TYPE,
	p_telefono CLIENTES.TELEFONO%TYPE)    
IS  
BEGIN  
	INSERT INTO CLIENTES (ID, NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, CORREO, TELEFONO)  
	VALUES (p_id, p_nombre, p_primer_apellido, p_segundo_apellido, p_correo, p_telefono);  
	COMMIT;  
END;

--TEST--
EXECUTE INSERTclientes(8,'Elci','Garro','Mata','egarrom@gmail.com',33333333);

--UPDATE--  
CREATE OR REPLACE PROCEDURE UPDATEclientes (
	p_id IN CLIENTES.ID%TYPE,
	p_nombre IN CLIENTES.NOMBRE%TYPE,
	p_primer_apellido IN CLIENTES.PRIMER_APELLIDO%TYPE,
	p_segundo_apellido IN CLIENTES.SEGUNDO_APELLIDO%TYPE,
	p_correo IN CLIENTES.CORREO%TYPE,
	p_telefono IN CLIENTES.TELEFONO%TYPE)    
IS  
BEGIN  
	UPDATE clientes SET ID = p_id, NOMBRE = p_nombre, PRIMER_APELLIDO = p_primer_apellido,
		SEGUNDO_APELLIDO = p_segundo_apellido, CORREO = p_correo, TELEFONO = p_telefono
	WHERE ID = p_id;
	COMMIT;  
END; 

--SELECT--

CREATE OR REPLACE PROCEDURE SELECTclientes (
	p_id IN CLIENTES.ID%TYPE,  
	p_clientes_display OUT SYS_REFCURSOR)    
IS  
BEGIN  
	OPEN p_clientes_display for SELECT ID, NOMBRE, PRIMER_APELLIDO,
		SEGUNDO_APELLIDO, CORREO, TELEFONO FROM CLIENTES
	WHERE ID = p_id;  
END;


--DELETE--

CREATE OR REPLACE PROCEDURE DELETEclientes (p_id IN CLIENTES.ID%TYPE)    
IS  
BEGIN  
	DELETE FROM CLIENTES WHERE ID = p_id;  
END;

--test--
EXECUTE DELETEclientes(8);
