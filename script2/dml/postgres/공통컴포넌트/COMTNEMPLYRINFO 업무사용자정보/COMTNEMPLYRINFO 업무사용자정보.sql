-- 업무사용자정보
SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , A.EMPLYR_ID /* emplyr_id varchar(20) NOT NULL, -- 업무사용자ID */
     , A.ESNTL_ID /* esntl_id bpchar(20) NOT NULL, -- 고유ID */
     , A.*
  FROM COMTNEMPLYRINFO A /* 업무사용자정보 */
 WHERE 1 = 1
   AND A.EMPLYR_ID LIKE 'TEST%' /* emplyr_id varchar(20) NOT NULL, -- 업무사용자ID */
 ORDER BY
       A.ESNTL_ID /* esntl_id bpchar(20) NOT NULL, -- 고유ID */
--       A.EMPLYR_ID /* emplyr_id varchar(20) NOT NULL, -- 업무사용자ID */
;

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , A.*
  FROM COMVNUSERMASTER A /* 사용자마스터 */
 WHERE 1 = 1
--   AND A.USER_ID LIKE 'TEST%' /* emplyr_id varchar(20) NOT NULL, -- 업무사용자ID */
   AND A.USER_ID LIKE 'USER%' /* emplyr_id varchar(20) NOT NULL, -- 업무사용자ID */
 ORDER BY
       A.ESNTL_ID/* esntl_id bpchar(20) NOT NULL, -- 고유ID */
;
