SELECT
    a.*
FROM comtnmenuinfo a /* �޴����� */
;

SELECT
    COUNT(*)
FROM comtnmenuinfo a /* �޴����� */
;

SELECT
    a.*
FROM comtnmenuinfo a /* �޴����� */
WHERE 1 = 1
--     AND a.menu_no = 0 /* �޴���ȣ*/
-- 
--     AND a.menu_no = 1 /* �޴���ȣ*/
--     AND a.menu_no = 2 /* �޴���ȣ*/
    AND a.menu_no IN (1, 2) /* �޴���ȣ*/
-- 
--     AND a.upper_menu_no = 1 /* �����޴���ȣ*/
--     AND a.upper_menu_no = 2 /* �����޴���ȣ*/
    AND a.upper_menu_no IN (1, 2) /* �����޴���ȣ*/
;
