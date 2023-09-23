psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	SELECT active FROM pg_replication_slots;
EOSQL
