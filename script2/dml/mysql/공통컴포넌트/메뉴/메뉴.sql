SELECT
    a.*
FROM comtnmenuinfo a /* 메뉴정보 */
;

SELECT
    COUNT(*)
FROM comtnmenuinfo a /* 메뉴정보 */
;

SELECT
    a.*
FROM comtnmenuinfo a /* 메뉴정보 */
WHERE 1 = 1
--     AND a.menu_no = 0 /* 메뉴번호*/
-- 
--     AND a.menu_no = 1 /* 메뉴번호*/
--     AND a.menu_no = 2 /* 메뉴번호*/
    AND a.menu_no IN (1, 2) /* 메뉴번호*/
-- 
--     AND a.upper_menu_no = 1 /* 상위메뉴번호*/
--     AND a.upper_menu_no = 2 /* 상위메뉴번호*/
    AND a.upper_menu_no IN (1, 2) /* 상위메뉴번호*/
;

-- https://mariadb.com/kb/en/recursive-common-table-expressions-overview/

WITH RECURSIVE search_graph(depth, menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm) AS (
    SELECT
      0
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM comtnmenuinfo a
    WHERE a.menu_no = 0
  UNION ALL
    SELECT
      sg.depth + 1
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM comtnmenuinfo a, search_graph sg
    WHERE a.upper_menu_no = sg.menu_no
    AND a.menu_no > 0
)
SELECT * FROM search_graph
;

WITH RECURSIVE search_graph(depth, is_cycle, path, path2, menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm) AS (
    SELECT
      0
      , false
      , CAST(LPAD(a.menu_ordr, 3, '0') AS VARCHAR(999))
      , CAST('home' AS VARCHAR(999))
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM comtnmenuinfo a
    WHERE a.menu_no = 0
  UNION ALL
    SELECT
      sg.depth + 1
      , false
      , CONCAT(sg.path, ',', LPAD(a.menu_ordr, 3, '0'))
      , CONCAT(sg.path2, ' > ', a.menu_nm)
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM comtnmenuinfo a, search_graph sg
    WHERE a.upper_menu_no = sg.menu_no
    AND a.menu_no > sg.menu_no
)
SELECT * FROM search_graph
ORDER BY path
;
