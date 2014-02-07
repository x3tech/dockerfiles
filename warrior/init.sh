#!/bin/bash

git clone $PROJECT_URL /opt/warrior-script
chown -R archiveteam:archiveteam /opt/warrior-script
cd /opt/warrior-script
exec su -c "while true; do run-pipeline pipeline.py --concurrent $CONCURRENT '$USERNAME'; sleep 1; done"
