---
date: '2008-02-08 11:36:09'
layout: post
slug: archlinux64de-flash-destegini-etkinlestirmek
status: publish
title: Archlinux64'de flash desteğini etkinleştirmek
wordpressid: '385'
categories:
- Gezegen
- Linux
tags:
- '64'
- arch64
- Archlinux
- flash
- ipucu
---

Yeni bilgisayarım gelmesiyle berabar yıllardır kullandığım [dağıtımının](http://archlinux.org) 64bit olanını yükledim. Duyduğum ve okuduğum kadarıyla 64bit dağıtımları eskisi kadar "kötü" değiller. Artık hemen hemen tüm programlar mevcut. Flash desteğini de bir şekilde halletmek mümkün. Gözünüz korkmasın yani. 

Gelelim [Arch64](http://wiki.archlinux.org/index.php/Arch64_FAQ)'de flash desteğinin yapılandırmasına. Arch wikisinde bu konuda [bir belge var](http://wiki.archlinux.org/index.php/Install_Flash_on_Arch64), ben kısaca 3 adımda ne yapmanız gerekeni yazacağım o kadar. 





	
  1. 
Community desteğinin _/etc/pacman.conf_'da açık olduğunu varsayarak aşağıdaki komut ile gereken tüm paketleri yüklüyoruz


> **pacman -Sy --asdeps gtk2 lib32-atk lib32-cairo lib32-expat lib32-fontconfig lib32-freetype2 lib32-gcc-libs lib32-glib2 lib32-glibc lib32-gtk2 lib32-libice lib32-libpng lib32-libsm lib32-libx11 lib32-libxau lib32-libxcb lib32-libxcursor lib32-libxext lib32-libxfixes lib32-libxft lib32-libxi lib32-libxinerama lib32-libxmu lib32-libxrandr lib32-libxrender lib32-libxt lib32-pango lib32-pcre lib32-zlib libxt util-linux-ng lib32-alsa-lib
**







	
  2. Ardından  nspluginwrapper ve nspluginwrapper-flash paketlerini [aur](http://aur.archlinux.org)'dan alıp paketliyoruz. Paketlemek aslında kolay bir iş, fakat ben onunla şimdi uğraşamam diyenler için paketler [arsln.org/dosya](http://arsln.org/dosya)'ya yükledim. İndirip, pacman -A paket.tar.gz şeklinide kursunlar.


	
  3. 
Sonra kullanıcı olarak ~/.mozilla/plugins klasörünü oluşturup, konsoldan **nspluginwrapper -v -a -i** komutunu yazıyoruz. Dikkat edin bu komutu **kullanıcı** olarak yazın, **root ile değil!**.





Evet hepsi bu kadar, Firefox'u yeniden başlatıktan sonra her türlü flash içerikli düzgün bir şekilde çalışacaktır(Youtube gibi). Evet biliyorum hepimiz Arch'ı seviyoruz :)





