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

/* 테이블 */
