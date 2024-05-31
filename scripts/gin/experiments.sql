/* -- Эксперименты.

-- 1 В tsquery используется только включение слова.

-- 1.1.	С применением индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 1).

\o /experiment_data/1.1.json

-- 1.1.1 Селективность 1%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1');

-- 1.1.2 Селективность 3%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1');

-- 1.1.3 Селективность 10%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1');

-- 1.1.4 Селективность 20%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1');

\o

-- 1.2.	Без применения индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 2).
\o /experiment_data/1.2.json

-- 1.2.1 Селективность 1%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1');

-- 1.2.2 Селективность 3%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1');

-- 1.2.3 Селективность 10%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1');

-- 1.2.4 Селективность 20%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1');

\o

-- 2 В tsquery используется включение слова1 и слова2

-- 2.1.	С применением индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 1).

\o /experiment_data/2.1.json

-- 2.1.1 Селективность 1%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1 & User2');

-- 2.1.2 Селективность 3%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1 & User2');

-- 2.1.3 Селективность 10%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1 & User2');

-- 2.1.4 Селективность 20%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1 & User2');

\o

-- 2.2.	Без применения индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 2).

\o /experiment_data/2.2.json

-- 2.2.1 Селективность 1%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1 & User2');

-- 2.2.2 Селективность 3%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1 & User2');

-- 2.2.3 Селективность 10%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1 & User2');

-- 2.2.4 Селективность 20%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1 & User2');

\o

-- 2.3.	С применением индексов, зафиксированной селективностью (10%) и вариацией количества записей (по таблице 1).

\o /experiment_data/2.3.json

-- 2.3.1 Количество записей: 1.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1k where event_message_tsv @@ to_tsquery('User1 & User2');

-- 2.3.2 Количество записей: 1.000.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_gin_1m where event_message_tsv @@ to_tsquery('User1 & User2');

\o

-- 2.4.	Без применения индексов, зафиксированной селективностью (10%) и вариацией количества записей (по таблице 2).

\o /experiment_data/2.4.json

-- 2.4.1 Количество записей: 1.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1k where event_message_tsv @@ to_tsquery('User1 & User2');

-- 2.4.2 Количество записей: 1.000.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.1_users_1m where event_message_tsv @@ to_tsquery('User1 & User2');

\o

-- 3 В tsquery используется включение слова1 или слова2

-- 3.1.	С применением индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 1).

\o /experiment_data/3.1.json

-- 3.1.1 Селективность 1%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 | User1');

-- 3.1.2 Селективность 3%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3');

-- 3.1.3 Селективность 10%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');

-- 3.1.4 Селективность 20%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10 | User11 | User12 | User13 | User14 | User15 | User16 | User17 | User18 | User19 | User20');

\o

-- 3.2.	Без применения индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 2).

\o /experiment_data/3.2.json

-- 3.2.1 Селективность 1%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1');

-- 3.2.2 Селективность 3%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3');

-- 3.2.3 Селективность 10%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');

-- 3.2.4 Селективность 20%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10 | User11 | User12 | User13 | User14 | User15 | User16 | User17 | User18 | User19 | User20');

\o

-- 3.3.	С применением индексов, зафиксированной селективностью (10%) и вариацией количества записей (по таблице 1).

\o /experiment_data/3.3.json

-- 3.3.1 Количество записей: 1.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');

-- 3.3.2 Количество записей: 1.000.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1m where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');

\o

-- 3.4.	Без применения индексов, зафиксированной селективностью (10%) и вариацией количества записей (по таблице 2).

\o /experiment_data/3.4.json

-- 3.4.1 Количество записей: 1.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');

-- 3.4.2 Количество записей: 1.000.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1m where event_message_tsv @@ to_tsquery('User1 | User2 | User3 | User4 | User5 | User6 | User7 | User8 | User9 | User10');

\o

-- 4 В tsquery используется слово1 <-> слово2

-- 4.1.	С применением индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 1).

\o /experiment_data/4.1.json

-- 4.1.1 Селективность 1%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

-- 4.1.2 Селективность 3%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

-- 4.1.3 Селективность 10%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

-- 4.1.4 Селективность 20%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

\o

-- 4.2.	Без применения индексов, фиксированным количеством записей (1000 шт.) и вариацией селективности (по таблице 2).

\o /experiment_data/4.2.json

-- 4.2.1 Селективность 1%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

-- 4.2.2 Селективность 3%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

-- 4.2.3 Селективность 10%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

-- 4.2.4 Селективность 20%.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

\o

-- 4.3.	С применением индексов, зафиксированной селективностью (10%) и вариацией количества записей (по таблице 1).

\o /experiment_data/4.3.json

-- 4.3.1 Количество записей: 1.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

-- 4.3.2 Количество записей: 1.000.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_gin_1m where event_message_tsv @@ to_tsquery('User1 <-> tried');

\o

-- 4.4.	Без применения индексов, зафиксированной селективностью (10%) и вариацией количества записей (по таблице 2).

\o /experiment_data/4.4.json

-- 4.4.1 Количество записей: 1.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1k where event_message_tsv @@ to_tsquery('User1 <-> tried');

-- 4.4.2 Количество записей: 1.000.000.
explain(analyze 1, format json, timing 1)
SELECT event_message from gin.users_1m where event_message_tsv @@ to_tsquery('User1 <-> tried');

\o */

explain(analyze 1, format text, timing 1)
SELECT event_message from gin.users_1m where event_message_tsv @@ to_tsquery('User1 <-> tried');

explain(analyze 1, format text, timing 1)
SELECT event_message from gin.users_gin_1m where event_message_tsv @@ to_tsquery('User1 <-> tried');

