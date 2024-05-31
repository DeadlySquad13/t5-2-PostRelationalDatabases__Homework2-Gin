-- SELECT * from gin.users_1k;

-- Эксперименты

-- 3.1.	С применением индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 1).
-- \o /xmldocs/3.1.json



-- \o

-- 3.2.	Без применения индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 2).
/* \o /experiment_data/3.2.json

-- 3.2.1 Селективность 1%
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1');

-- 3.2.2 Селективность 3%
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3');

-- 3.2.3 Селективность 10%
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');

-- 3.2.4 Селективность 20%
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10 | User11 | User12 | User13 | User14 | User15 | User16 | User17 | User18 | User19 | User20');

\o */

-- 3.3.	С применением индексов, зафиксированной селективностью (10%) и вариацией количества записей (по таблице 1).


-- 3.4.	Без применения индексов, зафиксированной селективностью (10%) и вариацией количества записей (по таблице 2).
/* \o /experiment_data/3.4.json
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');

explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1m where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');
\o */
