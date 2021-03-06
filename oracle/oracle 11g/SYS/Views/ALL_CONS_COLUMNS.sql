SELECT * FROM ALL_CONSTRAINTS X WHERE X.OWNER = 'COM'
--AND X.CONSTRAINT_TYPE = 'P'
--AND X.TABLE_NAME = 'COMTCADMINISTCODERECPTNLOG'
AND X.TABLE_NAME = 'COMTCCMMNDETAILCODE'
;

SELECT * FROM ALL_CONS_COLUMNS L WHERE L.OWNER = 'COM' AND L.TABLE_NAME = 'COMTCADMINISTCODERECPTNLOG';

SELECT * FROM ALL_CONS_COLUMNS L WHERE L.OWNER = 'COM' AND EXISTS (SELECT 1 FROM ALL_CONSTRAINTS X WHERE X.OWNER = 'COM' AND X.CONSTRAINT_TYPE = 'P' AND X.TABLE_NAME = 'COMTCADMINISTCODERECPTNLOG' AND X.CONSTRAINT_NAME = L.CONSTRAINT_NAME)
;

--

SELECT /* select */
       A.*
  FROM ALL_CONS_COLUMNS A
 WHERE 1 = 1
   AND A.OWNER = 'COM'
   AND A.CONSTRAINT_NAME = 'COMTCADMINISTCODE_PK'
   AND A.TABLE_NAME = 'COMTCADMINISTCODE'
;

SELECT /* select */
       A.OWNER
     , A.CONSTRAINT_NAME
     , A.TABLE_NAME
     , A.COLUMN_NAME
  FROM ALL_CONS_COLUMNS A
 WHERE 1 = 1
   AND A.OWNER = 'COM'
   AND A.CONSTRAINT_NAME = 'COMTCADMINISTCODE_PK'
   AND A.TABLE_NAME = 'COMTCADMINISTCODE'
;

--

SELECT /* select */
       A.*
  FROM ALL_CONS_COLUMNS A
 WHERE 1 = 1
   AND A.OWNER = 'COM'
   AND A.TABLE_NAME = 'COMTCADMINISTCODE'
   AND EXISTS (
                SELECT /* select */
                       1
                  FROM ALL_CONSTRAINTS X
                 WHERE 1 = 1
                   AND X.OWNER = A.OWNER
                   AND X.CONSTRAINT_NAME = A.CONSTRAINT_NAME
                   AND X.CONSTRAINT_TYPE = 'P'
                   AND X.TABLE_NAME = A.TABLE_NAME
   )
;

--

SELECT 'Y' FROM ALL_CONS_COLUMNS L WHERE L.OWNER = 'COM' AND L.TABLE_NAME = 'COMTCADMINISTCODE' AND L.COLUMN_NAME = 'ADMINIST_ZONE_SE' AND EXISTS (SELECT 1 FROM ALL_CONSTRAINTS X WHERE X.OWNER = L.OWNER AND X.CONSTRAINT_NAME = L.CONSTRAINT_NAME AND X.CONSTRAINT_TYPE = 'P' AND X.TABLE_NAME = L.TABLE_NAME)
;

--
