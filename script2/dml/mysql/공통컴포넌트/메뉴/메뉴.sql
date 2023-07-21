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
