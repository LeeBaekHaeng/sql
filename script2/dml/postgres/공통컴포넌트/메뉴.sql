select * from COMTNMENUINFO
;

select count(*) from COMTNMENUINFO
;

select * from COMTNMENUINFO where menu_no = 0
;

--https://www.postgresql.org/docs/current/queries-with.html

WITH RECURSIVE included_parts(sub_part, part, quantity) AS (
    SELECT sub_part, part, quantity FROM parts WHERE part = 'our_product'
  UNION ALL
    SELECT p.sub_part, p.part, p.quantity * pr.quantity
    FROM included_parts pr, parts p
    WHERE p.part = pr.sub_part
)
SELECT sub_part, SUM(quantity) as total_quantity
FROM included_parts
GROUP BY sub_part
;

WITH RECURSIVE included_parts(
grp_path
, depth
, is_cycle
, menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm) AS (
    select
    ARRAY[menu_no]
--    ARRAY[cast(menu_no as varchar)]
    , 0
    , false
    , menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm from COMTNMENUINFO where menu_no = 0
  UNION ALL
    select
    grp_path
--    ARRAY[p.menu_no]
--    grp_path || p.menu_no
--    cast(p.menu_no as varchar)
    , depth + 1
    , p.menu_no = ANY(grp_path)
    , p.menu_nm, p.progrm_file_nm, p.menu_no, p.upper_menu_no, p.menu_ordr, p.menu_dc, p.relate_image_path, p.relate_image_nm
--    FROM included_parts pr, COMTNMENUINFO p
    FROM COMTNMENUINFO p, included_parts pr
    WHERE p.upper_menu_no = pr.menu_no
--    WHERE pr.menu_no = p.upper_menu_no
--    AND NOT CYCLE
     AND NOT is_cycle
     and p.menu_no != 0
)
select
--path
--, depth
--, menu_nm, progrm_file_nm, menu_no, upper_menu_no, menu_ordr, menu_dc, relate_image_path, relate_image_nm
*
--count(*)
FROM included_parts
--order by path
--order by depth
--order by path, menu_ordr
--order by depth, menu_ordr
--limit 100
;
