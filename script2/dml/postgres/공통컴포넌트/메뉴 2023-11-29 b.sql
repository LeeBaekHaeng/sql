SELECT * FROM comtnmenuinfo
ORDER BY menu_no
;

SELECT COUNT(*) FROM comtnmenuinfo
;

SELECT * FROM comtnmenuinfo WHERE menu_no = 0
;

--comtnmenuinfo
--메뉴번호    메뉴순서    메뉴명 상위메뉴번호  메뉴설명    관련이미지경로 관련이미지명  프로그램파일명
--menu_no menu_ordr  menu_nm upper_menu_no menu_dc relate_image_path relate_image_nm progrm_file_nm
--menu_nm progrm_file_nm  menu_no upper_menu_no menu_ordr menu_dc relate_image_path relate_image_nm

select * from COMTNPROGRMLIST a /* 프로그램목록 */
;

--progrm_file_nm

--https://www.postgresql.org/docs/current/queries-with.html

WITH RECURSIVE search_graph(menu_no, menu_ordr, menu_nm, depth, is_cycle, path
, path2
, upper_menu_no, menu_dc, relate_image_path, relate_image_nm, progrm_file_nm
) AS (
    SELECT g.menu_no, g.menu_ordr, g.menu_nm, 0,
      false,
      ARRAY[g.menu_ordr::numeric]
, ARRAY[g.menu_nm::varchar]
, g.upper_menu_no, g.menu_dc, g.relate_image_path, g.relate_image_nm, g.progrm_file_nm
    FROM comtnmenuinfo g
WHERE g.menu_no = 0
  UNION ALL
    SELECT g.menu_no, g.menu_ordr, g.menu_nm, sg.depth + 1,
      g.menu_no = ANY(path),
      path || g.menu_ordr
, path2 || g.menu_nm
, g.upper_menu_no, g.menu_dc, g.relate_image_path, g.relate_image_nm, g.progrm_file_nm
    FROM comtnmenuinfo g, search_graph sg
--    WHERE g.menu_no = sg.upper_menu_no AND NOT is_cycle
    WHERE g.upper_menu_no = sg.menu_no AND NOT is_cycle
and g.menu_no > 0
)
SELECT * FROM search_graph a
left outer join COMTNPROGRMLIST b /* 프로그램목록 */ on b.progrm_file_nm = a.progrm_file_nm
order by path
;
