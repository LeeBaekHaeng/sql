/*

https://www.postgresql.org/docs/current/catalogs.html

Chapter 53. System Catalogs

41.37. pg_tables

https://www.postgresql.org/docs/8.0/view-pg-tables.html

*/

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , COL_DESCRIPTION(A.TABLE_NAME::REGCLASS::OID, 0) TABLE_COMMENTS
     , A.*
  FROM INFORMATION_SCHEMA.TABLES A
 WHERE 1 = 1
--   AND A.TABLE_CATALOG = 'db_com'
--   AND A.TABLE_SCHEMA = 'sc_com'
--   AND A.TABLE_NAME = 'comtngnrlmber'
   AND A.TABLE_NAME LIKE 'com%'
 ORDER BY 
       A.TABLE_CATALOG, A.TABLE_SCHEMA, A.TABLE_NAME
;

SELECT * FROM PG_TABLES
;

SELECT * FROM PG_DESCRIPTION
;

SELECT * FROM PG_NAMESPACE
;

/*

https://www.postgresql.org/docs/9.5/functions-info.html#FUNCTIONS-INFO-COMMENT-TABLE

The functions shown in Table 9-62 extract comments previously stored with the COMMENT command. A null value is returned if no comment could be found for the specified parameters.
표 9-62에 표시된 함수는 이전에 COMMENT 명령으로 저장된 주석을 추출합니다. 지정된 매개변수에 대한 설명을 찾을 수 없으면 null 값이 반환됩니다.

Table 9-62. Comment Information Functions
표 9-62. 댓글 정보 기능

col_description(table_oid, column_number)
get comment for a table column
테이블 열에 대한 설명 얻기

obj_description(object_oid, catalog_name)
get comment for a database object
데이터베이스 개체에 대한 설명 얻기

obj_description(object_oid)
get comment for a database object (deprecated)
데이터베이스 개체에 대한 설명 가져오기(더 이상 사용되지 않음)

shobj_description(object_oid, catalog_name) 
get comment for a shared database object
공유 데이터베이스 객체에 대한 코멘트 받기

col_description returns the comment for a table column, which is specified by the OID of its table and its column number. (obj_description cannot be used for table columns since columns do not have OIDs of their own.)
col_description은 테이블의 OID와 열 번호로 지정된 테이블 열에 대한 설명을 반환합니다. (열에는 자체 OID가 없으므로 테이블 열에는 obj_description을 사용할 수 없습니다.)

The two-parameter form of obj_description returns the comment for a database object specified by its OID and the name of the containing system catalog. For example, obj_description(123456,'pg_class') would retrieve the comment for the table with OID 123456. The one-parameter form of obj_description requires only the object OID. It is deprecated since there is no guarantee that OIDs are unique across different system catalogs; therefore, the wrong comment might be returned.
obj_description의 두 매개변수 형식은 OID와 포함 시스템 카탈로그의 이름으로 지정된 데이터베이스 개체에 대한 설명을 반환합니다. 예를 들어, obj_description(123456,'pg_class')는 OID가 123456인 테이블에 대한 주석을 검색합니다. obj_description의 단일 매개변수 형식에는 객체 OID만 필요합니다. OID가 여러 시스템 카탈로그에서 고유하다는 보장이 없으므로 더 이상 사용되지 않습니다. 따라서 잘못된 설명이 반환될 수 있습니다.

shobj_description is used just like obj_description except it is used for retrieving comments on shared objects. Some system catalogs are global to all databases within each cluster, and the descriptions for objects in them are stored globally as well.
shobj_description은 공유 객체에 대한 주석을 검색하는 데 사용된다는 점을 제외하면 obj_description과 동일하게 사용됩니다. 일부 시스템 카탈로그는 각 클러스터 내의 모든 데이터베이스에 전역적으로 적용되며, 해당 카탈로그의 개체에 대한 설명도 전역적으로 저장됩니다.

*/

SELECT /* DAO.selectList 조회(멀티건) */
       ROW_NUMBER() OVER() RN
     , COL_DESCRIPTION(A.OID, 0)
     , OBJ_DESCRIPTION(A.OID, 'pg_class')
     , OBJ_DESCRIPTION(A.OID)
     , SHOBJ_DESCRIPTION(A.OID, 'pg_class')
     , A.*
FROM PG_CLASS A
 WHERE 1 = 1
   AND A.RELNAME = 'comtngnrlmber'
;
