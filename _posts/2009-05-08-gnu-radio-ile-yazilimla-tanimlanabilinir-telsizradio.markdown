---
date: '2009-05-08 23:52:54'
layout: post
slug: gnu-radio-ile-yazilimla-tanimlanabilinir-telsizradio
status: publish
title: Gnu-Radio ile yazılımla tanımlanabilinir telsiz(radio)
wordpress_id: '637'
categories:
- Gezegen
tags:
- gnu radio
- proje
- sdr
- software defined radio
- usrp
- yazılımla tanımlanabilinir telsiz
---

**Yazılımla tanımlanabilinir telsiz**, ya da yazılıma bağlı telsiz cağımızın en yeni konularından biri. Bundan 2 gün önce 4'üncü sınıf projemizi seçtik ve bizim üç kişilik ekip bu proje ile uğraşacak. Birazdan yazacaklarım, daha önce bunları hiç duymadıysanız kesinlikle ilginç gelecektir. Bu projenin temelini oluşturan yazılıma bağlı olan radyo'nun İngilizce ismi ise "Software Defined Radio"'dir. Kısa adı [SDR](http://en.wikipedia.org/wiki/Software-defined_radio) (bundan sonra yazımda SDR ile devam edeceğim. Telekom ile aşina olanlar bu terimi belki daha önce duymuşlardır.


## SDR nedir?


Çağımızda'ki iletişim'lerin çoğu kablosuz olarak gerçekleşiyor. Örneğin **cep telefonları** ile 900Mhz ve 1800MHz frekanslarında konuşuyoruz, **müziğimizi FM dalgaları** ile 88-108MHz frekans yayın aralığında dinleriz, **dizüstü bilgisayarımız** ile 2.4Ghz ile wifi üzerinden İnternet'e giriyoruz, **çatı'daki antenler** sayesinde TV izleyebiliyoruz, **GPS sistemi** ile yönümüzü ve ona göre gideceğimiz yerleri an ve an takip edebiliyoruz.

Tüm bunlar on yıllardır mühendislerin ortaya çıkartığı bir takim radyo özellikleridir.(Radyo kelimesi her türlü veri-alış verişini yapabilen cihazlardır, yani aklınıza sadece FM radyo'su gelmesin, cep telefonu da bir radyo'dur) Her birinin kendine has özellikleri vardır ve genellikle bu teknoloji'yi çıkartanlar bu işte çok para kazanmışlardır.** Neden para kazandılar **? Çünkü her frekans için özel bir donanım hazırladılar ve biz sadece bu donanım üzerinden iletişim kurabiliyorduk.

Görüldüğü gibi gündelik hayatta da her iletişim kanalı için **ayrı bir cihaz kullanıyoruz** ve her biri için **ayrı para veriyoruz**.

İşte burada SDR devreye giriyor. SDR'ın amacı, tamamen donanımdan bağımsız bir ortam geliştirmek ve mümkün olduğunca yazılımla anten kısmına kadar gelebilmek. Bu şu demek, elinizdeki bir cihaz'ın özellikleri artık donanım'a bağlı değil, aksine yazılıma bağlı.


## SDR'nin avantajları nedir peki?


Dediğim gibi artık **donanım'a bağlı değil,** yazılıma bağlı. Bunu avantajları saymakla bitmiyor, sadece bir kaçı şu şekilde:



	
  * Anında değiştirilebilinir özelliklere sahip olacaklar. Öyle bir cihaz düşünün ki, istediğiniz zaman bir GPS alıcısı olacak, başka bir zaman wireless İnternet cihazı olacak, başka bir an telefon olacak, canınız sıkıldı FM alıcısı olacak. **Tüm bunlar yazılıma bağlı olduğu için, tek tıklama ile bunlar olacak**. Tüm bunları tek bir cihaz'ın yapabileceğini söyleyeyim tekrardan.

	
  * Yazılıma bağlı oldukları için, yeni teknolojilere adapte olma süreci kolay bir şekilde hal olabilecekler. Şöyle bir örnek verelim, şu an **3g destekleyen telefonlar var**, bazılarında ise 3g desteği yok. 3g desteğinin olmamasının sebebi ise tamamen donanımsal bir olay. Fakat ellimizdeki cihaz bir SDR olsaydı, yeni bir yazılım ile 3g'ye adapte olabilecektik.

	
  * Aynı anda birden fazla kanalları dinleyebilecek ve konuşabilecek. Polislerin telsizleri mesela belirli bir frekans aralığında çalışır, askeri'yenin ise apayrı bir frekans aralığında çalışır. Eğer  SDR olsaydı polis ile askeriye kendi aralarında çok kolay bir şekilde iletişim kurabilecekler. Başka bir örnek, diz üstü bilgisayarınız var, wifi özelliği mevcut ve elinizde bluetooth destekleyen bir telefon var. Bluetooth'lu telefondan wireless'li diz üstü bilgisayarınıza bağlantı kurabileceksiniz.

	
  * Yazılıma bağlı olduğundan, **doğanın donanımlara getirdiği bazı sınırlamalar ortadan kalkacaklar**.Bu yüzden daha önce hiç görmediğimiz uygulamalar görmemiz mümkün olacaktır.




## Peki Gnu Radio nedir ?


10 yıl önce Eric Blossom, açık kaynak kodlu SDR projesini ortaya attı. Bu projeyi daha fazla ileriye götürmek için, GNU kurucularından Richard Stallman'i de ikna ederek, GNU çatısı altına almaya başarmıştır.[ Gnu radio](http://www.gnu.org/software/gnuradio/)'nun kendi altında 100'e yakın blok var. Her bir blok, telekom alanındaki bazı matematiksel özellikleri yapmayı yarıyor. Örneğin **filtreleme, demodulation, modulation,vs.**. Bu sayede, bazı fiziksel olayları yeni baştan yazmak yerine, Gnu radio'nun **kütüphanelerini kullanmak mümkündür**. Örneğin bu kütüphaneler ile kolayca bir FM alıcısı yapabilirsiniz.

Tabi bu yazılım çalışabilmesi için bir donanım yine gerekli. Günümüz dünyamızda her evde en az 2 çekirdekli bilgisayar artık olağan olmadığından, bu tarz yüksek işlemci hızı gerektiren işlemleri kolayca yapmamız mümkün. Masaüstü bilgisayarların işlemci güçleri gayet yeterli, fakat bunların alıcı kısmının dezavantajları var. **Hava'dan gelen bir sinyali nasıl alacaksınız mesela?** Bilgisayarlarımızda ses kartları aslında çok düşük fiyatları analog-to-digital çeviricileridir. Fakat bunlar 96KHz aralığında olduğundan, bizim diğer sinyaller için çok yetersiz olacaktır(örneğin FM frekansları 88MHz'den başlar, yani yaklaşık 10 katı daha fazla). Başka bir alternatif ise, yüksek hızlı PCI analog-to-digital ana kartları satın almak. Bunlar bizim işimizi görebilir, fakat normal bir masaüstü fiyatı kadar pahalı olacağından göz ardı edilebilinir.

Bu yüzdendir ki, Eric Blossom, [USRP](http://www.ettus.com/) adında, SDR için özel geliştirilmiş bir ana kart geliştirdi.


## USRP nedir ?


USRP'nin açılımı "**Universal Software Radio Peripher**al"'dir. Bu genel amaçlı bir anakart. Üzerinde 4 tane yüksek hızlı analog-to-digital(ADC) çeviricileri, 4 tane digital-to-analog(DAC) çevirileri, bir tane FPGA ve bir kaç giriş ve çıkış girişleri var. GNU radio yazılımı doğrudan bu cihaz ile kolay bir şekilde iletişim kurabiliyor. Bu cihaz'a özel kütüphaneler var. O yüzden USRP ile SDR oluşturmak ve üzerinde çalışmak çok daha kolay. Tabi ki Gnu radio farklı platformlarda çalışacaktır, fakat USRP gibi özel bir donanım kadar performanslı ve efektif olmayacaktır. Aşağıda resimleri görebilirsiniz

[![gnur_01](http://blog.arsln.org/wp-content/uploads/gnur_01.jpg)](http://blog.arsln.org/wp-content/uploads/gnur_01.jpg)

[![gnur_02](http://blog.arsln.org/wp-content/uploads/gnur_02.jpg)](http://blog.arsln.org/wp-content/uploads/gnur_02.jpg)

Anakartın üzerinde bir takım kardeş-anakartlar yerleştirmek mümkün (**bunlara daugtherboard deniliniyor**). Bu kardeş anakartların her biri farklı frekans aralıklarındaki frekansları almayı ve göndermeyi becerebiliyor. Her birinin farklı yani. O yüzden geliştireceğiniz proje'ye göre, kardeş anakartları da farklı olacaktır. Eğer cep telefon sinyalleri ile uğraşacaksanız, 900MHz-1800MHz aralığındaki bir kardeş anakartı almanız gerekebilecek. USRP'nin üzerinde 4 tane bu tarz giriş var, yani 4 tane farklı kardeş anakart üzerine kurabiliyorsunuz. Bu yüzden farklı frekanslarından alabilir ve gönderebilirsiniz. Yukarıdaki resimde 4 tane farklı anakartın yerleştirildiğini görebilirsiniz.


## Sonuç


4'üncü sınftaki bitirme projemiz, bir tane USRP üzerinde, şu an daha henüz belli olmayan bir alıcı ve verici düzeneği oluşturmaktır. Proje'nin detayları sonra belli olacak. Zamanla bunları burada yazacağım. Bu kadar yazdım, hiç mi dezavantajları yok bunun diyeceksiniz? Evet maalesef var.

Bu cihazı Amerika'dan 700 dolara getirebilirsiniz. Kardeş anakartlar ise 150-200 dolar arasında değişiyor. Ayrıca uzun mesafe'de çalışmak için iki tane anakart almak isteyeceksiniz. Oradan buraya kargo ücreti ise 150 dolar tutuyor. Bizim [bölüm](http://ee.hacettepe.edu.tr/) iki tane anakart bize tehsis edeceğinden bu yönde bir sıkıntı olmayacak(öyle denildi, umarım sorun çıkmaz bu konuda), kardeş anakartlar için ise kendimiz biraz para ayırmamız gerekecek herhalde. Sponsor bulursak tabi bunların hiç biri olmayacak. Türkiye gibi bir ülke'de bu konuda kesinlikle çok güzel araştırmalar yapabileceğine inanıyorum.

Kaynaklar:
[http://www.ettus.com/](http://www.ettus.com/)
[http://www.gnu.org/software/gnuradio/](http://www.gnu.org/software/gnuradio/)
[http://en.wikipedia.org/wiki/Software-defined_radio](http://en.wikipedia.org/wiki/Software-defined_radio)
[http://www.comsec.com/software-radio.html](http://en.wikipedia.org/wiki/Software-defined_radio)
[http://dev.emcelettronica.com/gnu-radio-open-source-software-defined-radio](http://en.wikipedia.org/wiki/Software-defined_radio)
