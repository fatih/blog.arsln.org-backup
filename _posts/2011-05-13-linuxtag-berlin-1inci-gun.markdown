---
date: '2011-05-13 22:08:51'
layout: post
slug: linuxtag-berlin-1inci-gun
status: publish
title: LinuxTag Berlin - 1'inci Gün
wordpressid: '990'
categories:
- Gezegen
- Linux
tags:
- berlin
- fermi
- gpu
- linuxtag
- massif
- memory
- qt5
- Spice
- valgrind
---

Bu yıl Berlin'deki LinuxTag'a katılıyorum (hala devam ediyor). Almanya'da ilk başta Frankfurt'a ayak bastım. Aile ziyareti yaptıktan sonra hızlı Tren ile Berlin'e geçtim. Üç gündür Berlin'deyim. Burada kısa kısa aldığım notları sizlerle paylaşmayı düşünüyorum. Almanya şöyle değişik, böyle değişik şeyleri beklemeyin benden şimdiden söyleyeyim, çünkü o şekilde zaten istesem de yazamam. Notlar genel olarak biraz dağınık, şimdiden haberiniz olsun :)

LinuxTag nedir ? LinuxTag avrupa'nın en büyük özgür yazılım etkinliklerinden biri. Gerek Almanya'dan, gerekse  diğer ülkelerden yoğun katılım alıyor. Çok profesyonel işleniyor, 5-6 ayrı salonlarda paralel sunumlar mevcut. Her gün ayrı bir konuya ağırlık veriliyor.

**Scientific Computing on GPU's
**
İlk girdiğim sunum buydu. Genel olarak CPU ve GPU arasındaki temel farkları anlatan bir sunumdu. GPU'yu kullanmamız gereken alanlar var, özellikle de bilimsel alanlarda onlara değinildi. Örneğin GPU'da hiç bir şekilde ön bellek yokmuş. CPU'da normalde L1 veya L2 adlarında bellekler olur. Bunlar doğrudan CPU'nun dahilinde olduğu için hazırı hızlı olabiliyor. Fakat bu da veriye yerel bağımlılık oluşturuyor, yani bir veri kullanılacaksa, hemen bellekte tutuyor ve orada saklıyor.
GPU'larda ise bu bellek olmadığından her gelen verilerin hızlıca işlenip geri yollanmasına bağlı. GPU bu yüzden paralel programlama'da inanılmaz hızlar sağlıyor. Bunun dışında GPU'ların kendi içsel bellekleri mevcut (önbellekten farklı). Bunlar 5 çeşit olarak ayrılıyor:



	
  * Registers

	
  * Shared Memory

	
  * Global Memory

	
  * Constant Memory

	
  * Texture Memory


Her bir belleğin çeşitli ulaşım hızları var. GPU'larda zor olan da bu bellekleri yönetmek. Bunlar manuel olarak düzenleniyor ve tamamen size bağlı fakat ciddi şekilde optimasyon sağlıyor. Bunun dışında sunumda Tegra ve Nvidia'nın Fermi mimarilerine girildi. Mesela Fermi'lerde yukarıda bahsettiğim ön bellek (cache memory) eklenmiş.

Genel olarak sonrasında çok da spesifik konulara dalıp uçtu sunucu :) Yakalayamadım sonrasını. Değişik ve ilginç bir sunumdu

**Spice  and desktop virtualization
**
Bu sunumu RedHat'den Gerd Hoffman yaptı. Ama ben hiç beğenmedim açıkcası, çok hızlı bir şekilde anlattı. Konuşmayı da ağızının içinden söylediği için çok anlayamadım açıkcası. Verimsiz geçti bu yüzden. Biraz da Spice geliştiricilerine hitap ediyor gibiydi. Spice'nin kuruluşunu anlattı kısaca. Spice'in basit bir protocol olduğunu ve işini yaptığından bahsetti. Genel olarak sanallaştırma sunucu ve yönetici işlerinde kullanılınıyor, fakat günümüzde masaüstü kullanımı da artıyor ve önem kazanıyor.
Bunun için Spice'da bir takım teknolojiler mevcut. Örneğin ekran effektleri için (gnome-shell gibi) Spice QXL apisi mevcut. Usb için yoğun bir şekilde çalışılıyor ve gelişmeler mevcut.  Bunun dışında ağ protokolleri ile ilgili bilgiler sundu. Dediğim gibi pek verimsiz geçti, fakat geliştirici slaytların bağlantısını da bizlerle paylaştı :)

Şuradan indirebilirsiniz: [http://kraxel.org/slides/2011-linuxtag-spice.pdf](http://kraxel.org/slides/2011-linuxtag-spice.pdf)

**Qui Vadi, QT
**
Sunumu veren Daniel Molkentin, kendisi Nokia Berlin'de yazılım mühendisi olarak çalışıyor. Şu an için de Qt Creator uygulaması için çalışıyor(QT ve QML için platform bağımsız IDE). İlk başta QT'nin hala satılmadığından dem vurdu, biz hala buradayız çalışıyoruz dedi :) Bunu vurgalayarak söyledi, çünkü bildiğiniz gibi Nokia'nın Microsoft ile anlatşmasından sonra kafalarda bir çok kafa işareti oluşmuştu.
Genel olarak Qt'de çıkacak yeniliklerden bahsetti. 4.8 için , Lighthouse adındaki uygulamadan bahsetti. Bu uygulama bir çok platformda (özellikle gömüllü sistemlerde) avantaj sağlayacak. Bundan önce QT/Embedded mevcut idi, QT/E'nin pencere sistemi de yoğun olarak yazılımsal bir grafik motoruna bağlı idi. Lighthouse ile bunu tamamen donanım bazlı yapmak istiyorlar. Bunun dışında Qt 4.8'de ciddi optimizasyonlar mevcut (özellikle I/O kısmında). Ayrıca QML de bu yenilikler arasında olacak.

Qt5 için de ana konu modularizasyon olacak. Tüm bileşenleri modüle etmeye çalışılacak. Yine son zamanlarda bir trend olarak karşımıza çıkan GPU kullanımı da artacak. GPU ile ilgili ciddi kullanımlar olacak. Grafik altyapsını da tamemen yenileyercekler (OpenGL 2.1 kullanımı), yani yeni Qt5 Linux dağıtımlarında Mesa'nın 7.10.2 ve üstünü isteyecek.

**Massif Visualizer
**
Sunumu veren Milian Wolff. Kendis Kdevelop ve Kate geliştirici. Konu debugger'ler hakkında. Valgrind'den yola çıkarak anlattı. Valgrind iyi bir debugger olsa da 5-100x katı daha yavaş çalıştırıyor uygulamayı, çünkü kendisi bir emulatör kullanıyor. Bunun dışında debug için çeşitli uygulamalar mevcut. Örneğin **Memcheck**, bellek yönetimindeki hataları bulmak için. Helgrind, multithread hatalarını bulmak için. Callgrind, işlemci gücünü analiz etmek. Massif , bu da bellek kullanımını analiz etmek için.

Bir uygulamayı debug edebilmek için, debug sembolleri ile derlemek gerekiyor. **Massif** daha önce de belirtiğim gibi bellek kullanımını analiz etmek için kullanılan bir araç. Valgrind ile kullanmak isterseniz valgrind --tool=massif ... şeklinde belirterek çalıştırmanız gerekiyor. Massif belleğin "Heap" dediğimizin kısmını inceliyor. Çeşitli aralıklarla birer imaj alıyor. Bunun yaparken uygulamanın bellek kullanımını hiç bir şekilde etkilemiyor, fakat Massif'in kendisi bellek harçayabilir.

Valgrind'i Massif ile çalıştırdıktan sonra, belirli bir dosya üretiyor. Bu dosya'dan her türlü bilgiyi elde edebiliyorsunuz. Fakat okuması çok zor ve uğraştırıcı. Bunun önüne geçebilmek için Milian, Massif Visualizer adında bir uygulama yazmış. Bu uygulama bu bilgileri çok daha güzel ve okunabilinir bir şekilde gösteriyor. İşte bu sunumda bu uygulamanın tanıtımı yapıldı :)

Resmi sitesi şu şekilde: https://projects.kde.org/projects/extragear/sdk/massif-visualizer

Genel olarak ilk gün bu şekilde geçti. Birde **İsmail Dönme**z ile buluştum, eski Pardus geliştiricilerinden :) Kendisi şimdi openSUSE'de Booster olarak görev alıyor. Güzel bir konuşmamız oldu, özellikle OBS ve OSC konularında, onları ilerideki günlerdeki yazılarımda anlatacağım.

