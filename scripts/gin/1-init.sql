-- Подходит для 1 и 4 эксперимента.
DROP SCHEMA IF EXISTS gin CASCADE;
CREATE SCHEMA gin;

-- 1k rows.
DROP TABLE IF EXISTS gin.1_users_1k CASCADE;
CREATE TABLE gin.1_users_1k (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    event_message text,
    event_message_tsv tsvector,
    logged_in TIMESTAMP
);

INSERT INTO gin.1_users_1k (event_message, logged_in)
SELECT
    ('User' || i || ' tried to authenticate in system' || j),
    time_hour
FROM 
    generate_series(1, 100) as i,
    generate_series(1, 1) as j,
    generate_series(
        TIMESTAMPTZ '2024-05-01', 
        TIMESTAMPTZ '2024-05-10', 
        INTERVAL '1 day'
    ) as time_hour;

UPDATE gin.1_users_1k set event_message_tsv = to_tsvector(event_message);

SELECT * from gin.1_users_1k;

-- 1k rows with GIN.
DROP TABLE IF EXISTS gin.1_users_gin_1k CASCADE;
CREATE TABLE gin.1_users_gin_1k (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    event_message text,
    event_message_tsv tsvector,
    logged_in TIMESTAMP
);

INSERT INTO gin.1_users_gin_1k (event_message, logged_in)
SELECT
    ('User' || i || ' tried to authenticate in system' || j),
    time_hour
FROM 
    generate_series(1, 100) as i,
    generate_series(1, 1) as j,
    generate_series(
        TIMESTAMPTZ '2024-05-01', 
        TIMESTAMPTZ '2024-05-10', 
        INTERVAL '1 day'
    ) as time_hour;

UPDATE gin.1_users_gin_1k set event_message_tsv = to_tsvector(event_message);

create index on gin.1_users_gin_1k using gin(event_message_tsv);
SELECT * from gin.1_users_gin_1k;

-- 1m rows.
DROP TABLE IF EXISTS gin.1_users_1m CASCADE;
CREATE TABLE gin.1_users_1m (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    event_message text,
    event_message_tsv tsvector,
    logged_in TIMESTAMP
);

INSERT INTO gin.1_users_1m (event_message, logged_in)
SELECT
    ('User' || i || ' tried to authenticate in system' || j),
    time_hour
FROM 
    generate_series(1, 100) as i,
    generate_series(1, 1000) as j,
    generate_series(
        TIMESTAMPTZ '2024-05-01', 
        TIMESTAMPTZ '2024-05-10', 
        INTERVAL '1 day'
    ) as time_hour;

UPDATE gin.1_users_1m set event_message_tsv = to_tsvector(event_message);

SELECT COUNT(*) from gin.1_users_1m;


-- 1m rows with GIN.
DROP TABLE IF EXISTS gin.1_users_gin_1m CASCADE;
CREATE TABLE gin.1_users_gin_1m (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    event_message text,
    event_message_tsv tsvector,
    logged_in TIMESTAMP
);

INSERT INTO gin.1_users_gin_1m (event_message, logged_in)
SELECT
    ('User' || i || ' tried to authenticate in system' || j),
    time_hour
FROM 
    generate_series(1, 100) as i,
    generate_series(1, 1000) as j,
    generate_series(
        TIMESTAMPTZ '2024-05-01', 
        TIMESTAMPTZ '2024-05-10', 
        INTERVAL '1 day'
    ) as time_hour;

UPDATE gin.1_users_gin_1m set event_message_tsv = to_tsvector(event_message);

create index on gin.1_users_gin_1k using gin(event_message_tsv);
SELECT COUNT(*) from gin.1_users_gin_1m;
