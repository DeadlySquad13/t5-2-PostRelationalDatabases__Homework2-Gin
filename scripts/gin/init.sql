DROP SCHEMA IF EXISTS gin CASCADE;
CREATE SCHEMA gin;

-- В БД создать две-три связанные таблицы по теме, выданной преподавателем.
-- - RepoUser.
DROP TABLE IF EXISTS gin.users CASCADE;
CREATE TABLE gin.users (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(256)
);

INSERT INTO gin.users ( username )
VALUES ('Sasha'),
       ('Vladik'),
       ('Misha'),
       ('Vadim'),
       ('Pasha'),
       ('Vanya');

SELECT * FROM gin.users;
