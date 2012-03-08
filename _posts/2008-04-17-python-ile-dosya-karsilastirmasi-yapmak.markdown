---
date: '2008-04-17 04:01:59'
layout: post
slug: python-ile-dosya-karsilastirmasi-yapmak
status: publish
title: Python ile dosya karşılaştırması yapmak
wordpressid: '417'
categories:
- Hayat-Yaşam
tags:
- betik
- ekran
- fedora
- ipucu
- monitor
- pardus
- Programlama
- python
- script
- string
---

[Pınar](http://pinguar.org/gunluk/) ile Jabber'den konuşurken Pardus için küçük bir iş olduğunu söylemişti. Kendisine eğer ufak tefek şeyler olursa yapmaya çalışırım demiştim zamanında. Kendisi de Fatih Aşıcı'nın küçük bir işini bana söylemişti. Fatih ile de konuştuk sonra bu işi. Gerçi sonra farklı bir yol izledik, ama ben yine de öğrendiğim ve yazdığım bu betiği paylaşayım. Bu gibi yazılar çokça görebilirsiniz şimdiden diyeyim :)  Gelelim işin nasıl bir şey olduğuna.

Şimdi elimizde iki tane liste var. Bu listelerde her ekran markasının hangi frekanslarda çalışması gerektiği yazar. Bir tanesi Fedora'ya ait, diğeri de Pardus'un kendi listesi. Fedora'da yaklaşık **5200** tane Pardus'ta ise yaklaşık **4400** tane girdi var. Şimdi sorun şu, Fedora'da olup ama Pardus'ta olmayan belki yüzlerce model var. Fedora'da her model için Pardus'ta olup olmadığına bakıp eklememiz lazım. Hal öyle olunca binlerce satır'a teker teker bakmak zor oluyor. Ben de bunu bir Python betiği ile halletim. İlk önce betiğinin kendisini vereyim ve ardından betik hakkında bilgileri veririm:









[cc lang="python"]
#!/usr/bin/python
# -*- coding: utf-8 -*-

first = []
second = []
fourth= []
third = open('templiste','w')
fifth = open('yeniliste','w')

for line in open('fedora','r').readlines():
    first.append(line.rstrip())

for line in open('pardus','r').readlines():
    second.append(line.rstrip())

for x in first:
    if x in second:
        pass
    else:
        if x[-1] == '1':
            y = x.rstrip('; 1')
            if y in second:
                second.remove(y)
                third.write('%s\n' % x )
            else:
                third.write('%s\n' % x )
        else:
            third.write('%s\n' % x )

third.close()

for line in open('templiste','r').readlines():
    fourth.append(line.rstrip())

for z in first:
    fourth.append(z)

nodupes = []
[nodupes.append(i) for i in fourth if not nodupes.count(i)]

nodupes.sort()

for a in nodupes:
    fifth.write('%s\n' % a )

fifth.close()

[/cc]













	
  * **Satır 4-8**: Üç tane boş liste oluşturuyoruz. Ayrıca "_third_" "_fifth_" adlı değişken üzerine yazılabilir bir dosya oluşturuyoruz


	
  * **Satır 10-14**: Ellimizde iki liste var demiştim, burada _Fedora_ ve _Pardus_ adlı iki dosyayı bir for döngüsü ile liste haline dönüştürüyoruz. Her bir satırı alıyor, ve Fedora'da first adlı, Pardus'ta second adlı listeye ekliyor. Eklenen satırların sonunda "\n" ibaresi olacağından bunları **"rstrip()" ile siliyoruz**. 


	
  * **Satır 16-28**: Burada şimdi en başta bir for döngüsü var, Fedora dosyası için ilk baştan başlayarak sonuna kadar her bileşeni teker teker alacak. "İf x in second" kısımlı yerde Fedora'dan aldığımız her değer için second yani Pardus listesine bakacak. Eğer aynısı var ise, hiç bir şey yapmıyor(_Bize de zaten Pardus'ta olmayanlar lazım_).  Eğer aynısı yoksa o zaman devam ediyor. Şimdi şöyle bir sorunumuz var ayrıca, liste'de bazı satırların sonunda 1 olabiliyor. Fakat diğerinde aynı satır fakat sonunda 1 olmayabiliyor. Bunları da aslında aynı şeyler. Örneğin:

Acer; Acer 11D; API440B; 31.0-35.5; 50.0-90.0; 1 (Fedora listesindeki girdi)
Acer; Acer 11D; API440B; 31.0-35.5; 50.0-90.0 (Pardus listesindeki girdi)

O yüzden ilk önce bu satırın sonunda bir var mı yok mu ona bakıyoruz (ii x[-1] == '1'), eğer varsa sonundaki "; 1" kısmını rstrip ile siliyoruz ve **y değişkenine kaydediyoruz**. Ardından bu y değişkenine tekrar bakıyoruz , eğer varsa o zaman Pardus'takini siliyor, eğer yoksa bunu "templiste" adlı dosya'ya ekliyor. Eğer satırların sonunda 1 yoksa ve Pardus listesinde de yoksa bunu "yeniliste"'ye ekliyor. Tüm bu işlemlerin sonunda "templiste" adlı bir dosya oluşuyor. 


	
  * **Satır 32-36**: Şimdi ellimizde bir "_templiste_" var, birde Pardus'un kendi listesi(içinden de bazı girdileri sildiğimiz liste). Bunların ikisini _fourth_ adlı bir liste'ye ekliyoruz. Bundan bizim nihai liste oluşacak


	
  * **Satır 38-39**: **6000'e yakın** girdi olduğundan çift girdi olma ihtimaline karşın bunları siliyoruz ve _fourth_ listesinden yeni bir tane, çift girdilerden arındırılmış bir liste oluşturuyoruz, onun da adı _nodupes_.


	
  * **Satır 41-46**: "_Templiste_" ve "_fourth_" adlı listeleri topladığımızda belirli bir sıra yoktu, **sort()** ile alfabetik bir sıralamaya göre sıralıyoruz liste'yi tekrardan. Son olarak sıralanmış, nihai listemiz "**nodupes**"'u  bir dosya'ya yazdırıyoruz. Bu dosya'nın adı ise "**yeniliste**"(betiğin başlarında bunu fifth olarak belirlemiştik)





Hepsi bu kadar. Kısaca ne yaptı bir daha incelersek:

_-Fedora olup ama Pardus'ta olmayanlar eklendi listeye
-Fedora'da sonu 1 fakat Pardus'ta sonu 1 olmayanlar eklendi listeye
-Pardus'un kendi orijinal listesi de dahil haliyle
-Son olarak çift girdi olanlar silindi  _

Yinelemekte fayda var, yeni olduğumdan kesinlikle daha kolay ve basit bir yöntem ile yapılabilir. En azından benim aklıma il gelen "if x in second" kısmını sadece x değil, x'in sonunda 1 olmayanlar da dahil edilebilir ve daha az satırlı bir şey elde edilebilirdi. Ayrıca dosya'yı manüel olarak elden girmek yerine doğrudan web üzerinden çekip öyle de işleyebiliriz listeleri. Benim için iyi bir egzersiz oldu bu betik, en azından yeni şeyler öğrenmiş oluyorum :)

_Not: Aslında kısaltılmış şekilde gözükmesi lazım rss'de. Anasayfa'da kısaltılmış şekilde gözükürken Rss beslemesinde gözükmüyor. Büyük ihtimalle Wp 2.5'den kaynaklanıyor._
