---
date: '2010-12-13 17:49:05'
layout: post
slug: bir-hata-kovalamaca-hikayesi
status: publish
title: Bir hata kovalamaca hikayesi
wordpressid: '770'
categories:
- Gezegen
- Linux
tags:
- bug
- developer
- gzopen
- hata
- kdebase
- kdelibs
- pardus
- zlib
---

Bugzilla'ya girilen hataların çözüldüğüne şahit oluyorsunuz kimi zaman. Bunlar anında çözülse de bazıları zaman alabiliyor. Peki hiç bir geliştirici gözünden merak ettiniz mi bir hata nasıl kapanıyor diye ?  Aslında basit gibi gözüken bir hatanın nerelere kadar gittiğine hep beraber inceleyelim. Uzun bir yazı, şimdiden uyararım:

**1.) **Bundan yaklaşık iki ay önce ilk hata giriliyor [1], bir ay geçmeden ikinci bir hata daha giriliyor [2], bir ay sonra yine aynı hata giriliyor [3]. Tüm hata kayıtları aynı:

Tasma'da simge setini "**Siyah-Beyaz**" çevirmek istediğinizde Tasma çöküyor. Evet bu kadar basit. "Siyah-Beyaz" seti bir türlü seçilemiyor. Aşağıdaki gibi bir hata ile karşılaşıyoruz:

[![](http://blog.arsln.org/wp-content/uploads/hata.png)](http://blog.arsln.org/wp-content/uploads/hata.png)

"Geriye dönük izleme" sekmesine tıkladığımızda aşağıdaki hata kaydını görüyoruz:

`
[Thread debugging using libthread_db enabled]
0xffffe424 in __kernel_vsyscall ()
#0  0xffffe424 in __kernel_vsyscall ()
#1  0xb7788da0 in __nanosleep_nocancel () from /lib/libc.so.6
#2  0xb7788ba3 in __sleep (seconds=0)
    at ../sysdeps/unix/sysv/linux/sleep.c:138
#3  0xb6f0e2dc in KCrash::startDrKonqi(char const**, int) ()
   from /usr/kde/3.5/lib/libkdecore.so.4
#4  0xbff3ca4c in ?? ()
`

**2.)** Hata kaydından görüldüğü gibi pek bir şey anlaşılmıyor. Bu konuda yapabileceğimiz bir şey olmadığından en baştan başlayalım, yani simge setlerinin bulunduğu dizinden. Linux işletim sistemlerinde simge setleri genelikle **/usr/share/icons** altında kaydedilir. Fakat KDE simge setleri ** /usr/kde/3.5/share/icons/** dizini altında da yer alabiliyor. Biz de buradan başlayalım araştırmamıza.  

**"Siyah-beyaz"** simge setimiz **mono** adıyla orada duruyor. Simge setinin dosyalarının .svgz formatında olduğunu gördüm.. SVG formatı kullanıyor ama GZ ile sıkıştırılmış yani.  **Orjinal boyutunun sadece %20'sini** kaplıyor. Bu oran çok fazla olduğundan simge setleri genelikle bu şekilde paketleniyor.

**3.)** Simge setinin bozuk olacağını düşünürek kısa bir Google aramısından sonra sahibine ulaştım [4]. 2004 yılında simge setini oluşturumaya başlamış ve ve 2007 yılında güncellemiş. Ama KDE'nin Svn deposunda bulabileceğimiz söyleniyordu.  KDE deposundan indirip son sürümü denemek istedim. KDE'nin svn depoları yavaştan git'e dönüştüğü için düzgün bir sunucu bulup düzgün bir şekilde indirmek için çeşitli svn kombinasyonları denedim.  Sonunda [Gökmen'in](http://gokmengoksel.com/) de yardımı ile şu satırı buluyoruz ve indirmeye başlıyoruz:

`
svn co svn://anonsvn.kde.org/home/kde/tags/KDE/3.5.10/kdeaccessibility/IconThemes/mono
`

Tasma'yı açıyor ve tekrar deniyoruz. Ama Tasma'nın yine çöküyor. Biraz daha farklı bakalım o zaman.

**4)** Ne demiştik. Tasma'da simge setine tıkladığımızda, Tasma tamanen kitleniyor ve çöküyor. Kısaca düşünürsek, simge setine tıkladığımızda Tasma'nın içindeki "**icons**" modülü simgeleri yükleyecek ve bir önizleme oluşturacak. Eğer bir önizleme oluşturamıyorsa, o zaman yüklemede bir yerde takılıyor ve yükleyemiyor demek. Bizim "Siyah-Beyaz" seti svgz formatından oluşacağından, ilk önce sıkıştırılmış dosyayı açacak. Peki, o zaman şu dosyaları kendimiz açıp bir bakalım, neymiş ne değilmiş.

`
$ gunzip örnek.svgz
gzip: devices/örnek.svgz: unknown suffix -- ignored
`

Hm... Bilmediğini iddia ediyor. Halbukji .svgz dosyaları GZ ile sıkıştırılmıştı. Hangi formatları desteklediğini öğrenmek için man gunzip ile açıp okumaya başlıyorum. Dökümantasyon'da şu cümle yazıyordu:


> gunzip  takes  a  list of files on its command line and replaces each file whose name ends with .gz, -gz, .z, -z, or _z (ignoring case) ...


O zaman biz de bu kurala uyalım ve dosyanın son ekini .gz yapıp açalım 

`
$ mv örnek.svgz örnek.svg.gz
$ gunzip örnek.svg.gz
`

Voila. Dosyamız açıldı. Fakat bir sorun var, sadece bir dosya açıldı. Tüm dosyaların son ekini svg.gz şeklinde yapıp tüm dosyaları gunzip ile açmak gerekiyor (Tasma tüm seti yüklesin, olması gerektiği gibi). Bash'deki for seçeneği çok kullanışlı olsa da, birbirine içine girmiş dosyalar söz konusu olunca **find** komutu daha işe yarar oluyor.  .svgz ile biten tüm dosyaları .svg.gz'ye çevirmem gerekiyor. Rename komutu da İbrahim'in tavsiyesi, bu tavsiye olmazsa "**sed**" komutu ile uğraşmam gerekiyordu (**sonradan ekleme**: Gökçen sayesinde -S parametresinin varlığından haberdar oldum. gunzip -S .svgz ile doğrudan belirleyebiliriz son eki, find ile hepsini çevirmemize  gerek yok yani :) ):

`
find  scalable/ -name *.svgz -exec rename .svgz .svg.gz '{}' \;
`

ardından gunzip ile hepsini açalım. gunzip'de güzel olan ise -r seçeneğinin olması. Bu seçenek ile klasör ismi verebiliriz ve içinde ne kadar klasör varsa her birine girip dosyaları açıyor.

`
gunzip -f -r scalable/
`

Evet tüm dosyaları .svg formatına dönüştürdük. Şimdi Tasma'yı tekrar açıyoruz ve "Siyah-Beyaz simge setine tıklıyoruz. Evet, açıldı!

[![](http://blog.arsln.org/wp-content/uploads/mono_icons.png)](http://blog.arsln.org/wp-content/uploads/mono_icons.png)


Tasma çökmedi, ve güzel bir şekilde simge setimizi kullanabildiğimizi gördük. Demek svgz paketlerinde bir sorun var. Peki tam olarak nerede ?

**5.) **SVGZ formatını açan KDE fonksiyonunu bulup incelememiz lazım. Bunun hangi paketten çıkacağına pek emin değilim. Fakat fonksyonun başka kütüphanelerce kullanabileceği ihtimali var. Çünkü icon seti yükleniyor. Hemen hemen her uyguluma simge seti yüklediğinden, bu görev bir kitaplık tarafından yaptırılıyordur. **Ozan** ile soruna bakarken, bu fonksiyonun kdelibs'den çıktığını anladık. Fonksiyonun adı ise KSVGIconEngine()j Ben sonra araştırmalarımı bu yönde ağırlaştırmaya başladım. Hangi dosyalarda kullanıldığına baktım ilk önce:

`
grep -rin KSVGIconEngine .
`

Grep, parametre olarak verdiğimiz kelimeleri dosyanın içeriğinde satır satır arayıp bize yerini bildiren bir uygulama. **"-rin" ** seçeneği ile alt dizinlerinin tümünü arayacak, ararken büyük-küçük ayrımı yapmayacak ve bulduğu kelimelerin dosya'daki satır numarasını da gösterecek. Satır numarası bize lazım, çünkü 4000 satırlık dosyalar olabiliyor. Arama sonucu baya uzun, ama şöyle bir göz gezdirip bakalım neler varmış: 

`
...
./kdecore/svgicons/ksvgiconengine.cpp:513:     KSVGIconEngineHelper *helper;
./kdecore/svgicons/ksvgiconengine.cpp:518:KSVGIconEngine::KSVGIconEngine() : d(new Private())
./kdecore/svgicons/ksvgiconengine.cpp:520:      d->helper = new KSVGIconEngineHelper(this);
./kdecore/svgicons/ksvgiconengine.cpp:525:KSVGIconEngine::~KSVGIconEngine()
...
`

Aha !! İlk ipucunu yakaladık bile.  Görüldüğü gibi gözümüze hemen ksvgiconengine çarpıyor. Herhalde bizim simge setini yükleyen fonksiyon bu olsa gerek. Fonkisyona ait ksvgiconengine.cpp dosyasını açıp inceleyelim. İncelereken gz_open fonksiyonuna dair bir şeyler de aramaya başladım. Aramaların sonucunda su kısma denk geldim:

`
...
gzFile svgz = gzopen(path.latin1(), "ro");
if(!svgz)
return false;

QString data;
bool done = false;

QCString buffer(1024);
int length = 0;

while(!done)
{
int ret = gzread(svgz, buffer.data() + length, 1024);
...
`

Burada gzopen() fonksiyonu bir seçenek alıyor ve onunla açıp svgz nesnesi oluşturuyor. Eğer patlıyorsa ve Tasma çöküyorsa gzopen() fonksiyounun bu hataya sebep olacağını düşünerek devam edelim (ihtimaller çok, ama en mantıklı bu gözüküyor). Ya da gzread ile okurken patlıyor olabilir.  Önemli olan bu iki fonksiyondan biri buna sebep oluyor. Peki bu fonksiyon hangi pakete ait ?

**6.) **Yine bir google araştırması ile bu paketinin **zlib** paketine ait olduğunu öğreniyoruz. Kurumsal 2'deki paket 1.2.5 sürümünde. Eğer bu paket sorunluysa, ve gzopen() düzgün çalışmıyorsa son zamanlarda yaptığımız güncellemelerden kaynaklanabilir. Peki 1.2.5 sürümü ne zaman güncellendi ? 

Commit listesine baktığımızda [5] **27.9.2010** tarihinde geçirilmiş gözüküyor. 
Bizim hata da ** 07.10.2010** tarihinde açılmış

Yani Zlib güncelleniyor ve yaklaşık 1.5 Hafta sonra hata kaydı açılıyor. Demek ki bununla ilgili olabilir. Devam edelim ve paketin hangi sürümden güncellediğinde bakalım.

`
     
+        
+            2010-08-20
+            1.2.5
+            Version bump and split devel packages.
+            Ozan Çağlayan
+            ozan at pardus.org.tr
+        
         
             2010-06-08
             1.2.3
`

Gördüğünüz gibi 1.2.3 sürümünden 1.2.5 yükseltmişiz (Paket 2011 deposundan merge edildiği için tarih eskiyi gösteriyor, ona aldanmayın). Acaba 1.2.3 sürümünü tekrar kursak hata düzelir mi ? Bunu deniyorum elbette ve zlib sürümünü 1.2.3 sürümüne downgrade yapıyorum. Sonrasında Tasma'yı açıp simge setini değiştire tıklıyorum. 

[![](http://blog.arsln.org/wp-content/uploads/mono_icons.png)](http://blog.arsln.org/wp-content/uploads/mono_icons.png)

Evet! ikinci bir Voila! Paket çökmedi ve çalıştı. Bu ne demek peki ?

**7.) **zlib 1.2.3'den 1.2.5'e geçerken gzopen() fonksiyonu değişime uğruyor ve ondan sonra çalışmamaya başlıyor. O zaman bu iki paketi indirip aradaki farka bakmamız gerekiyor. Zlib'in sitesine girip 1.2.3 ve 1.2.5 sürümünü indirmek için bağlantıya tam tıklayacaktım ki kötü süpriz ile karşılaştım [6]. 1.2.3 sürümü ve 1.2.5 arasında tam **beş** yıl geçmiş!

`
1.2.3 (18 July 2005)
1.2.5 (19 Apr 2010)
`

Tabi bununla da bitmiyor, bu iki tarih arasında onlarca minor sürüm çıkmış. Tam söylemek gerekirse :

`
zlib-1.2.3.tar.gz        18-Jul-2005
zlib-1.2.3.1.tar.gz     16-Aug-2006
zlib-1.2.3.2.tar.gz     04-Sep-2006
zlib-1.2.3.3.tar.gz     03-Oct-2006
zlib-1.2.3.4.tar.gz     22-Dec-2009
zlib-1.2.3.5.tar.gz     08-Jan-2010
zlib-1.2.3.6.tar.gz     17-Jan-2010
zlib-1.2.3.7.tar.gz     24-Jan-2010
zlib-1.2.3.8.tar.gz     13-Feb-2010
zlib-1.2.3.9.tar.gz     21-Feb-2010
zlib-1.2.4.tar.gz        14-Mar-2010
zlib-1.2.4.1.tar.gz     28-Mar-2010
zlib-1.2.4.2.tar.gz     09-Apr-2010
zlib-1.2.4.3.tar.gz     10-Apr-2010
zlib-1.2.4.4.tar.gz     18-Apr-2010
zlib-1.2.4.5.tar.gz     18-Apr-2010
`

Sürüm değişiklikleri ile ilgili değişiklikleri dizeleyen [6] dosyayı gzopen() fonksiyoununa aratmama rağmen ele tutulur hiç bir şeye varamadım. Peki şimdi hangi sürümden hangi sürüme geçiş yaparken sorun çıkıyor ? Sürümleri, üsten başlayarak rastgele seçtim ve 1.2.3.9 sürümünden 1.2.4 sürümüne geçişti gzopen() değişime uğradığını gördüm.  Burada sormamız gereken soru ise, nasil bir değişime ?

**8.)** Aradaki farkı görebilmek için diff kullandım. 1.2.3.9 ve 1.2.5 sürümlerini siteden [7] indirip bir klasöre attım. Burada artık 1.2.4 yerine doğrudan 1.2.5 sürümünü indirdim, çünkü 1.2.3.9'dan sonraki tüm sürümlerde Tasma çöküyor. Bu sebeble en yeni sürüme ile 1.2.3.9 sürümü arasındaki farka bakmak daha yararlı olacak. gzopen ve gzread fonksiyonlarına baktım ve gzlib.c'den çıktığını gördüm. Bunların farkını diff komutu alınca

`
diff -Nur zlib-1.2.3.9/gzlib.c zlib-1.2.5/gzlib.c > degisim.patch
`

ilginç bir süpriz ile karşılaşıyoruz( kod parçasının sadece bir kısmını gösteriyorum):

`
--- zlib-1.2.3.9/gzlib.c·   2010-02-18 04:52:05.000000000 +0200
+++ zlib-1.2.5/gzlib.c· 2010-04-18 20:53:22.000000000 +0300
@@ -147,6 +147,14 @@
return NULL;
}
·
+    /* save the path name for error messages */
+    state->path = malloc(strlen(path) + 1);
+    if (state->path == NULL) {
+        free(state);
+        return NULL;
+    }
+    strcpy(state->path, path);
+
/* open the file with the appropriate mode (or just use fd) */
state->fd = fd != -1 ? fd :
open(path,
@@ -164,20 +172,13 @@
O_APPEND))),
0666);
if (state->fd == -1) {
+        free(state->path);
free(state);
return NULL;
}
if (state->mode == GZ_APPEND)
state->mode = GZ_WRITE;         /* simplify later checks */
·
-    /* save the path name for error messages */
-    state->path = malloc(strlen(path) + 1);
-    if (state->path == NULL) {
-        free(state);
-        return NULL;
-    }
-    strcpy(state->path, path);
-
/* save the current position for rewinding (only if reading) */
if (state->mode == GZ_READ) {
state->start = LSEEK(state->fd, 0, SEEK_CUR);
`

Diff'e alışık gözler burada bir yer değişikliğini olduğunu görecekler. Ayrıca bir bir pointer adresi temizliyoruz. Bu kod parçasında ilginç olan ve bizim Tasma'yı çöktüren neden, bir kod parçasının yer değiştirmesinden kaynaklanıyor. Bu iki dosyayı yan yan koyup incelediğimizde ise şunları görüyoruz (resime tıklayarak büyütebilirsiniz)

[![](http://blog.arsln.org/wp-content/uploads/vizlibg-300x200.jpg)](http://blog.arsln.org/wp-content/uploads/vizlibg.jpeg)

Sol tarafta 1.2.3.9 sürümü var, sağ tarafta ise 1.2.5 sürümü. Sol taraftaki sürümde Tasma çökmüyorken, sağ taraftaki sürümü kullanmaya başladığımzıda çökmeye başlıyor. Peki neden ? Burada zlib hakkında pek bilgim olmadığından geniş bir yorum yapamayacağım, fakat tahminen beklenen önce NULL değeri geri döndürdüğü için KSVGIconEngine bu geri döndürilen NULL ile bir şey yapamıyor. Bu konuda fikri olan varsa yorumlara yazarsa sevinirim : )

**9.**) Şimdi gelelim "path" olarak KDE'deki fonksiyonunun ne çevirdiğine. Fonksiyonun tam olarak nerede kullanıldığını ögrenebilmek için KSVGIconEngine fonksyionun nerelerde çağırıldığına bakmam lazım. Bunun için ksvgiconengine.h satırını bulmamız işimize yarayacak. Kaynak kodlarının yer aldığı /var/pisi dizinin altındaki kdelibs paketine girip aratınca:

`
grep -rin ksvgiconengine.h
`

Gelen sonuçlarda biri ise:

`
...
./kiconloader.cpp:50:#include "svgicons/ksvgiconengine.h"
...
`

Demek ksvgiconengine başlık dosyalarını kiconloader.cpp adındaki bir dosyada çağırılıyor. Madem öyle artık araştırmamıza bu dosya üzerinden yapmamız gerekiyor. Dosyada bir arama yapınca şununla karşılaştım:

`
#ifdef HAVE_LIBART
	else
	{
	    // Special stuff for SVG icons
	    KSVGIconEngine *svgEngine = new KSVGIconEngine();
	    if(svgEngine->load(size, size, icon.path))
		img = svgEngine->painter()->image();
	    else
		img = new QImage();

	    delete svgEngine;
	}
#endif
`

Burada görüldüğü gibi bizim fonksiyon çağırılıyor. Parametre olarak da simgenin boyutlarını ve dosyanın yolunu veriyoruz. Evet, görüldüğü gibi, buradaki **icon.path** bizim başımızı ağrıtıyor. Sorunun kökü ta kendisi. Yukarıdaki fonksiyon temel fonksiyonlardan biri. Çoğu uygulama bunu kullanacak. Tasma'da simge setini değiştiriken de bu fonksiyon çağırılıyor. Burada şunu bilmemi lazım. "**kdelibs**" paketi yukarıdaki kod parçasını bize sağlıyor(yani ksvgiconengine()). Simge setini değiştirdiğimiz modülün adı ise "icons". Bu modül ise "kcontrol" ait bir modül ve "**kdebase**" paketinden çıkıyor.  Tasma'da bu simge setini seçtiğimizde "icons" modülü çağrılıyor.

**10.** Bu sefer aramak yerine, tema'da tıkladığımız listenin nesnesine ve sinyali gönderdiği yere bakmaya karar verdim. Simge setinin oluşturan liste ise şu :

`
  m_iconThemes=new KListView(this,"IconThemeList");
  m_iconThemes->addColumn(i18n("Name"));
  m_iconThemes->addColumn(i18n("Description"));
  m_iconThemes->setAllColumnsShowFocus( true );
  m_iconThemes->setFullWidth(true);
  connect(m_iconThemes,SIGNAL(selectionChanged(QListViewItem *)),
		SLOT(themeSelected(QListViewItem *)));
`

Görüldüğü gibi tıkladığımızda sinyal "themeSelected" fonksiyonunu çağırıyor. Dosya içinde o fonksiyonu aratınca şuraya varıyoruz(uzun bir yer sadece en önemli kısmını gösteriyorum):

`
void IconThemesConfig::themeSelected(QListViewItem *item)
...

  KIcon icon=icontheme.iconPath("exec.png", size, KIcon::MatchBest);
  if (!icon.isValid()) {
#ifdef HAVE_LIBART
	  icon=icontheme.iconPath("exec.svg", size, KIcon::MatchBest);
	  if(engine.load(size, size, icon.path))
              m_previewExec->setPixmap(*engine.image());
          else {
              icon=icontheme.iconPath("exec.svgz", size, KIcon::MatchBest);
              if(engine.load(size, size, icon.path))
                  m_previewExec->setPixmap(*engine.image());
          }
#endif
  }
...
`

Burada .svg dosyalarını yüklüyor eğer if döngüsü "false" döndürürse .svgz dosyasını yüklüyor. 

Peki bu if döngüsü bize "false" döndürmezse ne oluyor ? Evet Tasma çöküyor :) 

Eğer "false" döndürebilseydi o zaman .svgz dosyalarını yükleyebilecekti. Çünkü o dosyalar elimizde mevcut. Burada .svg dosyasını gzopen ile açmaya çalışıyor, fakat "path" değişkeni yazımın ortalarında da değindiğim gibi NULL değeri aldığından gzopen patlıyor. Çözüm artık kesinleşti gibi.

`
if(engine.load(size, size, icon.path))
`

satırının düzetmemiz lazım. 5'inci satırda eklediğim gz_open dosyasında şu satırları:
`
bool KSVGIconEngine::load(int width, int height, const QString &path;)
{

	QDomDocument svgDocument("svg");
	QFile file(path);

`

aşağıdaki gibi değiştiriyoruz.

`
bool KSVGIconEngine::load(int width, int height, const QString &path;)
{
	if (path.isEmpty())
		return false;

	QDomDocument svgDocument("svg");
	QFile file(path);

`

Evet, boş bir "path" değişkeni geldiğinde bize "false" döndürecek iki satırlık bir şey. Hepsi bu kadar :) Bu yama bir saat önce svn deposuna da yansıdı. Yazdıklarım sanki bir anda yapılmış gibi gözükebilir, fakat 2-3 günümü aldı. Kullanıcı açısından basit gibi gözüken bir şey, biz geliştiricilerin bazen günlerini alabiliyor. Buraya da not düşeyim :)

[1] [http://bugs.pardus.org.tr/show_bug.cgi?id=14560](http://bugs.pardus.org.tr/show_bug.cgi?id=14560)
[2] [http://bugs.pardus.org.tr/show_bug.cgi?id=15022](http://bugs.pardus.org.tr/show_bug.cgi?id=15022)
[3] [http://bugs.pardus.org.tr/show_bug.cgi?id=15440](http://bugs.pardus.org.tr/show_bug.cgi?id=15440)
[4] [http://kde-look.org/content/show.php/Monochrome?content=18317](http://kde-look.org/content/show.php/Monochrome?content=18317)
[5] [http://liste.pardus.org.tr/paketler-commits/2010-September/107492.html](http://liste.pardus.org.tr/paketler-commits/2010-September/107492.html)
[6] [http://www.zlib.net/ChangeLog.txt](http://www.zlib.net/ChangeLog.txt)

