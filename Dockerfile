# You need to specify the version of postgres with build version ARG --build-arg POSTGRES_VERSION=14 on docker build
ARG POSTGRES_VERSION

FROM postgres:${POSTGRES_VERSION}
ARG POSTGRES_VERSION

COPY library/002_install_extensions.sh /docker-entrypoint-initdb.d/002_install_extensions.sh
COPY library/003_create_extensions.sql /docker-entrypoint-initdb.d/003_create_extensions.sql

RUN apt update

RUN apt -y install postgresql-14-repack
RUN apt -y install postgresql-9.5-repack
RUN apt -y install postgresql-$PG_MAJOR-cron
RUN apt -y install postgresql-$PG_MAJOR-partman
RUN apt -y install postgresql-$PG_MAJOR-hypopg
