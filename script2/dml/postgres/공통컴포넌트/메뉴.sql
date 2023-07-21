select * from COMTNMENUINFO
;

select count(*) from COMTNMENUINFO
;

select * from COMTNMENUINFO where menu_no = 0
;

--https://www.postgresql.org/docs/current/queries-with.html

WITH RECURSIVE search_graph(depth, menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm) AS (
    SELECT
      0
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM COMTNMENUINFO a
    WHERE a.menu_no = 0
  UNION ALL
    SELECT
      sg.depth + 1
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM COMTNMENUINFO a, search_graph sg
    WHERE a.upper_menu_no = sg.menu_no
    AND a.menu_no > 0
)
SELECT * FROM search_graph
;

WITH RECURSIVE search_graph(depth, is_cycle, path, menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm) AS (
    SELECT
      0
      , false
      , ARRAY[a.menu_no :: numeric]
--      , ARRAY[ROW(a.menu_no, a.menu_nm)]
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM COMTNMENUINFO a
    WHERE a.menu_no = 0
  UNION ALL
    SELECT
      sg.depth + 1
      , a.menu_no = ANY(path)
--      , ROW(a.menu_no, g.f2) = ANY(path)
      , path || a.menu_no
--      , path || ROW(a.menu_no, g.menu_nm)
      , a.menu_nm, a.progrm_file_nm, a.menu_no, a.upper_menu_no, a.menu_ordr, a.menu_dc, a.relate_image_path, a.relate_image_nm
    FROM COMTNMENUINFO a, search_graph sg
    WHERE a.upper_menu_no = sg.menu_no AND NOT is_cycle
    AND a.menu_no > 0
)
SELECT * FROM search_graph
;
