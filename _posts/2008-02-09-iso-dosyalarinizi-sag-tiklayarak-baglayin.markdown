---
date: '2008-02-09 11:39:08'
layout: post
slug: iso-dosyalarinizi-sag-tiklayarak-baglayin
status: publish
title: Iso dosyalarınızı sağ tıklayarak bağlayın
wordpress_id: '386'
categories:
- Gezegen
- Linux
tags:
- custom actions
- ipucu
- iso
- thunar
---

Daha önceki sizlerle [bir](http://blog.arsln.org/video-dosyalarinizi-sag-tiklayarak-320x240-formatina-donusturun/) [kaç](http://blog.arsln.org/video-dosyalarini-sag-tiklama-ile-tvde-acmak/) Thunar custom action paylaşmıştım, şimdiki de gayet yararlı ve güzel bir uygulama. Örneğin elinizde bir tane **iso dosyası** var, ve içeriğine göz atmanız lazım. Normal'de konsol'dan kolay bir şekilde bunu yapmanız mümkün, fakat Thunar kullanarak da bunu kolay bir şekilde yapabilirsiniz (gui sevenler için).

Kurmanız gereken programlar arasında bir tek **gksu** var. Mount uygulaması root ile çalıştığı için bu gerekiyor. Gksu'yu kurduktan sonra, birde /_mnt/iso klasörünü oluşturun._ Bağlayacağımız iso dosyası burada olacak. Dilersiniz farklı bir yere de bağlayabilirisniz bu tamamen size bağlı. 

Thunar‘da **(Edit > Configure custom actions)** tıklayarak boş alanları şu şekilde dolduruyoruz:




> Name: Iso dosyasını bağla
Command : gksu 'mount -t iso9660 %f /mnt/iso/ -o loop'
Appaearance Conditions
File Pattern : *.iso 
Appears if selection contains: Other files




Evet hepsi bu kadar, bundan sonra herhangi bir Iso dosyasının üzerine sağ tıklarsanız karşınıza şöyle bir menü çıkacak, tıkladığınız zaman iso dosyamız bağlanmış olacak:

 ![Thunar Custom Action](http://blog.arsln.org/image/isothunar2.jpg)

Diyelim ki bağladığımız bu iso dosyasını tekrar çıkartmak istiyoruz, onu da ben şu şekilde yaptım. Panel'e küçük bir simge yerleştirdim, ona da **gksu 'umount /mnt/iso' **komutunu ekledim. İşim bittiğinde buna tıklıyorum ve çıkartıyorum. Dileyen bunu konsoldan da yapabilir. 
