--INFORMATION_SCHEMA 정보_스키마

--https://www.postgresql.org/docs/current/information-schema.html

--테이블/뷰/함수/시퀀스 권한 조회
--01.테이블/02.뷰/03.함수/04.시퀀스 권한 조회

-- 컬럼 권한 조회
--37.35. role_column_grants
SELECT * FROM INFORMATION_SCHEMA.ROLE_COLUMN_GRANTS
where 1 = 1
and table_schema like 'sc_%'
order by table_catalog, table_schema, table_name, column_name
;

-- 함수 권한 조회
--37.36. role_routine_grants
SELECT * FROM INFORMATION_SCHEMA.ROLE_ROUTINE_GRANTS
where 1 = 1
and specific_schema like 'sc_%'
order by specific_catalog, specific_schema, specific_name
;

-- 테이블 권한 조회
--37.37. role_table_grants
SELECT
'REVOKE ALL ON TABLE ' || table_schema || '.' || table_name || ' FROM ' || grantee || ';' REVOKE_TABLE /* 테이블 권한 취소 */
, A.*
FROM INFORMATION_SCHEMA.ROLE_TABLE_GRANTS A
where 1 = 1
and table_schema like 'sc_%'
and grantee = 'postgres'
order by table_catalog, table_schema, table_name
;

SELECT grantee, count(*) FROM INFORMATION_SCHEMA.ROLE_TABLE_GRANTS
where 1 = 1
and table_schema like 'sc_%'
group by grantee
order by grantee
;

--TYPE USAGE
--37.38. role_udt_grants
SELECT * FROM INFORMATION_SCHEMA.ROLE_UDT_GRANTS
where 1 = 1
and udt_schema like 'sc_%'
order by udt_catalog, udt_schema, udt_name
;

--시퀀스 권한 조회
--37.39. role_usage_grants
SELECT * FROM INFORMATION_SCHEMA.role_usage_grants
where 1 = 1
and object_schema like 'sc_%'
order by object_catalog, object_schema, object_name
;

SELECT object_type, count(*) FROM INFORMATION_SCHEMA.role_usage_grants
where 1 = 1
and object_schema like 'sc_%'
group by object_type
order by object_type
;
