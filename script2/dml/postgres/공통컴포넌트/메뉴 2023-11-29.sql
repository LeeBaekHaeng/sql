SELECT * FROM comtnmenuinfo
ORDER BY menu_no
;

SELECT COUNT(*) FROM comtnmenuinfo
;

SELECT * FROM comtnmenuinfo WHERE menu_no = 0
;

--https://www.postgresql.org/docs/current/queries-with.html

--7.8.2.1. Search Order
--https://www.postgresql.org/docs/current/queries-with.html#QUERIES-WITH-SEARCH

--To add depth-first ordering information, you can write this:
--깊이 우선 순서 정보를 추가하려면 다음과 같이 작성할 수 있습니다.

--WITH RECURSIVE search_tree(id, link, data, path) AS (
--    SELECT t.id, t.link, t.data, ARRAY[t.id]
--    FROM tree t
--  UNION ALL
--    SELECT t.id, t.link, t.data, path || t.id
--    FROM tree t, search_tree st
--    WHERE t.id = st.link
--)
--SELECT * FROM search_tree ORDER BY path;

--WITH RECURSIVE search_tree(menu_no, upper_menu_no, menu_nm, path) AS (
--    SELECT t.menu_no, t.upper_menu_no, t.menu_nm, ARRAY[t.menu_no::numeric]
--    FROM comtnmenuinfo t
--    WHERE t.menu_no = 0
--  UNION ALL
--    SELECT t.menu_no, t.upper_menu_no, t.menu_nm, path || t.menu_no
--    FROM comtnmenuinfo t, search_tree st
----    WHERE t.menu_no = st.upper_menu_no
--WHERE t.upper_menu_no = st.menu_no
--and t.menu_no < 101000000
--)
--SELECT * FROM search_tree ORDER BY path;

--In the general case where more than one field needs to be used to identify a row, use an array of rows. For example, if we needed to track fields f1 and f2:
--행을 식별하기 위해 둘 이상의 필드를 사용해야 하는 일반적인 경우에는 행 배열을 사용합니다. 예를 들어 f1 및 f2 필드를 추적해야 하는 경우:

--WITH RECURSIVE search_tree(id, link, data, path) AS (
--    SELECT t.id, t.link, t.data, ARRAY[ROW(t.f1, t.f2)]
--    FROM tree t
--  UNION ALL
--    SELECT t.id, t.link, t.data, path || ROW(t.f1, t.f2)
--    FROM tree t, search_tree st
--    WHERE t.id = st.link
--)
--SELECT * FROM search_tree ORDER BY path;

--WITH RECURSIVE search_tree(menu_no, upper_menu_no, menu_nm, path) AS (
--    SELECT t.menu_no, t.upper_menu_no, t.menu_nm, ARRAY[ROW(t.menu_dc, t.progrm_file_nm)]
--    FROM comtnmenuinfo t
--WHERE t.menu_no = 0
--  UNION ALL
--    SELECT t.menu_no, t.upper_menu_no, t.menu_nm, path || ROW(t.menu_dc, t.progrm_file_nm)
--    FROM comtnmenuinfo t, search_tree st
--    WHERE t.menu_no = st.upper_menu_no
--and t.menu_no < 101000000
--and st.menu_no < 101000000
--)
--SELECT * FROM search_tree ORDER BY path;

--7.8.2.2. Cycle Detection
--https://www.postgresql.org/docs/current/queries-with.html#QUERIES-WITH-CYCLE

--WITH RECURSIVE search_graph(id, link, data, depth) AS (
--    SELECT g.id, g.link, g.data, 0
--    FROM graph g
--  UNION ALL
--    SELECT g.id, g.link, g.data, sg.depth + 1
--    FROM graph g, search_graph sg
--    WHERE g.id = sg.link
--)
--SELECT * FROM search_graph;

--WITH RECURSIVE search_graph(menu_no, upper_menu_no, menu_nm, depth) AS (
--    SELECT g.menu_no, g.upper_menu_no, g.menu_nm, 0
--    , g.menu_ordr
--    FROM comtnmenuinfo g
--WHERE g.menu_no = 0
--  UNION ALL
--    SELECT g.menu_no, g.upper_menu_no, g.menu_nm, sg.depth + 1
--    , g.menu_ordr
--    FROM comtnmenuinfo g, search_graph sg
----    WHERE g.menu_no = sg.upper_menu_no
----
--WHERE g.upper_menu_no = sg.menu_no
--and g.menu_no > 0
--)
--SELECT * FROM search_graph
--order by depth, menu_ordr
--;

--WITH RECURSIVE search_graph(id, link, data, depth, is_cycle, path) AS (
--    SELECT g.id, g.link, g.data, 0,
--      false,
--      ARRAY[g.id]
--    FROM graph g
--  UNION ALL
--    SELECT g.id, g.link, g.data, sg.depth + 1,
--      g.id = ANY(path),
--      path || g.id
--    FROM graph g, search_graph sg
--    WHERE g.id = sg.link AND NOT is_cycle
--)
--SELECT * FROM search_graph;

WITH RECURSIVE search_graph(menu_no, menu_ordr, menu_nm, depth, is_cycle, path
, upper_menu_no, menu_dc, relate_image_path, relate_image_nm, progrm_file_nm
) AS (
    SELECT g.menu_no, g.menu_ordr, g.menu_nm, 0,
      false,
      ARRAY[g.menu_no::numeric]
, g.upper_menu_no, g.menu_dc, g.relate_image_path, g.relate_image_nm, g.progrm_file_nm
    FROM comtnmenuinfo g
WHERE g.menu_no = 0
  UNION ALL
    SELECT g.menu_no, g.menu_ordr, g.menu_nm, sg.depth + 1,
      g.menu_no = ANY(path),
      path || g.menu_no
, g.upper_menu_no, g.menu_dc, g.relate_image_path, g.relate_image_nm, g.progrm_file_nm
    FROM comtnmenuinfo g, search_graph sg
--    WHERE g.menu_no = sg.upper_menu_no AND NOT is_cycle
    WHERE g.upper_menu_no = sg.menu_no AND NOT is_cycle
and g.menu_no > 0
)
SELECT * FROM search_graph
order by path
;

--comtnmenuinfo
--메뉴번호    메뉴순서    메뉴명 상위메뉴번호  메뉴설명    관련이미지경로 관련이미지명  프로그램파일명
--menu_no menu_ordr  menu_nm upper_menu_no menu_dc relate_image_path relate_image_nm progrm_file_nm
--menu_nm progrm_file_nm  menu_no upper_menu_no menu_ordr menu_dc relate_image_path relate_image_nm

--WITH RECURSIVE search_graph(upper_menu_no, menu_no, menu_nm, depth, is_cycle, path) AS (
--    SELECT g.upper_menu_no, g.menu_no, g.menu_nm, 0,
--      false,
--      ARRAY[g.upper_menu_no::numeric]
--    FROM comtnmenuinfo g
--WHERE g.menu_no = 0
--  UNION ALL
--    SELECT g.upper_menu_no, g.menu_no, g.menu_nm, sg.depth + 1,
--      g.upper_menu_no = ANY(path),
--      path || g.upper_menu_no
--    FROM comtnmenuinfo g, search_graph sg
--    WHERE g.upper_menu_no = sg.menu_no AND NOT is_cycle
----WHERE g.menu_no = sg.upper_menu_no AND NOT is_cycle
--and g.menu_no > 0
--)
--SELECT * FROM search_graph
--order by path
--;
