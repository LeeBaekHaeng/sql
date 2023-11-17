postgresql search_path

https://www.devkuma.com/docs/postgresql/%EC%8A%A4%ED%82%A4%EB%A7%88-%EA%B2%80%EC%83%89-%EA%B2%BD%EB%A1%9C%EB%A5%BC-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0/

show search_path;

--public, public, "$user"

SET search_path TO public, "$user", test_schema;

SET search_path TO test_schema;

ALTER ROLE test_user SET search_path = public, "$user", test_schema;

ALTER ROLE test_user SET search_path = test_schema;
