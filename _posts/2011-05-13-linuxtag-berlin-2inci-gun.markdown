---
date: '2011-05-13 22:25:38'
layout: post
slug: linuxtag-berlin-2inci-gun
status: publish
title: LinuxTag Berlin -  2'inci gün
wordpress_id: '983'
categories:
- Gezegen
- Linux
tags:
- berlin
- berlin linuxtag
- limux
- linuxtag
---

Bu sabah GPU ile ilgili bir workshop'a girecektim. Fakat sunacak olan kişi ortada olmadığı için ertelendi. Şöyle bir plana bakarken, LiMuX sunumunu gördüm (bugünkü sunumlar pek güzel değil açıkcası). Neyse buna girdim, LiMuX'un release manager'i Robert Jaehne'den başladım dinlemeye. Aldığım notları sizlerle paylaşayım dedim:

**LiMuX**, München belediyesi tarafından Windows'tan Linux geçiş için yapılan anlatşmalardan ortaya çıkan bir dağıtım. Genel bilgiler şu şekilde:




	
  * 2006'da bu işe başlamışlar (geliştirme)


	
  * Devlet işi olarak görüldüğü için camia unsuru hiç yok


	
  * Temel olarak Debian ile başlanmış, sonra Ubuntu'ya geçilmiş. Paketlerin %90 doğrudan Ubuntu'dan alınıyormuş


	
  * Kurum içinde kullanılan özel yazılımın bağımlılıklarını kendileri paketlemişler. Hatta bazı uygulamalar için Firefox 2.0 sürümünü paketlediklerini söylediler. Yani geliştiriciler bir uygulamanın çalışması için gerekli olan ne varsa yapmışlar (bir paketin farklı sürümlerini paketlemek gibi)


	
  * Belirli güvenlik kıstasları var (her istemciye virus scanneri kurmak, spesifik haklar vermek (flash bellekleri kullanmak gibi), vs..)


	
  * Kullanıcı senkronizasyon'a önem verdiklerini söylediler (Mail, Browser, fakat nasıl yaptıkları hakkında bir şey söylemediler.




Bundan sonra yıl yıl hangi aşamalardan geçtiklerini, ne sorunlar yaşadıklarını, neler öğrendiklerini anlattılar:

**2008**:
    Sürüm takviminden 6 ay sonra yayınlamışlar dağıtımı. Son ürün de bir sürü hata mevcutmuş. Bir çok memnun olmayan kullanıcılarına sahiplermiş. O aralarda Debian kullandıklarından tam Sarge/Etch güncellemesine denk gelmişler.  Kullanıcılardan ciddi istekler varmış (hataların çözümleri konusunda).  Çıkardıkları sürümler özellik bazında imiş (feature based). Bunların önüne geçebilmek için zaman bazlı sürüm çıkartma planına geçmişler. Gelen istekleri önceliklerine göre ayarlamışlar. Her yeni sürüm geliştirmesi için özellikleri baştan bırakmışlar (yani feature frezze olduktan sonra hiç bir şeye bulaşmamışlar).  

**2009**:
    Zaman bazlı sürümler çok önemli hale gelmiş, kullanıcı istekleri de mevcut fakat kaliteli değil. İsteklerin çok önemli olduklarını anlamışlar. Geliştiriciler her gelen isteği yapmaya çalışmış (fakat bunun yanlış olduğundan bahsetti, biri X uygulamayı isteyebilir, ona sormak gereken şey ise neden X uygulamayı istiyorsun ?). Bu işin üstesinden gelebilmek için "Anforderungsanalyst" almışlar. Türkçesi tam olarak ne bilmiyorum, ama "İstek analisti" olabilir.  Bu kişi de sadece isteklerle ilgilenip, onların yapılabilirliğini gösteren, kullanıcın isteklerini inceleyen, düzenleyen biri. İstekler için de kullandıkları araç da TRAC imiş.

**2010**:
    Bir çok güzel işler yapıldığını fakat kimsenin duymadığından bahsettiler. Etrafta hep negatif söylemler kalmış (insanlar hala 2008 yılındaki geç kalmalardan bahsediyorlarmış). Aslında çok bilgi var etrafta, fakat bu herkesin çok bildiği anlamına gelmediğinden bahsetti. İnsanları bilgilendirmek de gerekiyor.  Peki hangi bilgileri kimler istiyor ? Bunlar da belirlenmeli. Dökümentasyon çok var ama dağıtık (çoğunlukla SVN depolarında sağda solda duruyormuş).  Bunun dışında "son kararı" veren bir mecraları olmadıklarını ve bu yüzden sıkıntı yaşadıklarını belirti ( Yönetim bir şey diyormuş, kullanıcılar başka bir şey diyormuş, geliştiriciler ayrı bir şey diyormuş). Bu da uzun vadede zarar veriyor, "son karar" mecrasının eksikliğini hissetmişler. Kullanıcıları grup grup ayırmışlar(?), ve bunlarla da zamanında iletişime geçilip bilgilendirme yoluna gidilmiş. Son karar verme mecrası(mekanizması) oluşturmuşlar. En son da 500 sayfalık bir PDF hazırlamışlar, admin dökümentasyonu, ama bunu kimin için, ne için yazdıklarından bahsetmedi.

**2011**:
    Geliştirici == Testci gibi bir durumları varmış (bunun yanlış olduğundan dem vurdu). Belirli bir test zaman düzelgesi yokmuş, yani testler rastgele yapılıyormuş, geliştiriciler bazen yapıyor bazen yapmıyordu. Bazı testler gerçek dünya koşulları ile hiç uyuşmuyormuş.  Bunun dışında kullanıcılar her şey "sürüm notlarından" öğreniyormuş, bir önceki yıldan kalan bir alışkanlık, çoğu zaman sıkıntı oluyormuş. Belli başlı sorunları var, neler ?



	
  * Kimse test yapmak istemiyor (özellikle de geliştiriciler, kod yazmayı daha çok seviyorlar)


	
  * Hatanın önemi yanlış kişiler tarafından değerlendiriliyor (duruma göre sıkıntı yaratıyormuş)


	
  * Müşteri için planlama güvenliği yapılmamış (?)


	
  * Kurum içinde kullanılan kritik uygulamalarda bir takım hatalar çok geç farkedilmiş (olmaması gerekiyormuş kesinlikle)



Bunu düzeltmek için neler yapmışlar ?
	

  * Kalite planı oluşturmuşlar (was, wann , wie), yani örneğin Release notlarında olması gerekenler çok daha öncesinden konuşumul ve müşteriye söylenmiş


	
  * Bağımsız ve tecrübeli bir test takımı kurulmuş (6 kişi, tam zamanlı)


	
  * Kullandıkları araçlar : testlink / TRAC


	
  * "Harte definitionen für bug schwerer grade" gibi bir şey yazmışım.  biraz karmaşık bir cümle, çevirisinden ziyade ne anlama gelebileceğini tam bilemiyorum, yine de şu şekilde bir şey: "Çok kritik hatalar için sınır belli tanımlar". Tam olarak ne demek istediğini bilemedim ama :)



**2012**:
    Bir sonraki Ubuntu LTS güncellemesini yapacaklar (şimdi kullandıkları 10.04)
    Yeni bir arayüz olabilirmiş.
    Tam teşeküllü 8000 istemci kullanılacak
    Geliştiricilere ihtiyaçları varmış.


Bu kadar, sonra soru sorma safhasına geçildi. Çok az soru soruldu. Bir tanesi şu şekildeydi:
 "_Kurumlardaki yaş ortalaması çok değişken. Windows'tan Linux'a geçişte hangi yaş grubu nasıl tepki verdi ?"_ Cevap ise şu şekilde: "_Kişisel olarak bununla karşılaştım, özellikle yaşlı insanlar (50 yaş üstü) hayatlarında bir çok değişim görmüş insanlar, o yüzden olgunlukla davranıyorlar, ama 5-10 senedir çalışan yeni nesil ile sık sık fikir ayrılığına giriliyor._"

Ben de bir soru sordum kendilerine, dedim ki geliştriciye ihtiyacınız varmış, peki şu anki durumunuz nedir ? Ne kadar geliştirici çalışıyor ekibinizde ? diye sorduum. 
O da bana,  8 geliştirici çalıştığını, bunlardan biri yönetici işleriyle uğraştığını, birinin (kendisinin) sürüm yöneticiliğini yaptığı (ama geliştirme yapamadığını daha çok kağıt işleri ve yardım,fikir danışma işleri yaptığını söyledi), bir de yukarıda bahsettiğim "istek analisti". Geriye kalan beş geliştirici de çok yoğun çalışıyormuş.

Test ekipleri 6 kişi, geliştirici ekipleri de 8 kişi. Oran baya yüksek :) Evet bu kadar, yeni başka şeyler öğrenirsem yine paylaşırım.

**Kişisel düşüncem:
**LiMuX ekibi var olan ve yapılmış işi (Ubuntu 10.04) kendi isteklerine göre konfigure ediyorlar. 8 Kişilik ekip ile pekala bunu yaparlar. Muhtemelen Ubuntu'daki her güncellemeyi doğrudan alıyorlardır. Test ekibi de sadece kurum içinde kullanılan özel yazılımlar için test durumları hazırlıyorlardır. LiMuX ekibi depo'da "temiz" kod gibi bir kavramdan uzak gibiler, bunu sunum'da özellikle Firefox 2.0 paketlediklerini anlattıkları vakit anladım. Mesela uygulamanın Firefox 4.0 ile çalışmasını sağlamak yerine Firefox 2.0 paketleyip o şekilde çalıştırmışlar. Tabiki iç yüzlerini bilmiyoruz, yanılıyor da olabilirim.

**LinuxTag diğer sunumlar**:

Bundan sonra bir tane Debian sunumuna girdim. Debian Proje Lideri çok güzel bir şekilde Debian'ın genel yapısını ve kültürünü anlattı. Kendisi de Fransa'da doktora bitirmiş 32 yaşında biri. Ama her konuyla Debian ve Linux kültürüne hakkim idi. Fransız olmasına rağmen İngilizceyi çok akıcı bir şekilde konuşuyordu. Kendisinin adı Stefano Zacchiroli idi. Google'de aratıp daha fazla bilgi alabilirsiniz. 

Debian sunumunda salon tıklım tıklım idi. Bilindik şeyler anlattı Stefano, ne kadar çok fork edildiklerini, hatta forkların forku olduklarını. Kendilerinin çok kaliteli işler yaptıklarını, tüm paketçilerin kendi alanlarında birer yazılım uzmanı olduklarını vs... Salon'da sanki herkes bir vefa borçu ödüyormuş gibi izliyordu. Debian'ı genel olarak insanların sevdiğini gördüm. Her dağıtımdan insan vardı. Birleştirici bir unsurları var gerçekten

Bunun dışında da "Nasıl hata çözülür" diye bir sunuma katıldım. Biraz ileri seviye bir şey beklerken, aslında benim çokça yaptığım ve sizlerle de paylaştığım yazıların çok daha basit bir şekli idi. Biraz hayal kırıklığına uğradım ama olsun artık bu kadar :)

Bir sonraki yazımda çok da güzel konular yer alacak, özellikle OSB ile ilgili güzel bilgiler edindim. Okumanızı tavsiye ederim :)









