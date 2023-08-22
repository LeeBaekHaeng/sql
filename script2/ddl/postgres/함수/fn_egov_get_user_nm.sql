--사용자명

--SELECT VERSION();

CREATE
OR REPLACE
FUNCTION fn_egov_get_user_nm (
    in_esntl_id VARCHAR(20)
)

RETURNS VARCHAR(60) AS $$

DECLARE rt_user_nm VARCHAR(60);

BEGIN

    SELECT
        a.user_nm
        INTO rt_user_nm
    FROM
        comvnusermaster a /* 사용자정보뷰 */
    WHERE 1 = 1
        AND a.esntl_id = in_esntl_id /* 고유ID */
    ;

    RETURN rt_user_nm;

END;
$$ LANGUAGE plpgsql


SELECT
    fn_egov_get_user_nm('USRCNFRM_00000000000') user_nm
;
