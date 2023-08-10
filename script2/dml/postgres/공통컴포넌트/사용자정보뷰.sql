SELECT
    a.mber_id
    , a.mber_nm
    , a.*
FROM
    comtngnrlmber a /* 일반회원 */
WHERE 1 = 1
    AND a.esntl_id = 'USRCNFRM_00000000001' /* 고유ID */
;

SELECT
    a.entrprs_mber_id
    , a. applcnt_nm
    , a.*
FROM
    comtnentrprsmber a /* 기업회원 */
WHERE 1 = 1
    AND a.esntl_id = 'USRCNFRM_00000000002' /* 고유ID */
;

SELECT
    a.emplyr_id
    , a.user_nm
    , a.*
FROM
    comtnemplyrinfo a /* 업무사용자정보 */
WHERE 1 = 1
    AND a.esntl_id = 'USRCNFRM_00000000000' /* 고유ID */
--    AND a.esntl_id = 'USRCNFRM_99999999999' /* 고유ID */
;

SELECT
    a.user_id
    , a.user_nm
    , a.*
FROM
    comvnusermaster a /* 사용자정보뷰 */
WHERE 1 = 1
    AND a.esntl_id = 'USRCNFRM_00000000000' /* 고유ID */
--    AND a.esntl_id = 'USRCNFRM_00000000001' /* 고유ID */
--    AND a.esntl_id = 'USRCNFRM_00000000002' /* 고유ID */
--    AND a.esntl_id = 'USRCNFRM_99999999999' /* 고유ID */
;
