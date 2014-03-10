# MySQL Docker Image

## Import/Export

An import and export utility are present in this image. Example usage:

### Export

`docker run -v /backup/path/on-host:/backups -rm -link container-to-export:mysql x3tech/mysql /export`

This will create a .sql.gz file in `/backup/path/on-host` with a
timestamped filename (See export.sh for the format) containing data from
`container-to-export`

### Import

`zcat /path/to/export/on/host.sql.gz | docker run -i -rm -link destination:mysql x3tech/mysql /import`

This will import `/path/to/export/on/host.sql.gz` to `destination-container`

## TODO

Figure out why echoing into the import doesn't give any output
