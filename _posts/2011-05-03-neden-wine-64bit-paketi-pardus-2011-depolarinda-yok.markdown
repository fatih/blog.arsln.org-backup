---
date: '2011-05-03 00:24:46'
layout: post
slug: neden-wine-64bit-paketi-pardus-2011-depolarinda-yok
status: publish
title: Neden Wine 64bit paketi Pardus 2011 depolarında yok ?
wordpress_id: '969'
categories:
- Gezegen
- Linux
tags:
- geliştirici
- pardus
- pardus 2011
- wine
- wine64
---

![](http://blog.arsln.org/wp-content/uploads/wine-software.jpg)Sıkça sorulan sorulardan biri. Neden Wine yok depoda ? Son aylarda gerek forumlarda, gerek bugzilla bununla ilgili yoğun bir şekilde şikayet geliyor. Bir geliştirici olarak ister istemez rahatsız oldum. Çünkü ben kendi adıma kullanıcılara hep en iyiyi sunmayı çalıştım ve hala da çalışıyorum. Ne zaman bir şikayet görsem "**nerede hata yaptım**" diye düşünmeden edemiyorum.

Bu konuyla ilgili sizleri bildirmek adına bu yazıyı yazıyorum. Bu yazdıklarımı bir bahane olarak görmezseniz sevinirim. Biraz da bizim içerimizdeki gizli **kahramanların** neler yaptıklarını ve sizler için gece gündüz çalıştıklarını da görmenizi istiyorum. Şimdi yerinizden kalkın, kendinize bir çay hazırlayın. Uzun bir yazı olacak. Ben bekliyorum :)

Çayınızı aldınız değil mi ? Hadi bakalım, başlayalım ...

Her şey bundan yaklaşık **beş ay **önce [bir Bugzilla hatası](http://bugs.pardus.org.tr/show_bug.cgi?id=15409) ile başladı. Kullanıcılardan Wine paketi ile ilgili bir istek geliyor. O zamanki Wine paket bakıcısı olan **Fatih Aşıcı** ise 32 bit deposuna Wine'in girdiğini, fakat 64 bit deposu için biraz zamana ihtiyacı olacağını söyledi.

Biraz zaman alacak derken neyi kast ediyordu peki ?

Fatih Aşıcı'nın kastettiği durum, Wine'in çalışması için gerekli **lib32 paketleri** idi. Yani 64 bit altında çalışan 32bit paylaşımlı kütüphaneler. **Bunlar olmadan Wine çalışmaz**. Mesela **Skype, Google Earth, Picasa** gibi uygulamalar da bunu istiyor. Pisi'nin güzel bir şekilde bu paketleri yapmasına olanak veren bir altyapısı mevcut değildi.

Fatih bu yorumu 16.01.2011 tarihinde yapmış. Depo'da hiç bir lib32 paketi mevcut değil. Usanmadım, Fatih Aşıcı'nın bu yorumundan sonraki tüm commitlerini tek tek inceledim. Gerek paketler deposunda, gerekse Uludağ deposunda yaptıklarını not aldım.

Şimdi beraber Fatih Aşıcı'ın bu günden sonra uğraştığı işlerle ve bu lib32 paketlerinin durumunun nasıl geliştiğine bakalım.

**Ocak Ayı (16'sından sonra)**



	
  * Kde'nin öntanımlı klasör ayalarını düzenlemiş.

	
  * Xorg-sunucusu Opengl sürümünü düzgün yüklemediği için Onur Küçük ile buna bir yama hazırlamış.

	
  * Ardından 2011 çıkışı için gerekli depo değişiklikleri yapmış (2011 adında bir tag oluşturmuş).

	
  * 2011 için testing deposunu açmış.

	
  * Depo'daki sahipsiz paketleri bakıcısız olarak işaretlemiş.

	
  * NVidia ve Ati'nin kapalı kaynak kodlarını güncellemiş.

	
  * Virtualbox sürümünü elden geçirmiş, önemli bir hatayı düzeltmiş.

	
  * Az sayılı karakterleri desteklemek amacıyla Çomar'ı yamalamış.

	
  * Pisi 2.4_Alpha2 sürümünü çıkarmış.

	
  * Xorg sunucusunu yeni geliştirme sürümüne geçirmiş.

	
  * Bunun yanında bir çok küçük paketi güncellemiş, düzenlemeler yapmış.

	
  * Sürüm notlarını gözden geçirmiş

	
  * Rusya dilinin desteklenmemesi için Yalı'yı düzenlemiş

	
  * Yalı'ya ayrı bir klavyeyı kolayca kullanılması için yama yapmış

	
  * Pisi'nin düzgün arşiv indirilmesi için "fetcher" sınıfını gözden geçirmiş

	
  * Çomar'daki modelerden birini gözden geçirmiş


Ocak ayının yarısı bu şekilde geçmiş. Ortada hala lib32 yok. Onun yerine 2011'in yetişmesi için elinden geldiğince kritik sistemleri düzeltmeye çalışmış. Tabi bu arada  Bakalım şubat ayı nasıl geçiyor

**Şubat ayı (01-28 arası)
**



	
  * Henüz 2011'e alınmamış paketlerin listesini çıkarmış.

	
  * İsmi değişmiş paketlerin depo indeksini bozulmaması için gerekli değişiklikleri yapmış.

	
  * "Patch" paketinde kritik bir güvenlik hatasını kapatmış ve paketi gözden geçirmiş

	
  * Gpg/ssh agent'lerin ile bir hatayı düzeltmiş

	
  * Yalı'nin kodunda bir kısmı sadeleştirmiş

	
  * Benim libicns ile yaptığım bir hatayı usanmamış gidip değiştirmiş

	
  * Network Manager'e küçük bir değişiklik yapmış

	
  * Çeşitli X11 paketlerini gözden geçirmiş (libpciaccess, pixman, vs...)

	
  * Playground'daki Koffice paketine de göz atmış ve paket içeriği ile ilgili sadeleştirme yapmış

	
  * Ntfsprogs paketinin bakımını yapmış

	
  * Depolar arasındaki paketler uyumsuzluğuna tekrar göz atıp gereken düzeltmeleri yapmış

	
  * Kde'ye bir yama hazırlamış (klavye ayarlarını Xorg sunucusundan düzgün almıyordu)

	
  * Gnupng  paketinin bakımını yapmış

	
  * Benim review'e koydum bir pakete göz atmış (vim-plugin-pisi)

	
  * Yine depoya aldığım bir pakete göz atıp gereken değişiklikeri yapmış (keepassx)

	
  * Wine paketini güncellemiş(32bit tabi, çünkü hala henüz ortada 64 bit yok)

	
  * **Wine 64 bit paketi için deneysel bir actions.py hazırlamış**

	
  * Xorg sunucusunun bakımını yapmış, eski yamaları atmış, yeni olanları eklemiş

	
  * Yine kritik bir paket olan Mesa'ya göz atmış

	
  * Gramps adı altındaki paketin anlatımını düzeltmiş

	
  * Flashplugin'i güncellemiş, kritik bir güvenlik açığını düzeltildi bu sayede (sevgililer günü bugün bu arada:))

	
  * Kurumsal 2'deki Kde başlangıçta takılıp kalıyordu gidip baştan bir yama hazırlamış, bunu düzeltmiş

	
  * Virtualbox paketine bakmış tekrardan, önemli bir hatayı düzeltmiş


Şu an şubat ayının ortasına gelmişiz...

	
  * Ati kapalı kaynak kodlu sürücülere göz atmış tekrardan(güncelleme ve kod düzeltme)

	
  * Çizim tabletleri için gerekli olan bir paket olan xorg-input-wacom paketini güncellemiş tekrardan

	
  * Pisi için bir yama hazırlayıp onu pakete sokmuş.

	
  * Gecelik iso'ların çıkması için gerekli altyapıyı hazırlamış (Gökçen Eraslan ile hatırladığım kadarıyla)

	
  * Farm için gerekli olan betikleri gözden geçirmiş tekrardan.

	
  * Buildtype özelliği için pisiye sayısız değişikliler almış.

	
  * Pisi 2.4_alpha3 sürümünü çıkarmış. Bu paketle beraber lib32 için gerekli altyapıyı da başlatmış oldu. (Tarih 21.02.2011)


Bundan sonra şubat ayının sonun kadar benim de içinde olduğum bir dizi lib32 paketlerinin bakımını yapmış. O zamanlar Skype isteği de ön plandaydı. Bu yüzden Skype için gerekli lib32 paketlerini oluşturmaya başladık. Benim hazırladığım paketleri oyun alanıma alıyordum, Fatih de bir yandan onların üzerinden geçiyordu. Bununla ilgili bir mail de geliştirici listesine atmışım:

http://liste.pardus.org.tr/gelistirici/2011-February/055676.html

Bu arada tarihlere dikkatlice bakınız. Fatih 21.02 tarihinde lib32 için gerekli altyapı paketini, yani Pisiyi depoya koymuş. İki gün sonra neredeyse  **yaklaşık 40 tane **lib32 paketi hazırlamıştık ve playground'a bekliyordu. O iki gün gerçekten inanılmaz işler yapmıştık.

**Mart (başlangıç)**



	
  * lib32 paketlerinden dolayı sıkan sorunları çözmeye zamanını ayırmış.

	
  * Nvidia ekran kartları sürücülerine göz atmış

	
  * Kısa kısa paket düzenlemeleri yapmış


Fatih sonra 04.03 gibi aramızdan ayrılıyor. Kendisi bir ay sonra Askere gidecekti. Tabi bununla bitmiyor, tatildeyken bile Pisi  2.4_alpha4'yı çıkartmış. Pisi'ye yeni buildfarm ile uyumlu olacak şekilde Delta desteğini de veriyor. Bunu yaptıktan sonra Nisan ayını başında zaten Askere teslim oluyor.  Üzerinde 300'e yakın paket vardı. Bunların bir çoğunu ben aldım. Bunların arasına Wine'de vardı. Bunu da hata kaydında belirtmişim (03.03).

Fatih Aşıcı tarafında durum böyleydi. Kendisine Wine paketini Mart ayı başlangıçında sormuştum. Kendisi Askere teslim olmadan önce yapacağını dile getirmişti. Yani Nisan'ın başında gitmeden önce bakacağını söylemişti. Ben de haliyle Nisan'a kadar bekledim. Fakat işler istenildiği gibi gitmiyor. Hayat bu, demek ki Fatih de zaman bulamadı ve yapamadı.

Nisan'dan sonra peki ben ne yaptım da Wine 64bit paketi hala depo'da yok ?

**Nisan (1-30 arası)**



	
  * Libva paketini yeni sürüme çekmişsim,

	
  * Libva güncellendiği için, çeşitli paketleri tekrar derlemek zorunda kalmışız (geliştirici listesinde [bununla ilgili mail ](http://liste.pardus.org.tr/gelistirici/2011-March/055956.html)mevcut)

	
  * Sayısız paket güncellemeleri yapmışım:

	
    1. Texmaker

	
    2. Aria2

	
    3. Git

	
    4. Libtorrent

	
    5. Dos2unix

	
    6. Xorg-sgml-doctools

	
    7. Chromium'u (ayda 3-4 kere oluyor bu güncelleme)

	
    8. Xscreensaver

	
    9. Flashplugin

	
    10. Intel ekran kartı sürücüleri

	
    11. ...





	
  * Yeni ati kapalı kaynak kodlu sürücülere göz atmışım

	
  * Ati sürücüleri ile ilgili değişiklikleri depoya yansıtmışım.

	
  * Xorg-app'deki bir güvenlik açığını kapatmışız

	
  * Çomak'da **Gnome3** çıkabilir düşüncesi ile xkeyboard-config'u güncellemişsim

	
  * Xkeyboard'un düzgün çalışabilmesi için libX11'i de güncellemişsim

	
  * Bugzilla'daki Licq vardı onunla ilgili oyun alanımda Licq paketini hazırladım

	
  * Udev'deki 32 bit kütüphaneleri 64 bit olanları eziyordu onu düzeltmişsim (ilgili [geliştirici maili](http://liste.pardus.org.tr/gelistirici/2011-April/056037.html))

	
  * Önemli bir bileşen olan libdrm'i paketine bakmışsım

	
  * Nvidia kapalı kaynak sürücülerini güncellemişsim

	
  * Geleneksel Vim yamaları eklemişim

	
  * Bir takım bileşenleri üzerime almışım

	
  * Nvidia açık kaynak kodlu sürücüleri güncellemişsim

	
  * Mutt'daki bir güvenlik açığını kapatmışsım

	
  * Phoronix test-suite'nin çalışabilmesi için Php'yi değişiklik yapmışız

	
  * Bir takım Nvidia reverse engineering uygulamalarını oyun alanıma yüklemişsim

	
  * Virtualbox ailesini güncellemişsim

	
  * **Wine 64bit için gerekli olabilecek lib32 paketlerini depoya almışım (freeglut, glew, mesa)**

	
  * Emre Erenoğlu'nun katkılarıyla daha fazla lib32 paketleri almışız depoya (libXft, libXtst, libXpm, libXinerama, libXcursor)

	
  * Kde randr modülüni devreye sokmuşum ve baştan yeniden değiştirerek yazmışsım (güzel bir özellik oldu bu)


Bunu dışında Bugzilla'daki hatalar da var elbet (sağ üst köşedeki noktalar gibi). Bunlar da haliyle zaman alıyor. Ha bugün ha yarın derken hala Wine ile uğraşamadım haliyle. Şimdi peki ne durumdayız ?

Yaklaşık bir haftadır Wine ve paket bağımlılıkları ile ilgileniyorum. Wine için mesa-32bit bunun bir önemli parçasıydı. Onu düzgün bir şekilde yaptıktan sonra çeşitli farklı paketler de mevcut yapmamız gerekiyor. Nihayetinde yerelimde Wine 64bit düzgün bir şekilde çalışmayı başardım :) Hatta deneme olarak Winamp uygulamasını indirip denedik Ofiste, sesi de güzelce veriyor (_şu ünlü koyun sesi)_. Örnek ekran görüntüsü:

[![Wine 64 bit Pardus 2011 altında](http://blog.arsln.org/wp-content/uploads/wine64_pardus2011-300x168.png)](http://blog.arsln.org/wp-content/uploads/wine64_pardus2011.png)



Peki depo'ya ne zaman girecek ?

Wine henüz tam bitmedi. Açıkcası bir çok pakete ihtiyacı var hala. Bunlar şu şekilde:




	
  * **libxinerama-32bit  (depoda mevcut)**


	
  * **libxcomposite-32bit (depoda mevcut)**


	
  * **ldbus-32bit (depoda mevcut)**


	
  * libgnutls-32bit


	
  * libsane-32bit


	
  * libgphoto2-32bit


	
  * liblcms-32bit


	
  * gstreamer-32bit


	
  * liboss-32bit


	
  * libcups-32bit


	
  * libgsm-32bit


	
  * libtiff-32bit


	
  * libmpg123-32bit


	
  * libopenal-32bit


	
  * libldap-32bit


	
  * libxml2-32bit


	
  * **libXslt-32bit (depoda var)**


	
  * openssl-32bit (bununla bugün uğraşıyordum bitmedi henüz)


	
  * libjpeg-32bit


	
  * libpng-32bit 





Yukarıdaki paketlerin çoğunun bizdeki ismi farklı. Bazıları olmayabilir de depoda. Ama Wine'in düzgünce çalışabilmesi için bunların lib32 paketine ihtiyacımız var. Bazı paketlerin lib32 paketini oluşturmak kolay olsa da, bazıları çok zaman alabiliyor. O yüzden hani sizlere iki güne sonra hazır diyemiyorum. Paketlerin çoğunu bilmiyorum bile ne yaptığını, benim üzerime olmayan paketler. 

Pardus'taki Wine 64bit'in hali bu durumda. Umarım en azından kafanızda bazı şeyler şekillenmiştir diye düşünüyorum. Hatırlarsanız, geliştiricileri bir hatayı iki ayda bir çözüyor demiştiniz ve [bununla ilgili uzun bir yazı yazmıştım](http://blog.arsln.org/bir-hata-kovalamaca-hikayesi/).  "20-30 tane geliştirici var, bir Wine'i mi yapamıyorlar" diyenler de oldu, bu yazıyı okuduktan sonra belki farklı düşünen olmuştur, yok değişmediyse o zaman kendimizi hala anlatacağız demektir.

Örneğin yukarıda saydıklarımın arasında, ne kadarını kod geliştirmeye ayırdık sizce ? Ben kendi adıma konuşursam çok ama çok az. Gönül isterdi ki, paketlerin sayısı az olsun, bugzilla'daki hatalar az olsun, kullanıcıların isteklerini yerine getirelim, yeni teknolojiler geliştirelim. İnanın **sizler ne kadar istiyorsanız bizler de istiyoruz** bunları yapmayı. Ama buraya kadar okuyup geldiyseniz, yukarıda Fatih Aşıcı'dan verdiğim örnekleri de göz önüne alırsanız, ne durumda olduğumuzu herhalde çok iyi anlayacaksınızdır.  Akşamları eve gelince, hafta sonları bile boş vakitlerinde sizlere zaman ayıran insanlar bunlar. 

Bu sıkıntıyı gidermek için çözümlerden bir tanesi geliştirici sayısını artırmak. Buraya kadar okumuşsanız, "**Madem böyle bundan sonra ben de Pardus için bir şeyler yapmak istiyorum**" diyorsanız şimdi tam zamanı. Bugzilla'daki hatalara bakın, yeni paket isteklerindeki paketlerle ilgilenin, geliştirici adaylığına başvurun, ben güzel yazı yazarım diyorsanız güzel belgeler yazın, çeviri yapın, Pardus'u dünya'ya tanıtın. 

Siz var olduğunuz sürece biz de bu işi yapıyor olacağız. Gelin hep beraber güzel işlere imza atalım. Sizden tek isteğim bu.


