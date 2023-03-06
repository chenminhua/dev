#!/bin/bash

shell() {
  if [ -z "$*" ]; then
    docker-compose exec pg bash
  else
    docker-compose exec -T pg bash -c "$*"
  fi
}

psql() {
  docker-compose exec -T pg bash -c "psql \"$*\""
}

logs() {
  shell 'tail -qF /var/log/postgresql/postgresql-*'
}

reload() {
  shell 'su - postgres -c "/usr/lib/postgresql/13/bin/pg_ctl -D $PGDATA reload"'
}

restart() {
  docker-compose restart pg
}

action="$1"
shift
if [ -z "$action" ]; then
  echo "Usage:"
  echo "  ./postgres.sh shell|psql|logs|reload|restart|"
  exit 1
fi

cd "$(dirname "$0")"
"$action" "$@"
