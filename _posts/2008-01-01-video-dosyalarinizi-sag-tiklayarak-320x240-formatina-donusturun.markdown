---
date: '2008-01-01 13:48:38'
layout: post
slug: video-dosyalarinizi-sag-tiklayarak-320x240-formatina-donusturun
status: publish
title: Video dosyalarınızı sağ tıklayarak 320x240 formatına dönüştürün
wordpressid: '373'
categories:
- Gezegen
- Linux
tags:
- convert
- custom actions
- film
- Linux
- mencoder
- n95
- thunar
---

Daha önce Thunar için küçük bir "custom action" [hazırlamıştım](http://blog.arsln.org/video-dosyalarini-sag-tiklama-ile-tvde-acmak/). Eğer bilgisayarınıza tv bağlı ise sağ tıklayarak doğrudan oradan açılmasını sağlıyordu. Buna benzer küçük bir betik daha yazdım. Betik zaten hemen hemen aynı, fakat bu sefer yaptığı iş farklı. 

Telefonum için 4gb kart aldım. Artık yeterince yerim de olduğu için izlemek istediğim dizileri telefondan otobüsle git gel yaparken izleyeceğim. Fakat bundan önce filmi hem 320x240 formatına çevirmemiz lazım, hem de altyazı filmin içine gömülmesi lazım. Bunu da daha önceki bir yazımda [anlatmıştım](http://blog.arsln.org/symbian-yuklu-telefonlarda-altyazili-film-divx-xvid-izlemek/). Ben bu betiği biraz daha değiştirdim, ve artık DivX Mobile Player'lerde sorunsuz bir şekilde de çalışıyor(Diğeri için codec yüklenmesi gerekiyordu). DivX Mobile Player uygulumasını cep telefonunuz için **ücretsiz** olarak resmi sitesinden [indirebilirsiniz](http://www.divx.com/mobile/). 

Betiğimiz şu şekilde:





> 
#!/bin/bash

for D in *.[sS][rR][tT] ; do

mencoder -sub "$D" -subcp latin5 -subfont-text-scale 4 -vf scale=320:240 -oac mp3lame -lameopts vbr=0:br=32:mode=1 -ovc xvid -xvidencopts bitrate=256 -ofps 20 -sws 2 -o mobilevideoNEW.avi "$1" 

done
exit 0 





Betiği convertfilm.sh diye /usr/bin altına kaydedip, **chmod +x convertfilm.sh** yaparak herhangi bir konsol altından şu şekilde çalıştırılabilir

`convertfilm film.srt film.avi`

Bunun sonucunca mobilvideoNEW adında bir dosya oluşacak. Bu da bizim yeni oluşan filmimiz oluyor. Betiği kafanıza göre düzenleyebilirsiniz tabi. Örneğin -ofps 20 seçeneğini bize frame sayısını ayarlatabiliyor. N95 30'a kadar destekliyor, fakat daha eski telefonlarda bu sorun olabilir, o yüzden onu 15 yapmakta yarar var. Onun dışında mode:1 olan kısımdaki sayı da değiştirilerek stereo(0),jingle-stereo(1) ya da mono(3) yapılabilir. Bitrate kısmı da 256 ideal demiştim daha önceki yazımda, şimdi de öyle. Denemek isteyenler 384 yapıp tekrar deneyebilirler. Filmin kendisi biraz daha yer tutacak ama kalite de artmış olacak. Diğer bilgilerin hepsini "man mencoder" yaparak bulabilirsiniz. 

Tabi her zaman konsol açık değildir diye, şu işlemleri de yaparsak tadından yenmez. İlk önce **Thunar**'da (Edit > Configure custom actions) tıklayarak boş alanları şu şekilde dolduruyoruz:

_Name: Film'i 320x240 formatına dönüştür
Command : /usr/bin/convertfilm %f
Appaearance Conditions
File Pattern : *.avi
Appears if selection contains: Video File_

Kaydedelim bu şekilde, dilerseniz de ayrı bir simge ekleyin ki daha güzel dursun menüde. Bundan sonra bir klasör içinde bir film ve altyazı bulunmak şartıyla bir filmin üzerine sağ tıklarsanız şu ibare çıkacaktır:

![videthunar.jpg](http://blog.arsln.org/image/videthunar.jpg)


Tıkladığımız an arka planda mencoder çalışacak, ve video'muzu 320x240 formatına çevirecek ve altyazı da içine gömülecek.





