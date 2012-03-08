---
date: '2008-08-27 21:25:43'
layout: post
slug: staj-projesi-synergy-entegrasyonu
status: publish
title: Staj Projesi - Synergy entegrasyonu
wordpressid: '463'
categories:
- Gezegen
- Linux
tags:
- avahi
- pardus
- pardus stajı
- staj
- synergy
---

Staj başladı ve geride 3 gün bıraktım. İlk önce şunu belirteyim ki buradaki ortam çok şahane. Herkes birbirine yardım ediyor, destek sağlıyor, büyük bir aile gibi yani. Burada misafirhane'de **Ankara TÜBİTAK**'ta çalışan 3-4 kişi ile de tanıştım. Sağ olsunlar onlar da baya yardımcı oldular, oluyorlar.Burada sanki herkes birbirini tanıyor gibi. Güzel bir yer, çok sevdim.

İlk gün tanışma faslından sonra  projeler tahtaya yazıldı ve sonra da beyin fırtınası yapılarak herkese uygun olan proje verildi. Emre Aladağ da bu konuda bir şeyler yazdı, [okuyabilirsiniz](http://www.emrealadag.com/pardus-stajim-basladi-184.html). Benimki ise [Synergy](http://synergy2.sourceforge.net/) ile ilgili olan projeydi. Danışmanlarım ise Pınar ve Faik abi. Staj boyu süresince bu proje üzerinde çalışacağım, tabi erken ya da geç de bitebilir bilmiyorum henüz.

**Synergy nedir ?**

Bir örnek üzerinde açıklayayım. _Linux_ kurulu bir bilgisayarınız var, bunu dışında bir tane de _Windows_ yüklü ayrı bir makineniz var. Her iki bilgisayarı da kullanıyorsanız, ekranları da yan yana. Fakat her zaman klavyeleri değiştirmek, fareyi değiştirmek bir süre sonra zor olabiliyor. [Synergy](http://synergy2.sourceforge.net/) ile işte bir bilgisayarın, ki bunu siz belirliyorsunuz , bizim örneğimizde Linux kurulu olan, klavyesini ve farenizi her iki taraf için de kullanabiliyorsunuz. Ayrıca bu sadece 2 değil, 3 tane bilgisayar için de geçerli. Solunuzda _Mac_, sağınızda Windows, tek bir klavye ve fare ile hepsini kullanabilirsiniz.

**Synergy nasıl çalışır ?**

Her bilgisayar kurulması gerekir. Bir server olacak, bu bizim ana bilgisayarımız, bizim örnekte server Linux kurulu bilgisayar. Bir de client'ler olacak, bunlar da diğer tüm bilgisayarlarda olacak. Bizim örnekte Windows ve Mac yüklü bilgisayarlar client'tir. Synergy her bilgisayar yüklenmesi gerekiyor yine hatırlatayım. Ardından synergy.conf dosyası vardır, Server bilgisayarında düzenlenecek bu dosya, client tarafında ayara gerek yoktur.Fakat Client tarafı hangi bilgisayarın Server olduğunu bilmesi lazım, ve bunu da siz yazmanız lazım. Ayara gerek yok, ama "**_synergyc -f hostname_**" komutu ile belirtmeniz lazım, her client için geçerli olacak bu. O yüzden client tarafından da biraz uğraş var.

**Pardus'ta Synergy entegrasyonu nasıl olacak peki?**

Şimdi birinci kısım synergy.conf olayı olmayacak, tasma için hazırlanan bir arayüz olacak ve oradan kolay bir şekilden ayarlanabilinecek. İkinci kısım ise, server tarafı kolay bir şekilde tasma'dan ayarladıktan sonra, client kısmında hiç bir iş düşmeyecek. [Avahi](http://avahi.org/) sayesinde client'ler server'den haberdar olacak, ve otomatik olarak synergy'e ayarlanacak. Synergy'de avahi desteği yok ayrıca, bu da eklenecek. Tabi bu sadece Pardus için geçerli olacak. İlerleyen zamanlarda daha tekntik detayları anlatacağım.
