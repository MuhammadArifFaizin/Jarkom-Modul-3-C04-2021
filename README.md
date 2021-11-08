# Jarkom-Modul-3-C04-2021

## Topologi
Berikut ini topologi yang digunakan pada praktikum ini

![Topologi](/img/Topologi.png)

### Soal 1

### Soal 2
Pada soal ini diminta agar node `Foosha` menjadi dhcp relay, agar node tersebut bisa menjadi relay maka pertama yang dilakukan adalah menginstall `isc-dhcp-relay` pada node tersebut

![2.1](/img/2.1.png)

Kemudian setelah mendownload maka edit file `isc-dhcp-relay` pada folder `/etc/default/` menjadi seperti berikut

![2.2](/img/2.2.png)

IP pada SERVERS adalah IP dari dhcp server yaitu node `Jipangu` yang memiliki IP `10.16.2.4`, dan INTERFACES diisi dengan `eth1 eth2 eth3` agar dapat merelay ke switch 1, 2, dan 3.

### Soal 3
Pada soal ini dhcp server diminta untuk mengconfigure range IP pada `switch 1` menjadi diantara `10.16.1.20` hingga `10.16.1.99` dan `10.16.1.150` hingga `10.16.1.169`.
Untuk mengerjakan soal ini maka pertama perlu menginstall `isc-dhcp-server` pada node `Jipangu`. 

![3.1](/img/3.1.png)

Setelah menginstall, kemudian edit file `/etc/default/isc-dhcp-server` pada INTERFACE diisi `eth0`. Kemudian mengedit file `/etc/dhcp/dhcpd.conf` menjadi seperti berikut ini.

![3.2](/img/3.2.png)

Pada subnet diisi IP `10.16.1.0` yaitu switch 1 dan dengan netmask `255.255.255.0`, kemudian isi range sesuai soal. 

### Soal 4
Pada soal ini diminta pada switch 3 untuk diconfigure dengan range IP `10.16.3.30` hingga `10.16.3.50`. Untuk itu maka diedit file `/etc/dhcp/dhcpd.conf` ditambahkan berikut ini.

![4.1](/img/4.1.png)

Pada subnet diisi IP `10.16.3.0` yaitu switch 3 dan dengan netmask `255.255.255.0`, kemudian isi range sesuai dengan soal.

### Soal 5
Pada soal ini diminta agar Client mendapat DNS dari EniesLobby dan dapat terhubung dengan internet melalui DNS tersebut. Untuk menyelesaikan masalah ini maka pada konfigurasi soal nomer 3 dan 4, terdapat bagian `option domain-name-servers` dan diisi dengan IP EniesLobby yaitu `10.16.2.2`.

