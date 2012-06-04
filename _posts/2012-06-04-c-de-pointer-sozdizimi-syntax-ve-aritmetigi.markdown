---
date: '2012-06-05 00:05:00'
layout: post
slug: c-de-pointer-sozdizimi-syntax-ve-aritmetigi
status: publish
title: C'de Pointer Sözdizimi (Syntax) ve Aritmetiği
---


C'de pointer konusunda yüzlerce, binlerce kaynak var. Bu yüzden size sil baştan
pointer'i anlatmayacağım (söz!). Sadece, pointer konusunu öğrenmeye
başlayan herkesin sıkıntı çektiği sözdizimi(**pointer syntaxı**) ve aritmetiği
ile ilgili ayrıntılara **örneklerle** değineceğim. Okuduğum bir çok kaynakta
örnek malesef çok az. Bu yazımda özellikle C'de pointer sözdiziminde kullanılan
yıldız `*` operatörünün neden kafa karıştırdığını ve `*ptr++, *++ptr, ++*ptr,`
vs.. gibi değişkenlerin ne anlama geldiğini anlatacağım. Örnek C kodları da
mevcut olacaktır, yani indirip, derleyip adım adım görebileceksiniz.

##Şimdi pointer nedir?

Pointer bir veri tipidir ve bu veri tipi başka bir değişkeni işaret eder. Peki
nasıl işaret eder? Diğer değişkenin sakladığı(tuttuğu) adres sayesinde doğrudan
oraya işaret eder. Peki pointer nasıl oluşturulur (**declaration**)?  Pointer
tıpkı diğer veri tipleri sözdizimi gibi oluşturulur. Tek fark değişkenin önüne
bir yıldız konmasıdır.  Örneğin aşağıda bir pointer ve örneklerimizi
kullanacağımız bir array verelim

{% highlight cpp %}
int *foo_ptr;
int my_array[] = {13, 4, 9, -5, 45};
{% endhighlight %}

Burada "pointer to int" tipinde bir pointer değişkeni oluşturduk ve bu
değşikenin ismi de **foo_ptr**. Şu an için hiç bir yere işaret etmiyor.
Geçersiz bir durum söz konusu ve bunu gidermek için bir yere işaret etmesini
sağlayacağız. Yukarıda **my_array** değişkeni oluşturmuştuk. Şimdi ona işaret
etmesini sağlayalım:

{% highlight cpp %}
ptr = &my_array[0];
{% endhighlight %}

Array oluşturulurken bellekte bir bütün olarak yer aldığından ilk sayısı
(yani my_array[0]) bize arrayin başlangıcını verecektir. **&** operatoru ise, bize
bir veri tipinin bulunduğu alanın adresini verir. Yukarıda böylelikle **ptr**
değişkenini **my_array** değişkenin ilk elemanına işaret ediyor olacak. **my_array**
elemanı da bir bütün olduğundan aslında hepsini işaret etmiş olacak. Son olarak
belki de önemli bir ayrıntı, & operatoru ile geri dönen verinin tipi **pointer**
cinsinden. Bu yüzden doğrudan **ptr** değişkenine atayabildik.

##İşaret edilen veriye ulaşmak

Pointer'in işaret ettiği veriye ulaşmak için tek yapmamız pointer değişkenin
önüne yıldız koymak. Mesela my_array'deki ilk sayıyı çıktısını alalım:

{% highlight cpp %}
printf("Bu my_array[0] değeri: %d", *ptr); // 13 sayısını gösterecek
{% endhighlight %}

Peki o zaman bu değeri değiştirebilir miyiz? Evet aynen değiştirebiliriz.  Şimdi
sıkı durun. Aşağıda iki tane örnek var, bakalım onlar ne yapıyor:

{% highlight cpp %}
*foo_ptr = 2;
printf("Bu my_array[0] değeri: %d", *ptr); // 2 sayısını gösterecek
{% endhighlight %}

C'deki asıl sorun, `*` operatorunun hem pointer oluşturma için kullanılması
hem de veriyi ulaşmak için kullanılmasıdır. Aslında her ikisini anlamı farklı.
Örneğin aşağıdaki örnek ne yapıyor sizce?

{% highlight cpp %}
foo_ptr = 2;
{% endhighlight %}

Eğer adres atama örneğini iyi anladıysanız bu ifadenin sorunlu bir ifade
olduğunu göreceksiniz. Yukarıdaki örnek 2 sayısını (burada **int** tipinde)
pointere (pointer de burada **pointer of int** tipinde) atamaya çalışacak.
Ama böyle bir şey mümkün değil. Çünkü her ikisinin tipi farklı. Bu yüzden
derlemeye çalışırsanız şöyle bir uyarı çıkacak("-Wall -g" parametreleri ile
derliyorum):

<pre class="terminal">
warning: assignment makes pointer from integer without a cast [enabled by
default] 
</pre>

## Bir başka atama şekli: foo = bar

Tekrar örnek değişkenlerimizi oluşturalım:

{% highlight cpp %}
int *foo_ptr;
int my_array[] = {13, 4, 9, -5, 45};
{% endhighlight %}

Sonra ptr'ye my_array'in adresini atalım:

{% highlight cpp %}
ptr = my_array;  // ptr = &my_array[0]; ile aynı
{% endhighlight %}

Yukarıdaki örnek bir başka sözdizimi farklılığı. Yani istersek bu şekilde de
yazabiliriz. Farklı bir şekilde yazılmış hali diyelim. Herhangi bir adres
pointerini, örneğin &foo[i] , şu şekilde de yazabiliriz kısaca:

{% highlight cpp %}
(foo + i)
{% endhighlight %}

Bizim my_array[0] örneği de haliyle (my_array +0) şekline dönüşüyor. Sıfır ve
parantezleri attık mı, sonuç olarak üsteki sonucu elde ederiz:

{% highlight cpp %}
ptr = my_array;
{% endhighlight %}

## 3[my_array] ve my_array[3] eşittir, nasıl mı ?

Bir önceki örnekte &foo[i] sözdiziminin (foo +i) sözdizimine eşit olduğunu
söylemiştik. O zaman kısa bir hack yapalım. Mesela my_array[3] şu şekilde yazalım:

{% highlight cpp %}
(my_array + 3)
{% endhighlight %}

yerlerini değiştrelim:

{% highlight cpp %}
(3 + my_array)
{% endhighlight %}

Hiç bir şey değişmedi, hala aynı. Son olarak bunu da my_array sözdiziminde yazalım:

{% highlight cpp %}
3[my_array]
{% endhighlight %}

Evet bu mümkün! Inanmakta güçlük çekiyorsanız deneyip sonucu kendi gözlerinizle
görebilirsiniz. Hiç bir zaman böyle bir şey yazmayın, yazmayalım. Sadece neler
olabileceğini görünüz diye yazdım.

---

Aşağıda yukarıdaki örneği denemeniz için kısa bir örnek kod mevcut:

<script src="https://gist.github.com/2870790.js?file=blog_arsln_org_pointer_arithmetic2.c"></script>


Pointer Aritmetiği, örnekler, örnekler..
----------------------------------------

Şimdi buraya kadar gelmişken aşağıdaki örnek değişkenlere bakalım:

{% highlight bash %}
*ptr
*(ptr++)
(*ptr)++
++*ptr
*++ptr
*ptr--
*--ptr
--*ptr
{% endhighlight %}


Gördüğünüz gibi karman çoban bir şey. Her birini anlamı farklı, anlaması zor bir
şeymiş gibi gözüküyor. Ama şu ana kadar anlattıklarımda bir sorun yoksa, bunlar
da bir sorun olmayacak. Şimdi my_array örneğinden gidip her bir değişken ne
yaptığını öğrenmiş olacaksınız. Array ve ptr tanımlarını hatırlatalım:

{% highlight cpp %}
int *foo_ptr;
int my_array[] = {13, 4, 9, -5, 45};
{% endhighlight %}

Sonra ptr'ye my_array'in adresini atalım:

{% highlight bash %}
ptr = my_array;  // ptr = &my_array[0]; ile aynı
{% endhighlight %}

Şimdi devam etmeden önce şunu unutmayın. * operatoru + operatorundan daha
önceliklidir. Yukarıdaki listede parantez kullandıklarım olduğu gibi,
kullanmadıklarım da var. Parantez kullanmıyorsanız ben o koda kötü derim.
Özellikle C gibi bir dilde, pointerleri yukarıdaki gibi kullanacaksanız
kesinlikle parantez kullanın. Parantez kullanılmayan değişkenlerin de neye
dönüştüğünü tek tek öğreniyor olacaksınız birazdan. Başlayalım:

{% highlight bash %}
*ptr // print the value 13
{% endhighlight %}

Bu bize my_array değişkenindeki ilk değeri verecektir. Hatırlayınız ki *
operatoru bir pointer'in önüne konulduğunda, o pointer doğrudan o veriyi
bize gösterir.

{% highlight bash %}
*(ptr++) // print the value (13) and increment pointer
{% endhighlight %}    

Bu bize o anki değeri verecektir, bizdeki örnekte **13** sayısını
verecektir. Fakat ptr pointeri de bir artacaktır. Yani artık ptr bir sonraki
indeksi işaret ediyor.

{% highlight bash %}
(*ptr)++ // print the value (4) and increment the value
{% endhighlight %}

Burada bir üsteki örneğin tersini yapıyoruz. İlk önce değeri alıyoruz. Sonra da
bu değeri artırıyoruz. Çıktı olarak bize 4 verecektir, ama değişkenin değeri
artık 5 olmuştur.

{% highlight bash %}
++*ptr // same as ++(*ptr), increment value (5) and print the value (6)
{% endhighlight %}    

Burada * öncelikli her zamanki gibi. Bu yüzden ilk başta değişkeni bize
verecektir. Yani 5 sayısını. Ama öndeki iki ++ artış operatoru olduğundan 5
sayısı bir artacak yani 6 olacaktır.

{% highlight bash %}
*++ptr // same as *(++ptr), increment the pointer and print the value (9)
{% endhighlight %}    

Bu sefer ilk önce pointeri bir artırıyoruz. Sonra da işaret ettiği yerin
değişkenini alıyoruz. Pointeri bir artırdığımız bir sonraki değeri almış olduk.
Bu da (9) sayısı.

{% highlight bash %}
*ptr-- // same a (*ptr)--, print the value (9) and decrement the pointer
{% endhighlight %}    

Şu anki işaret edilen yerinin değişkenin değerini alıyoruz. Yani bu da bizim
örneğimizde (9) sayısı. Fakat sonra pointer düşürüyoruz. Artık bir önceki yere
işaret ediyor.

{% highlight bash %}
*--ptr // same a *(--ptr), decrement the pointer and print the value (13)
{% endhighlight %}    

Burada pointerin işaret ettiği yeri bir daha düşürüyoruz. Yani en başa döndük.
Sonra da değeri alıyoruz, o da bizim örneğimizde (13)

{% highlight bash %}
--*ptr // same a --(*ptr), increment value (13) and print the value (12)
{% endhighlight %}    

Son olarak değerimizi alıyoruz ve bu değeri bir azaltıyoruz. Yani 13 sayısını 12
olarak geri dönüyor bize.

---

Tabi en iyi deneyim göze görülür bir deneyim. Bu yüzden yukarıda tek tek
anlattığım örnekleri aşağıdaki C kodunu çalıştırıp da görebilirsiniz. Kolaylık
olsun diye ptr adreslerinin de çıktısını veriyorum. Böylelikle pointer
adreslerinin nasıl artığını gözünüzle göreceksiniz.

<script src="https://gist.github.com/2870682.js"> </script>


Evet hepsi bu kadar. Bir sonraki yazıma vakit ayırabilirsem, iki boyutlu
arraylar (pointers to pointers to data type) ve struct ilişkisini yazmayı
düşünüyorum. O zaman işler daha da karmaşık hale geliyor haliyle. Ama umarım
yukarıdaki örnekler az çok işinize yaramıştır diye düşünüyorum.  Sormak
istediğiniz, aklınıza takılanlar varsa, yanlış bulduğunuz kısımlar varsa yorum
kısmına yazın lütfen.

