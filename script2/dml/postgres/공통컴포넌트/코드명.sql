SELECT
    fn_egov_get_code_nm('COM001', 'REGC01') code_nm
;

SELECT
    a.sexdstn_code "성별코드" /* 성별코드 */
    , fn_egov_get_code_nm('COM014', a.sexdstn_code) sexdstn_code_nm /* 성별코드명 */
    , a.*
FROM 
    comtnemplyrinfo a /* 업무사용자정보 */
WHERE 1 = 1
    
;
