/*

mariadb information_schema

Information Schema
정보 스키마
https://mariadb.com/kb/en/information-schema/

Information Schema Tables
정보 스키마 테이블
https://mariadb.com/kb/en/information-schema-tables/

Information Schema TABLES Table
정보 스키마 테이블 테이블
https://mariadb.com/kb/en/information-schema-tables-table/

**/

/* 테이블 */
select
    a.table_name '테이블 이름'
    , a.table_comment '테이블 주석'
    , a.*
FROM information_schema.tables a/* 테이블 */
WHERE 1 = 1
    AND a.table_schema = 'com' /* 테이블 스키마 */
;

SELECT * FROM information_schema.tables WHERE temporary='y'
;

-- View Tables in Order of Size
-- 크기순으로 테이블 보기
SELECT table_schema as `DB`, table_name AS `Table`, 
  ROUND(((data_length + index_length) / 1024 / 1024), 2) `Size (MB)` 
  FROM information_schema.TABLES
WHERE 1 = 1
    AND table_schema = 'com' /* 테이블 스키마 */
  ORDER BY (data_length + index_length) DESC;
