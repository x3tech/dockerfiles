# Seafile Docker Container

## Research on Seafile start-up

TODO: Possibly change start-up sequence

### seaf-controller

seaf-controller gets launched by the seafile.sh script, it's used to start
the seafile components in the correct order and restarts them if they stop
running.

it launches the following commands:

#### seafdav (normal)

`<PYTHON_EXECUTABLE -m wsgidav.server.run_server --log-file <seafdav_log_file> --pid <SEAFDAV_PIDFILE> --port <SEAFDAV_PORT> --host 0.0.0.0`

or

#### seafdav (wsgi)

`<PYTHON_EXECUTABLE -m wsgidav.server.run_server --log-file <seafdav_log_file> --pid <SEAFDAV_PIDFILE> --port <SEAFDAV_PORT>`

#### httpserver

`httpserver -c <SEAFILE_CONFIG_DIR> -d <SEAFILE_DATA_DIR> -l <HTTPSERVER_LOGFILE> -P <HTTPSERVER_PIDFILE>`

#### seaf-server

`seaf-server -c <SEAFILE_CONFIG_DIR> -d <SEAFILE_DATA_DIR> -l <SEAF-SERVER_LOGFILE> -P <SEAF-SERVER_PIDFILE> -C`

#### ccnet-server

`ccnet-server -c <SEAFILE_CONFIG_DIR> -f <CCNET_LOGFILE> -d -P <CCNET_PIDFILE>`


### seahub

TODO

## TODO

* Figure out init system to use
* Write unit files for said init system for all components
