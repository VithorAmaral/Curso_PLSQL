--
-- Seção 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 2 - Utilizando Funções no bloco PL/SQL
--

--
-- Seção 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 2 - Utilizando Funções no bloco PL/SQL
--

-- Utilizando Funções no bloco PL/SQL

SET SERVEROUTPUT ON

DECLARE
    vnumero1 NUMBER(13, 2);  -- Declaração de variável para o Primeiro número
    vnumero2 NUMBER(13, 2);  -- Declaração de variável para o Segundo número
    vmedia   NUMBER(13, 2);  -- Declaração de variável para a Média
BEGIN
  /* Cálculo do valor da média entre dois números
     Autor: Emílio Scudero
     Data: 05/05/2020 */

    vnumero1 := 5000.8888;
    vnumero2 := 3000.4444;
    vmedia := round((vnumero1 + vnumero2) / 2, 2);
    dbms_output.put_line('vnumero1 = ' || vnumero1);  -- Impressão do Primeiro Número
    dbms_output.put_line('vnumero2 = ' || vnumero2);  -- Impressão do Segundo Número
    dbms_output.put_line('Media = ' || to_char(vmedia, '99G999G999D99'));     -- Impressão da Média calculada 
END;