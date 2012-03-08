---
date: '2011-10-21 22:24:25'
layout: post
slug: paylasimli-kitapliklar-kullanimi-ve-yonetimi
status: publish
title: Paylaşımlı kitaplıklar - kullanımı ve yönetimi
wordpressid: '1009'
categories:
- Gezegen
- Linux
- Programlama
tags:
- DT_RPATH
- dynamis loading
- ld-linux.so
- ld.so
- ld.so.cache
- ldconfig
- ldd
- lib
- linker-name
- real name
- rpath
- sembolik bağ
- shared libraries
- soname
- symlink
---

Paylaşımlı kitaplıklar (_shared libraries_) linux dünyasının olmazsa olmazlarından bir kavram. Linux altında iş yapmış herkesin bir kere eli bulaştığını düşünüyorum. Web'de bununla ilgili kaynak çok. 1-2 gün önce IRC'de **#pardus-gelistirici** de bunu uzun uzadıya tartıştık hatta.Karmakarışık bir yapı vardı önümde (_ldconfig, ld-linux.so, rpath, LD_PRELOAD, soname, linker, loader, etc.._). Baktım olmuyor dün akşam araştırmaya koyuldum ve bulduğum her belgeyi okuyup bir resim ortaya çıkartmaya çalıştım. Burada yazılanlar bunların ve IRC'de not aldıklarımın birer yansıması. Merak etmeyin kimseyi ayrıntıya boğumayacağım, sadece gerekli olabilecek bilgileri sizlere sunacağım. Benim bir çok şeyi daha iyi anlamamı sağladı, umarım sizin de işinize yarar. Uzun bir yazı, haliyle teknik konular da içeriyor, öncesinden bir çay/kahve yapıp o şekilde okumanızı tavsiye ederim :) Başlayalım:



## Paylaşımlı kitaplıklar nedir?




Paylaşımlı kitaplıklar adı üstünde bir çok uygulama tarafından kullanılacak şekilde tasarlanmıştır. Uygulama başlatıldığında bu paylaşımlı kitaplıklar yüklenip kullanılmaya başlanır. Bunun şüphesiz en güzel yanı, bir çok uygulamanın aynı kitaplığı paylaşabilmesi, bizlere esneklik sağlaması, az yer kaplaması, vs... Yani siz bir tane kitaplık yazıyorsunuz ve diğer tüm uygulamalar bundan faydalanabiliyor. Dezavantajı ise kararsızlığın çabuk bozulabilmesi. Bir uygulama _libfoo.2.0.0_ kitaplığın ihtiyaç duyuyorsa ve siz sisteminizde bunu kullanmaya karar verdiyseniz, o zaman eski sürümüne bağlı diğer tüm uygulamaları kırmış olursunuz. Çünkü diğer bazı uygulamalar _libfoo.1.0.0_ sürümüne ihtiyaç duyuyacak ve sistemde artık bunu bulamayacak. 

Linux dağıtımları bunlara dikkat ederek sistemlerini güncel ve kararlı tutmaya çalışır. Örneğin **"Python 2.7"**, **"Xorg-Server 1.9.5"**, vs.. Sistem'de **"Xorg-Server 1.10"** sürümünü kullanmaya karar veriseniz buna bağlı tüm uygulamaları da tekrar gözden geçirerek güncellemeniz gerekecek. O yüzden **dağıtımlar** bu tarz işleri her yeni sürüm çıkışının **başlarında** yaparlar.

Burada gördüğünüz gibi sürüm numarası büyuk bir önem taşıyor. Linux altındaki bu sistem de tümüyle bu **sürüm kavramını** üzerine oturtulmuştur. Kitaplık isimleleri genel olarak "lib" öneki ile başlar. Örneğin libpng, libzlib, vs... Alt seviye C kitaplıklarında ise **"lib" ön-eki bulunmaz**. Bunlar genelikle /lib dizininde yer alır. Diğer genel kitaplıklar ise /usr/lib altına konulur  (_şimdilik böyle düşünelim, biraz sonra ldconfig ile daha ayrıntılı anlayacağım_). Bu dizine şöyle bir göz attığımızda kitaplıkların birbirine benzeyen dosyalar olduğunu ve her birinin birbirine bağlı olduğunu görürsünüz. Aşağıda bunun bir örneğini görebilirsiniz (yazımda bu örneğe sık sık atıfta bulunacağım):

`
..
libagg.so -> libagg.so.2.0.4
libagg.so.2 -> libagg.so.2.0.4
libagg.so.2.0.4
libchoqok.so -> libchoqok.so.1
libchoqok.so.1 -> libchoqok.so.1.0.1
libchoqok.so.1.0.1
..
`
Peki bu numaralar nedir? Niye birbirine bağlı bu kadar dosya var? İlk bakışta kafa karışıklığına yol açsa da her birinin anlamı var. 



## Kitaplıkların adlandırılması



Yukarıda gördüğünüz kitaplıklar **üç** farklı türe ayırabiliriz. Bunlar şu şekilde:



	
  1. **"Real name"** adını verdiklerimiz. Bunlar**.so** son-eki, **sürüm numarası** ve son olarak bir **minör numarası**(seviye inebilir) sahiptirler. Bizim örneğimizde bu "_libagg.so.2.0.4_" ve "_libchoqok.so.1.0._1". Bunlar uygulama'nın çalıştırabilinir kodlarını taşır. Yani sisteminizde asıl işi yapanlar bunlardır. Bunları sistemden sildiğiniz veya değiştirdiğiniz an buna bağlı tüm uygulamalar kırılır ve çalışmamaya başlar.

	
  2. **"Soname"** adını verdiklerimiz var. Bunlar **.so** son-eki, **sürüm numarası**(bu sürüm numarasına _soversion_ da denilinir) sahiptirler. Örnek olarak "_libagg.so.2_" ve "_libchoqok.so.1_" . Soname'ler sistemdeki en kararlı sürüme bağlandığı için büyük bir önem taşır. Sistemdeki kararlılığı **soversion** tematiği ile sağlamaya çalışır. **Soname **diyebilmenin bir başka şartı ise "Real name"'lere sembolik bir bağ oluşturmaları. Yani yukarıda örneklerimize göre:
`
libagg.so.2 -> libagg.so.2.0.4
libchoqok.so.1 -> libchoqok.so.1.0.1
`
Soname'ler önemlidir çünkü sistemimiz her daim bunları görür. Yani bir uygulama çalıştığında yukarıdaki örnek için konuşursak, "libagg.so.2" kitaplığını yüklemeye çalışacaktır. Bu da bizim gerçek kitaplığımıza bağlı olacağından sorun oluşmayacaktır zaten. Bir uygulamanın hangi soname'lere ihtiyaç duyduğunu "**ldd**" komutu ile kolayca bakabiliriz. Mesela "[choqok](http://choqok.gnufolks.org/)" uygulaması için bize şöyle bir çıktı verecektir:
`
# ldd /usr/bin/choqok | grep libchoqok
libchoqok.so.1 => /usr/lib/libchoqok.so.1 (0x00007f6252cff000)
`
Gördüğünüz gibi "**choqok**" uygulaması "_libchoqok.so.1_" soname'ine ihtiyaç duyuyor. Normal bir Linux dağıtımda binlerce kitaplık olabileceği için bu bağlama işlerini kolayca yapabilmemiz lazım. Tek tek elle yapmak yerine, ldconfig adındaki bir araç bunu bizim yerimize hallediyor. ldconfig kısaca sistem'deki "**real-name**" kitaplıklarını tarar ve gerekli "**soname"** bağlarını oluşturur. ldconfig sadece bununla yükümlü değil elbet. Kapsamlı ve önemli bir araç olduğu için birazdan buna tekrar değineceğim.

	
  3. Son olarak **"Linker-name"** olanlar var. Bunkar sadece **.so** son-ekini alırlar. Bizim örneğimizde bunlar _"libagg.so"_ ve _"libchoqok.so"_. Bunlar linker tarafından "link-time" zamanında kullanılınır. Yani bir uygulamaya derleyip, inşa etmeye çalıştığınız anlarda. Genel olarak soname'a bağ içerelirler. Ama bazıları doğrudan realname kitaplığına bir bağ içerir. Bizim örneğimizde:

`
libagg.so -> libagg.so.2.0.4
libchoqok.so -> libchoqok.so.1
`
Gördüğünüz gibi libagg.so **realname** dosyasına bir bağ oluşturuken, libchoqok.so **soname** kitaplığına bir bağ oluşturmuş. Bu bağları **linker**(ld uygulaması) kullandığı için genel olarak elle kendimiz yapmamız lazım. Burada şunu unutmayın, bu bağlantıları ldconfig yapmıyor,** inşa sistemi tarafından (örneğin Autotools)** ve ya kendiniz tarafından yapılıyor. Bir uygulamanın hangi kitaplığa bağlı olduğuna kısaca siz karar veriyorsunuz. Örneğin libagg.so.2.0.4 kitaplığını yeni bir sürümü çıktı, geliştirici doğrudan en soversion'u yükselti ve bunu libagg.so.2.0.5 yaptı. Şimdi siz geldiniz bunu sisteminize kurdunuz. Bir uygulamayı derlemeye başladınız, libagg.so'ya ihtiyaç duyuyor. Peki şimdi sorayım size, hangi sürüme linklenmesini istiyorsunuz? 
Evet tamamen size bağlı, eğer yeni özellikleri istiyorsanız, yeni sürüme bağ oluşturursunuz:
`
libagg.so -> libagg.so.2.0.5
`
Ama gördüğünüz gibi burada aslında minör bir sürüm değişikliği var. **Bu yüzden çoğu zaman "linker-name"'ler real-name yerine soname'e bağ oluştururlar.** Çünkü bu tarz küçük değişiklikler yüzünden inşa sırasında sorun çıkmaması gerekiyor. Verimli bir durum anlayacağınız, her seferinde bu bağları güncellemeniz gerekmeyecek.






## ld-linux.so ile kitaplıkların yüklenmesi ve çalıştırılması




GNU/Linux sistemlerinde **ld.so** ve **ld-linux.so** adında iki tane "**loader**" vardır. Bunlar paylaşımlı kitaplıkların yönetimini sağlar. ld.so kitaplığı **a.out** çalıştırabilir dosyaların kitaplıklarını yönetirken, ld-linux.so **ELF** türündeki çalıştırabilir kitaplıkları yönetir. Günümüzde genel olarak tüm çalıştırabilinir dosyalar ELF türündedir. Bazen ld-linux.so ismi ld-linux-x86-64.so olarak da anılıyor. Isimler değişebilir ama genel olarak bu şekilde olurlar.

Elinizdeki çalıştırabilir dosyaya (binary) başla dediğinizde, ilk önce **ld-linux.so** devreye girer, tüm kitaplıkları tarar ve bulduklarını taramaya başlar. ldd komutu bildiğiniz gibi bir dosyanın ihtiyaç duyduğu paylaşımları kitaplıkları listeler. Aslında tek yaptığ şey ld-linux.so'ya haber vermek.** Listemeyi "loader"ın kendisi yapar.** Aşağıda tipik bir ldd çıktısını görebilirsiniz (libao.so.2.1.3 kitaplığı için):
`
# ldd /usr/lib/libao.so.2.1.3
linux-vdso.so.1 => (0x00007fffe93b2000)
libpthread.so.0 => /lib/libpthread.so.0 (0x00007fcc248e1000)
libdl.so.2 => /lib/libdl.so.2 (0x00007fcc246dd000)
libc.so.6 => /lib/libc.so.6 (0x00007fcc2436c000)
/lib/ld-linux-x86-64.so.2 (0x00007fcc24d30000)
`
Burada gördüğünüz gibi "/lib/ld-linux-x86-64.so.2" kitaplığı gözüküyor. Bu yukarıda anlattığım loaderin kendisidir. Buna ihtiyaç duyuyor. Ardından diğer ihtiyaç duyduğu kitaplıkları listelemeye başlar. Peki nasıl ve hangi sıralamaya göre listeliyor ? Yani sistemde o kadar kitaplık varken hangisini seçiyor ? Bunu da belirli ve önemli bir sıralaması var (ELF dosyaları için). Sıralama şu şekilde:



	
  1. Çalıştırabilir dosyanın başlık kısmındaki **DT_RPATH** değişkenine göre (DT_RUNPATH aktif edilmediyse)

	
  2. **LD_LIBRARY_PATH** çevre değişkenine göre. Bunu loader ile değiştirebilirsiniz (örneğin: /lib/ld-linux.so.2 --library-path $KİTAPLIK_DIZINI)

	
  3. Çalıştırabilir dosyanın başlık kısmındaki **DT_RUNPATH** değişkenine göre.

	
  4. **/etc/ld.so.cache** önbellek dosyasına göre. Bu dosyayı ldconfig adındaki uygulama oluşturuyor.

	
  5. **/usr/lib ve /lib** dizinlerine göre


Yukarıdaki maddelerin her biri dizinleri gösteren değişkenler ya da doğrudan dizinlerdir. Tüm bunların dışında bir de **LD_PRELOAD** değişkeni var. Bunu kullanırsanız yukarıdaki tüm maddeleri ezmiş olabilirsiniz, ama burada büyük bir dezavantaj ise LD_PRELOAD değişkenin sadece birer dosya ismi aldığıdır(absolute path). Yani dizin veremiyorsunuz. Bu yüzden çoğu zaman LD_LIBRARY_PATH kullanmak isteyeceksiniz.



## RPATH değişkeninin dejavantajları ve zararları




Şimdi **ldconfig'e** gelmeden önce rpath mevzusuna bir el atalım. **RPATH** istenmeyen eski bir teknolojidir. Linker'e (yani ld) "-Wl,-rpath, $(KİTAPLIK_DIZINI)" parametlerini ekleyerek açabilirsiniz. Rpath, yukarıdaki liste'de da görüldüğü gibi listenin en tepesinde ve doğrudan çalıştırabilir dosyanın içinde "**hardcoded**" olarak yer alıyor. Yani siz ne yaparsanız yapın, uygulama hep RPATH'deki dizine bakmaya çalışacak. Bunu değiştirmenin imkanı da yok (chrpath gibi uygulamalar dışında). Bu da bizim paylaşımlı kitaplıklarla anlattığımız her şeyin hiç bir işe yaramayacağını gösteriyor.

Pardus'ta RPATH mevzusunu ciddiye alıyoruz. Depo'da şöyle bir göz atarsanız bununla ilgili onlarca yama bulabilirsiniz. Bu yamalar genelikle -rpath değişkenini kaldırır ve gerekli değişiklik yapılır. **RPATH'ı düzeltmenin bir başka yolu ise –enable-new-dtags paramtresini linkere eklemek.** Yani şu şekilde: "-Wl,-rpath, $(KİTAPLIK_DIZINI), -enable-new-dtags". Bunu yaptığınız vakit, DT_RPATH dışında DT_RUNPATH değişkenini de aktif hale getiriyoruz. Loader yüklendiğinde DT_RUNPATH'i görür görmez **DT_RPATH değişkenini pasif hale getirir**. Bu da bizim işimizi kolaylaştırıyor. Yukarıdaki sıralamaya bakarsanız, DT_RUNPATH değişkeni üçüncü sırada olduğunu görürsünüz. Yani artık **LD_LIBRAY_PATH** değişkenini gönül rahatlıyla kullanabiliriz.



## ldconfig ile paylaşımlı kitaplıkların yönetimi




Tüm bunların dışında bir de **ldconfig** var. Şu ana kadar yazdıklarımda sıkça karşımıza çıktı. ldconfig komut satırında verilmiş parametreleri, /etc/ld.so.conf dosyası içeriğini ve güvendiği dizinleri tarayarak gerekli sembolik bağları ve /etc/ld.so.cache belleğini oluşturur.  Sırayla bunlarına üzerinden gidelim



	
  1. **Parametre olarak**. ldconfig'e doğrudan bakması gereken dizinleri parametre olarak verebilirsiniz. Örneğin:
`
ldconfig -n /home/pars/lib 
`
Bu komut sadece /home/pars/lib dizinine bakar. **Yani güvenli dizinleri ve /etc/ld.so.conf hiçe sayar**. Anı kurtarmak veya bir şey denemek için kullanabilirsiniz. Sistemi yeniden başlatırsanız eski haline geri döner

	
  2. **/etc/ld.so.conf dosyası**. Bu dosyanın içeriği her dizin bir satır ile ifade eder. Örneğin:

`
/usr/x11/lib
/opt/lib
..
`
Bunun dışında içeriği şu şekilde de olabilir: "**include /etc/ld.so.conf.d/*.conf**". Pardus'da mesela bu şekilde kullanıyoruz. Tüm dizinlerimiz /etc/ld.so.conf.d/ dizini içindeki dosyalar içinde saklı. Bu dizinin içeriği şu şekilde:

`
10-local.conf
20-java_jre.conf
20-xulrunner.conf
21-java_jdk.conf
..
`
Bunları açıp inceleyebilirsiniz.

	
  3. **Güvenli dizinler**. Yukarıdaki dosyalara incelediyseniz **/lib ve /usr/lib** dizinleri nerede diye kendinize sorabilirsiniz. Bu dizinler ldconfig olarak öntamlı kabul edilen güvenli dizinlerdir. O yüzden bunları eklemenize gerek yok.


ldconfig buradaki dizinlerden **soname -> realname** sembolik bağlarını oluşturur. Bu kitaplıkları bir önceki yazımda anlattım. Bunun dışında **/etc/ld.so.cache** adında bir önbellek. Bir çok uygulama açılıp/kapanacağı için hızlı bir mekanizma sunuyor. Yazımın başında da bahsettiğim gibi loader'imi (ld-linux.so) bu dosya'ya da bakıyor.

**Bu önbellek dosyası her yeni kitaplık ile güncellemesi gerekiyor. Yani ldconfig'i tekrar çalıştırmanız gerekiyor**. Pardus kullanıyorsanız bunları sizin için **otomatik** olarak yapıyoruz. Pardus'ta ldconfig "**baselayout**" paketinde yer alan bir çomar betiği ile her kurulan paketle birlikte çalıştırılır. Sizin hiç bir şey yapmanız gerek kalmıyor anlayacağınız :)

--

Paylaşımlı kitaplıklar ile ilgili çok kapsamlı bilgiler mevcut. Burada anlatıklarım ve yazdıklarım işin temelini oluşturuyor. Örneğin C ile yazdığınız bir uygulama'da bunları nasıl kullanacaksınız ? Bunu gibi sorular biraz da ileri seviye konuları olduğu için şimdilik burada bırakıyorum. Belgeyi yazarken yararlandığım döükmanlar aşağıda listelenmiştir (ingilizce).

Umarım yazdıklarım kitaplıklarla ilgili bilinmezlikleri gidermiştir. Sorularınız, eleştirileriniz veya düzeltilecek yerler varsa yorum kısmında belirtirseniz sevinirim :)

Kaynaklar:

1- [http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html](http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html)
2- [http://www.ibm.com/developerworks/library/l-shobj/](http://www.ibm.com/developerworks/library/l-shobj/)
3- [http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html](http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html)
4- [http://cs.nyu.edu/~xiaojian/bookmark/linux/ld_so%20%20Dynamic-Link%20Library%20support.ht](http://cs.nyu.edu/~xiaojian/bookmark/linux/ld_so%20%20Dynamic-Link%20Library%20support.ht)m
5- [http://blog.lxgcc.net/?p=15](http://blog.lxgcc.net/?p=15)

