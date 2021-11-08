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
Kemudian menjalankan command `service isc-dhcp-service restart`, dan di cek status sudah jalan atau belum dengan `service isc-dhcp-service status`

### Soal 4
Pada soal ini diminta pada switch 3 untuk diconfigure dengan range IP `10.16.3.30` hingga `10.16.3.50`. Untuk itu maka diedit file `/etc/dhcp/dhcpd.conf` ditambahkan berikut ini.

![4.1](/img/4.1.png)

Pada subnet diisi IP `10.16.3.0` yaitu switch 3 dan dengan netmask `255.255.255.0`, kemudian isi range sesuai dengan soal.
Kemudian menjalankan command `service isc-dhcp-service restart`, dan di cek status sudah jalan atau belum dengan `service isc-dhcp-service status`

### Soal 5
Pada soal ini diminta agar Client mendapat DNS dari EniesLobby dan dapat terhubung dengan internet melalui DNS tersebut. Untuk menyelesaikan masalah ini maka pada konfigurasi soal nomer 3 dan 4, terdapat bagian `option domain-name-servers` dan diisi dengan IP EniesLobby yaitu `10.16.2.2`.

![5.1](/img/5.1.png)

### Soal 6
Pada soal ini diminta untuk DHCP meminjamkan IP pada switch 1 selama 6 menit dan switch 3 selama 12 menit, dan keduanya memiliki waktu maksimal selama 120 menit. Apabila dikonversi menjadi detik, maka switch 1 menjadi 360 detik, switch 3 menjadi 720 detik, dan waktu maksimal yaitu 7200 detik. Maka pada konfigurasi soal nomor 3 dan 4, pada bagian `default-lease-time` yaitu lama waktu peminjaman sehingga switch 1 = 360 detik dan switch 3 = 720 detik. dan `max-lease-time` diisi dengan 7200 detik.

![6.1](/img/6.1.png)

Maka hasil dijalankan pada switch 1 seperti berikut

![Alabasta](/img/Client.png)

dan switch 3 seperti berikut

![TottoLand](/img/TottoLand.png)

### Soal 7
Pada soal ini diminta agar node Skypie memiliki `fixed address` yaitu 10.16.3.69 , maka pertama ditambahkan di node `Jipangu` pada file `/etc/dhcp/dhcpd.conf` seperti berikut.

![7.1](/img/7.1.png)

Dengan pada `hardware ethernet` diisi dengan physical address skypie
Kemudian menjalankan command `service isc-dhcp-service restart`, dan di cek status sudah jalan atau belum dengan `service isc-dhcp-service status`
Pada node skypie diedit file `/etc/network/interfaces` menjadi seperti berikut.

![7.2](/img/7.2.png)

Dengan `hwaddress ether` diisi dengan physical address skypie.
Kemudian merestart node Skypie dan apabila benar maka akan terlihat hasil seperti berikut.

![Skypie](/img/Skypie.png)

### Soal 8

### Soal 9

### Soal 10

### Soal 11

### Soal 12

### Soal 13
