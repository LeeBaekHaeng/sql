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
--     , 'ALTER FUNCTION ' || A.PROOWNER || '.' || A.PRONAME || ' OWNER TO us_comobj;' ALTER_TABLE_OWNER
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
