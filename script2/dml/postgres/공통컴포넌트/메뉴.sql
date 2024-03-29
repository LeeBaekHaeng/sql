SELECT * FROM comtnmenuinfo
ORDER BY menu_no
;

SELECT COUNT(*) FROM comtnmenuinfo
;

SELECT * FROM comtnmenuinfo WHERE menu_no = 0
;

--https://www.postgresql.org/docs/current/queries-with.html

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

WITH RECURSIVE search_graph(depth, is_cycle, path, menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm) AS (
    SELECT
      0
      , false
      , ARRAY[a.menu_ordr :: numeric]
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM comtnmenuinfo a
    WHERE a.menu_no = 0
  UNION ALL
    SELECT
      sg.depth + 1
      , a.menu_no = ANY(path)
      , path || a.menu_ordr
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM comtnmenuinfo a, search_graph sg
    WHERE a.upper_menu_no = sg.menu_no AND NOT is_cycle
    AND a.menu_no > sg.menu_no
)
SELECT * FROM search_graph
ORDER BY path
;

WITH RECURSIVE search_graph(depth, is_cycle, path, menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm) AS (
    SELECT
      0
      , false
      , ARRAY[ROW(a.menu_ordr, a.menu_no, a.menu_nm)]
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM comtnmenuinfo a
    WHERE a.menu_no = 0
  UNION ALL
    SELECT
      sg.depth + 1
      , ROW(a.menu_no, a.menu_nm) = ANY(path)
      , path || ROW(a.menu_ordr, a.menu_no, a.menu_nm)
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM comtnmenuinfo a, search_graph sg
    WHERE a.upper_menu_no = sg.menu_no AND NOT is_cycle
    AND a.menu_no > sg.menu_no
)
SELECT * FROM search_graph
ORDER BY path
;
