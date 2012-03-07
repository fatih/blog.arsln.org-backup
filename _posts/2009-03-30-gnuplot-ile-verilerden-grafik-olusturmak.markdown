---
date: '2009-03-30 00:26:01'
layout: post
slug: gnuplot-ile-verilerden-grafik-olusturmak
status: publish
title: Gnuplot ile verilerden grafik oluşturmak
wordpress_id: '611'
categories:
- Gezegen
- Linux
tags:
- deney verileri
- gnuplot
- grafik
- Linux
- milimetrik kağıt
- okul
- veri
- veri'den grafik oluşturma
---

Benim gibi **milimetrik** kağıtlardan nefret ediyorsanız, eldeki verilerinizi o küçük noktalara **yerleştirmek**, onlardan bir eğri **çıkartmak** ve o eğrinin açısını hesaplamaktan sıkıldıysanız bu yazı tam size göre. Birazdan anlatacaklarım çok işinize yarayabilir.

[Gnuplot](http://www.gnuplot.info/) açık kaynak kodlu grafik oluşturma uygulamasıdır. Grafik'ten kastım her türlü veri'yi görsel olarak sunmaktan bahsediyorum. Bu iki boyutlu kartesian koordinatları olabilir, üç boyutlu kök eğrileri olabilir ya da borsa'daki herhangi bir indeksin işlemleri de olabilir. Gnuplot'un kendine has bir kabuğu var, konsoldan gnuplot yazdığınızda doğrudan giriş yaparsanız. Kullanması da inanın çok kolay. Çok basit tasarlamışlar, ama çok zor işlerin üstünden de gelebiliyor(hastasıyım böyle yazılımların). Bir örnekle başlayalım. Örneğin:

**gnuplot> plot sin(x)**

yazdığınızda size bir tane sinus dalgası çıkartacak. Bu kadar basit. Şimdi gelelim bizim yapmak istediğimiz şeye.

Elimde bir çok veri var, şimdiki kullanacağım veri geçen hafta kontrol laboratuvarında ısı sensöründe aldığım verileriyle ilgili olacak. Veriler şu şekilde:

#   X   Y
     0   297
     30  299
     60  303
     90  310
     120     310
     150     312
     180     316
     210     318

Bu verileri **"test.dat" **olarak kayıt ediyoruz. Şimdi ilk kolon boş anlamına geliyor, ikinci kolon x ile başlıyor sonraki kolonları da tab ile ayrıştırıyoruz. Burada iki tane eksen için verilerimiz var şimdi bizim için. X ekseni bizim örneğimizde saniye'yi gösteriyor. Y ekseni de kelvin'deki sıcaklık değerini gösteriyor. Görüldüğü gibi zamanla sıcaklık artıyor. Gnuplot ile sonra şunları yazıyoruz

**gnuplot> set xlabel "t (sec)"
gnuplot> set ylabel "temperature (kelvin"**

Bu iki satır eksenleri adlandırmamızı sağlıyor.  Ardından şu komutu yazdıyoruz:

**gnuplot> plot "test.dat" using 1:2**

Bu komut test.dat dosyasındaki birinci ve ikinci kolonların grafiğini bize çıkartıyor, kendisi şöyle bir şey:

[![gnuplot](http://blog.arsln.org/wp-content/uploads/gnuplot-300x214.png)](http://blog.arsln.org/wp-content/uploads/gnuplot.png)

Gördüğünüz gibi güzelce basit bir şekilde verileri yerlerine çıkartı. Şimdi genellikle bu noktaların ortasından geçen bir eğri'yi bulup, o eğrinin eğimini bulmamız bizim işimize yarayabiliyor. Birim zamandaki değişimi görmemizi sağlıyor, daha da önemlisi bu denklem bizim bulduğumuz verilerin denklemini oluşturacağından kolayca istediğimiz andaki veriyi elde edebileceğiz. Noktalardan geçen doğru'nun neye benzediğiniz Gnuplot'a söylemimiz lazım. Bu bir logaritmik fonksiyon olabileceği gibi trigonometrik fonksiyon da olabilir. Bunu biraz araştırdıktan sonra bir blog sayfasında [buldum](http://jperalta.wordpress.com/2007/01/12/using-gnuplot-for-fit-a-dataset/). Bizim örneğimizde basit bir eğri olduğundan fonksiyonumuz şu şekilde olacak:

**gnuplot> f(x) = a*x + b**

Kısaca y = ax +b olacak. Peki bizim a ve b değerlerimiz nelerdir ? Burada gnuplot devreye giriyor. Kendisi bizim test.dat'daki dosya'dan verileri alıyor ve hesaplama, yanılma yöntemiyle doğru sonucu buluyor(hata payı da var elbette). Onu da şu şekilde yapıyoruz:

**gnuplot> fit f(x) "test.dat" via a,b**

Bunu yazdığımızda uzun bir çıktı geliyor, altıncı denemeden sonra bize nihai sonuçları veriyor, ben sadece bizim işe yarar kısmı gösteriyorum size:


> Final set of parameters            Asymptotic Standard Error
=======================            ==========================

a               = 0.102778         +/- 0.008289     (8.065%)
b               = 297.333          +/- 1.04         (0.3499%)


Gördüldüğü gibi a ve b değerli bulundu. Şimdi sadece şu satırı yazıyorum ve sonuçu elde ediyorum:

**gnuplot> replot f(x)**

Sonuç ise şu şekilde:

[![gnuplot1](http://blog.arsln.org/wp-content/uploads/gnuplot1-300x214.png)](http://blog.arsln.org/wp-content/uploads/gnuplot1.png)

a ve b değerlerinden oluşan denklemimiz ise **y = 0.102x + 297.333** şeklide olacak. Denklemi de elde ettiğimize göre bu denklemden kolayca eğimi bulabiliyoruz. Hepsi bu kadar. Böyle uzun uzun yazıldığına bakmayın, topu topu 6-7 satırdan oluşuyor. Cetvele ve milimetrik kağıt ile uğraşmaktan hem daha zevkli hem daha güvenirli. Umarım yukarıda anlattıklarım işinize yaramıştır. Aşağıdaki bağlantılardan çok daha fazlasını bulabilirsiniz.

[http://t16web.lanl.gov/Kawano/gnuplot/index-e.html](http://t16web.lanl.gov/Kawano/gnuplot/index-e.html)
[http://www.gnuplot.info/docs/gnuplot.html](http://www.gnuplot.info/docs/gnuplot.html)
