echo '
nameserver 192.168.122.1
' > /etc/resolv.conf

apt-get update
apt-get install bind9 -y
apt-get install nano -y

echo ' 
    options {
        directory "/var/cache/bind";
        forwarders {
                    192.168.122.1;
            };
        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
    };
' > /etc/bind/named.conf.options

echo '
zone "super.franky.c04.com" {
        type master;
        notify yes;
        file "/etc/bind/kaizoku/super.franky.c04.com";
        allow-transfer { 10.16.3.69; };
};
' > /etc/bind/named.conf.local

mkdir /etc/bind/kaizoku

echo '
$TTL    604800
@       IN      SOA     super.franky.c04.com. root.super.franky.c04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      super.franky.c04.com.
@       IN      A       10.16.3.69
www     IN      CNAME   super.franky.c04.com.
@       IN      AAAA    ::1
' > /etc/bind/kaizoku/super.franky.c04.com

service bind9 restart