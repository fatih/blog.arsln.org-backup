---
date: '2008-09-02 16:53:24'
layout: post
slug: sinerji-programi
status: publish
title: Sinerji programı
wordpressid: '468'
categories:
- Gezegen
- Linux
tags:
- Linux
- pardus
- pardus stajı
- sinerji
- synergy
---

Bildiğinizi gibi staj projem Synergy üzerine. [Bir önceki girdimde](http://arsln.org/staj-projesi-synergy-entegrasyonu/) Synergy'inin ne yaptığının sizlere anlatmıştım. Son bir hafta içinde bir çok şeyi yazdım. Arayüz de hala taslak, yani her an değişebilir. Çünkü nasıl yapılacağına tam karar veremedik. Ama son hali bu şekilde de olabilir.  Bunun dışında buradaki kişiler olmazsa bu 1 hafta içinde bu kadar şeyi yapamazdım herhalde. Özellikle [Faik abi](http://www.faikuygur.com/blog/) çok yardımcı oldu. Gerçekten çok şey öğrendim, hala da öğreniyorum. Keşke diyorum staj 4 hafta değil de 8 hafta falan olsa.

Arayüzü PyQt4 ile yazdım, ayrıca avahi ile olan kısım da bitti. Yani kendi servisini oluşturabiliyor ya da ağdaki belirli servisleri okuyabiliyor. Kendi sitesindeki [Python binding'leri](http://avahi.org/wiki/Bindings) çok işe yaradı, zaten yaptığım aramalarda bir çok kişi de aynı şekilde kullandığını gördüm. Onlardan çok şey aldığım söylenebilinir. Zaten arayüz QuickSynergy'ye benziyor. Fakat biz ayrı bir konsept işledik, ve daha kolay olacak şekilde yapıyoruz. İleride Tasma modülü olarak doğrudan Tasma içinden kullanabileceksiniz. Qt4 ile yazıldığı için Tasma'da kullanabilmek için 2009 sürümünü beklemek lazım ama, çünkü şu anki Tasma Qt3 ile yazıldı. 

Apayrı bir program oluştuğu için programın adına **"Sinerji"** dedim.  Kendisi de şöyle bir şey:

![](http://arsln.org/wp-content/uploads/sinerji_gamma.png)

Burada üsteki bilgisayar** "uekae-pardus"** ile sağdaki bilgisayar **"obsidian"** kendi klavye ve faremiz ile kullanabileceğiz. Bu isimleri biz girmiyoruz, avahi kendisi buluyor ve ekliyor. Biz sadece listeden istediğimiz bilgisayarları seçiyoruz. 

**[Pardus](http://www.pardus.org.tr)** gibi bir yerde staj yapmanın ayrı bir güzeliği ise, yaptığım çalışmaları istediğiniz an bakabilmeniz ve inceleyebilmenizdir. Yaptığım tüm değişiklikleri svn deposuna yansıtıyorum. İlgilenenler ya da merak edenler [http://svn.pardus.org.tr/uludag/trunk/staj-projeleri/sinerji/](http://svn.pardus.org.tr/uludag/trunk/staj-projeleri/sinerji/) adresinden çalışmalarımı takip edebilirler. 
