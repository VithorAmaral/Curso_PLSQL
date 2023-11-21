--
-- Seção 6 - Declaração de Identificadores - Variáveis e Constantes
--
-- Aula 3 - Tipos de Dados no PL/SQL - Datatypes
--

-- Declarando Variáveis utilizando os principais Tipos de Dados

SET SERVEROUTPUT ON

DECLARE
    vnumero                       NUMBER(11, 2) := 1200.50;
    vcaractertamfixo              CHAR(100) := 'Texto de Tamanho Fixo de até 32767 bytes';
    vcaractertamvariavel          VARCHAR2(100) := 'Texto Tamanho variável de até 32767 bytes';
    vbooleano                     BOOLEAN := TRUE;
    vdata                         DATE := sysdate;
    vlong                         LONG := 'Texto Tamanho variável de até 32760 bytes';
    vrowid                        ROWID;
    vtimestamp                    TIMESTAMP := systimestamp;
    vtimestamptz                  TIMESTAMP WITH TIME ZONE := systimestamp;
    vcaractertamfixouniversal     NCHAR(100) := 'Texto de Tamanho Fixo Universal de até 32767 bytes';
    vcaractertamvariaveluniversal NVARCHAR2(100) := 'Texto Tamanho variável Universal de até 32767 bytes';
    vnumerointeiro                BINARY_INTEGER := 1200;
    vnumerofloat                  BINARY_FLOAT := 15000000;
    vnumerodouble                 BINARY_DOUBLE := 15000000;
BEGIN
    dbms_output.put_line('Numero = ' || vnumero);
    dbms_output.put_line('String Caracteres Tam Fixo = ' || vcaractertamfixo);
    dbms_output.put_line('String Caracteres Tam Vari?vel = ' || vcaractertamvariavel);
    IF vbooleano = true THEN
        dbms_output.put_line('Booleano = ' || 'TRUE');
    ELSE
        dbms_output.put_line('Booleano = ' || 'FALSE OR NULL');
    END IF;

    dbms_output.put_line('Data = ' || vdata);
    dbms_output.put_line('Long = ' || vlong);
    SELECT
        ROWID
    INTO vrowid
    FROM
        employees
    WHERE
            first_name = 'Steven'
        AND last_name = 'King';

    dbms_output.put_line('Rowid = ' || vrowid);
    dbms_output.put_line('Timestamp = ' || vtimestamp);
    dbms_output.put_line('Timestamp with time zone= ' || vtimestamptz);
    dbms_output.put_line('String Caracteres Tam Fixo = ' || vcaractertamfixouniversal);
    dbms_output.put_line('String Caracteres Tam Vari?vel = ' || vcaractertamvariaveluniversal);
    dbms_output.put_line('Numero Inteiro = ' || vnumerointeiro);
    dbms_output.put_line('Numero Float = ' || vnumerofloat);
    dbms_output.put_line('Numero Double = ' || vnumerodouble);
END;