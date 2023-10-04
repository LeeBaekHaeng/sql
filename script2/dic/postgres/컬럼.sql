/*

https://www.postgresql.org/docs/current/catalogs.html

Chapter 53. System Catalogs

*/

SELECT
    (
        SELECT aa.description
        FROM pg_description aa
        WHERE aa.objoid = (
                SELECT aaa.oid
                FROM pg_class aaa
                WHERE aaa.oid = (a.table_schema || '.' || a.table_name)::regclass
            )
            AND aa.objsubid = 0
    ) table_comments
    , (
        SELECT aa.description
        FROM pg_description aa
        WHERE aa.objoid = (
                SELECT aaa.oid
                FROM pg_class aaa
                WHERE aaa.oid = (a.table_schema || '.' || a.table_name)::regclass
            )
            AND aa.objsubid = a.ordinal_position
    ) column_comments
    , a.*
FROM
    information_schema.columns a
WHERE 1 = 1
--    AND a.table_catalog = 'com'
--    AND a.table_schema = 'com'
--    AND a.table_schema = 'public'
--    AND a.column_name = 'use_at'
--    AND a.column_name LIKE '%_at'
ORDER BY 
    a.table_catalog, a.table_schema, a.table_name, a.ordinal_position
;

--Table Comments
SELECT
    a.*
FROM
    pg_description a
WHERE 1 = 1
--    AND a.objoid = 'comtcadministcode'::regclass
--    AND a.objoid = 'com.comtcadministcode'::regclass
    AND a.objoid = 'public.comtcadministcode'::regclass
--    AND a.objoid = 'comtcadministcode'::regclass::oid
    AND objsubid = 0
;

--Column Comments
SELECT description 
FROM pg_description 
WHERE objsubid = (SELECT ordinal_position 
                  FROM information_schema.columns 
                  WHERE table_schema = 'com' AND table_name = 'comtcadministcode' 
                    AND column_name = 'administ_zone_se') 
  AND objoid = 'com.comtcadministcode'::regclass;

--Tables
SELECT a.oid, a.*
FROM pg_class a
WHERE 1 = 1
--    AND a.relname = 'comtcadministcode'
--    AND a.oid = 'comtcadministcode'::regclass::oid
--    AND a.oid = 'com.comtcadministcode'::regclass
    AND a.oid = 'public.comtcadministcode'::regclass
;

SELECT 
    'comtcadministcode'::regclass
    , 'comtcadministcode'::regclass::oid
;

SELECT
    *
FROM
    pg_attribute
WHERE 1 = 1
    AND attrelid = 'comtcadministcode'::regclass
    AND attnum > 0
;
