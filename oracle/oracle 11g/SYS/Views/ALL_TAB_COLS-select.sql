SELECT /*  */
       '       , A.' || COLUMN_NAME SQL
--       '       , A.' || COLUMN_NAME || ' /* ' || COLUMN_COMMENTS || ' */' SQL
  FROM (
        SELECT /* select */
               A.OWNER
             , A.TABLE_NAME
             , A.COLUMN_NAME
             , A.DATA_TYPE
             , A.DATA_LENGTH
             , A.DATA_PRECISION
             , A.DATA_SCALE
             , A.NULLABLE
             , A.COLUMN_ID
             , A.DATA_DEFAULT
             , (SELECT L.COMMENTS FROM ALL_TAB_COMMENTS L WHERE L.OWNER = A.OWNER AND L.TABLE_NAME = A.TABLE_NAME) TABLE_COMMENTS
             , (SELECT L.COMMENTS FROM ALL_COL_COMMENTS L WHERE L.OWNER = A.OWNER AND L.TABLE_NAME = A.TABLE_NAME AND L.COLUMN_NAME = A.COLUMN_NAME) COLUMN_COMMENTS
          FROM ALL_TAB_COLS A
         WHERE 1 = 1
           AND A.OWNER = 'SYS'
           AND A.TABLE_NAME LIKE 'ALL_TABLES'
         ORDER BY A.OWNER, A.TABLE_NAME, A.COLUMN_ID
  )
;
