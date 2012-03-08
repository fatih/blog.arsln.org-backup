---
date: '2007-11-18 00:07:20'
layout: post
slug: linux-icin-klavye-alirken-dikkat-edilmesi-gerekenler
status: publish
title: Linux için klavye alırken dikkat edilmesi gerekenler
wordpressid: '348'
categories:
- Gezegen
- Linux
tags:
- kernel
- keytouch
- klavye
- ps/2
- usb
---

![keyboard.jpg](http://arsln.org/image/keyboard.jpg)Eski yadigar **Microsoft Office** klaveyemi değiştirip onun yerine adam gibi tuşlarını basabileceğim bir klavye alacaktım(6 senelik klavye malum). Aynı zamanda da tıpkı şimdiki klavye'deki gibi bir kaç eksta tuşları da isteklerime göre ayarlamak istiyordum. Her neyse, yolum **Ankamall**'a düştü, ve en aşağıdaki **Bimeks** mağazasına gittim(yanındaki EP-teiler kapanmış). Klavye'lere şöyle bir bakıyordum ki gözüme bir tane A4Tech **F Klavye** düştü. Bir an için heveslendim ve aldım bunu. Hiç PS/2 mi Usb mi bakmadım. 

Eve geldikten sonra baktım ki **PS/2 **çıktı, fakat Laptop'da sadece Usb girişi var. Bende P4'de(diğer bilgisayar) taktım ve öyle denedim. Tüm tuşları yerli yerinde çalışıyordu. Hepsini de **[Keytouch](http://keytouch.sourceforge.net/)** programı ile ayarlayabildim. Keytouch programı güzel bir arayüz sunuyor, benim çok hoşuma gitmişti. 

**2-3 gün** sonra yolum **Vatan Bilgisayar**'a düştü, şöyle bir gezinirken bir tane PS/2 > Usb dönüştürücüsü gördüm. Zaten uzun zamandır alacaktım, bende dayanamadım aldım bir tane. Eve geldikten sonra taktım F-Klavye'yi ve üstündeki ekstra tuşları **Keytouch** ile ayarlayama çalıştım. Velakın bazı tuşlar çalışmıyordu. **Xev**'i çalıştırdım, baktım gerçekten çalışmıyor. Yani çıkış girdisi yok. Halbuki PS/2 ile bağlı olan diğer bilgisayarımda çalışıyordu. 

Biraz araştırdıktan sonra PS/2 ve USB klavyeler arasındaki farkı gördüm. **Linux çekirdeği** Usb'deki bazı komutları yorumlayamıyormuş henüz. Ne kadar uğraşırsanız uğraşın, çekirdek tanımadığı için bir işe de yaramıyor. Halbuki PS/2 bağlantısı ile herşeyi görmenüz mümkündür. 

Gerçi F-Klavye'yi de kullanamadığım için bir müddet rafa kaldırdım. Ps/2 dönüştürücüsünü de bir köşeye koydum. Bu hafta gidip USB bağlantılı adam akıllı bir klavye almam gerekecek. Bu da benim için iyi bir tecrübe oldu.Demek neymiş, PS/2 girişi varsa bilgisayarda bilerek **PS/2 alınacak** tüm tuşların çalışabilmesi için. Yoksa Usb'li klavyelerde tüm multimedia tuşları çalışmıyor(Cherry'nin Linux için özel ürettiği [klavye'yi](http://news.zdnet.co.uk/software/0,1000000121,39164303,00.htm) saymazsak)
