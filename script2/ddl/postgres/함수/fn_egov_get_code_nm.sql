--코드명

--SELECT VERSION();

CREATE
OR REPLACE
FUNCTION fn_egov_get_code_nm (
    in_code_id VARCHAR(6)
    , in_code VARCHAR(15)
)

RETURNS VARCHAR(60) AS $$

DECLARE rt_code_nm VARCHAR(60);

BEGIN


    SELECT
        a.code_nm
        INTO rt_code_nm
--        , a.*
    FROM
        comtccmmndetailcode a
    WHERE 1 = 1
        AND a.code_id = in_code_id
        AND a.code = in_code
    ;

    RETURN rt_code_nm;

END;
$$ LANGUAGE plpgsql


SELECT
    fn_egov_get_code_nm('COM001', 'REGC01') code_nm
;
