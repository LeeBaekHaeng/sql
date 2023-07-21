/*

Information Schema COLUMNS Table
정보 스키마 COLUMNS 테이블
https://mariadb.com/kb/en/information-schema-columns-table/

**/

/* 컬럼 */
select
    a.table_name '테이블 이름' /* 테이블 이름 */
     , (select aa.table_comment FROM information_schema.tables aa where aa.table_catalog = a.table_catalog AND aa.table_schema = a.table_schema AND aa.table_name = a.table_name) '테이블 주석' /* 테이블 주석 */
    , LOWER(a.column_name) '컬럼 이름' /* 컬럼 이름 */
    , a.*
FROM information_schema.columns a/* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com' /* 테이블 스키마 */
order by a.table_name /* 테이블 이름 */, a.ordinal_position
;

/* 컬럼 select */
select
    CONCAT('SELECT * FROM ', a.table_name, 'a /* ', a.table_comment, ' */ where 1 = 1;')
FROM information_schema.columns a/* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com' /* 테이블 스키마 */
order by a.table_name /* 테이블 이름 */
;
