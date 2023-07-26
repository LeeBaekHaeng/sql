/*

Information Schema COLUMNS Table
정보 스키마 COLUMNS 테이블
https://mariadb.com/kb/en/information-schema-columns-table/

**/

SELECT
    a.table_schema '테이블 스키마'
    , a.column_name '컬럼 이름'
    , a.column_comment '컬럼 설명'
    , a.*
FROM information_schema.columns a/* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com'
    AND a.column_comment LIKE '%순서%' /* 컬럼 설명 */
ORDER BY a.table_schema /* 테이블 스키마 */
    , a.table_name /* 테이블 이름 */
    , a.ordinal_position /* 서수 위치 */
;

/* 컬럼 */
select
    a.table_name '테이블 이름' /* 테이블 이름 */
--      , (select aa.table_comment FROM information_schema.tables aa where aa.table_catalog = a.table_catalog AND aa.table_schema = a.table_schema AND aa.table_name = a.table_name) '테이블 주석' /* 테이블 주석 */
    , LOWER(a.column_name) '컬럼 이름' /* 컬럼 이름 */
    , a.*
FROM information_schema.columns a/* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com' /* 테이블 스키마 */
ORDER BY a.table_name /* 테이블 이름 */
    , a.ordinal_position
;

/* 컬럼 */
select
    CONCAT('    , a.', LOWER(a.column_name), ' /* ', (select aa.table_comment FROM information_schema.tables aa where aa.table_catalog = a.table_catalog AND aa.table_schema = a.table_schema AND aa.table_name = a.table_name), '.', a.COLUMN_COMMENT, ' */') sql1
FROM information_schema.columns a/* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com' /* 테이블 스키마 */
    AND a.table_name = 'comtcadministcode' /* 테이블 이름 = 행정코드 */
--     AND a.table_name = 'comtcadministcoderecptnlog' /* 테이블 이름 = 행정코드수신로그 */
ORDER BY a.table_name /* 테이블 이름 */
    , a.ordinal_position
;
