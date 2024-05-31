ifneq (,$(wildcard ./.env))
    include .env
    export
endif

execute-init: ./scripts/gin/init.sql
	docker exec "${CONTAINER_NAME}" psql --dbname="${DB_NAME}" --username "${DB_USR}" --password "${DB_PWD}" --file /scripts/gin/init.sql

execute-experiments: ./scripts/gin/experiments.sql
	docker exec "${CONTAINER_NAME}" psql --dbname="${DB_NAME}" --username "${DB_USR}" --password "${DB_PWD}" --file /scripts/gin/experiments.sql

run:
	docker compose up --detach

stop:
	docker stop "${CONTAINER_NAME}"

connect:
	docker exec -it "${CONTAINER_NAME}" /bin/bash

connect-to-bd:
	docker exec -it "${CONTAINER_NAME}" mongosh --username "${DB_USR}" --password "${DB_PWD}"

