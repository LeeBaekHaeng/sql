SELECT
    a.*
FROM comtccmmncode a
WHERE 1 = 1
--     AND CODE_ID_NM LIKE '%회원%' /* comtncmmntyuser.MBER_STTUS 커뮤니티사용자.회원 상태 */
--    AND a.code_id_nm = '회원상태' /* comtncmmntyuser.MBER_STTUS 커뮤니티사용자.회원 상태 */
--     AND CODE_ID_NM LIKE '%발송결과%' /* comthemaildsptchmanage.SNDNG_RESULT_CODE 메일발신관리.발송결과코드 */
    AND a.code_id_nm = '발송결과구분' /* comthemaildsptchmanage.SNDNG_RESULT_CODE 메일발신관리.발송결과코드 */
;

SELECT
--     a.code_id
    a.code
    , a.code_nm
--     , a.*
FROM comtccmmndetailcode a
WHERE 1 = 1
--     AND a.code_id = 'COM013' /* 회원상태 MBER_STTUS */
    AND a.code_id = 'COM024' /* 발송결과구분 SNDNG_RESULT_CODE */
;
