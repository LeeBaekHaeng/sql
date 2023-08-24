SELECT
    a.*
FROM
    information_schema.columns a
WHERE 1 = 1
    AND table_catalog = 'com'
--    AND table_schema = 'com'
--    AND table_schema = 'public'
--    AND column_name = 'use_at'
    AND column_name LIKE '%_at'
ORDER BY 
    table_catalog, table_schema, table_name, ordinal_position
;
