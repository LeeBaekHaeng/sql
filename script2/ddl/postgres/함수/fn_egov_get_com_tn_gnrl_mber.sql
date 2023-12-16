--https://www.postgresql.org/docs/current/plpgsql.html

--https://www.postgresql.org/docs/current/extend.html

--38.5.10. SQL Functions Returning TABLE 
--https://www.postgresql.org/docs/current/xfunc-sql.html#XFUNC-SQL-FUNCTIONS-RETURNING-TABLE

--43.5.4. Executing Dynamic Commands
--https://www.postgresql.org/docs/current/plpgsql-statements.html#PLPGSQL-STATEMENTS-EXECUTING-DYN

CREATE
OR REPLACE
FUNCTION fn_egov_get_com_tn_gnrl_mber(
    in_esntl_id VARCHAR(20)
    , in_column_name VARCHAR
)
RETURNS VARCHAR
AS $$
DECLARE
    nm VARCHAR;
BEGIN
    EXECUTE 'SELECT ' || in_column_name || ' FROM '
        || 'COMTNGNRLMBER'
        || ' WHERE ESNTL_ID = $1'
       INTO nm
       USING in_esntl_id;
    RETURN nm;
END;
$$ LANGUAGE plpgsql;
