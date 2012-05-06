---
date: '2011-11-29 11:52:47'
layout: post
slug: c-dilinde-char-veri-tipi-ve-platform-bagimli-sorunlar
status: publish
title: 'C dilinde "char" veri tipi ve platform bağımlı sorunlar '
wordpressid: '1061'
categories:
- Gezegen
- Linux
- Programlama
tags:
- c
- char
- gcc
- Linux
- signed char
- unsigned char
- veri tipi
---

Bugün ofiste **getchar()**, **putchar()** fonksiyonları ile küçük ASCII denemeleri yapıyordum. Bunlara bakarken "char" veri tipi ile de biraz haşır neşir oldum. Beklemediğim bir kaç davranışla da karşılaştım. Aklımdan kalanları kısaca aktarmak istiyorum:

**"char"** veri tipi, C'nin **basit** veri tiplerinden sadece biridir. Diğerleri ise sırayla **int, float, double ve void**. Bu birincil veri tipleri de yine kendi aralarında bazı ön ekler alarak yeni veri tipleri oluşturuyorlar. Örneğin **long int, short int, unsigned long int**, vs.. gibi.
Bu veri tiplerinin her birinin bellekte tuttukları miktar da farklıdır. Aşağıdaki tablo'da örneklerini görebilirsiniz (char ile ilgili kısım yanlış, önü göz ardı edebilirsiniz):

[![C veri tipleri](http://arsln.org/wp-content/uploads/data_types_c.jpg)](http://arsln.org/wp-content/uploads/data_types_c.jpg)

<!--more-->

Gördüğünüz gibi her veri tipinin büyüklüğü farklı olabiliyor. Ayrıca aldıkları önekler (_short ve long_) sayesinde bunları küçültüp veya büyütebilirsiniz. 

_"char"_ veri tipi ise ailemizin en küçük veri tipi diyebiliriz. Kendisi aslında tıpkı _"int"_ gibidir, yanı tam sayılar için tasarlanmıştır. Bu yüzden tam sayı hesaplamaları için de kullanabiliriz. Fakat C dili ile kod yazarken de C'nin dahili olarak desteklemesi gereken belirli bir karakter kümesi olması gerekiyor. Yoksa dünyada herkes kafasına göre bir karakter seti kullanabilirdi (hiragana, kiril, arapça, türkçe,vs..). Bu yüzden C standardında ASCII karakter seti kullanılınıyor. Her bir karakter de birer tam sayı olarak kaydediliyor. Örneğin **"A" harfi ASCII'ye göre "65" sayısına** denk geliyor. Hangi harfin hangi sayıya denk geldiğini [ASCII tablosundan](http://www.asciitable.com/) bakabilirsiniz.

Üç çeşit char veri tipi var, her birinin sahip olabileceği veriler ve isimleri şu şekilde:

  * char --> Bilgisayar platformuna göre signed char veya unsigned char olabiliyor
  * signed char --> [-128, 127]
  * unsigned char --> [0, 256]

Yukarıdaki listeye bakarak iki çeşit _"char"_ veri tipi var diye düşünmeyelim. Her biri kendince anlamı olan veri tipleridir. _"char"_, _"signed char"_ veya _"unsigned char"_ adında üç çeşit karakter veri tipi var. _"signed char"_ veri tipi ise gömüllü sistemlerde ya da bilimsel kodlarda çok sık kullanılınır, çünkü kendisi en az yer kaplayan ve negatif,pozitif sayılar  kümesini içeren tek veri tipidir. Ama genel olarak insanlar her daim _"char"_ veri tipini kullanıyor. Yani şu şekilde bir şey:

{% highlight bash %}
char a = 30;
{% endhighlight %}


Şimdi bu örnek hiç bir platformda sorun çıkarmayacaktır (ayrıca belirttiğim gibi char tam sayı saklayabilen bir veri tipidir). Çünkü hem _"signed char"_ hem de_ "unsigned char"_ tam sayı aralığına uyuyor. Peki şöyle bir örnek yazdığımızda ne olacak:

{% highlight bash %}
char a = 255;
{% endhighlight %}

Burada okumayı bırakıp küçük bir deneme yapabilirsiniz. Muhtemelen iki türlü cevap gelecektir. Yukarıda değindiğim gibi _"char"_ veri tipi bilgisayar platformuna göre değişiyor. x86 GNU/Linux ve Microsoft Windows'da  **"signed char"** olabilirken, PowerPC ve ARM processors genellikle** "unsigned char"** olabiliyor. Bu yüzden:

  * "signed char" ise** a = -1 değerini** alacak (neden -1 ? yazının sonunda açıklaması mevcut)
  * "unsigned char" ise **a = 255 değerini** alacak

Görüldüğü gibi hiç beklemediğiniz sonuçlara yol açabilir **sade bir "char"** veri tipi. Bunun önüne geçebilmenin yolları var, en mantıklı ve güveniliri en baştan _"signed char"_ veya _"unsigned char"_ veri tiplerini kullanmak. Bunu bir alışkanlık haline getirmek iyi bir davranış olabilir. Başka bir seçenek ise derleyici sisteminin desteklediği parametrelerini kullanarak "char" veri tipini sınırlamak. Örneğin **GCC** ile derliyorsanız , **-fsigned-char** ve **-funsigned-char** parametrelerini kullanarak  "char" veri tipinin etki alanını kısıtlayabilirsiniz.

Yazımın başında da değindiğim gibi **getchar()** ile denemeler yapıyordum. **getchar()** fonksiyonu veri tipi olarak _"char"_ yerine _"int"_ veri tipi dönderiyor. Yani klavye'den **"A" tuşuna bastığınızda size "65"** sayısını döndürecek. Peki neden "char" değil de "int"? Genel olarak getchar() fonksiyonu **EOF** ile birlikte kullanacak şekilde tasarlanmıştır. EOF sayesinde **dosyanın sonunu öğrenebilme(end-of-line**) ya da getchar() ile veri almayı durdurabiliriz (örneğin CTRL+D tuş kombinasyonu ile EOF yaratabilirsiniz). **EOF'un değeri ise "-1"** olarak belirlenmiştir. Bunu linux platformlarında **/usr/include/stdio.h** dosyasını açarak ~112 satır numarasına bakarak görebilirsiniz. Şöyle bir kod parçası vardır:

{% highlight c %}
/* End of file character.
   Some things throughout the library rely on this being -1.  */
#ifndef EOF
# define EOF (-1)
#endif
{% endhighlight %}


Genellikle **getchar()** kullanırken insanlar _"char"_ veri tipi kullandıkları için sorun oluşabiliyor. Aşağıdaki gibi bir kod parçası düşünün:

{% highlight c %}
#include

int main (void)
{
  char a;
  while ((a = getchar()) != EOF)
      printf("%c\n", a);

  return 0;
}
{% endhighlight %}

Burada **getchar()** fonksiyonunun dönüş değeri için "char = a" veri tipi kullanılmıştır. Örneğin GNU/Linux makinede bu kodu derlediniz ve sizin _"char"_ veri tipini _"signed char"_ veri tipine dönüştü. Sonra bu kodu çalıştırdınız ve klavyeden verileri girmeye başladınız. Muhtemelen hiç bir sorunla karşılaşmayacaksınız. Çünkü "signed char" -128'den 127'ye kadar tüm tamsayı değerlerini alacaktır.

Fakat bu kodu **ARM mimari** bir platformda çalıştırınca _"char"_ veri tipi _"unsigned car"_ veri tipine dönüşecektir. Bu veri tipi de 0 ile 256 arasındaki tamsayı değerleri alıyor. Peki EOF burada hangi değeri alacak? Siz **CTRL+D bastığınız an** ya da bir dosyanın sonuna geldiğinizde geri dönen "-1" değeri 255'ye dönüşecektir(yazımın sonunda neden böyle olduğunu anlatacağım). Böyle olunca **while** döngüsü sonsuz bir döngüye girecek ve hiç çıkamayacaksınız. Yukarıda kod parçasında **"int" ile tanımlanmış veri tipini "unsigned char" olarak belirtmemiz sorunu düzeltecektir**. Düzeltme şu şekilde olacaktır: 

{% highlight bash %}
#include

int main (void)
{
  unsigned char i;
  while ((i = getchar()) != EOF) 
      printf("%c\n", i);

  return 0;
}
{% endhighlight %}

Yukarıdaki kod parçası taşınabilinir ve daha güvenilirdir.

Yazıda sık sık "-1" <=> "255" dönüşümünü görmüşündüzdür. İki tür örnekle karşılaşmıştık:

  * "char a = 255" değerinin "signed char" veri tipinde "-1" dönüşmesi 
  * "char a = EOF" değerinin(EOF = -1 ..) değerinin "unsigned char" veri tipinde "255" dönüşmesi


İlk örnek için devam edelim. 255 numarası **ondalık sayı sistemi** ile ifade edilmiştir. Fakat "_unsigned_" ve "_signed_" kavramları ikili sayı sistemine göre tasarlanmıştır. 255 sayısının ikili sayı sistemindeki değeri ise **1111 1111**, yani 1 byte (8-bit) yer kaplıyor. Şunu not alın "1111 1111" ikili sayısı "signed char" olarak belirlinmiştir(doğrudan bu şekilde kaydediliyor). Fakat signed ikili sayıları 1 + 7 bit şeklinde belirleniyor. En soldaki ilk bit sayının negatif(1 ise) ya da pozitif(0 ise) olduğunu gösterir, kalan 7 bit ise sayının değerini gösterir. Bu yüzden örneğimiz şu şekilde:

{% highlight bash %}
1 111 1111 (negatif bir sayı ve sayımızın ikili değeri 111 1111)
{% endhighlight %}

Signed ikili sayıları tekrar ondalık sayısına çevirmek ise basit bir işleme bakıyor. Sayının "2's complement"ini almak. Bunu da kısaca tüm sayıları tersine çevirip, çevirdikten sonra +1 bir ekliyoruz. Devam etmeden önce kısa bir örnek yapalım:

{% highlight bash %}
101 1001
{% endhighlight %}

sayısını çevirelim. İlk önce her bir numarayı tersine çeviriyoruz

{% highlight bash %}
010 0110
{% endhighlight %}

ardından +1 bir ekliyoruz:

{% highlight bash %}
010 0111
{% endhighlight %}

Kısacası 101 1001 numarasının 2s complement eşleniği 010 0111 oluverdi.

Tekrar örneğimize geri döndüğümüzde, bizim elimizdeki numaranın **"111 1111"** tersini alıp **"000 0000"** +1 eklediğimizde **"000 0001"** sayısını elde edeceğiz. Bunun ondalık sistemindeki değeri de kısaca "1" dir. Fakat unutmayın ki bu sayı negatif bir sayıdır (en soldaki bir negatif olduğunu gösteriyordu). Bu yüzden **sayımız "-1" olarak gözüküyor**. Yani bizim meşhur "_char a = 255_" değerinin "signed char" veri tipinde "_-1_" dönüşmesinin sonucu diyebiliriz.

İkinci örneği siz okurlara bırakıyorum, bu sefer tersten gitmeniz gerekiyor ve elinizdeki sayı unsigned olacağından 255 sayısını elde edeceksiniz.

Hepsi bu kadar. Görüldüğü gibi küçük bir veri tipi dikkat edilmediğinde bir çok soruna aşabiliyor. Bununla ilgili başınızdan geçen senaryolar, sorularınız veya merak ettikleriniz varsa yorum kısmından sorabilirsiniz. Bir çok kaynaktan yararlanmıştım, aşağıdaki bağlantılardan detaylı bir şekilde bakabilirsiniz:

1. [http://www.network-theory.co.uk/docs/gccintro/gccintro_71.html](http://www.network-theory.co.uk/docs/gccintro/gccintro_71.html)
2. [http://www.lix.polytechnique.fr/~liberti/public/computing/prog/c/C/CONCEPT/data_types.html](http://www.lix.polytechnique.fr/~liberti/public/computing/prog/c/C/CONCEPT/data_types.html)
3. [http://www.dreamincode.net/forums/topic/23249-trying-to-understand-signed-char-variable/](http://www.dreamincode.net/forums/topic/23249-trying-to-understand-signed-char-variable/)
4. [http://stackoverflow.com/search?q=signed+char](http://stackoverflow.com/search?q=signed+char)






