SELECT
    a.*
FROM comtccmmncode a
WHERE 1 = 1
--     AND CODE_ID_NM LIKE '%회원%' /* comtncmmntyuser.MBER_STTUS 커뮤니티사용자.회원 상태 */
    AND a.code_id_nm = '회원상태' /* comtncmmntyuser.MBER_STTUS 커뮤니티사용자.회원 상태 */
;

SELECT
    a.*
FROM comtccmmndetailcode a
WHERE 1 = 1
    AND a.code_id = 'COM013' /* 회원상태 MBER_STTUS */
;
