SELECT
    agenda_id, to_char(agenda_data, 'dd/mm/yyyy hh24:mi:ss') agenda_data
FROM
    agenda;