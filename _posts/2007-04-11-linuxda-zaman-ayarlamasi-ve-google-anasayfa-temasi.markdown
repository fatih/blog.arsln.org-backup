---
date: '2007-04-11 19:20:46'
layout: post
slug: linuxda-zaman-ayarlamasi-ve-google-anasayfa-temasi
status: publish
title: Linux'da zaman ayarlaması ve Google anasayfa teması
wordpressid: '218'
categories:
- Bilişim
- Linux
tags:
- google
- google homepage
- ipucu
- Linux
- tema
---

Bu aralar sınavlarıma çalışırken, [Google Ana Sayfamdaki](http://google.com/ig) bilgilere durmadan bakar oldum. Rss'lere, yeni e-postalarıma. Bildiğiniz gibi bir de yeni temalar [eklenmişti](http://www.murekkep.org/google-anasayfasi-temalandi) yakın zaman içinde. ![Google Homepage Theme](http://arsln.org/image/googleanasayfa.jpg)Temaların en güzel özelliği ise bulunduğunuz ortama göre değişmesi. Yani öğlen ise, resim'de güneş oluyor. Gece ise, arka plan resminde yıldızlar ve ay oluveriyor. Benim en hoşuma giden **Tea House**. Çalışması için tek yapmanız gereken, temayı seçtikten sonra **Zipcode** ve ya **Location** yani bulunduğuz yerin yazmanız gerekiyor. Fakat gel görün ki Ankara için herhangi bir şey bulamadım. Çok aradım fakat, Türkiye için zipcode bulamadım. **Google Homepage Location Turkey** gibi aramalar da bana istediğimi vermedi. **Ankara, Turkey** de işe yaramadı. Bir yerlerde sorun vardı fakat bulamamıştım. 

Sonra bilgisayarımdaki Saat'in GTM+2'ye göre ayarlı mı değil mi diye baktım. Saat doğruydu fakat, UTC'ye göre ayarlıydı. Bende onu GTM+2 olarak ayarladım, yani İstanbul'a göre. Bunu yapmak için de aşağıdaki komutu kullanabilirsiniz

`ln -sf /usr/share/zoneinfo/kendiyeriniz /etc/localtime`

Linux'da yerel zamanı /etc/localtime belirler. Bunu da _/usr/share/zoneinfo/kendiyeriniz_'e bağlamanız lazım. Yukarıdaki komut da bu işe yarıyor zaten. **Kendiyeriniz** kısmını _/usr/share/zoneinfo_ klasöründe bulabilirsiniz. Zamanı ayarlamak için de date ve hwclock komutları var. **Date **sistem saati, **Hwclock** ise makine saati içindir. Ayrıca Zipcode için de örnekteki **08816** numarasını da yazıverdim. Sonuç olarak çok güzel çalışıyor.  


