/* 테이블 */

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , 'ALTER TABLE ' || A.SCHEMANAME || '.' || A.TABLENAME || ' OWNER TO us_comobj;' ALTER_TABLE_OWNER
     , A.*
  FROM PG_TABLES A
 WHERE 1 = 1
   AND A.SCHEMANAME LIKE 'sc_%'
 ORDER BY
       A.SCHEMANAME, A.TABLENAME
;

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , A.TABLEOWNER
     , COUNT(A.*)
  FROM PG_TABLES A
 WHERE 1 = 1
   AND A.SCHEMANAME LIKE 'sc_%'
 GROUP BY
       A.TABLEOWNER
 ORDER BY
       A.TABLEOWNER
;

/* 뷰 */

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , 'ALTER TABLE ' || A.SCHEMANAME || '.' || A.VIEWNAME || ' OWNER TO us_comobj;' ALTER_TABLE_OWNER
     , A.*
  FROM PG_VIEWS A
 WHERE 1 = 1
   AND A.SCHEMANAME LIKE 'sc_%'
 ORDER BY
       A.SCHEMANAME, A.VIEWNAME
;

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , A.VIEWOWNER
     , COUNT(A.*)
  FROM PG_VIEWS A
 WHERE 1 = 1
   AND A.SCHEMANAME LIKE 'sc_%'
 GROUP BY
       A.VIEWOWNER
 ORDER BY
       A.VIEWOWNER
;

/* 함수 */

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
--     , 'ALTER FUNCTION ' || A.PROOWNER || '.' || A.PRONAME || ' OWNER TO us_comobj;' ALTER_FUNCTION_OWNER
     , A.*
  FROM PG_PROC A
 WHERE 1 = 1
   AND A.PRONAME LIKE 'fn_%'
 ORDER BY
       A.PROOWNER, A.PRONAME
;

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , A.PROOWNER
     , COUNT(A.*)
  FROM PG_PROC A
 WHERE 1 = 1
   AND A.PRONAME LIKE 'fn_%'
 GROUP BY
       A.PROOWNER
 ORDER BY
       A.PROOWNER
;

/* 시퀀스 */

--pg_class    tables, indexes, sequences, views ("relations")

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , 'ALTER SEQUENCE ' || (SELECT AA.USENAME FROM PG_SHADOW AA WHERE AA.USESYSID = A.RELOWNER) || '.' || A.RELNAME || ' OWNER TO us_comobj;' ALTER_SEQUENCE_OWNER
     , A.RELOWNER
     , (SELECT AA.USENAME FROM PG_SHADOW AA WHERE AA.USESYSID = A.RELOWNER) RELOWNER_USENAME
     , A.*
  FROM PG_CLASS A
 WHERE 1 = 1
--relkind char        r = ordinary table, i = index, S = sequence, v = view, c = composite type, s = special, t = TOAST table
--   AND A.RELKIND = 'r' /* r = ordinary table */
--   AND A.RELKIND = 'i' /* i = index */
   AND A.RELKIND = 'S' /* S = sequence */
--   AND A.RELKIND = 'v' /* v = view */
--   AND A.RELKIND = 'c' /* c = composite type */
--   AND A.RELKIND = 's' /* s = special */
--   AND A.RELKIND = 't' /* t = TOAST table */
/*  */
--   AND A.PRONAME LIKE 'fn_%'
 ORDER BY
       A.RELOWNER, A.RELNAME
;

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , (SELECT AA.USENAME FROM PG_SHADOW AA WHERE AA.USESYSID = A.RELOWNER) RELOWNER_USENAME
     , COUNT(A.*)
  FROM PG_CLASS A
 WHERE 1 = 1
   AND (SELECT AA.USENAME FROM PG_SHADOW AA WHERE AA.USESYSID = A.RELOWNER) LIKE 'us_%'
--relkind char        r = ordinary table, i = index, S = sequence, v = view, c = composite type, s = special, t = TOAST table
--   AND A.RELKIND = 'r' /* r = ordinary table */
--   AND A.RELKIND = 'i' /* i = index */
   AND A.RELKIND = 'S' /* S = sequence */
--   AND A.RELKIND = 'v' /* v = view */
--   AND A.RELKIND = 'c' /* c = composite type */
--   AND A.RELKIND = 's' /* s = special */
--   AND A.RELKIND = 't' /* t = TOAST table */
/*  */
 GROUP BY
       (SELECT AA.USENAME FROM PG_SHADOW AA WHERE AA.USESYSID = A.RELOWNER)
 ORDER BY
       (SELECT AA.USENAME FROM PG_SHADOW AA WHERE AA.USESYSID = A.RELOWNER)
;

--relowner    int4    pg_shadow.usesysid  Owner of the relation
SELECT AA.USENAME, AA.* FROM PG_SHADOW AA WHERE AA.USESYSID = 24587
;
