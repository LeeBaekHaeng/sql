SELECT
    a.*
FROM
    comtccmmncode a /* 공통코드 */
WHERE 1 = 1
    AND code_id_nm LIKE '%성별%' /* 코드ID명 */
;

SELECT
    a.*
FROM
    comtccmmndetailcode a /* 공통상세코드 */
WHERE 1 = 1
    AND code_id = 'COM014' /* 코드ID = COM014 성별구분 */
;
