--
-- Seção 6 - Declaração de Identificadores - Variáveis e Constantes
--
-- Aula 4 - Variável Bind
--

-- Utilizando Variável Bind

SET SERVEROUTPUT ON
VARIABLE gmedia NUMBER

DECLARE
    vnumero1 NUMBER(11, 2) := 2000;
    vnumero2 NUMBER(11, 2) := 5000;
BEGIN
    :gmedia := ( vnumero1 + vnumero2 ) / 2;
    dbms_output.put_line('Media = ' || to_char(:gmedia));
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Erro Oracle: '
                             || sqlcode
                             || sqlerrm);
END;