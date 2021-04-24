SELECT /* select */
       A.*
  FROM ALL_TABLES A
 WHERE 1 = 1
   AND A.OWNER = 'COM'
--   AND A.TABLE_NAME LIKE 'C%'
 ORDER BY A.TABLE_NAME
;

SELECT /* select */
       A.OWNER
       , A.TABLE_NAME
       , (SELECT L.COMMENTS FROM ALL_TAB_COMMENTS L WHERE L.OWNER = A.OWNER AND L.TABLE_NAME = A.TABLE_NAME) TABLE_COMMENTS
  FROM ALL_TABLES A
 WHERE 1 = 1
--   AND A.OWNER = 'COM'
   AND A.OWNER IN (
       'COM'
     , 'COM320'
   )
 ORDER BY A.OWNER, A.TABLE_NAME
;
