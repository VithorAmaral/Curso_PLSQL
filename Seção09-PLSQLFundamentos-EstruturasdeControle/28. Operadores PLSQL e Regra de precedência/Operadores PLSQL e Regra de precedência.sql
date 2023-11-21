--
-- Seção 9 - Estruturas de Controle 
--
-- Aula 1 - Operadores PL/SQL
--

-- Operadores PL/SQL - Com erro no cálculo devido ao mal uso da regra de precedência

SET SERVEROUTPUT ON

DECLARE
    vnota1 NUMBER(11, 2) := 7.0;
    vnota2 NUMBER(11, 2) := 6.0;
    vnota3 NUMBER(11, 2) := 9.0;
    vnota4 NUMBER(11, 2) := 6.0;
    vmedia NUMBER(11, 2);
BEGIN
    vmedia := ( vnota1 + vnota2 + vnota3 + vnota4 ) / 4;
    dbms_output.put_line('Media = ' || vmedia);
END;

-- Corrigindo o cálculo da média sobrepondo a regra de precedência utilizando parenteses

SET SERVEROUTPUT ON

DECLARE
    vnota1 NUMBER(11, 2) := 7.0;
    vnota2 NUMBER(11, 2) := 6.0;
    vnota3 NUMBER(11, 2) := 9.0;
    vnota4 NUMBER(11, 2) := 6.0;
    vmedia NUMBER(11, 2);
BEGIN
    vmedia := ( vnota1 + vnota2 + vnota3 + vnota4 ) / 4;
    dbms_output.put_line('Media = ' || vmedia);
END;