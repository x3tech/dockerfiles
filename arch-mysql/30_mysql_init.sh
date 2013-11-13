#!/bin/bash
if [ "$1" == "start" ]; then
  (
    while ! (echo "SHOW DATABASES;" | /usr/bin/mysql -u root 2>&1 > /dev/null); do sleep 1; done
    echo "MySQL Is up, initialising..."

    # Create the user
    echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
    echo "CREATE DATABASE ${MYSQL_USER}_${MYSQL_DB};" | mysql -u root 
    echo "GRANT ALL ON \`${MYSQL_USER}\\_%\`.* TO '${MYSQL_USER}'@'%';" | mysql -u root

    # Delete anonymous user
    echo "DELETE FROm mysql.user WHERE user='';" | mysql -u root

    # Allow root from everywhere
    echo "UPDATE mysql.user SET host='%' WHERE user='root' AND host='127.0.0.1';" | mysql -u root

    # Set root password
    echo "Setting root password..."
    echo "UPDATE mysql.user SET password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE user='root';" | mysql -u root

    # Flush privileges
    echo "FLUSH PRIVILEGES;" | mysql -u root

    echo "Done... self-destructing..."
    rm $0
  ) &
fi
