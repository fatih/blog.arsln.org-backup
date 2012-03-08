---
date: '2008-09-23 21:37:17'
layout: post
slug: pardusta-staj-1inci-hafta
status: publish
title: 'Pardus’ta staj - 1′inci hafta '
wordpressid: '491'
categories:
- Gezegen
- Hayat-Yaşam
- Linux
tags:
- pardus
- pardus stajı
- pardus'ta staj
- staj
---

Bildiğiniz gibi Pardus'ta staja başlamıştım ve** 4 haftalık süre **sonunda **Türkiye'de** yaptığım ilk stajımı bitirmiş bulunmaktayım. Bu 4 hafta içinde bir çok şey öğrendim, hatalarımı da gördüm ve ileride ne yapabilirim sorusuna da az olsa cevabımı buldum. Hayatımda bir **dönüm noktası** olduğu kesin, en azından benim için, çünkü bundan sonra yapmak istediklerimi daha sağlam temeler ile yapabileceğim. Bu benim için çok önemliydi. Staj döneminde bana yardımlarını esirgemeyen herkese çokça teşekkür ederim, ne kadar teşekkür etsem azdır.

Staj dönemimde her akşam ne yaptıklarımı **günlüğüme yazmıştım**. Hem neler yaptığımı unutmamak için hem de ileride geriye dönüp neler yaptığımı ve nasıl bir gelişme yaptığımı gördüm. İyi ki de yazmışım. Ayrıca açık kaynak kodlu bir proje olduğu için yaptığım tüm kod değişiklikleri de kayıt altına alındı, yani hangi gün ne yaptığımı **svn sunucusundan görebileceğiz**. Sırayla hangi günler neler yaptığımı anlatayım:



	
  * **1.gün**: İlk gün proje herkes kendini tanıttı. Daha önce neler yaptığımız ve Pardus hakkında neler bildiğimizi sordular. Ardından tahta'ya çeşitli projeleri yazdılar ve yaktın olduğumuz alanlara yönelik bize projeleri verdiler. Yaklaşık **1-2 saat boyunca **bunu tartıştık tabi, kim ne yapmak istiyor, ne yapmak istemiyor bunların hepsi Pardus ekibi için çok önemliydi. Onların tek amacı bize 4 hafta boyunca en verimli zamanı yaşatmaktı. **Bu günün sonunda "Synergy" projesini seçtim**. Danışmanım ise Pınar'dı(Sonra değişti gerçi).Ardından tüm gün boyunca Synergy hakkında dokümanlar topladım, nedir ne değildir bunları öğrendim. Synergy ağ üzerinden çalışan bir program olduğu için en az iki tane bilgisayara ihtiyacım vardı. Bu yüzden ana bilgisayarım dışında bir tane de** laptop verdiler**. Sonrasında ise bu iki bilgisayara Synergy kurup çalıştırmaya çalıştım. Çalışırken takılıyordu, biraz araştırdım ve **2-3 tane patch buldum**, ardından Faik abi ile bunlardan [bir tanesini uyguladık](http://liste.pardus.org.tr/paketler-commits/2008-August/057985.html).

	
  * **2.gün**: Synergy için **arayüz** yazmaya başladım. Uygulamanın adına da **Sinerji** koydum. Türkçe ismi olsun dedim. İlk önce Kitaptan okuyarak PyQt ile denemeler yapmaya başladım, amacım biraz ısınmak ve bir şeyler öğrenmekti. Pınar Qt-Designer ile yapmamı istedi(Daha mantıklı çünkü, arayüz Qt-designer ile yapılacaktı, sonrası ise kendimiz elle yapacaktık) . Bu yüzden kitaptaki 7'inci bölümü okudum ve bir taslak oluşturdum. .ui dosyasını oluşturdum ve bunu mkpyqt.py ile python dosyasına çevirdim

	
  * **3.gün**: Arayüz fikrinden **vazgeçtik**. Tasma için bir modül yazalım dedik. Ayrıca istemci  tarafı otomatik olarak sunucun isteklerini kabul etsin dedik, yani biz Synergy'i çalıştırdıktan sonra diğer bilgisayar sadece kabul etsin, başka bir şey yapmasın dedik.  Faik abi ağ'daki bilgisayarlar arasında bağlantı kurmak için **avahi'yi söyledi** bana. Avahi ile uygulamaları ağ üzerinden birbirleri ile iletişime geçmesini sağlayabiliyoruz. Örneğin **Pidgin avahi kullanıyor**, bu sayede hiç bir IM servisi gerekmeden, yani Msn, Jabber gibi bir protokoller gerekmeden avahi üzerinden de konuşabilirsiniz. Neyse bugün tüm günümü avahi'ye adadım, nedir ne değildir bunları öğrendim ve python ile nasıl kullanabileceğime baktım. Sitesindeki [python bindingleri](http://avahi.org/wiki/Bindings) inceledim, Faik abi'nin yanına 3-4 kere gitmişimdir çünkü anlamadığım çok şey vardı(başını ağrıttım biraz yani). Günün sonunda ise bir servis oluşturabildim. Yani kısaca _sinerji._tcp altında bir servis tüm ağ'ya yayınlanıyordu. **Herkes sinerjiyi görebiliyordu**. (Not bundan sonra danışmanım Faik abi olacaktı)

	
  * **4.gün**: Bugün hiç bir şey yapmadım. Çünkü ne yapacağımı tam bilmiyordum. Ayrıca tasma modülü yazamayacağımı öğrendim. Tasma **Qt3** ile yazılmıştı, ben ise sadece PyQt4 biliyordum yani Qt4 biliyordum sadece. O yüzden tekrar arayüzü oluşturmaya başladım.

	
  * **5.gün**: Faik abi ile tekrar projeyinin gidişatını değiştirdik. Arayüz farklı olsun dedik. Aslında Synergy'de sunucu ve istemci bilgilerini kendimiz yazıyorduk, sonra dedik ki, neden kendimiz yazıyoruz? Neden ağdaki bilgisayarları sinerji **kendisi bulup bize göstermiyor**. Yani sunucu tarafı da otomatik olacaktı. Ağdaki tüm bilgisayarları görüp, yönetmek istediklerimizi seçecektik.  Kısaca bir ileri noktaya çıkartıp daha kullanışlı ve otomatik hale getirmeye başladık. **4 tane combobox**(Her yönde bir tane) olsun dedik, ve buradan seçilsin dedik. Seçip programı başlatıktan sonra , karşı tarafta da combobox'larda istek yollayan bilgisayarlar görüntülensin dedik (bu benim fikrimdi). Fakat sonra bu fikirden de vazgeçip daha da kullanışlı bir hale getirecektik


_(Not: Bu bir yazı dizisi, uzun olduğu için haftalara ayırdım her hafta için bir yazı, bu yazi birinci hafta'da yaptığım işler ile ilgili)_
