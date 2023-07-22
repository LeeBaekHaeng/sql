/*

Information Schema TABLES Table
정보 스키마 TABLES 테이블
https://mariadb.com/kb/en/information-schema-tables-table/

**/

/* 테이블 */
select
    a.table_name '테이블 이름' /* 테이블 이름 */
    , a.table_comment '테이블 주석' /* 테이블 주석 */
    , a.*
FROM information_schema.tables a/* 테이블 */
WHERE 1 = 1
    AND a.table_schema = 'com' /* 테이블 스키마 */
order by a.table_name /* 테이블 이름 */
;

/* 테이블 select */
select
    CONCAT('SELECT a.* FROM ', a.table_name, ' a /* ', a.table_comment, ' */ where 1 = 1;')
FROM information_schema.tables a/* 테이블 */
WHERE 1 = 1
    AND a.table_schema = 'com' /* 테이블 스키마 */
order by a.table_name /* 테이블 이름 */
;
