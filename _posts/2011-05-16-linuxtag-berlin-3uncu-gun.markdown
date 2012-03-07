---
date: '2011-05-16 14:26:50'
layout: post
slug: linuxtag-berlin-3uncu-gun
status: publish
title: LinuxTag Berlin - 3'üncü gün
wordpress_id: '997'
categories:
- Bilişim
- Gezegen
- Linux
tags:
- bretzn
- cross-distro
- desktop summit
- distro summit
- fedora
- linustag
- obs
- opensuse build service
- opensuseqa
- osc
- suse
- upstream
---

Bugün LinuxTag'daki yine çeşitli ana temalar vardı. Ben de "Cross-distro" temasıyla ilgili seminerlere katıldım. Genel olarak bugünkü konular çok daha güzeldi. Yine bazı sunucuların konuşma yeteneği yüzünden verimsiz geçenler de vardı (anlatamadılar pek). Aşağıda girdiğim konuşmalar mevcut. Konuşmalar sırasında olabildiğince yazmaya çalıştım.

**"Cross-distro"** bir çok dağıtımın beraber çalışmasını sağlamak için ortaya atılan bir terim. Bildiğiniz gibi her dağıtımın kendine has paket yöneticisi var, kendine has tekonolojileri var, farklı hedefleri var vs... Örneğin paketleri yaparken bir uygulama için her dağıtım ayrı bir isim kullanabiliyor. Çoğu zaman başkasının yaptığı işi tekrar tekrar yapıyoruz. Neden her dağıtımda isim farklı mesela ? Ya da bir paket'in lisansını belirlerken neden zorluk çekiyoruz, halbuki bazı dağıtımlar çoktan bu bilgiyi buldu ve paketlerine yerleştirdi.

Bu gibi sorunları ortadan kaldırmak için ve gelecekte ortak bir payda'da oluşmak için yavaştan tüm dağıtımlar "cross-distro"'ya önem vermeye başlamış. Bunun en güzel örneğin **Gnome 3'de** yaşandı, openSuse ve Fedora'daki geliştiriciler beraber çalışıp güzel bir Gnome 3 ortaya çıkardılar.

Her neyse bu kadar ön bilgi yeter, başlayalım sunumlara :)


***** Pushing for more cross-distro collaboration *****

Sunumu veren openSuse Booster'lerinden Vincent Untz. Dağıtımlar arasındaki iletişim eksikliğinden dem vurdu.  Kimin ne yaptığını çoğu zaman bilmiyoruz. Çünkü ortak bir paydada buluşulmuyor. Mesela neden yüzden fazla dağıtım var ? Bunun çok olduğunu söylüyor. Ve çoğu zaman hepimiz aynı şeyleri yapıyoruz.

Beraber çalışma ve farklılaşma iki ayrı kutup. Buna iyi karar vermek lazım. Cross-distro için son 10 yıldır neler yapıldı ? Freedesktop kuruldu, freedesktop adı altında bir takım standartlar yazıldı ve buna uyulmaya sağlandı. Desktop Summit altında toplantılar yapılıyor her sene, Gnome ve Kde geliştiricileri bir araya geliyor. Herkes mühendis olduğu için arkadaşca geçiyor ortam. Verimli olduğundan bahsetti.

Bazen kötü örnekler de olabiliyor. Mesela g**nome-system-tools** uygulaması. Her türlü işi yapıyor fakat zamanında Ubuntu dışında kullanan çok az insan oldu. Gnome'cılar tarafından çıksa da, bu uygulama ayarları kendine has formatı ile kaydediyordu. Halbuki her dağıtım farklı ayarlama dosyalarına sahip. Bunun dışında uygulamaların açıklamalarını ortak bir web sitesinde çevirmeye çalışılmış. Fakat yine zaman darlığından çok fazla kademe elde edilmemiş.  Bunun dışında LSB de bir çok kişi tarafından adapte edildi, ama hiç biri içine sinerek yapmadı bu işi.

Bunu önüne geçilebilinri, upstream ile omuz omuza çalışmak gerekiyor. Gnome 3 konusunda Suse ve Fedora çok iyi çalışmış. Bunun meyvelerini şimdi topluyorlar. Güvenlik açıkların kapatılması ile ilgili dağıtımlar güzel bir iş birliği içinde olduğundan bahsetti. AppStream projesi başlatıldı (toplantı yapmışlari Debian, Fedora, Suse, Ubuntu katılmış, çok güzel geçtiğinden bahsetti). Ayrıca "Licesing Summit" adı altında lisans çalışmaları için bir toplantı düzenlendi. Systemd projesini de örnek gösterdi, dağıtımlarla konuşularak yapıldığı için herkes tarafından kabul görmüş (örneğin systemd öntanımlı dosyaları bulamadığı zaman, başka dosyaları okumasına imkan veriyor, yani hiç bir şey hardcoded değil, bu yüzden her dağıtım tarafından kolayce adapte edilebilir hale geliyor)

Cross-distro için neler yapılabilinir ? Destek konusunda çok sıkıntılı olduğunu söyledi. Mesela Suse çıkardığı dağıtımlar için 5 senelik destek veriyor, fakat üzerindeki Gnome sürümü 5 sene destek sağlıyor mu ? 2-3 sene sonra yeni bir sürüme geçtiklerinde Suse ne yapacak ? Gnome ve Kde bu konuda bir yol bulabilir diyor kendisi.

Paket yapımı hakkında belgeler mevcut, herkesinki farklı, örneğin Debian bu konuda çok sağlam temmeler atmış. Suse ve meiga örnek almış,ama Fedora örnek almamış. Desktop summit adı altında masaüstü dağıtımları buluşuyor, neden bir **Distro summit** olmasın diyor ? Sadece dağıtımların buluştuğu ve ortak kararlar alındığı bir konferans.

Dipnot: Konuşmasında sık sık Fedora'dan bahsetti. Fedora ve Suse'nin Upstream ile ne kadar içli dışlı çalıştığından bahsetti. Ama Ubuntu'nun tam tersine hiç bir şey yapmadığını ve Upstream ile pek çalışmadığından bahsetti. (Bunu sadece Suse'ciler değil, Fedora'cılar da sık sık söyledi)

Bunun dışında genel izlenimim (diğer konuşmalardan da yola çıkarak) dağıtımların artık kendine has teknoloji yaratmayı bırakmalarıdır. Artık herkes bir teknoloji belirleyip ona destek veriyor. Upstream dediğimiz de bu, yani örneğin systemd gibi bir şeyi yeniden yazmak yerine, doğrudan systemd'ye destek vermeye çalışıyor herkes. Gnome 3'de bunun çok meyvesi toplanmış. İleriki senelerde bu ciddi şekilde artacak. Yavaştan buraya adapte olmalıyız. Yoksa ileride çok sıkıntı yaşayacağız. (Fedora ile ilgili bir konuşma'nın notları da mevcut, onda bu daha belirgin ve ne demek istediğimiz daha iyi anlayabilirsiniz, 4'üncü gün yazısından okuyabilirsiniz.)

***** How automated testing helps distributions *****

Bu sunumu openSUSE test takımından **Bernand Wiedermann **sundu. Test yapmak ve test senaryoları oluşturmak da her dağıtımın olmazsa olmaz bir parçası. Test ekipleri bu işleri kolaylaştırmak için bir takım otomatikleştirme işlemlerine giriyor. Bernand da otomatik test yapma konusunda kendi deneyimlerini anlattı.

Dağıtımlar çok kompleks yapılar, her daim bir şey değişiyor. Küçük bir değişim bile çok büyük felaketlere yol açabiliyor. Ayrıca başka bileşenleri de bozabiliyor.

Düşük kaliteli yazılımlar istenmiyor. Çünkü düşük kaliteli yazılımlar morali bozuk testçiler ortaya çıkartıyor. Bunlar da bu yüzden yaptıkları işi kötü bir şekilde yapıyorlar. Test'leri kötü bir şekilde ele alıyor. Bunun sonuncunda da yine kalitesiz yazılımlar ortaya çıkıyor.Halbuki test sürecini iyileştirmenin herkese faydası var. İyi bir test süreci iyi yazılımlar ortaya çıkacaktır. Kaliteli yazılımlar da mutlu testçilere yol açıyor. Mutlu testçiler de kaliteli test süreci ortaya çıkartıyor ve döngü bu şekilde devam ediyor.

OpenSuse bu süreci iyileştirmek adına otomatik test süreçi geliştiriyor.  http://openqa.opensuse.org/ adresinden bakabilirsiniz. Bernand'ın kendi oluşturduğu bu framework ile çeşitli test senaryorları yapılabiliyor. Bunların arasında:



	
  * baştan kurulum·

	
  * bir sürümden başka bir sürüme güncelleme (2009.2'den 2011 gibi)

	
  * yazılım testleri

	
  * regression testleri

	
  * benchmarking


Ama testler sadece hataların  varlığını gösterir, saklı bir sürü hata hala yerinde duruyor ve sayıyor.

Kendisi sonra bir demo gösteriyor. Openqa adresinden tüm süreçler gözüküyor. Her adımın ekran görüntüsü adım adım alınıyor ve web sitesinden bakılabiliniyor. Eğer bir hata olduğunda ekran görüntüsünü alıp paketçiye yolluyor. Ciddi şekilde efor edilmiş güzel bir site ortada duruyor. İyice incelemek gerekiyor.

Bunun dışında başka özgür otomatik test yazılımların olduğundan bahsetti. Bunlar da **KVM-autotest, Sikuli ve Selenium**

Sununmdan sonra Bernand'a farklı ekran kartları (marka ve model çeşitliliği) ile testler nasıl yapıldığını sordum. Kendisi de bu otomatik test işinin ilerlediğini, şu an için genel olarak yukarıda da bahsedilen senaryolar düşünülmüş. **Mesa** ile ilgili test'lerde zaten çok hata aldığını ve yol alması gerektiğini söyledi.

Bernard'ın sunum içeriği çok güçlü idi. Fakat kendisi anlatma konusunda pek iyi olmayan arkadaşlardan biri idi. Bence bu tarz işleri konuşmayı iyi yapan insanlar yapması gerekiyor. LinuxTag'da çok şahit oldum buna çünkü, çok güzel ve içeriği kaliteli sunumlar, boş yere heba oldu.

***** Sharing Open Source License and Copyright Data with SPDX *****
Bu sunumu da HP'den **Martin Michimayr** verdi. Konu dağıtımlardan çok kurumsal yazılımlar ve ekosistemini ilgilendiriyor gibi idi (yani enterprise uygulamalar için). Yine de bir iki güzel bilgiler içeriyordu.

Temel sorun şu: Özgür yazılımların sunduğu lisans bilgileri her daim eksik, yanlış ve taşınabilinir şekilde değil (özellikle taşınabilinir konusunda vurgu yaptı). Buna bir örnek olarak, yazılımların içindeki dosyaları verebiliriz. Bazı dosyalar GPL veriliyor, bazıları LPGL olarak veriliyor. Tüm program türlü türlü lisanlar karmaşık şekilde dağıtılıyor.

Bununla bitmiyor, bu yazılım farklı program yazılım bileşenlere dahil olabiliyor (örneğin bir dağıtıma girebiliyor, dağıtımın lisans gerekliliği ile paketin sunduğu lisans gereklilikleri arasında uyumsuzluk mevcut).·

Bu gibi sorunların önüne geçmek için **SPDX** adı altında bir standart geliştirilmeye çalışılıyor. Bu format bir yazılım paketinin bileşenleri, lisansları ve yükümlülükleri hakkında temel bir iletişim sağlamayı amaçlıyor.

Bundan sonrası SPDX'in yapısı ve nasıl kullanabileceği hakkında idi. SPDX gibi seçenekler düşenenler [SPDX'in sitesinden](http://spdx.org/) daha fazla bilgiye ulaşabilir.

***** Project Bretzn *****

Bu sunum Kde geliştirici ve Kde-look gibi sitelerin tümümün bakımını ve liderliğini yapan **Frank Karlitscheck** tarafından yapıldı. Ön bilgi olarak, Bretzn'in temel hedefi kolay bir paket yapımı ve paket dağıtımı sunmak.

Frank başlıyor, soruyor bize, bizi ne motivite ediyor ? Şu anki durumumuz nasıl ? Yazılım geliştirici tarafından yazılıyor. Ardından bir inşa sistemi seçilerek onunla birlikte farklı mimariler için derleniyor. Derlendikten sonra bunun web sitesine koyuyoruz, yavaştan arkadaşlara tanıtıyoruz. Bununla yetmiyor, gidip twitter, facebook gibi sosyal mecraları da kullanıyoruz. Yazılım kullanıcılar tarafından benimsendikten sonra bir dağıtıma aldırtmaya çalışıyoruz. Dağıtım da doğrudan kararlı depoya almıyor, ortalama olarak 8 ay bekliyoruz kararlı dağıtıma girmesi için.·

Tüm bunları yaptık, şimdi artık birilerin kullanmasını umabiliriz :)

Bretzn tüm bunları **10 dakikaya **indirmek gibi idiallı bir sözle çözmeye çalışıyor.

Bretzn bir **Qt Creator** eklentisi. openSUSE'nin obs sistemi ve Meegoo'nun build servisi ile entegre çalışıyor (bir fikir edindiniz mi ?).  Bu gibi servisler ile entegreli çalıştığı için cross-compile işini bunlar hallediyor.  Paketi bu servisler inşa ettikten sonra, yine Bretzn tarafından başka servislere yollanıyor. Burada başka servislerden kastım Uygulama Mağazaları. Yavaş yavaş, Apple'nin **AppStore** örneği gibi Linux camiasında da bu tarz siteler açılıyor. Bunlara örnek olarak Meego Garage, openSuse AppStore, openDesktop.org gibi yapıları söyleyebiliriz.

Yayınladıktan sonra da yine yukarıda bahsettiği liste, rss, twitter, facebook gibi yayınlama kanalları da kullanılarak "reklam" yapma durumu mevcut.

Şöyle bir baktığımızda Bretzn'in aslında **OBS** sistemine birer frontend olduğunu ve paketlerin de bizim Pisido gibi araçlar gibi kolayca yapılmasını sağlamak. Fakat buradaki asıl amaç, paket yapmaktan ziyade paketi yayınlamak ve tanıtmak. Ben hala Pisido,pisiyap gibi programların paket yapmak için mantıklı araçlar olduğunu düşünmüyorum. Bunu da yine burada farkettiğim için soru hakkımı ele alarak Frank'a şu soruyu sordum :

"Paketlerin 10 dk'da yapılmasından ve yayınlanmasından bahsettiniz, halbuki Bretzn yapısı sanki %10 paket yapımı, %90 da paket tanıtımı ve yayımı. Örneğin sizin bu projeniz ile bir Apache, Chromium, Firefox gibi paketler yapmak mümkün mü ? Sizce mantıklı geliyor mu ?

Kendisi de hemen gülümsedi ve haklı olduğumu, Bretzn'in aslında bu tarz programlar için olmadığı, daha çok basit programlar için olduğundan bahsetti. Paket yapımını ve geliştirmesini yine kendimiz, düzgün işleyen süreçlerle yapmamız gerekiyor, daha sonra yaptığımız paketin inşa dosyalarını bretzn sistemi ile diğer inşa sistemlerine yüklememiz gerekiyor (OBS gibi).

Bretzn güzel bir proje'ye benziyor. Biraz beklemek lazım, tutar mı tutmaz mı emind değilim, zaman gösterecek :)

***** OBS - OpenSuse Build Service *****

Bununla ilgili ilk gün eski Pardus geliştiricilerinden** İsmail Dönmez **ile güzel bir konuşmamız olmuştu. Kendisi şimdi openSuse'de Booster olarak göreviyor alıyor. Birinci elden OBS ile ilgili bilgiler edindim diyebilirim. Bunları Geliştirici listesinde paylaşmıştım, fakat buraya da ekleyeyim, geliştirici listesini takip etmeyenler olabilir.

Bu birinci gün İsmail Dönmez ile ilgili elde ettiğim bilgiler dışında, bugün edindiğim kısa kısa bilgiler şunlar idi.  Kısaca OBS'yi anlatmaya çalışayım. OBS, openSuse tarafından geliştirilen bir sistemin genel adıdır.  Temel amacı, geliştiricilerin kolay bir şekilde paketlerin yapması ve esneklik sağlamaktır. Örneğin bir geliştirici paketi derliyor ve depoya almaya çalışıyorsa türlü türlü sorunlar ile karşılaşabiliyor. Mesela bağımlılık eksik olabilir ya da bir mimaride çalışabilirken başka bir mimaride sorun yaşayabilir (32bit 64bit farklılığı gibi).

OBS'i şu an kullanan 21 bir tane dağıtım varmış. Evet openSuse tarafından geliştiriliyor, ama kodları açık ve dileyen kendi paket sistemine göre değiştirebiliyor. Opensuse bunun için bir web arayüzü de yapmış: [https://build.opensuse.org/](https://build.opensuse.org/). OBS'nin bunun dışında OSC adı altında bir konsol arayüz uygulaması ve açık bir API'si mevcut (yani OBS için farklı uygulamalar geliştirebilirsiniz, yukarıda bahsettiğim **Bretzn** buna bir örnek).

Sununmda sonrasında benim İsmail Dönmez ile yaptığım 1-2 saatlık workshop ile ilgili bilgiler mevcut idi. Birinci gün yaptığımız bu workshop ile bilgiler de şu şekilde (geliştirici listesinde paylaştığım yazının aynısı):

İki ana bileşen var, bir OBS (OpenSource Build Service) ve OSC (OBS için konsol frontendi). Bunların kodu açık ve kullanılabilinir halde. OBS sisteminin bir de web arayüzü mevcut.

OBS sistemini ya Suse'nin kendi sunucularını kullanarak üye olabiliyorsunuz, ya da kendimiz sunucuları kurup kullanabiliyoruz. Her iki türde de OBS'de bir takım değişiklikler yapmamız gerekiyor. Bizim buildfarm.py'yi adapte etmemiz gerekiyor mesela, pspec.xml'e parser yazmak gerekiyor. Bunları yapabilmek için de Perl bilgisi gerekiyor çünkü OBS sistemi Perl ile yazılmış.  Örneğin OSB'yi kurduk ve OSC de kullanır halde. İşlevler nedir, ne yapabileceğiz, neye derman olacak derseniz, onlar da şunlar.

OSC aslında git-vari bir fronted (ozan daha çok svn'e benziyor dedi, ki haklı da :)), bazı komutlar şu şekilde:



	
  * osc co home:farslan

	
  * osc commit -m "Initial release"

	
  * osc delete home:farslan chromium-browser

	
  * osc up


Örneğin commit ettikten sonra, daha önce yine OSC ya da web arayüzden belirlediğiniz mimarilere göre derlemeye başlıyor. Herhangi bir commit'de doğrudan derlemye başlıyor. Bunu neye göre yaptığını sorduğumda, SUSE'cilerin bağımlılıklara göre ayarlardıklarını söyledi. Yani örneğin ben vim'e bir commit yaptım, gcc'ye de başkası bir commit yaptı. O zaman sıraya ilk gcc giriyor.··

Build başlamadan önce her bir build aşaması için sanal makine oluşturuluyor.  Makine'de haliyle hiç bir bağımlılık mevcut değil, on-the-fly bağımlılıkları kuruyur (bizim farmdaki gibi herşeyi kurulu değil yani). Yani vim için bir değişiklik mi yaptım, osc ile commit ettim örneğin, OBS gidip benim için yeni bir sanal makine kurup derlemeye başlıyor. Güzel olan ise osc ile doğrudan farm'da derlenen çıktıları görebilmemiz, hatalara müdahele edebilmemiz.

Burada aklıma takılan, bazı paketlerin derleme işlemi zaten çok uzun sürüyor (örnek: chromium-browser), öntanımlı olarak her sanal makine de aynı olduğundan uzun sürebilir. Fakat bunun da önüne geçebiliriz. OBS tarafı bizim elimizde olduğunda, doğrudan ayrı cluster'ler oluşturabiliriz. Böylelikle derleme süresi uzun süren paketlere daha güçlü bir sanal makine imkanı verebiliriz mesela.  Bunların hepsi bizim elimizde.

Genel olarak geliştiricilerin ev dizinleri oluyor home:farslan gibi. Bir de ayrı dizinler mevcut openSUSE:Factory (bizim devel), openSUSE:11_4 (bizim stable), vs..  Geliştirici sıkıntısı olmadığından Factory'de yüzlerce paketçi ve bunların paketleri mevcutmuş. Peki bunların koordinesi nasıl oluyor ?

Mesela chromium'un yeni bir sürümü çıktı. Ben bunu openSUSE:Factory'de güncelledim. Derlendi ve bana gerekli bilgileri verdi. Fakat bazen bir paketi güncellerken onlarla beraber başka paketleri de derlemem gerekiyor (ABI kırıldı). O zaman ilk önce asıl paketi (mesela chromium) home:farslan dizinine kopyalıyorum. Sonra da diğer paketleri kopyalıyorum. Burada tıpkı bizim playground gibi düşünebilirsiniz. Fakat buradaki farklı olan, sizin yaptığınız değişikliklerin de doğrudan benim home:farslan'a yansımasıdır. Yani mesela ben cups'u kopyaladım buraya, Ozan'ın bundan sonra yapacağı tüm commitler de bana yansıyacak. Ama bu da bir opsiyona bağlı, kopyalareken seçenek sunuluyor, istediğimde değişiklikler yansayacak, istemediğimde yansımayacak.

Şimdi tüm paketleri aldım, güncelledim iyice. Bunları stable'e merge edeceğim değil mi ? Doğrudan OBS'nin arayüzünden bir review isteği yolluyorum. Review isteği yolladıktan sonra benim yaptığım tüm commitler ve değişiklikler (paketlerle ilgili olanlar) doğrudan review ekibine gidiyor.

Review ekibi hem otomatik botlardan oluşuyor hem de insanlarda. Otomatik botlar yapılan değişiklerin kod düzenine kontrol ediyorlar (bizim ismail.py gibi).  Bunun dışında legal-team de mevcut, bu takım da sadece lisans bilgilerine bakıyor. Bu review ekibi içinde paketin bakıcısı da mevcut (başkasının paketini değiştirdiğini mesela), ayrıca bir de openSuse:11_4 sürüm yöneticileri mevcut.  Bunlardan hepsinden ACK alması lazım.··

Yani bu adamlar bir nevi bizim Commit listesini takip ediyorlar ve yapılan değişikleri review ediyorlar. Onların görevi bu. OBS'nin bir güzel yanı ise, ACK aldığınız paketi otomatik olarak sizin ev dizininzden silmesi. Yani paket'den onay aldığınızda sizin ev dizinizdeki bununla ilgili tüm paketler siliniyor (bu da yine opsiyone bağlı)

Bu merge ve review kısımları bizde bir çok yere, özellikle paket reviewlerine uygulanabilinir. Ciddi avantaj sağlayacağını düşünüyorum.
*********

Evet bu kadar. Bunların dışında systemd ve dracut sununmlarına da girdim. Fakat oradan aldığım notlar çok dağınık ve güzel bir blog yazısı temsil edecek şekilde değil. Önümüzdeki günler bu notları düzenleyebilirsem bu iki şey hakkında da yazmayı düşünüyorum. 



