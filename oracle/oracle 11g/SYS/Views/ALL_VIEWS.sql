SELECT /* 뷰 */
       A.*
  FROM ALL_VIEWS A
 WHERE 1 = 1
   AND A.OWNER = 'SYS'
   AND A.VIEW_NAME LIKE 'DBA_TA%'
 ORDER BY A.VIEW_NAME
;

SELECT /*  */
       A.*
  FROM ALL_VIEWS A
 WHERE 1 = 1
   AND A.OWNER = 'SYS'
--   AND A.VIEW_NAME LIKE 'ALL_TA%'
--   AND A.VIEW_NAME LIKE 'ALL_%'
--   AND A.VIEW_NAME LIKE 'ALL_%COMMENTS%'
--   AND A.VIEW_NAME LIKE 'ALL_TAB%'
--   AND A.VIEW_NAME LIKE 'ALL_OBJ%'
   AND A.VIEW_NAME LIKE 'ALL_%USER%'
 ORDER BY A.VIEW_NAME
;

SELECT /*  */
       A.*
  FROM ALL_VIEWS A
 WHERE 1 = 1
   AND A.OWNER = 'SYS'
   AND A.VIEW_NAME LIKE 'USER_TA%'
 ORDER BY A.VIEW_NAME
;