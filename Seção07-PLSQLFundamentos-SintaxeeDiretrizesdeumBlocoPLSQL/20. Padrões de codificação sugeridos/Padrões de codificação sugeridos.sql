--
-- Seção 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 4 - Padrões de codificação sugeridos
--

-- Exemplo de uso dos Padrões de codificação sugeridos

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