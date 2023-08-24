SET @column_comment = '%여부%';
SET @column_comment = '%기관%';

SELECT @column_comment;

SELECT
    a.table_schema '테이블 스키마'
    , a.column_name '컬럼 이름'
    , a.column_comment '컬럼 설명'
    , a.*
FROM information_schema.columns a /* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com'
    AND a.column_comment LIKE '%여부%' /* 컬럼 설명 */
--    AND a.column_comment LIKE @column_comment /* 컬럼 설명 */
ORDER BY a.table_schema /* 테이블 스키마 */
    , a.table_name /* 테이블 이름 */
    , a.ordinal_position /* 서수 위치 */
;

SELECT
    a.column_name
    , count(*) cnt
FROM
    information_schema.columns a /* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com'
    AND a.column_comment LIKE '%여부%' /* 컬럼 설명 */
GROUP by
    a.column_name
ORDER by
    a.column_name
;

SELECT
    a.column_name
    , count(*) cnt
FROM
    information_schema.columns a /* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com'
    AND a.column_comment LIKE '%여부%' /* 컬럼 설명 */
GROUP by
    a.column_name
ORDER by
    cnt DESC, a.column_name
;

SELECT
    a.column_comment
    , count(*) cnt
FROM
    information_schema.columns a /* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com'
    AND a.column_comment LIKE '%여부%' /* 컬럼 설명 */
GROUP by
    a.column_comment
ORDER by
    a.column_comment
;

SELECT
    a.column_comment
    , count(*) cnt
FROM
    information_schema.columns a /* 컬럼 */
WHERE 1 = 1
    AND a.table_schema = 'com'
    AND a.column_comment LIKE '%여부%' /* 컬럼 설명 */
GROUP by
    a.column_comment
ORDER by
    cnt DESC, a.column_comment
;
