-- Creación de la Tabla de Auditoría para Clientes
CREATE TABLE log_clientes (
    id NUMBER NOT NULL,
    nombre VARCHAR2(30) NOT NULL,
    primer_apellido VARCHAR2(50) NOT NULL,
    segundo_apellido VARCHAR2(50) NOT NULL,
    correo VARCHAR2(100) NOT NULL,
    telefono NUMBER NOT NULL,
    accion_realizada VARCHAR2(50),
 	usuario_elimina VARCHAR2(50),
 	fecha_elimina TIMESTAMP
);

-- Creación de Triggers de Auditoría para Clientes
CREATE OR REPLACE TRIGGER trg_borrar_clientes BEFORE DELETE ON clientes FOR EACH ROW
DECLARE
   v_username VARCHAR2(50);
BEGIN
    SELECT USER INTO v_username FROM dual;
    INSERT INTO log_clientes(id, nombre, primer_apellido, segundo_apellido,
        correo, telefono, accion_realizada, usuario_elimina, fecha_elimina)
    VALUES (:OLD.id, :OLD.nombre, :OLD.primer_apellido, :OLD.segundo_apellido, :OLD.correo,
        :OLD.telefono, 'Se eliminó el registro de clientes', v_username, SYSDATE);
END;

CREATE OR REPLACE TRIGGER trg_actualizar_clientes AFTER UPDATE ON clientes FOR EACH ROW
DECLARE
   v_username VARCHAR2(50);
BEGIN
    SELECT USER INTO v_username FROM dual;
    INSERT INTO log_clientes(id, nombre, primer_apellido, segundo_apellido,
        correo, telefono, accion_realizada, usuario_elimina, fecha_elimina)
    VALUES (:NEW.id, :NEW.nombre, :NEW.primer_apellido, :NEW.segundo_apellido, :NEW.correo,
        :NEW.telefono, 'Se actualizó el registro de clientes', v_username, SYSDATE);
END;

-- Pruebas
SELECT * FROM CLIENTES;
SELECT * FROM log_clientes;
EXECUTE INSERTclientes(6,'PRUEBA','PRUEBA','PRUEBA','PRUEBA@gmail.com',000000000);
EXECUTE DELETEclientes(6);