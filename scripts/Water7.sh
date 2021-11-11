echo '
nameserver 192.168.122.1
' > /etc/resolv.conf

apt-get update
apt-get install nano -y
apt-get install squid -y
apt-get install apache2-utils -y

mv /etc/squid/squid.conf /etc/squid/squid.conf.bak

echo '
include /etc/squid/acl.conf
include /etc/squid/acl-bandwith.conf

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

acl BLACKLIST dstdomain google.com
deny_info http://super.franky.c04.com/ BLACKLIST
http_reply_access deny BLACKLIST

' > /etc/squid/squid.conf

htpasswd -cm /etc/squid/passwd luffybelikapalc04

htpasswd -m /etc/squid/passwd zorobelikapalc04

echo '
    acl AVAILABLE_WORKING time MTWH 07:00-11:00
    acl AVAILABLE_WORKING time TWHF 17:00-23:59
    acl AVAILABLE_WORKING time WHFA 00:00-03:00
' > /etc/squid/acl.conf

echo '
    acl download url_regex -i \.jpg$ \.png$
    auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
    acl luffy proxy_auth luffybelikapalc04
    acl zoro proxy_auth zorobelikapalc04

    delay_pools 2
    delay_class 1 1
    delay_parameters 1 10000/10000
    delay_access 1 deny zoro
    delay_access 1 allow download
    delay_access 1 deny all

    delay_class 2 1
    delay_parameters 2 none
    delay_access 2 allow !luffy
' > /etc/squid/acl-bandwith.conf

echo '
# nameserver 192.168.122.1
nameserver 10.16.2.2
' > /etc/resolv.conf

service squid restart