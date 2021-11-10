echo '
nameserver 192.168.122.1
' > /etc/resolv.conf

apt-get update
apt-get install nano
apt-get install squid
apt-get install apache2-utils

mv /etc/squid/squid.conf /etc/squid/squid.conf.bak

echo '
include /etc/squid/acl.conf

http_port 5000
visible_hostname jualbelikapal.c04.com

auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic children 5
auth_param basic realm Login
auth_param basic credentialsttl 2 hours
auth_param basic casesensitive on
acl USERS proxy_auth REQUIRED
http_access allow USERS AVAILABLE_WORKING
http_access deny all
' > /etc/squid/squid.conf

htpasswd -cm /etc/squid/passwd luffybelikapalc04

htpasswd -m /etc/squid/passwd zorobelikapalc04

echo '
    acl AVAILABLE_WORKING time MTWH 07:00-11:00
    acl AVAILABLE_WORKING time TWHF 17:00-23:59
    acl AVAILABLE_WORKING time WHFA 00:00-03:00
' > /etc/squid/acl.conf

service squid restart