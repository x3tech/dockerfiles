# NGINX Docker Image

## Import/Export

An import and export utility are present in this image. Example usage:

### Export

`docker run -v /backup/path/on-host:/backups -rm -volumes-from container-to-export x3tech/nginx /export`

This will create a .tar.gz file in `/backup/path/on-host` with a
timestamped filename (See export.sh for the format) containing data from
`container-to-export`

### Import

`cat /path/to/export/on/host.tar.gz | docker run -i -rm -volumes-from destination-container x3tech/nginx /import`

This will import `/path/to/export/on/host.tar.gz` to `destination-container`
