--
-- SeÁ„o 6 - Declara√ß√£o de Identificadores - Vari·veis e Constantes
--
-- Aula 2 - Definindo Identificadores - Constantes
--
-- 

-- Declarando Constantes

-- Declarando uma Constante Tipo NUMBER

SET SERVEROUTPUT ON

DECLARE
    vpi NUMBER(38, 15) := 3.141592653589793;
BEGIN
    dbms_output.put_line('Pi = ' || vpi);
    vpi := 3.14159;
    dbms_output.put_line('Pi = ' || vpi);
END;

-- Declarando Constante Tipo CHAR e VARCHAR2

SET SERVEROUTPUT ON 

DECLARE
    vcaractertamfixo     CONSTANT CHAR(2) := 'RS';
    vcaractertamvariavel CONSTANT VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
    dbms_output.put_line('String Caracteres Tam Fixo = ' || vcaractertamfixo);
    dbms_output.put_line('String Caracteres Tam Vari·vel = ' || vcaractertamvariavel);
    
END;

-- Declarando vari√°veis Tipo DATE

SET SERVEROUTPUT ON

DECLARE
    vdata1 DATE := '29/04/20';
    vdata2 DATE := '29/04/2020';
BEGIN
    dbms_output.put_line('Data1 = ' || vdata1);
    dbms_output.put_line('Data2 = ' || vdata2);
END;