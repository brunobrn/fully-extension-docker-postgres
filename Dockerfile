# You need to specify the version of postgres with build version ARG --build-arg POSTGRES_VERSION=14 on docker build
ARG POSTGRES_VERSION

FROM postgres:${POSTGRES_VERSION}
ARG POSTGRES_VERSION

RUN apt update

RUN apt -y install postgresql-14-repack
RUN apt -y install postgresql-15-repack
RUN apt -y install postgresql-9.5-repack
RUN apt -y install postgresql-$PG_MAJOR-cron
RUN apt -y install postgresql-$PG_MAJOR-partman
RUN apt -y install postgresql-$PG_MAJOR-hypopg

COPY library/002_install_extensions.sh /docker-entrypoint-initdb.d/002_install_extensions.sh
COPY library/003_create_extensions.sql /docker-entrypoint-initdb.d/003_create_extensions.sql
RUN mkdir -p /var/lib/postgresql/data
RUN mkdir -p /var/lib/postgresql/data-slave
COPY library/init-script /etc/postgresql/init-script
RUN chmod 777 -R /var/lib/postgresql/
RUN chmod 777 -R /var/lib/postgresql/data
RUN chown -R postgres:postgres /var/lib/postgresql/
