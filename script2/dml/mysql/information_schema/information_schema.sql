-- https://mariadb.com/kb/en/information-schema-tables-table/

SELECT
    a.*
FROM information_schema.tables a
WHERE 1 = 1
    AND a.table_schema = 'com'
ORDER BY a.TABLE_NAME
;
