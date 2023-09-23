#!/bin/sh

cat <<EOT >> ${PGDATA}/postgresql.conf
shared_preload_libraries='pg_cron,pg_stat_statements'
cron.database_name='${POSTGRES_DB}'
wal_level=logical
max_replication_slots=16
max_wal_senders=16
EOT

# Required to load pg_cron
pg_ctl restart