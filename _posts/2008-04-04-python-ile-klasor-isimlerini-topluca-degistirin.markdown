---
date: '2008-04-04 00:55:49'
layout: post
slug: python-ile-klasor-isimlerini-topluca-degistirin
status: publish
title: Python ile klasör isimlerini topluca değiştirin
wordpressid: '407'
categories:
- Gezegen
- Programlama
tags:
- batch rename
- betik
- ipucu
- kod
- Linux
- Programlama
- python
---

2-3 haftadır Python çalışıyorum tekrardan ve bu sefer bir çok şey öğrendim. Öğrendiğim yeni bilgileri sizlerle paylaşayım dedim. Uzun zamandır aklımı meşgul eden bir konu vardı onu Python sayesinde halletim bu sayede. Şimdi kısaca bilgisayarımda fotoğraflarla dolu 20-30 tane klasör var, bunları da hep şu şekilde yazmıştım:

**Almanya_ekim_2007
Bolum_temmuz_2006
Bilmemne_hede_höde_2008**

Fakat sonraları baktım ki bu biçim bana uygun değil,sondaki yıl ibarelerini en başa getirirsem çok daha uygun olacağını anladım, yani şu şekilde bir şey:

**2007_almanya_ekim
2006_bolum_temmuz
2008_bilmemne_hede_höde
**

Haliyle bir sürü klasör olunca hepsini elle teker teker yapmak yerine bir tane küçük Python betiği yazayım ve kendisi hepsini değiştirsin dedim. İlk önce yazdığım betik aşağıdaki gibi:

[cc lang="python"]
#!/usr/bin/python
# -*- coding: utf-8 -*-

import os, re

def renamer():
    for filename in os.listdir(os.curdir):     
        if re.search('(\w)_(\d)', filename):
            m = re.compile('([a-z_]*)_([0-9]*)', re.IGNORECASE)
            names  = m.search(filename)
            newfilename = names.group(2) + '_' + names.group(1).lower()
            print newfilename
            #os.rename(filename, newfilename)

if __name__ == '__main__':
    renamer()
[/cc]

Betiği klasörleri değiştirmek istediğimiz klasörün içinde çalıştırmamız lazım. Kısaca yaptığı adımlar şunlar(satır numaralarına göre):




	
  * Satır 7:  Klasörün içindeki klasörlerin bir listesini çıkartıyor, ve teker teker isimleri alıyor


	
  * Satır 8:  Eğer klasörlerin sonunda sayılar varsa devam et, yoksa hiç bir şey yapma


	
  * Satır 9:  Klasör isimlerini için bir tane regex ifadesi yazıyoruz.


	
  * Satır 10:Ardından bu regex ifadesi için bizim klasör'ler aranıyor ve ona göre bulunuyor


	
  * Satır 11:Bulunduktan sonra names.group() şeklinde bunlara ulaşabiliyoruz, bunlarla da istediğimiz şekildeki yeni dosyamızı oluşturuyoruz, ben 2008 + _ + dosya_deneme şeklinde yaptım, sizler farklı yapabilirsiniz tabi.

 
	
  * Satır 12:İstediğimi ifadeler doğru çıkıyor mu, çıktısına bakalım


	
  * Satır 13:Eğer doğru ise bu satırın önünde # ifadesini kaldıralım.





Öğrendiklerim bazı noktalar var, örneğin regex ifadelerini kesinlikle çok iyi bilmek lazım. Örneğin 9'uncu satırdaki ifade'yi irc'de acemi'den aldım. Ondan önce re.split ile bir yöntem denemiştim fakat tam istediğim gibi olmadı. O yüzden bu gibi işlemler için regex ile aranız ne kadar iyi olursa sizin için daha iyi olacaktır. Örneğin 8'inci satırdaki if durumunu kitaptan bakarak yaptım ve istediğim şekilde çalıştı. \w tüm alfabetik harfler demek, \d ise tüm sayılar demek. Yani eğer harfler_sayılar şeklinde bir dosya ismi var ise filename içinde o zaman devam edecek, yoksa betik hiç bir şey yapmayacak. Ayrıca büyük harfleri küçük harflere dönüştürmek için sadece .lower() ifadesini ekledim, aynı şekilde yeni bir isim oluşturmak tıpkı lego taşları ile oynamak kadar kolay. Gerçekten sevilesi bir dil Python. 

Betiği düzgün bir şekilde çalıştıdıktan sonra, sonuçlar da şu şekilde olacaktır:

[![Python Betik](http://blog.arsln.org/image/degistir_python.jpg)](http://blog.arsln.org/image/degistir_python.jpg)

Ayrıca bu betik yazdığım ilk Python betiği özelliğini taşıyor. O yüzden ki bir sürü hata ya da gereksiz kod parçası olma olasılığı çoktur. Onun dışında Python ile cidden kısa zamanda güzel işler yapabilirsiniz, zaten kullandıkça yeni şeyler öğrenmemek elde değil. Bakalım zaman ne gösterecek inşallah zamanla çok daha farklı şeyler öğrenmiş oluruz. 





