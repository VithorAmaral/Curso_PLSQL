--
-- Seção 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 3 - Blocos Aninhados e Escopo de Identificadores (variáveis e constantes)
--

-- Escopo de Identificadores e Blocos Aninhados

SET SERVEROUTPUT ON

DECLARE
    vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
    dbms_output.put_line('Referenciando variável do Bloco 1: ' || vbloco1);
    -- Se voce referencia vbloco2 aqui ocorrerá Erro
    DECLARE
        vbloco2 VARCHAR2(20) := 'Bloco 2';
    BEGIN
        dbms_output.put_line('Referenciando variável do Bloco 1: ' || vbloco1);
        dbms_output.put_line('Referenciando variável do Bloco 2: ' || vbloco2);
    END;

    dbms_output.put_line('Referenciando variável do Bloco 1: ' || vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrerá Erro
END;

-- Identificando Blocos através de Labels

SET SERVEROUTPUT ON

<< bloco1 >> DECLARE
    vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
    dbms_output.put_line('Referenciando variável do Bloco 1: ' || bloco1.vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrerá Erro
    << bloco2 >> DECLARE
        vbloco2 VARCHAR2(20) := 'Bloco 2';
    BEGIN
        dbms_output.put_line('Referenciando variável do Bloco 1: ' || bloco1.vbloco1);
        dbms_output.put_line('Referenciando variável do Bloco 2: ' || bloco2.vbloco2);
    END;

    dbms_output.put_line('Referenciando variável do Bloco 1: ' || bloco1.vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrerá Erro
END;