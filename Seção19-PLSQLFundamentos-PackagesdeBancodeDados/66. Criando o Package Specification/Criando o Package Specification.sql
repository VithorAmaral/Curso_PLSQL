CREATE OR REPLACE PACKAGE pck_empregados IS
    gminsalary employees.salary%TYPE;
    PROCEDURE prc_insere_empregado (
        pfirst_name    IN VARCHAR2,
        plast_name     IN VARCHAR2,
        pemail         IN VARCHAR2,
        pphone_number  IN VARCHAR2,
        phire_date     IN DATE DEFAULT sysdate,
        pjob_id        IN VARCHAR2,
        psalary        IN NUMBER,
        pcommicion_pct IN NUMBER,
        pmanager_id    IN NUMBER,
        pdepartment_id IN NUMBER
    );

    PROCEDURE prc_aumenta_salario_empregado (
        pemployee_id IN NUMBER,
        ppercentual  IN NUMBER
    );

    FUNCTION fnc_consulta_salario_empregado (
        pemployee_id IN NUMBER
    ) RETURN NUMBER;

END pck_empregados;