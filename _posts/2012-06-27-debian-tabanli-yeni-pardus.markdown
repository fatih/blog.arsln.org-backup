---
date: '2012-06-27 22:45:00'
layout: post
slug: debian-tabanli-yeni-pardus
status: publish
title: Debian tabanlı yeni Pardus
---


Yavaş yavaş bazı bilgiler gün ışığına çıkmaya başladı herhalde. Başlıkta yazdığım gibi önümüzdeki 1-2 ay içinde çıkacak olan Pardus, **Debian** tabanlı bir dağıtım olacaktır. Eski bir Pardus geliştiricisi olarak o kadar emeğin, teknolojinin sona erdirilmesini tabi ki üzülerek izleyeceğim. Ama konumuz bu değil(bu yazı açısından), konumuz Debian tabanlı Pardus'a ilişkin bulgular.

## Pardus'un Debian tabanlı olmasına ilişkin üç önemli bulgu

Son zamanlarda kamuya açık yerlerde bununla ilgili bir çok ipucu birikti. Bunlar Pardus'ta çalıştığım zamanlardaki bilgilerim ve Pardus çalıştayındaki bilgilerle birleşince ortaya çıktı. Şimdi sırayla bunlar neler onları yazayım:

1. **Pardus Çalıştayı**. Pardus çalıştayında ben de yer almıştım. Benimle beraber Pardus ekibinde yer alan ekibin bir kısmı, daha önce ayrılmış geliştiriciler, Türkiye'deki Açık kaynak camiasından tanınmış simalar gibi bir çok insan katıldı. Bir çok şey çizildi yazıldı. Fakat orada özellikle **Ahmet Kaplan**'ın "Paket sayısı çok az, Ubuntu gibi on binlerce paketi olan bir dağıtımı alt yapı olarak kullanmak daha mantıklı" cümlesi aslında her şeyi özetler durumdaydı. 

    Ahmet kaplan dışında **Jon Hall (maddog)** da "Debian gibi evrensel ve oturmuş bir dağıtım varken ve özellikle fork'a müsait iken başka bir paket yöneticisi kullanmak mantıksız" demişti.

    Apache Foundation'da yer almış **Alex Karasulu** da buna benzer düşünceye sahip idi. Kendisi de zaten Jon Hall ile beraber konu açıldıkça bunun avantajlarınıanlatmaya çalışıyordu.

    Son olarak **Enderunix** ekibi de tam kadro oradayı ve her biri de "Devlet Pardus gibi bir dağıtıma destek vermemeli, Ubuntu/Debian forku daha mantıklı" cümlesine yakın ortak bir düşünceye sahiptiler.

    Tüm bunlar Ahmet Kaplan'ın istediği zemini hazırlamıştı aslında ta o zamanlar. Çalıştayda herkesin kafasında "Debian tabanlı bir Pardus" yerleşmişti ve mantıklı gelmeye başlamıştı (mantıklı ile o günün sonunda oluşan ve solunan havanın sonuçunda oluşan genel algıyı kastediyorum.)


2. **Danışma kurulu toplantısına ilişkin bilgiler**. Pardus Çalıştayında karar verilen bir konu vardı. O da bir danışma kurulunun kurulması ve Tübitak olmak üzere bir çok alandan insanların bir kurul oluşturması idi. Bu kurulda resmi/gayriresmi geliştirici, STK, topluluk, çözüm ortakları,vs.. gibi bir çok kesimden insanlar yer alacaktı.

    Bu hafta sonu bu kurul toplanacak. Bununla ilgili Pardus Camia listesinde kimlerin katılacağı sorulduğunda **Doruk Fişek** şöyle bir [mesaj](http://liste.pardus.org.tr/pardus-camia/2012-June/000932.html) attı:


    **************************************
    E-posta giden kişiler şunlar:

    * Ahmet Kaplan (TÜBİTAK)
    * Abdullah Arslan (MSB - kamu kurumları temsilcisi)
    * Abdullah Erol (TÜBİTAK)
    * Cahit Cavit Vural (?)
    * Doruk Fişek (Özgür Yazılım A.Ş. - çözüm ortakları temsilcisi)
    * Necdet Yücel (18 Mart Üniversitesi - üniversite temsilcisi)
    * Sezai Yeniay (Topluluk temsilcisi)

    **************************************

    Burada yeni-eski simalar var. Bazıları tanıdığımız bildiğimiz insanlar. Ama aralarından **"Cahit Cavit Vural"**'ın neden olduğunu anlayamamıştım. İsim tanıdık geliyordu ama nerde gördüğümü hatırlayamamıştım. Biraz araştırınca Pardus kullanıcı listesine **"Magmalinux"** adındaki Debian forkunu tanıttığını görmüştüm. Magmalinux, Debian tabanlı bir dağıtımdır. Cahit Vural ise bildiğim kadarıyla bununla yıllarca ilgilenmiş ve uğraşmış bir kişidir.

    Yukarıdaki listede onun da isminin yer alması, Tübitak'ın Debian forku ile ilgilinen kişilerin bilgi birikime başvurduğu anlaşılıyor. Acaba Cahit Cavit Vural, Tübitak'ın aylardır hazırladığı Debian forkunda çalışan yeni geliştiricilerinden biri miydi?

3. **Özgürlükiçin.com'daki gizemli Debian tabanlı Pardus dağıtımı**. Tüm bunlar yaşanırken ozgurlukicin.com forumlarında ilginç bir olaya tanıklık edildi. Forumda AoKiji adında biri aşağıdaki gibi ilginç bir [anını](http://www.ozgurlukicin.org/forum/haberler/24628/?page=3#post165354)
paylaştı:

    "Birkaç gün önce pilot okulların birine işim düştü. aklıma hemen akıllı tahta yer alan pardus bir göz atmak geldi. açtık sistemi bir baktık. pardus ilk  açılışta grupla değilde windows yapısı altından işletim sistemini seçiyorsunuz. varsayılan "windows". ordan pardus  seçiyoruz.

    Pardus 2011 kurulu sistemde ama **bildiğimiz 2011 ile arasında epeyi fark var**. adı pardus 2011 ama tamamiyle yeni bir sistem gibi geldi bana. **paket yöneticisi .deb paket yöneticisiydi**. içersinde paketler hepsi güvenli sürümlerdi."root" porolasını bilmediğim için fazla kurcalamayadım. herhalde yakında bir açıklama gelir"


## Yani yeni Pardus, Pardus değil mi?

Yukarıdaki yazılanları birleştirince bir çok şey aslında ortaya çıkıyor. Bildiğiniz gibi 30 küsür geliştirici son bir sene içinde Pardus projesinden ayrıldı ve projede bir kişi bile kalmadı. Fakat Ahmet Kaplan'ın her konuşmasında "Pardus bitmedi, çok güzel bir şekilde geri döneceğiz" demesi de kafaları iyi karıştırmıştı.

Tübitak muhtmelen son 1-2 aydır Debian/Ubuntu tabanlı bir dağıtım üzerinde çalışıyor (benim tahminim Debian üzerinde, Ubuntu upstream ile iyi anlaşamıyor). Fakat bunu henüz şimdi açıklamayacağı için tüm bilgiler de burnu açık havada kalıyor.

Pardus markası 2-3 ay içinde çok farklı bir anlamda kullanılacak. Yıllarca oluşturulmuş ve kamunun bildiği bir markayı doğrudan kullanmak Tübitak'ın da işine yarayacaktır. Ayrıca Kamu bilindik bir isimle iş yapacağı için içi rahat olacaktır. Fakat Erkan Tekman ve ekibinin yıllarca oluşturduğu teknolojiden hiç bir iz,eser bulunmayacaktır. Yani dışarıdaki yüzlerce Debian forkundan biri olacaktır. Adı Pardus olacak, ama bizim bildiğimiz Pardus'tan çok farklı bir ürün ortaya çıkacaktır.

******
_Dipnot: Yukarıda yazılanlar tamamen şahsi fikrim olmakla beraber, doğru veya yanlış bilgiler içerebilir. Bu bilgilerin doğru kabul edilip edilmemesi tamamen okurun insiyatifine bırakılmıştır. Tüm bilgiler kamuya açık bilgilerden yorumlanarak yazılmıştır._







