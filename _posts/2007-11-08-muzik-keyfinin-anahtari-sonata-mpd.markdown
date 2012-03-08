---
date: '2007-11-08 15:44:18'
layout: post
slug: muzik-keyfinin-anahtari-sonata-mpd
status: publish
title: 'Müzik keyfinin anahtarı: Sonata + Mpd '
wordpressid: '339'
categories:
- Gezegen
- Linux
tags:
- Archlinux
- Linux
- mpc
- mpd
- sonata
- xfce
- xubuntu
---

Kardeşimin yeni bir dizüstü bilgisayarı almasıyla beraber, onda olan benim eski yadigar P4 bilgisyayar da bana geldi. Kendisini kullanmıyorum, ama yanındaki **19 inch** ekranı laptopa taktım. Zaten benim işime de bu geliyor. Laptop'daki küçük ekran artık iyice beni bezdirmeye başlamıştı. 

Hal böyle olunca her iki bilgisayarı da düzenledim. P4'de [Archlinux](http://www.archlinux.org) + Xfce kurdum, Dizüsüstüne de Ubuntu + Xfce([Xubuntu](http://www.xubuntu.org/)) kurdum. Müziklerimi tekrar düzenledim. Ssh bağlantısıyla her iki tarafa da aktardım. Kurduğum iki sistemin de hafif olması için hafif programlar kurdum. 

Müzik konusuna gelince Amarok kurarark tüm Kde kütüphaneleri kuracağıma, [Mpd](http://www.musicpd.org/) kurayım, üstüne de güzel bir istemci kurayım çok daha nefis olur dedim. Hem mpd daemon olarak çalıştığı için bizim evdeki gibi 2-3 bilgisayarla ağlarda herkes müzik arşivinden yararlanabiliyor. Tek yapmamıza [Mpd](http://www.musicpd.org/)'ye bağlanmak. Mpd için bir de Grafik bir arayüz kurdum. Onun da adı [Sonata](http://sonata.berlios.de/), 

![sonata1.png](http://arsln.org/image/sonata1.png)

Pygmy'den fork edilmiş sade ve güzel bir uyguluma. Kısaca özellikleri şu şekilde:





	
  * Küçütülmüş ve büyütülmüş görünüm seçeneği


	
  * Otomatik olarak uzak veya yerel albüm kapağı getirme(Uzak derken örneğin Amazon.com'dan)


	
  * Otomatik olarak lyrik getirme


	
  * Müzik listeleri oluşturma ve Stream desteği


	
  * Tag düzenleme desteği. Easytag gibi 10-20 tane parçayı da birden düzenleye bilme imkanınız var.


	
  * Anlık ileti özelliği. Yeni şarkılarda belirtilen yerlerde çıkıyor


	
  * Sıraya koyma, yani queue desteği


	
  * Müziklistesi ve arşivde arama özelliği


	
  * Last.fm özelliği


	
  * Birden fazla profil desteği


	
  * Klavye kısayolları desteği


	
  * Komut satırı desteği





Tek yapmanız gereken Mpd'yi iyi bir şekilde kurmak. Bunun için uzun bir döküman yazmıştım vakti zamanında. [Wiki'de bulabilirsiniz. ](http://wiki.linux-sevenler.org/index.php/Mpd) Oraya bakarak kolay bir şekilde nasıl ve nasıl yapılacağını görebilirsiniz. 

Peki o kadar müzikçalar uygulaması varken, **neden Mpd ?** Mpd'nin bence en güzel yanı **daemon** olarak çalışmasıdır. Yani herhangi bir istemci'ye bağlı değil. Ben nasıl Sonata kullanıyorsam, dileyen başka bir program kurar. Hal böyle olunca eklentiler geliştirmek de çok kolay. Örneğin Xfce için panel'e yerleştirilebilen küçük bir eklenti var:

![deneme.jpg](http://arsln.org/image/deneme.jpg)

Onun dışında X'i durmadan kapatıyorsanız, yine arka planda Mpd çalışacaktır. Çünkü Mpd'e herhangi bir grafik istemciye bağlı değil.  Komut satırından Mpc gibi bir program, ya da Ncmpc gibi programlarla yönetebiliyorsunuz.
Bu yüzden çoğu **geliştirici** için bulunmaz bir nimet.


