# Image to test Postgres environments with some extensions

The objective is make the tests more easier in Postgres with this extensions already installed, we can use all the last minor version of majors versions.

### Versions available to pull

| Major  | Minor  | 
|---|---|
|  14 | 4  |
|  14 | 2  |
| 13  | 6  |
| 12  | 10  |
| 11  | 15  |
| 10  | 20  |
| 9  | 6  |

### Example of usage

The env inputs are the same of postgres official images, you can check the official documentation [here](https://hub.docker.com/_/postgres).


``` sh
docker run -e POSTGRES_PASSWORD=your_password fariasbrunobrn/postgres-fully-extension:<TAG>
``` 

To active **pg_cron** or **pg_stat_statements** you need to use -c input to configure some parameters, like below

```sh
# pg_cron
-c shared_preload_libraries='pg_cron' -c cron.database_name='postgres'

# pg_stat_statements
-c shared_preload_libraries='pg_stat_statements'
```

``` sh
docker run -e POSTGRES_DB=postgres -e POSTGRES_USER=user_app -e POSTGRES_PASSWORD=your_password fariasbrunobrn/postgres-fully-extension -c shared_preload_libraries='pg_stat_statements,pg_cron' -c cron.database_name='postgres'
``` 
