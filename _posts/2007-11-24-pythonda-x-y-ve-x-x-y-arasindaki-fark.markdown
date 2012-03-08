---
date: '2007-11-24 15:28:49'
layout: post
slug: pythonda-x-y-ve-x-x-y-arasindaki-fark
status: publish
title: Python'da X += Y ve X = X + Y arasındaki fark
wordpressid: '355'
categories:
- Programlama
tags:
- augmented assignment
- python
---

Bir nesneyi başka bir nesneye eklemek için genellikle şu ifade kullanılır

`X = X + Y`

Burada X'deki değeri alıp Y ile beraber yine X'e kayıt ediyor. Bu yöntem çokca kullanıldığı için C,Python gibi dillerde şu ifade de kullanılabiliyor

`X += Y`

Bu yukarıdaki ifade ile aynı. Velakin Python'da örneğin listeler ile uğraşırken bunu kullanmak yerine list komutunun kendi içinde barındırdığı özellikleri kullanabiliriz, örneğin .append veya .extend gibi. L = [1,2] ifadesi için şu örneği ele alalım

`L = L + [3]`

Burada 3 sayısını **L** listesine ekliyebiliyoruz. Aynı işlemi şu şekilde de yapmamız mümkün

`L.append(3)`

Gördüğünüz gibi ikiside aynı işlemi yapıyor. Fakat yukarıdaki örnekte, yani + kullandığımı örnek diğerine göre çok daha yavaş. Çünkü ekleme yapılırken yeni bir nesne oluşturuluyor, soldaki L listesine kopyalanıyor, bu da sağ tarafdaki L listesine kopyalanıyor. Halbuki L.append yaparken var olan L listesine 3 sayısı ekleniyor. 

Şimdi Python'da şöyle bir özellik var. [Kitabı](http://blog.arsln.org/python-kitabim-geldi-bu-sabah/) okurken gördüm. Eğer siz L listesine 3 sayısını şu şekilde

`L += [3]`

eklerseniz, aynı **L.append()** şeklinde ekliyor. Yani bizim için daha avantajlı oluyor(daha hızlı olduğu için). Bu demek ki, Python'da eklemeler yapılırken kesinlikle +=(-=,*=,..) gibi ifadeler(Ingilizce'de: _augmented assignment_) kullanmamız bizim için daha iyi olacaktır. 

_Not:(Python öğrenirken bana göre ilginç ve işe yarayan ipuçları sizlerle bu şekilde paylaşmayı düşünüyorum)_
