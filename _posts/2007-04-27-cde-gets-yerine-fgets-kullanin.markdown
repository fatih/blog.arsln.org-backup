---
date: '2007-04-27 22:35:01'
layout: post
slug: cde-gets-yerine-fgets-kullanin
status: publish
title: C'de gets yerine fgets kullanın
wordpressid: '227'
categories:
- Programlama
tags:
- c
- code
- fgets
- gets
- ipucu
- Programlama
---

Okulda verilen ödevi yapmaya çalışırken bu iki komut ile karşılaştım, sonra her ne kadar işime yaramadığını anladıysam da, ileride belki işime yarayabilir diye öğrenmiştim.İlk başta bir string tanımlayalım, 50 byte büyüklüğünde.

`char string[50];`

Ardından istediğiniz yere : **gets(string);** yazın. Sizden scanf komutu gibi stringi doldurmanızı isteyecek. Fakat boşluklar da dahil. Uzun yazılar için birebir yani. Gets'e benzer birde fgets komutu vardır. Gets yerine fgets kullanmak da daha mantıklıdır. Çünkü gets string'in büyüklüğünü gözardı ediyor. Nasıl yani ? 

Şöyle ki, örneğin gets ile 110-120 karakterlik bir cümle yazdıysanız, programınız sağlıklı çalışmaz, hata verir. Gets tüm yazdığınız karakterleri kaydetmeye çalışacak. Fakat bizim string'e ayırdığımız alan sadece 50 byte. Bu yüzden fgets'kullanmak daha mantıklı. Kullanımı da şu şekilde:

`fgets(string, sizeof(string), stdin);`

Burada string bildiğimiz string, **sizeof(string)** ise string'in büyüklüğü(byte olarak), stdin de standart input, yani klavyeden girdiğimiz veri. **Stdin** yerine de dilerseniz dosya adını da yazabilirsiniz.  **sizeof(string)** yerine _100, 53, 134_ gibi sayılar da yazabilirsiniz. Size bağlı. Bu yüzden fgets'i kullanmak daha iyi, çünkü belirleyici bir sayı var, onun geçmesine izin vermiyor. 
_
Not:(Yazıda ingilizce kelimelerin Türkçe karşılığını bilmediğim için aynen öyle yazdım, string gibi.)_
