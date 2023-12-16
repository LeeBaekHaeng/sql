select /* select */
       A.MBER_ID /* 회원ID mber_id varchar(20) NOT NULL, */
     , A.ESNTL_ID /* 고유ID esntl_id bpchar(20) NOT NULL, */
     , A.MBER_NM /* 회원명 mber_nm varchar(50) NOT NULL, */
     , A.ZIP /* 우편번호 zip varchar(6) NOT NULL, */
     , A.*
  from COMTNGNRLMBER A /* 일반회원 COM_TN_GNRL_MBER com_tn_gnrl_mber */
 where 1 = 1
   and A.MBER_ID = 'USER' /* 회원ID mber_id varchar(20) NOT NULL, */
   and A.ESNTL_ID = 'USRCNFRM_00000000001' /* 고유ID esntl_id bpchar(20) NOT NULL, */
;

select
    a.character_maximum_length
    , a.*
from information_schema.columns a
where 1 = 1
and table_name = 'columns'
order by table_catalog, table_schema, table_name, ordinal_position
;

SELECT /* select */
       A.MBER_NM
     , fn_egov_get_com_tn_gnrl_mber(A.ESNTL_ID::VARCHAR, 'MBER_ID') MBER_NM_NM
     , fn_egov_get_com_tn_gnrl_mber(A.ESNTL_ID::VARCHAR, 'PASSWORD') MBER_NM_NM
     , fn_egov_get_com_tn_gnrl_mber(A.ESNTL_ID::VARCHAR, 'MBER_NM') MBER_NM_NM
     , fn_egov_get_com_tn_gnrl_mber(A.ESNTL_ID::VARCHAR, 'ZIP') ZIP_NM
     , fn_egov_get_com_tn_gnrl_mber(A.ESNTL_ID::VARCHAR, 'GROUP_ID') GROUP_ID_NM
     , fn_egov_get_com_tn_gnrl_mber(A.ESNTL_ID::VARCHAR, 'SBSCRB_DE') SBSCRB_DE_NM
     , A.*
  FROM COMTNGNRLMBER A
-- WHERE A.ESNTL_ID = 'USRCNFRM_00000000001'
;

SELECT /* select */
       fn_egov_get_com_tn_gnrl_mber('USRCNFRM_00000000001'::VARCHAR, 'MBER_NM') MBER_NM_NM
     , fn_egov_get_com_tn_gnrl_mber('USRCNFRM_00000000001'::VARCHAR, 'ZIP') ZIP_NM
     , fn_egov_get_com_tn_gnrl_mber('USRCNFRM_00000000001'::VARCHAR, 'GROUP_ID') GROUP_ID_NM
     , fn_egov_get_com_tn_gnrl_mber('USRCNFRM_00000000001'::VARCHAR, 'SBSCRB_DE') SBSCRB_DE_NM
;
