#!/bin/bash
if [ "$1" == "start" ]; then
  (
    while [ ! -f /import.sql ]; do sleep 1; done
    echo "MySQL Import Detected, waiting for MySQL to be up...";
    
    while ! (echo "SHOW DATABASES;" | /usr/bin/mysql -u root); do sleep 1; done
    echo "MySQL Is up, importing..."
    
    cat /import.sql | mysql -u root
    
    echo "Setting root password..."
    mysqladmin -u root password 'changeme';
    
    echo "Done... self-destructing..."
    rm $0
  ) &
fi
