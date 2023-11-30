/*

12  보안관리    COMTNAUTHORGROUPINFO    권한그룹정보
13  보안관리    COMTNAUTHORINFO 권한정보
14  보안관리    COMTNROLES_HIERARCHY    롤 계층구조
15  보안관리    COMTNROLEINFO   롤정보
16  보안관리    COMTNAUTHORROLERELATE   권한롤관계

*/


select * from COMTNAUTHORGROUPINFO
;

select * from COMTNAUTHORINFO
order by author_code
;

/*

ROLE_ADMIN  관리자
ROLE_ANONYMOUS  익명 사용자
ROLE_USER   일반 사용자

ROLE_ANONYMOUS  익명 사용자 /raa/
ROLE_USER   일반 사용자 /ru/
ROLE_ADMIN  관리자 /rad/

*/

select * from COMTNROLES_HIERARCHY
;

select * from COMTNROLEINFO
order by role_code
;

select * from COMTECOPSEQ where table_name = 'ROLE_ID';

select * from COMTNAUTHORROLERELATE
order by author_code, role_code
;

--/* 롤정보 */
--/* 임업비서앱 */
--INSERT INTO COMTNROLEINFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000020', '메인화면 호출(로그인 후) 롤', '\\A/ms/initMSAA0003M01.do.*\\Z', '메인화면 호출(로그인 후) 허용을 위한 롤', 'url', '1', NOW());
--INSERT INTO COMTNROLEINFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000021', '날씨 단기예보 정보 가져오기 롤', '\\A/ms/getWeatherInfo.do.*\\Z', '날씨 단기예보 정보 가져오기 허용을 위한 롤', 'url', '1', NOW());
--INSERT INTO COMTNROLEINFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000022', '주요알림 ( 공지사항, 교육일정 ) 롤', '\\A/ms/aa/selectMSAA0003S03List.do.*\\Z', '주요알림 ( 공지사항, 교육일정 ) 허용을 위한 롤', 'url', '1', NOW());
--
----\\A/uat/uia/.*\\.do.*\\Z
--
--update COMTECOPSEQ set NEXT_ID = 200 where TABLE_NAME = 'ROLE_ID';

-- 권한 롤 매핑
/* 임업비서앱 */
--INSERT INTO COMTNAUTHORROLERELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000020', NOW());
--INSERT INTO COMTNAUTHORROLERELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000021', NOW());
--INSERT INTO COMTNAUTHORROLERELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000022', NOW());
