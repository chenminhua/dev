up:
	docker-compose up -d

pgcli:
	pgcli -h localhost -u stan -d test

default-config:
	docker run -i --rm postgres cat /usr/share/postgresql/postgresql.conf.sample > my-postgres.conf