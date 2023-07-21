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

WITH RECURSIVE RecursiveHierarchy AS (
  SELECT id, name, parent_id
  FROM your_table
  WHERE id = 1 -- 최상위 노드 ID

  UNION ALL

  SELECT t.id, t.name, t.parent_id
  FROM your_table t
  INNER JOIN RecursiveHierarchy r ON t.parent_id = r.id
)
SELECT id, name
FROM RecursiveHierarchy;
