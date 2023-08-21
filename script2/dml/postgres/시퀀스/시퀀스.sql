/*

https://www.postgresql.org/docs/current/sql-createsequence.html

https://www.postgresql.org/docs/current/functions-sequence.html

*/

SELECT nextval('sq_comthdbmntrngloginfo_log_id');

SELECT setval('sq_comthdbmntrngloginfo_log_id', 1, false);

SELECT currval('sq_comthdbmntrngloginfo_log_id');

SELECT lastval();
