#sed -i 's#TOPDIR=$(dirname "${INSTALLPATH}")#TOPDIR=/opt/seafile#g' setup-seafile.sh
sed -i 's/read server_name/server_name="$SERVER_NAME"/g' setup-seafile.sh
sed -i 's/read ip_or_domain/ip_or_domain="$SERVER_ADDR"/g' setup-seafile.sh
sed -i 's/read dummy//g' setup-seafile.sh
sed -i 's/read server_port//g' setup-seafile.sh
sed -i 's/read seafile_server_port//g' setup-seafile.sh
sed -i 's/read httpserver_port//g' setup-seafile.sh
sed -i 's#read seafile_data_dir#seafile_data_dir=/opt/seafile/data#g' setup-seafile.sh
sed -i 's/read seahub_admin_email/seahub_admin_email="$ADMIN_EMAIL"/g' setup-seafile.sh
sed -i 's/read -s seahub_admin_passwd_again/seahub_admin_passwd_again="$ADMIN_PASSWORD"/g' setup-seafile.sh
sed -i 's/read -s seahub_admin_passwd/seahub_admin_passwd="$ADMIN_PASSWORD"/g' setup-seafile.sh
