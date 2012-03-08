---
date: '2007-06-08 19:48:12'
layout: post
slug: how-to-fdm-ve-bogofilter-mutt-adapte-etmek
status: publish
title: Fdm ve Bogofilteri, Mutt'a adapte etmek
wordpressid: '253'
categories:
- Gezegen
- Linux
tags:
- bogofilter
- fdm
- ipucu
- mutt
---

Daha önceki yazımda **Fdm, Msmtp ve Mutt** ile bir eposta düzeneği kurduğumu [anlatmıştım](http://blog.arsln.org/fdm-mutt-ve-msmtp-ile-e-postalarinizi-daha-verimli-ve-duzenli-kullanin/). Ayarlama dosyaları, nasıl yapıldığına dair ipuçlarını o yazıda bulabilirsiniz. Fakat son günlerde spam mailleri artmaya başladı, her ne kadar mail'lerimi Gmail üzerinden alsam dahi, kendi bilgisayarıma da bir tane kurmaya karar verdim. Bunun için de uzun zamande önce [Sylpheed](http://sylpheed.sraoss.jp/en/) için kullandığım [Bogofilter](http://bogofilter.sourceforge.net/)'i kurmaya karar verdim.

Bogofilter, [Eric S. Raymond](http://catb.org/~esr/) tarafından başlatılan bir proje. İleriki senelerde başka kişiler de katılarak daha güzel bir hal aldı. Gelelim Bogofilter'i Fdm ile nasıl kullandığıma dair. Google da bir [arama](http://www.google.com/search?q=fdm+bogofilter) bana hiç bir şey getirmedi. Sadece uzun bir fdm.conf [dosyası](http://ft.bewatermyfriend.org/comp/data/fdm/fdm.conf.html) vardı arama sonucunda. Bu dosya da çok profesyonel bir şekilde hazırlanmış ve istemediğim bir sürü şey vardı. Bu dosya'dan ve Bogofilter [yardım sayfalarından](http://bogofilter.sourceforge.net/faq.shtml) bir bağlantı kurarak, bu işin nasıl yürütüleceği hakkında bir takım ipuçlar çıkardım. Onları birleştirdim ve **fdm.conf** dosyasına yazdım. Ardından deneysel bir e-posta aldım ve kendime gönderdim, gelen e-posta'yı da spam olarak işaretledim. Ardından tekrar yolladığımda, e-posta'nın spam klasörüne düştüğünü gördüm, bu da Bogofilter'in doğru çalıştıştığını gösterdi. 

Kısaca mantık şu:



Gelen tüm mail'ler Bogofilter filtresinden **geçirilmek** zorunda. Geçirilidikten sonra Bogofilter spam ya da spam değil diye ayırıyor(spam olup olmadığ belli değil). Spam olanlar Spam dosyasına, spam olup olmadığı belli olmayan e-posta'lar ise gelen kutusuna yani benim inbox klasörüme düşüyor. 

Bunun gerçekleşmesi için fdm.conf dosyasına şu satırları ekledim:

[source:xml]
$spamkomutu   = "bogofilter -p -e -u" 
action "spam-filter"          rewrite       "${spamkomutu}"
 
match all action "spam-filter" continue
 
match "^X-Spam-Status: Yes" in headers action "spam"
match "^X-Bogosity: Spam" in headers action "spam"
match "^X-Bogosity: Unsure" in headers action "inbox"
[/source]

Sırayla şu şekilde işliyor, **spamkomutu** adında bir değişken tanımlanıyor, ardından **spam-filter** adında bir fonksiyon oluşturuluyor. Yani artık spam-filteri çağırdığımız her yerde bu komut çalışacak_(fdm için tabi)_. Ardından gelen tüm mailler spam-filter komutundan geçirilecek. Bunları da sonra istenilen klasörlere yollanacak. Belli olmayan e-posta'lar için ben inbox klasörüme kullandım, siz isterseniz ayrı bir klasör oluşturabilirsiniz. 

Buraya kadar tamam, fakat bir de Mutt içinden Bogofilter'i çağırabilmemiz gerekiyor. Çünkü bogofilteri eğitmemiz lazım, tıpkı **Thunderbird**'in spam filtresi gibi. Hani oldu da spam-filtresinden geçti diyelim, o zaman bunu da spam olarak işaretleyip, bogofilterin yine aynı hataya düşmemesini sağlamamız lazım. Muttrc dosyasına ise sadece kısayolları ekledm:

[source:xml]
macro index S "|bogofilter -s\ns=spam"  "Spam olarak işaretle ve spam dosyasına ilet"
macro pager S "|bogofilter -s\ns=spam"  "Spam olarak işaretle ve spam dosyasına ilet"
macro index H "|bogofilter -n\n"               "Zararsız olarak işaretle"
macro pager H "|bogofilter -n\n"               "Zararsız olarak işaretle"
[/source]

Mutt'da artık **H** ve **S** tuşları ile spam olup olmadığına karar verebilirsiniz. İlk aşamada tüm mail'lerinizi bogofiltere öğretmenizi tavsiye ederim. Bunun için ilk başta biraz sabır gerektiğinin farkındayım, fakat gerekli bir şey bu. Bu yüzden de gelen her e-posta için H tuşuna basarak zararsız olarak işaretleyin. Bunu sadece ilk 100 e-posta için yapmanız gereklidir, bu bence yeterlidir. Tabi dilerseniz zararsız olarak devam edebilirsiniz aynen. 

Hepsi bu kadar, bu belge diğer belge ile örtüşüyor. Tüm ayar dosyalarını yayınlamadım, sadece eklemeler. Sorularınız varsa bu yazı altında alabilirim. 






