pg_ctl -U postgres init -w -D /home/postgresql/data
pg_ctl -U postgres start -D /home/postgresql/data
sleep 1
su postgres -s /usr/bin/psql < /root/db/users.sql
psql -U radius radius -f /etc/freeradius2/sql/postgresql/schema.sql
psql -U radius radius -f /root/db/content.sql
pg_ctl -U postgres stop -D /home/postgresql/data -m smart
