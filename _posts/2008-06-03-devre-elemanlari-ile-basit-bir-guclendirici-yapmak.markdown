---
date: '2008-06-03 11:28:48'
layout: post
slug: devre-elemanlari-ile-basit-bir-guclendirici-yapmak
status: publish
title: Devre elemanları ile basit bir güçlendirici yapmak
wordpressid: '441'
categories:
- Bilişim
- Gezegen
- Hayat-Yaşam
tags:
- amplifier
- bc107
- bc177
- bjt
- capacitor
- circuit
- common-emmiter
- devre
- direnç
- güçlendirici
- kondansatör
- okul
- resistor
- transisor
---

Geçenlerde hayatımda ilk defa küçük bir **devre projesi **üzerinde çalıştım. Proje bizim **Ele 214 Laboratuvar** dersinin bir eklentisiydi. Zorunlu değildi fakat yapmak isteyen yapabilirdi. Geriye dönüp baktığımızda iyi ki yapmışım diyorum. Proje nasıl bir şeydi onu anlatayım.

**Transistör, Direnç ve Kondansatör** ile basit bir stereo(çift giriş-çıkış) güçlendirici yapacaktık. Bu güçlendiricin toplam kazancı -10 olacaktı. Yani güçlendirici bizim girişe vereceğimiz voltaj değerini 10 katına artıracaktı. Örnek vermek gerekirse **5 voltluk** bir girişi çıkışta bize **-50 volt **olarak verecekti. Önündeki eksi ise dalga boyunun yer değiştiğini gösteriyor. Bu güçlendirici çok basit dediğim gibi ve amacı örneğin kulaklıkları çalıştırmak için  kullanabiliniyor. Normal bir kulaklık 5 volt ile çalışıyorsa 0.5Vlik girişin önüne bunu koyabiliriz. 


Devremiz iki tane Voltage-Divider devresinin birleştirmesi ile oluşuyor(Common-Emitter devresi de deniliyor). Kısaca taslak şu şekilde:

![](http://blog.arsln.org/image/devresema1.jpg)

Biz ilk önce bu devrenin teorik hesaplamalarını yaptık. Yaparken **DC ve AC analizlerini** ayrı ayrı yapıp bunları birleştirdik. Her iki analiz şeklini bilmemiz lazım yoksa kazancın 10 olabilmesi için gerekli olan direnç bilgilerini bulmamız imkansızlaşıyor. Devrenin hesaplamalarını yaptıktan sonra bir de simülasyon yaptık. Simülasyonu **Proteus** adında bir programla yaptık ve sonuçlar da istediğimiz değerlere yakın çıktı. Aşağıdaki grafikte bir giriş için olan grafikleri görebiliyorsunuz.



![](http://blog.arsln.org/image/grafikdevre1.jpg)



Gördüğünüz gibi yaklaşık **10 katında bir artma var ve "Phase Shift" dediğimiz olay da gerçekleşiyor**, yani dalga kayma yapıyor. Almamız gereken liste şu şekilde çıktı:



  * _Dirençler_:  100k, 33k, 4.7k, 390, 2.2k
  * _Kondansatörler_: 3 tane 10uF
  * _Transistörler_: BC107 ve BC177(İkiside birer BJT)
  * Devreyi tamamlamak için de bir tane board aldık


Bu malzemeleri Ankara'da alabileceğiniz bir yer var orası da** Ulus'daki Konya Sokağıdır.** Burası çok meşhurdur ve her türlü elektrik,elektronik malzeme bulmanız mümkündür. Genellikle **Robot topluluğundaki **arkadaşlar buralara çokça gelirler. Ben ilk defa gitmiştim. Malzemeleri aldıktan sonra okula geldik ve laboratuvar sınıfında devre elemanlarını boarda yerleştirdik ve lehimledik. Belirtmekte fayda var bu proje'yi tek başına değil, **Halil ile beraber yaptık**. Boarda yerleştirme, malzemeleri lehimleme ve test etme işlemlerini kendisi yaptı. Ben ise teorik hesaplamaları,simülasyonları ve bir takım başka testler yaptım. Sonuç olarak aşağıdaki devreyi elde ettik:



![](http://blog.arsln.org/image/boarddevre1.jpg)



Başta da dediğim gibi basit bir devredir, **profesyonel** bir şekilde kullanamıyoruz, fakat yine de bizim için iyi oldu. Bu dönem öğrendiğimiz çoğu bilgiyi burada kullandık ve çalıştığını da gördük.

_Not:Hesaplamalar karışık olduğu için buraya koymadım, sadece genel hatlarını anlattım. Proje ile ilgilenen olursa ya da spesifik sorusu olanlar bana mail yoluyla ulaşabilirler._
