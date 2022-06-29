# You need to specify the version of postgres with build version ARG --build-arg POSTGRES_VERSION=14 on docker build
ARG POSTGRES_VERSION
# ENV POSTGRES_VERSION ${POSTGRES_VERSION}

FROM postgres:${POSTGRES_VERSION}
ARG POSTGRES_VERSION

RUN apt update

RUN apt -y install postgresql-$PG_MAJOR-cron
# To use pg_cron execute docker run with this two -c inputs 
#-c shared_preload_libraries='pg_cron' -c cron.database_name='database_name'


RUN apt -y install postgresql-$PG_MAJOR-repack
RUN apt -y install postgresql-$PG_MAJOR-partman
RUN apt -y install postgresql-$PG_MAJOR-hypopg

# To active the extension pg_stat_statements you need to put the below input on docker run command
# -c shared_preload_libraries='pg_stat_statements'