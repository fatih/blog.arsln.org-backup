---
date: '2011-01-14 21:09:34'
layout: post
slug: bir-hata-cozme-hikayesi-2
status: publish
title: Bir hata çözme hikayesi - 2
wordpressid: '902'
categories:
- Gezegen
- Linux
- Programlama
tags:
- bug
- bug solving
- ekran koruyucu
- hata
- hata çözme
- kde
- kscreensaver
- pardus
- pardus 2011
- xscreensaver
---

Ofiste sürüm telaşı var. Haftaya çıkacak olan 2011 için herkes harıl harıl çalışıyor. Benim işlerim( bir sonraki blog yazımda onlardan bahsedeceğim) bittiği için Fatih'in yanına gidip yapabileceğim bir şeyler var mı diye sorunca, bana bu hatadan bahsetti. Bu sabah iki saat süren güzel bir araştırmanını sonunda çözmüştük. Teker teker nasıl çözüldüğüne dair bir yazı yazdım yine. Başlayalım.



## **Hata nedir ?**



Pardus 2011'de bazı ekran koruyucuları çalışmıyor. Tıkladığınızda siyah bir ekran çıkıyor. Yani çalışmıyor. Bununla ilgili bir hata kaydı girilmiş  ([Bug 15578 - Ekran koruyucuların bazıları çalışmıyor](  http://bugs.pardus.org.tr/show_bug.cgi?id=15578) ). Aşağıdaki resimde görebileceğiniz gibi ilk bölümdeki "**Değişen Çizgile**r" adındaki ekran koruyucu siyah bir şekilde gözüküyor

[![](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü8-e1295012525930.png)](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü8.png)



## **Elimizde ne var ?**



Hata kaydında hangi ekran koruyucuların çalışmadı bilgisi var. Bunun dışında ekran koruyucuları oluştusan **xscreensaver** paketçisi olan_ Fatih Aşıcı_'nın bir yorumu mevcut: "Bu ekran koruyucular xscreensaver paketinden çıkmamaya başlamış. Pakette yanlış bir şey olup olmadığına bakayım."



## **Çözüm**


Sistem ayarlarında "**Ekran ve Monitör**" kısmında "**Ekran Koruyucu**" ile ekran koruyucularını seçebilir ve değiştirebiliriz. Bazı ekran koruyucuların neden çalışmadığına bakmak için doğrudan sadece bu modülü çalıştırıp bakmak gerekiyor. Sistem ayarlarında her ayarlama ünitesi aslında birer bağımsız bir uygulama. Bunları

`
kcmshell4 --list
`

ile görebilirsiniz. Buraya göz atınca "**screensaver**" diye bir modül olduğunu göreceksiniz. Bunu konsoldan doğrudan

`
kcmshell4 screensaver
`

ile çalıştırabilirsiniz. Çalıştırınca da "**Ekran Koruyucu**" olarak söylediğim pencerenin aynısı çıkıyor. Şimdi bu ünitenin ismini öğrendiğimiz göre ,kaynak kodlarını araştırmaya başlayabiliriz. Bu paketler genellikle kdebase-workspace ve kdebase-runtime paketlerinden çıkıyor. Ben kdebase-workspace paketini açıp içinde "**screensave**r" ismini aratınca karşıma şunlar çıkıyor:

`
find -iname screensaver
./kcontrol/screensaver
./plasma/design/screensaver
./plasma/screensaver
./plasma/screensaver/containments/screensaver
./doc/kcontrol/screensaver
./krunner/screensaver
`

görüldüğü gibi screensaver ile ilgili birden fazla klasör var. Bizim sorunumuz sistem ayarlarında olduğu için "**kcontrol**" klasörüne girip orayı kurcalamaya başladım. Birden fazla dosya olsa da, genelikle bu KDE modüllerinin bir ana dosyası olur. Bunların isimlendirmesi de **kcmMODULISMI.cpp** ya da **main.cpp** şeklinde. Fakat screensaver ile ilgili bu şekilde bir dosya yoktu. Ama klasör içinde .cpp dosyaları zaten azdı ve isimlere bakarak **scrnsave.cpp** dosyasının doğru olacağını düşünerek açtım.

Arayüzü oluşturan kodlar ana sınıfta olacağından oraya göz atmaya başladım. Şimdi diyeceksiniz ki, KDE ya da QT bilmek gerekiyor mu kodu anlamak için? Kesinlikle Hayır! Eğer başka dillerde bir iki syntax biliyorsanız hemen hemen her kodu okuyabilirsiniz. Mesela bu ana sınıfta şöyle bir kod parçası var:

`
mSaverListView->setColumnCount(1);
mSaverListView->header()->hide();
mSelected = -1;
connect( mSaverListView, SIGNAL(itemDoubleClicked(QTreeWidgetItem*, int)), this, SLOT(slotSetup()));
connect( mSetupBt, SIGNAL( clicked() ), SLOT( slotSetup() ) );
connect( mTestBt, SIGNAL( clicked() ), SLOT( slotTest() ) );
mEnabledCheckBox->setChecked(mEnabled);
connect(mEnabledCheckBox, SIGNAL(toggled(bool)), this, SLOT(slotEnable(bool)));
mWaitEdit->setRange(1, INT_MAX);
mWaitEdit->setSuffix(ki18ncp("unit of time. minutes until the screensaver is triggered", " minute", " minutes"));
`

Bu koda **mSaverListView** bizim aramamız gereken kısım. Yani ekran koruyucuları oluşturan kısım **muhtemelen**. Burada muhtemelen diyorum çünkü ben şu an bunun ne yapacağını bilmiyorum. Ama isimden yola çıkarak ve arayüzde sadece bir liste olduğunu düşünürsek bu yolun yanlış olmayacağını düşünebiliriz.

Şimdi koda (scrnsave.cpp) de bu değişken ismini aratınca karşımıza birden fazla fonksiyonda karşımıza çıktığını göreceksiniz. Bunlara yine şöyle göz atınca bir iki ipucu alabiliyoruz.

`
void KScreenSaver::findSavers()
{
if ( !mNumLoaded ) {
    mSaverServices = KServiceTypeTrader::self()->query( "ScreenSaver");
    new QTreeWidgetItem ( mSaverListView, QStringList(), 18n("Loading...") );
if ( mSaverServices.isEmpty() )
   mLoadTimer->stop();
else
   mLoadTimer->start( 50 );
}
for( KService::List::const_iterator it = mSaverServices.constBegin();
it != mSaverServices.constEnd(); it++,mNumLoaded++)
{
SaverConfig *saver = new SaverConfig;
QString file = KStandardDirs::locate("services", (*it)->entryPath());
if (saver->read(file)) {
    mSaverList.append(saver);
} else
    delete saver;
}
`

Bakınız yine kodun ne yapacağını anlamamıza gerek yok. Önemli olan sorunun nereden kaynaklandığına bakmak. Mesela yazımın başında da belirtiğim gibi, xscreensaver'de bazı paketler eksik olduğunu söyledi Fatih Aşıcı.

Ben ise olaya biraz farklı baktım. Madem bu paketler eksik, neden listede biz bunları görüyoruz ? Listeyi oluşturan nedir ? Oluşturuyorsa neye göre oluşturuyor ?

Yukarıda koda bakınca şu satır göze çarpıyor:
`
QString file = KStandardDirs::locate("services", (*it)->entryPath());
`

file adında bir değişken oluşturuyor. Bunu da KDE'nin standart dizinlerinden biri olan "**services**" klasöründen oluşturuyor (bakınız kodun ne anlama geldiğine yine bakmadım, ama değişken isimleri zaten kendini anlatıyor)

Bundan sonra bu dizinlerin nerede olduğunu bakmaya karar verelim. Genelikle kde paketlerinin veri dosyaları** /usr/share/kde4** altın atılır. Bu dizine girdiğimizde ise "services" diye bir klasör olduğunu görececeğiz. Hatta bu klasörün içinde "**ScreenSavers**" adında bir klasör mevcut  ve klasörün içeriği de şu şekilde devam ediyor:
`
[/usr/share/kde4/services/ScreenSavers ]$ ls
abstractile.desktop   decayscreen.desktop     halo.desktop            loop.desktop          rubik.desktop
anemone.desktop       deco.desktop            helix.desktop           m6502.desktop         sballs.desktop
anemotaxis.desktop    deluxe.desktop          hopalong.desktop        maze.desktop          shadebobs.desktop
...
`

Onlarca desktop dosyası mevcut. Demek ki ekran koruyucu listesini bu dosyalar oluşturuyor. Daha doğrusu "**Ekran Koruyucu**" modülü listeyi buradaki dosyalardan oluşturuyor. Bu desktop dosyaların İçeriği ise şu şekilde:

`
[Desktop Entry]
Exec=xflame
Icon=kscreensaver
Type=Service
X-KDE-ServiceTypes=ScreenSaver
TryExec=xscreensaver
Actions=InWindow;Root;Setup;
X-KDE-Category=Gadgets;Simulations
...

`


Burada "**Exec=**" ile başlayan kısımlar ekran koruyucusunun uygulama isimlerini gösteriyor. Yani bu dosyalar çağırılıyor. "**Ekran Koruyucu**" modülünde, listede herhangi bir ekran koruyucusuna tıkladığınızda işte buradaki Exec komutları çalıştırılıyor. Exec komutlarında belirtilen ekran koruyucuları da xscreensaver paketi ile beraber geliyor. O zaman bu dizinin içeriği ile xscreensaver'den çıkan paketleri karşlılaştırınca. Bakalım neler göreceğiz.


Konsolda dünyanın en iyi metin düzenleyicisi olan [Vim'i](http://vim.org) açıp (swh), "**ex**" modunda

`
:vs 
`

yazarak iki tane temiz pencere açalım 
[![](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü1-e1295012619421.png)](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü1.png)

Ardından xscreensaver'den çıkan çalıştırabilinir dosyaları doğrudan vimin ilk penceresine yapıştıralım. Vim'de bash komutlarını doğrudan çağırıp, çıktılarını yapıştırabilirseniz. "**ex**" modunda şu komutu çalıştırmak yeterli
`
:r !pisi info xscreensaver -F |grep libexec
`
[![](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü2-e1295012654316.png)](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü2.png)

İkinci pencereye geçip (Ctrl-W, W) , bu sefer **/usr/share/kde4/services/ScreenSaver** içeriğini yapıştıralım. "**Ex**" modunda şu komutu çalıştırdım bu sefer:
`
:r !ls /usr/share/kde4/services/ScreenSavers/
`
[![](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü3-e1295012688204.png)](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü3.png)

Güzel olan ise desktop dosyalarını isimleri ile xscreensaver'den çıkan ekran koruyucu uygulamalarının ismi aynı. Tek yapmamız gereken bu isimleri karşılaştırmak. Fakat resimde de gördüğünüz gibi ilk pencerede her satırın başında dizin yolun adresleri mevcut. ikinci pencerede de dosyalar .desktop dosyası ile başlıyor.

Hepsini tek tek değiştirmiyorum tabi :) Elimizde **Vim** gibi şahane bir uygulama var, neden kullanmayalım ? (Vim konusunda biraz fanatikliğim var, özür). Vim'de de **macrolar** mevcut. "**qa**" tuşu ile macroyu başlatıp, bir takım işler yapıp "q" ile kapatabilirsiniz. Sonra bu kaydedilen makroyu her satırda "@a" ile çağırabilirsiniz. "**a**" ise macronun içeriğini kaydeden belleğin ismi. İlk pencerede her satır için yapmamız gerekenler şunlar (vim komutularıyla beraber)



	
  1. Satırın sonuna gitmek.  Vim komutu: "**$**"

	
  2. Sonra bir kelime geriye gitmek. Vim komutu : "**b**"

	
  3. Kelimenin başlangıcından sonuna kadar silmek. Vim komutu: "**d0**"

	
  4. Bir alt satıra inmek - Vim komutu: "**j**"


Evet üç tane hamle ile bunu güzelce halledebiliriz. Bunları sırayla yaptıktan sonra tekrar "**q**" tuşu ile macroyu kapatacağım. Tüm satırlar için ex modunda
`
:%norm! @a
`

çalıştırınca aşağıdaki sonucu elde ediyoruz:
[![](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü4-e1295012727618.png)](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü4.png)

İkinci pencere için ise yine bir macro oluşturuyoruz. Her satır için yapmamız gerekenler ise



	
  1. Satırın başına gelmek - Vim komutu: "**0**"

	
  2. Satırda . ile başlayan konuma gelmek . Vim komutu: "**f.**"

	
  3. Sonra bu konumdan satırın sonuna kadar silmek Vim komutu: "**d$**"

	
  4. Bir alt satıra inmek - Vim komutu: "**j**"


:%norm! @a çalıştırınca aşağıdaki sonucu elde ediyoruz:
[![](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü5-e1295012764297.png)](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü5.png)

Evet şimdi yan yana iki tane liste elde ettik. Bunları kaydedip vimdiff ile açabilirdik. Ki genelikle öyle yapılır. Fakat bu şekilde iki tane pencere açıkken de diff komutunu kullanabilrsiniz. Yapmamız gereken "**ex**" modunda şu satırı yazmak:
`
:windo diffthis
`
[![](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü6-e1295012790309.png)](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü6.png)

Sol tarafta **xscreensaver** uygulamaları görülüyor. Sağ tarafta ise /**usr/share/kde4/services/ScreenSavers** altındaki desktop dosyaları. Buradan görüldüğü gibi desktop dosyalarında fazlalıklar var (yeşil olanlar). Yani var olan desktop dosyaları  var fakat ona karşılıklı gelen xscreensaver ekran koruyucuları mevcut değil. Hata'da buradan kaynaklanıyor.Bazıları çalışmıyorsa, sistemde kurulmadığı anlamına geliyor. Peki sistemde kurulu olmayan bir ekran koruyucu için neden bu dosyalar oluşuyor ?  Bu dosyalar nerden geliyor o zaman ?

Pisi'nin bununla ilgili çok güzel bir komut var, rastgele bir dosya üzerinde bu komutu çalıştırınca:
`
pisi sf /usr/share/kde4/services/ScreenSavers/boxed.desktop
Searching for /usr/share/kde4/services/ScreenSavers/boxed.desktop
Package **kdeartwork-screensavers** has file /usr/share/kde4/services/ScreenSavers/boxed.desktop
`

Bu paketin hangi bileşene ait olduğunu öğrenmek için de pisi info çalıştırıyorum:
`
pisi info kdeartwork-screensavers
Installed package:
Name                : kdeartwork-screensavers, version: 4.5.5, release: 43
Summary             : Additional KDE4 screensavers
Description         : Contains additional screensavers for KDE4.
Component           : desktop.kde.base
`

Bileşenin **desktop.kde.base** olduğunu görünce svn deposunda o dizine girdim. **Kdeartwork-screensavers** adında bir klasör mevcut değildi fakat kdeartwork klasörü mevcut idi. Bu paketin pspec.xml dosyasına bakınca kdeartwork ile gelen bir alt paket olduğunu görünce paketi açıp devam ettim:
`
pisi bi pspec.xml --unpack
`

**/var/pisi/** altında kaynak kodunun dizinine girdiğimizde hiç bir şey aratmadan kscreensaver klasörü gözüme çarptığı için oradan başladım devam etmeye. Bu sefer doğrudan **.desktop** aratarak, bu dosyaların neden oluştuğuna veyahut da nasıl oluştuğunu öğrenmek istedim. Arayınca şunlar çıktı:
`
grep -rHIin desktop .
./kxsconfig/ScreenSavers/truchet.desktop:1:[Desktop Entry]
./kxsconfig/ScreenSavers/decayscreen.desktop:1:[Desktop Entry]
./kxsconfig/ScreenSavers/photopile.desktop:1:[Desktop Entry]
./kxsconfig/ScreenSavers/jigglypuff.desktop:1:[Desktop Entry]
...
`

Şeklinde desktop dosyaları mevcuttu. Bunlar bizim desktop dosyalarının ta kendisi. Bu yüzden **kxsconfig** klasörüne girip oraları kurcalamaya başladım. Klasörün içindeki CMakelists.txt dosyası çözümün ta kendisiydi:

`
########### install files ############### 

FILE(GLOB _desktopfiles "ScreenSavers/*.desktop" )
foreach(_currentdesktopfile ${_desktopfiles})
·   STRING(REGEX REPLACE ".desktop" "" _newitem "${_currentdesktopfile}" )
·   #MESSAGE(STATUS "newItem <${_newitem}>")
·   GET_FILENAME_COMPONENT(_screensaverName ${_newitem} NAME_WE)
·   MESSAGE(STATUS "name without extension <${_screensaverName}>")
·   find_file(XSCREENSAVER_FILE_FOUND ${_screensaverName}.xml PATHS ${XSCREENSAVER_CONFIG_DIR} )
·   if(XSCREENSAVER_FILE_FOUND)
·   ·   MESSAGE(STATUS "xscreensaver name ${_screensaverName} found")
·   ·   install(FILES ${_currentdesktopfile} DESTINATION  ${SERVICES_INSTALL_DIR}/ScreenSavers )
·   else(XSCREENSAVER_FILE_FOUND)
·   ·   MESSAGE(STATUS "xscreensaver name ${_screensaverName} not found")
·   endif(XSCREENSAVER_FILE_FOUND)
endforeach(_currentdesktopfile ${_desktopfiles})
`

Burası tam olarak düşündüğüm şeyi yapıyordu. Desktop dosyalarının ismini **XSCREENSAVER_CONFIG_DIR** altından bakıyor ve eğer aynı dosya varsa gidip "**desktop**" dosyasını kuruyor.

İşte bütün sorun burada. Sorun şu ki, bu betik her koşulda tüm desktop dosyalarını yüklüyor. Xscreensaver'den çıkan ekran koruyucularını hiçe sayıyor. Yukarıdaki şu satırlarda sorun var yani:
`
find_file(XSCREENSAVER_FILE_FOUND ${_screensaverName}.xml PATHS ${XSCREENSAVER_CONFIG_DIR} )
if(XSCREENSAVER_FILE_FOUND)
...
`

Tam olarak hatayı görmek için cmake'in **MESSAGE** komutu ile şu şekilde yazıp Makefile'ı çalıştırıyorum tekrardan:

`
find_file(XSCREENSAVER_FILE_FOUND ${_screensaverName}.xml PATHS ${XSCREENSAVER_CONFIG_DIR} )
MESSAGE(STATUS ${XSCREENSAVER_FILE_FOUND} )
if(XSCREENSAVER_FILE_FOUND)
...
`

Aldığım sonuç ise şu şekildeydi.
`
-- /usr/share/xscreensaver/config/compass.xml
-- xscreensaver name truchet found
-- name without extension
-- /usr/share/xscreensaver/config/compass.xml
-- xscreensaver name decayscreen found
-- name without extension
-- /usr/share/xscreensaver/config/compass.xml
-- xscreensaver name photopile found
-- name without extension
-- /usr/share/xscreensaver/config/compass.xml
-- xscreensaver name jigglypuff found
`

Burada "**compass**" ile bitenler bizim **XSCREENSAVER_FILE_FOUND** değişkenin değeri. Gördüğünüz gibi aslında bu değişken her file_find komutu çağırıldığında değişmesi gerekiyordu. Fakat bizde değişmiyor

Peki neden ?

Fatih Aşıcı ve Gökçen Eraslan ile bu konuya bakarken, Gökçen şu komutu file_find'dan önce yerleştirmemizi söylemişti
`
unset(XSCREENSAVER_FILE_FOUND CACHE)
find_file(XSCREENSAVER_FILE_FOUND ${_screensaverName}.xml PATHS ${XSCREENSAVER_CONFIG_DIR} )
`

Bu şekilde tekrar make komutunu çalıştırdığımda şu çıktıyı almaya başladım
`
-- name without extension
-- /usr/share/xscreensaver/config/truchet.xml
-- xscreensaver name truchet found
-- name without extension
-- /usr/share/xscreensaver/config/decayscreen.xml
-- xscreensaver name decayscreen found
-- name without extension
-- /usr/share/xscreensaver/config/photopile.xml
-- xscreensaver name photopile found
-- name without extension
-- /usr/share/xscreensaver/config/jigglypuff.xml
`

Evet görüldüğü gibi artık **XSCREENSAVER_FILE_FOUND** değişkeni güzel bir şekilde değişmeye başlamıştı. Bu satırı ekleyip baştan derletip kdeartwork'u kurunca herşey güzelce çalıştı. Peki bu satırı neden eklememiz gerekiyordu ?

Cmake'de file_find komutunun yardım dosyasını şu şekilde açarak:
`
cmake --help-command find_file
`

Aşağıdaki kısmı okuyunca her şey daha iyi anlaşıldı:
`
This command is used to find a full path to named file.  A cache entry
named by  is created to store the result of this command.  If the
full path to a file is found the result is stored in the variable and
the search **will not be repeated unless the variable is cleared**. 
`

Yani file_find komutu ilk bulduğu değeri belleğe atıp kaydediyor. Ondan sonraki değerleri hiçe sayıyor. Bellekteki değeri silmemiz bekliyor."**unset**" komutu ile işte bu değişkeni bellekten siliyor tam olarak. Paketi yamalayarak sisteme kurduktan sonra aşağıda "**Ekran Koruyucu**"yu açtığımda gördüğünüz gibi "**Değişen Çizgiler**" ekran koruyucusunun yok olduğunu görürsünüz:


[![](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü9-e1295012824972.png)](http://blog.arsln.org/wp-content/uploads/ekran-görüntüsü9.png)

Hepsi bu kadar. Yine [bir satırlık bir yama](http://svn.pardus.org.tr/pardus/2011/devel/desktop/kde/base/kdeartwork/files/fix_screensaver_install.patch) ama gördüğünüz gibi bir çok şeyi değiştiriyor. Bunun gibi yüzlerce hata çözüldüğünü, çok daha eksantrik olanların olduğundan bahsetmeye gerek yok herhalde. Bazıları gerçekten çok zaman alabiliyor. Örneğin benim yazdığım bir [diğer yazımdaki hata](http://blog.arsln.org/bir-hata-kovalamaca-hikayesi/) 2-3 günümü alırken, bu hata 2 saatimi almıştı. Biraz da o anki ruh halin de etkisi olabiliyor herhalde. 

Bu arada yukarıda anlatıklarımın çoğu sesli düşünce. Hataya bakarken belki yüzlerce komut kullanıyorsunuz, vim macrolarını aslında çok hızlı bir şekilde yazıyorsunuz. Ben sadece adım adım neler yapıldığını ve nerelere gidebileceğini gösterdim yine. Vim ile yaptığım düzenlemelerde biraz ayrıntıya girdim biliyorum, fakat onu da macro ve iki dosya arasındaki karşılaştırma olayların sıkça yapıldığından biraz ipucu şekilde olsun dedim.Sorularınız varsa daha detaylı anlatabilirim. 



