# Jarkom-Modul-3-C04-2021

Kelompok : C4

Anggota Kelompok :

- Muhammad Arif Faizin (05111940000060)
- Aufi Fillah (05111940000148)
- Abiya Sabitta Ragadani (05111940000166)

## Soal
Luffy yang sudah menjadi Raja Bajak Laut ingin mengembangkan daerah kekuasaannya dengan membuat peta seperti berikut:

![Topologi](/img/Topologi.png)

Luffy bersama Zoro berencana membuat peta tersebut dengan kriteria EniesLobby sebagai DNS Server, Jipangu sebagai DHCP Server, Water7 sebagai Proxy Server (1), dan Foosha sebagai DHCP Relay (2). Luffy dan Zoro menyusun peta tersebut dengan hati-hati dan teliti.

Ada beberapa kriteria yang ingin dibuat oleh Luffy dan Zoro, yaitu:
Semua client yang ada HARUS menggunakan konfigurasi IP dari DHCP Server.
Client yang melalui Switch1 mendapatkan range IP dari [prefix IP].1.20 - [prefix IP].1.99 dan [prefix IP].1.150 - [prefix IP].1.169 (3)
Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.30 - [prefix IP].3.50 (4)
Client mendapatkan DNS dari EniesLobby dan client dapat terhubung dengan internet melalui DNS tersebut. (5)
Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch1 selama 6 menit sedangkan pada client yang melalui Switch3 selama 12 menit. Dengan waktu maksimal yang dialokasikan untuk peminjaman alamat IP selama 120 menit. (6)
    
Luffy dan Zoro berencana menjadikan Skypie sebagai server untuk jual beli kapal yang dimilikinya dengan alamat IP yang tetap dengan IP [prefix IP].3.69 (7). Loguetown digunakan sebagai client Proxy agar transaksi jual beli dapat terjamin keamanannya, juga untuk mencegah kebocoran data transaksi.

Pada Loguetown, proxy harus bisa diakses dengan nama jualbelikapal.yyy.com dengan port yang digunakan adalah 5000 (8). Agar transaksi jual beli lebih aman dan pengguna website ada dua orang, proxy dipasang autentikasi user proxy dengan enkripsi MD5 dengan dua username, yaitu luffybelikapalyyy dengan password luffy_yyy dan zorobelikapalyyy dengan password zoro_yyy (9). Transaksi jual beli tidak dilakukan setiap hari, oleh karena itu akses internet dibatasi hanya dapat diakses setiap hari Senin-Kamis pukul 07.00-11.00 dan setiap hari Selasa-Jum’at pukul 17.00-03.00 keesokan harinya (sampai Sabtu pukul 03.00) (10).

Agar transaksi bisa lebih fokus berjalan, maka dilakukan redirect website agar mudah mengingat website transaksi jual beli kapal. Setiap mengakses google.com, akan diredirect menuju super.franky.yyy.com dengan website yang sama pada soal shift modul 2. Web server super.franky.yyy.com berada pada node Skypie (11).

Saatnya berlayar! Luffy dan Zoro akhirnya memutuskan untuk berlayar untuk mencari harta karun di super.franky.yyy.com. Tugas pencarian dibagi menjadi dua misi, Luffy bertugas untuk mendapatkan gambar (.png, .jpg), sedangkan Zoro mendapatkan sisanya. Karena Luffy orangnya sangat teliti untuk mencari harta karun, ketika ia berhasil mendapatkan gambar, ia mendapatkan gambar dan melihatnya dengan kecepatan 10 kbps (12). Sedangkan, Zoro yang sangat bersemangat untuk mencari harta karun, sehingga kecepatan kapal Zoro tidak dibatasi ketika sudah mendapatkan harta yang diinginkannya (13).

Keterangan :
yyy adalah nama kelompok Anda
Untuk nomor 9, harus htpasswd yang melakukan enkripsi
Bisa melakukan wget https://raw.githubusercontent.com/FeinardSlim/Praktikum-Modul-2-Jarkom/main/super.franky.zip untuk mendapatkan file untuk super.franky.yyy.com

## Jawaban

## Soal 1

## Soal 2
Pada soal ini diminta agar node `Foosha` menjadi dhcp relay, agar node tersebut bisa menjadi relay maka pertama yang dilakukan adalah menginstall `isc-dhcp-relay` pada node tersebut

![2.1](/img/2.1.png)

Kemudian setelah mendownload maka edit file `isc-dhcp-relay` pada folder `/etc/default/` menjadi seperti berikut

![2.2](/img/2.2.png)

IP pada SERVERS adalah IP dari dhcp server yaitu node `Jipangu` yang memiliki IP `10.16.2.4`, dan INTERFACES diisi dengan `eth1 eth2 eth3` agar dapat merelay ke switch 1, 2, dan 3.

## Soal 3
Pada soal ini dhcp server diminta untuk mengconfigure range IP pada `switch 1` menjadi diantara `10.16.1.20` hingga `10.16.1.99` dan `10.16.1.150` hingga `10.16.1.169`.
Untuk mengerjakan soal ini maka pertama perlu menginstall `isc-dhcp-server` pada node `Jipangu`. 

![3.1](/img/3.1.png)

Setelah menginstall, kemudian edit file `/etc/default/isc-dhcp-server` pada INTERFACE diisi `eth0`. Kemudian mengedit file `/etc/dhcp/dhcpd.conf` menjadi seperti berikut ini.

![3.2](/img/3.2.png)

Pada subnet diisi IP `10.16.1.0` yaitu switch 1 dan dengan netmask `255.255.255.0`, kemudian isi range sesuai soal. 
Kemudian menjalankan command `service isc-dhcp-service restart`, dan di cek status sudah jalan atau belum dengan `service isc-dhcp-service status`

## Soal 4
Pada soal ini diminta pada switch 3 untuk diconfigure dengan range IP `10.16.3.30` hingga `10.16.3.50`. Untuk itu maka diedit file `/etc/dhcp/dhcpd.conf` ditambahkan berikut ini.

![4.1](/img/4.1.png)

Pada subnet diisi IP `10.16.3.0` yaitu switch 3 dan dengan netmask `255.255.255.0`, kemudian isi range sesuai dengan soal.
Kemudian menjalankan command `service isc-dhcp-service restart`, dan di cek status sudah jalan atau belum dengan `service isc-dhcp-service status`

## Soal 5
Pada soal ini diminta agar Client mendapat DNS dari EniesLobby dan dapat terhubung dengan internet melalui DNS tersebut. Untuk menyelesaikan masalah ini maka pada konfigurasi soal nomer 3 dan 4, terdapat bagian `option domain-name-servers` dan diisi dengan IP EniesLobby yaitu `10.16.2.2`.

![5.1](/img/5.1.png)

## Soal 6
Pada soal ini diminta untuk DHCP meminjamkan IP pada switch 1 selama 6 menit dan switch 3 selama 12 menit, dan keduanya memiliki waktu maksimal selama 120 menit. Apabila dikonversi menjadi detik, maka switch 1 menjadi 360 detik, switch 3 menjadi 720 detik, dan waktu maksimal yaitu 7200 detik. Maka pada konfigurasi soal nomor 3 dan 4, pada bagian `default-lease-time` yaitu lama waktu peminjaman sehingga switch 1 = 360 detik dan switch 3 = 720 detik. dan `max-lease-time` diisi dengan 7200 detik.

![6.1](/img/6.1.png)

Maka hasil dijalankan pada switch 1 seperti berikut

![Alabasta](/img/Client.png)

dan switch 3 seperti berikut

![TottoLand](/img/TottoLand.png)

## Soal 7
Pada soal ini diminta agar node Skypie memiliki `fixed address` yaitu 10.16.3.69 , maka pertama ditambahkan di node `Jipangu` pada file `/etc/dhcp/dhcpd.conf` seperti berikut.

![7.1](/img/7.1.png)

Dengan pada `hardware ethernet` diisi dengan physical address skypie
Kemudian menjalankan command `service isc-dhcp-service restart`, dan di cek status sudah jalan atau belum dengan `service isc-dhcp-service status`
Pada node skypie diedit file `/etc/network/interfaces` menjadi seperti berikut.

![7.2](/img/7.2.png)

Dengan `hwaddress ether` diisi dengan physical address skypie.
Kemudian merestart node Skypie dan apabila benar maka akan terlihat hasil seperti berikut.

![Skypie](/img/Skypie.png)

## Soal 8

## Soal 9

## Soal 10

## Soal 11

## Soal 12

## Soal 13
