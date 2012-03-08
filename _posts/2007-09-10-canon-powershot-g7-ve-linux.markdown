---
date: '2007-09-10 22:27:23'
layout: post
slug: canon-powershot-g7-ve-linux
status: publish
title: Canon PowerShot G7 ve Linux
wordpressid: '313'
categories:
- Gezegen
- Linux
tags:
- Archlinux
- canon
- canon g7
- digikam
- flickr
- fotoğraf
- kde
- ptp
- storage
---

Daha önce Canon G7 hakkında ayrıntılı bir şekilde [izlenimleri](http://blog.arsln.org/canon-powershot-g7-hakkinda-fotograflar-ve-bilgiler/) ve çektiğim fotoğrafları [paylaşmıştım](http://blog.arsln.org/canon-powershot-g7-hakkinda-fotograflar-ve-bilgiler/). Almanya'da iken Ubuntu kullanıyordum, çünkü Archlinux altındaki **ipw2200** sürümünü yükleme unutmuştum ve wifi üzerinden internet'e giremiyordum. Ubuntu kullanırken **Canon G7**'den içindeki kartı çıkartıp dahili kart okuyucusunda indiriyordum fotoğrafları. Ankara'ya gelmemle beraber tekrar Archlinux'u kullanmaya başladım. Archlinux'da kart okuyucusunu hiç denemedim, onun yerine **usb kablosu** ile bağlanıp öyle indireyim dedim fotoğrafları. 

[![Nereye kadar](http://farm2.static.flickr.com/1084/1295896751_ea83c53faa_m.jpg)](http://www.flickr.com/photos/ftharsln/1295896751/)Usb kablosunu taktım, sonra otomatik olarak bağlanmasını bekledim. Bekledim bekledim bir şey olmadı. Dedim herhalde yanlış yere bağlandı, dmesg ile takip edeyim dedim. Oradan Usb'yi gördüğünü fakat hiç bir yere bağlamadığını gördüm. Allah allah nasıl olur ? Şirket Canon olunca olurmuş. Meğersem sabit disk olarak görmüyormuş kamerayı. Değişik bir protokol ile çağırmak lazımdı. Onun adı da **PTP**. Sonra biraz araştırınca Canon şirketin Linux alanında hiç bir desteğinin olmadığını gördüm. **Linuxquestions** sitesinde de bundan bahsediliyordu. Yani Canon alırken buna dikkat edilmeli. 

PTP modu nasıl çalıştıyoruz peki ? Fotoğraflarım için [Digikam](http://www.digikam.org/) uygulamasını kulanıyorum. Hemen hemen tüm programları denemiş biri olarak, kesinlikle herkese digikam'i öneririm. İlk başta biraz kullanması zor olsa da (kullanabirliği Kde uygulamaların çoğu gibi çok kapsamlı ve kullanışız) kullandıkca alışıyorsunuz. İçinde gPhoto desteği de geliyor, yani PTP modlu kameralara direkt bağlanabiliyorsunuz, ve fotoğraflarınızı sabit diskinize yükleyebiliyorsunuz. Hiç bir şey yapmadan kendisi otomatik olarak kameramı buldu. Fakat bağlan dediğimde şu hata ile karşılaştım :

**Failed to connect to the camera. Please make sure it is connected properly and turned on. Would you like to try again?**

[![Pembe'nin mutluluğu](http://farm2.static.flickr.com/1383/1268808289_277a74d688_m.jpg)](http://www.flickr.com/photos/ftharsln/1268808289/) Archlinux forumlarında araştırmaya başladım ve hatayı hemen görüverdim. /etc/group dosyasında "camera" adlı bir grup vardı. Karşılığı ise boştu, ben de kendi kullanıcı adımı ekledim ve yeniden giriş yaptım. Ardından terminal'dan **groups** yazıp kontrol ettim camera grubuna dahil miyim değil miyim diye:

`
wheel video audio optical floppy storage camera power users fatih
`

Gördüğünüz gibi ekliydi. [Digikam](http://www.digikam.org/)'i tekrar çalıştırdım ve sorunsuz bir şekilde Canon G7'ye bağlanabildim. Çok hızlı bir şekilde hepsini indirdim. Digikam özelliklerinden biri de fotoğrafları indirmeden önce hepsini ismini değiştirebilmeniz, otomatik bir dosya oluşturabilmenizdir,vs... Yani kamera ile çalışmak için birebirdir. 
_
Not: yukarıdaki iki fotoğraf G7 ile çektiğim fotoğraflardan bir kaçı_



