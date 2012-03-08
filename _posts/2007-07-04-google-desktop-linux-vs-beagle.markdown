---
date: '2007-07-04 21:03:13'
layout: post
slug: google-desktop-linux-vs-beagle
status: publish
title: Google Desktop Linux vs. Beagle
wordpressid: '268'
categories:
- Gezegen
- Linux
tags:
- arama
- Archlinux
- beagle
- google
- google desktop linux
- indekslemek
- index
- Linux
- PKGBUILD
- tomboy
---

Bildiğiniz gibi [Linux için Google Desktop](http://desktop.google.com/linux/) çıktı. Ben de bu vesileyle hem Beagle hem de Google Desktop'u denedim. Zamanı gelmişti zaten. Bir sürü dosyam vardı, ve hangisinin nerede olduğunu artık bulamıyordum. Her şey düzgün bir şekilde olsa dahi, bazı şeyler olması gereken yerde olmayabiliyordu. Archlinux için Google Desktop paketini Lapis forumundan [bulabilirsiniz](http://forum.linux-sevenler.org/index.php/topic,7293.msg34315.html#new). Beagle ise depolarda mevcut zaten.

Özellikle [Beagle](http://beagle-project.org/Main_Page)'den başlamak gerekirse. Mono bağımlılıkları olduğu için bir sürü paket yüklemek zorunda kaldım(hazır mono kururken **Tomboy** da kuruvereyim dedim). Kurduktan sonra, **beagled** yazarak çalıştırdım. Arka planda indekslemeye başladı. Bittiğinde ise bir kaç arama yaptım. Bazılarını buldu, bazılarını ise bulmadı. Burada hoşuma gitmeyen, çok yavaş olmasıydı. Ciddi şekilde yavaştı. Hantal geldi, arama yaparkan aramaları hemen göstermiyordu, bazı aramalarda başka formataki sonuçları **4-5 sn** gösteriyordu. Aramalarda ise 100'den fazla sonuç göstermiyor. Belki ayarı vardır, fakat Gnome olduğu için, preferences menüsü süs gibi duruyor orada. Adı güya preferences. Hiç bir şey ayarlanmıyor. ***.mp3** diye aratınca **4000 tane** dosya olduğunu söyledi, fakat sadece 100 tanesini görebildim. Diğerlerini görmem mümkün değildi. Fakat açık kaynaklı olması, ve Google Desktop'a göre daha çok dosya formatı desteklemesi de bir avantaj. Örneğin **Gaim** konuşma logları da indeksleniyor Beagle'de. Tıpkı Evolution için de olduğu gibi. Bunun dışında **Tomboy** notlarınız ve e-posta eklerini de indeksliyor Beagle. Beagle için panel'e **deskbar** adında bir gereç kurabilirsiniz. Aramalarınız oradan yapabilir, ya da F12 tuşuna basarak başlatabilirsiniz. 

![desktop_scrshot.jpg](http://blog.arsln.org/image/desktop_scrshot.jpg)Google Desktop'da olay biraz daha farklı. Tek bir paket var. Bağımlılık olarak sadece gtk istiyor. Ki bu da zaten yüklü bende. **7-8 mb** civarında. Yükledikten sonra(PKGBUILD), **gdlinux** yazarak çalıştırdım ve ayarlardan neler yapması gerektiğini belirtim. Google Desktop'daki ayarlar menüsü çok daha gelişmiş. Beagle gibi değil. Ek bir özellik ise **Gmail** e-postalarınız da indekslemek mümkün. Bu da benim için artı puan. İndesklerken işinizi de yapabilirsiniz. Yavaş bir şekilde yaptığı için pek bir etkisi olmuyor. **40-50gb** sabit diskimi 5-6 saat içinde bitirdi. Ardından iki kere CTRL tuşuna basarak ortaya bir arama kutusu çıkartıyorsunuz. Bu arama kutusu yazdığınız anda aramaya başlıyor. En fazla **10 tane sonuç** görmeniz mümkün ilk başta, daha fazla görmek istiyorum derseniz, Firefox içinden sonuçlar çıkıyor. Tipik Google araması gibi, size sabit diskinizdeki sonuçları gösteriyor. Beagle'de bir program arayüzü varken, Google Desktop'da sadece Firefox için hazırlanmış sayfalar var. Yani ayarlarınızı Firefox üzerinden yapıyorsunuz. Bu yüzden bir tarayıcıya da dolaylı yönden bağımlı Google Desktop. Dejavantajları ise, kapalı kaynak kodlu olması, Google gibi büyük bir şirkete güvenilirliği, ve Beagle'e göre daha az dosya formatı indekslemesidir. Fakat Beagle'e göre çok çok daha hızlı. Sonuçlar daha keskindi. Beagle'de bazı şeyleri bulmazken, Google Desktop'da hemen hemen hepsini bulabilmiştim. Bunu da Google'un algoritmasına bağlıyorum. Bana göre Beagle göre çok daha gelişmiş bir Algoritması var. Doğal olarak bu da beklenir haliyle.

Sonuç olarak ben [Google Desktop](http://desktop.google.com/linux/) kullanmaya karar verdim. Benim için hız daha önemliydi. Ayrıca herhangi bir bağımlılık istememesi ve arama sonuçları daha iyi olması bunu daha da etkin kıldı. Fakat daha güçlü bir makinem olsaydı, belki Beagle düşünebilirdim, çünkü açık kaynak kodlu olması, ve daha çok dosya desteklemesi önemli bir etken. Ayrıca gözlemlediğim kadarıyla, bir çok kişi Google'a güvenemediği için, böyle kapalı kodlu bir programı da kurmak istemiyor. Benim bu açıdan bir sorunum yok, zaten kullandığım servislerin yarısı Google tarafından sağlanıyor (E-posta, Rss okuyucu, İstatistik, ...). Ayrıca Google Desktop'un tuttuğu veritabının büyüklüğüne bakılınca yaklaşık **250 mb** yer tutmuş olduğunu gördüm. Yani gerçek verinin büyüklüğünün yaklaşık **%5-10** arasında bir şey. Bağlantım sınırsız **256k** olduğunu düşünürsek, bu kadar veriyi yollanabileceğini de sanmıyorum.  


