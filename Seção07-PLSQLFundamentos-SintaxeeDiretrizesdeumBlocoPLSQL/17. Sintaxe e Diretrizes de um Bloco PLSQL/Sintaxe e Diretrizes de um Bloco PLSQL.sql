--
-- Seção 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 1 - Sintaxe e Diretrizes de um Bloco PL/SQL
--

-- Comentando o Código

SET SERVEROUTPUT ON

DECLARE
    vnumero1 NUMBER(13, 2);  -- Declaração de variável para o Primeiro número
    vnumero2 NUMBER(13, 2);  -- Declaração de variável para o Segundo número
    vmedia   NUMBER(13, 2);  -- Declaração de variável para receber a Media calculada
BEGIN
  /* Cálculo do valor da média entre dois números
     Autor: Emílio Scudero
     Data: 05/05/2020 */

    vnumero1 := 8000;
    vnumero2 := 4000;
    vmedia := ( vnumero1 + vnumero2 ) / 2;           -- Cálculo da Media entre os dois números  
    dbms_output.put_line('vnumero1 = ' || vnumero1);  -- Impressão do Primeiro Número
    dbms_output.put_line('vnumero2 = ' || vnumero2);  -- Impressão do Segundo Número
    dbms_output.put_line('Media = ' || vmedia);       -- Impressão da Média calculada 
END;