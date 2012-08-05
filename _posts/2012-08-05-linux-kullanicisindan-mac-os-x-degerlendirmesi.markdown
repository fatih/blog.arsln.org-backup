--- 
date: '2012-08-05 14:25:46'
layout: post
published: true
title: Linux kullanıcısından Mac OS X değerlendirmesi
---

Bundan 1-2 ay önce kendime yeni bir Macbook Air aldım. Daha önce hiç Mac kullanmamış, ama yaklaşık 7-8 yıldır Linux kullanan biri olarak bununla ilgili tecrübelerimi yazayım dedim. Aşağıda **yazılım, donanım, kullanım,vs..** yönünden bir Linux kullanıcısı/geliştirici açısından izlenimlerimi bulabilirsiniz.


![Mountion Lion altinda kullanilan uygulamar](http://arsln.org/image/osx_uygulamalar.jpg)


* Dosya sistemi farklı(haliyle). Elim hep /usr, /home/ vs. gibi dizinlere gidiyor.  Zamanla bu dizinlere değil de farklı yerlere bakmak gerektiğini anlıyorum tabi ki. Alışkanlık gerektiriyor. Kullandığınız özel betikler varsa bunları ona göre düzenlemeniz gerekiyor.

* Terminal olarak **iTerm2** kullanıyorum, herhangi bir sorun yaşamadım. Normalde **Gnome-terminal** kullanıyordum. Tmux desteği bile var (bunun sayesinde Tmux'un session bilgisini doğrudan iTerm'in pencere sistemi ile kullanabiliyorsunuz.  Yani mesela Yakuake'deki gibi pencereleri bölüp, kapatıp açtığınızda aynen bıraktığınız gibi geliyor). Fakat ben iTerm'in bu özelliğini kullanmadım.  Zaten uzun süredir kullandığım ve kişiselleştirdiğim tmux.conf ile klasik düzende devam ediyorum.

* Tmux var ve tıpkı Linux altındaki gibi düzgünce çalışıyor. Herhangi bir sorun yaşamadım. Linux altında kullandığım **tmux.conf** ile sorunsuz çalışıyor,

* **Vim** de Linux altında kullandığım dosyaları, eklentileri yine sorunsuz bir şekilde çalıştırabildim. Bunu için Github'da dotfiles deposunu kullanıyorum (merak edenler için sağ taraftan github linkinden ulaşabilirsiniz.) 

* **Zsh**'da bazı eklentilerim için değişiklik yapmak zorunda kaldım. Bazı uygulamalar farklı çalıştığından alias'ları değiştirdim(*ls --color* yerine *ls -G* gibi).  

* Cmd tuşuna alışamadım bir türlü. **CMD, OPTİON, CTRL, FN** tuşlarını ciddi şekilde birleştirerek kullanan bir işletim sistemi OS X. Bazen ALT diyorlar, bazı yerlerde OPTİON diyorlar (ikisi de aynı). CMD ve CTRL karışıklığı. Cmd dışında Ctrl tuşu da var. Normalde **Ctrl+C, Ctr+V** gibi tuşlar yerine **Cmd+C, CMD+V** gibi kısayollar kullanmak gerekiyor. Bu da kafa karışıklığına yol açıyor

* Terminal altında Cmd değil de Ctrl tuşunu kullanmanız gerekiyor. **Burada Capslock'u ne yapmalı** o zaman? CMD ya da CTRL mi? Ben Emacs tarzı veri girişini çok kullandığım için (Xcode, Bash/Zsh readline) CTRL olarak ayarladım.

* İnsert tuşu yok, delete tuşu yok(onun yerine backspace var), silmek için **Fn+Backspace** yapmanız gerekiyor. PageUp, PageDown gibi tuşlar da yok. Özellikle Tmux ile copy-mode'a girerken rahatsız oluyor bu.

* İngilizce klavye kullandığımdan kod yazmak çok daha verimli ve hızlı olmaya başladı(gerçi bunun Linux-Mac durumu ile alakası yok). Fakat Türkçe harflerden eksik kaldım(gördüğünüz gibi). Bununla ilgili küçük bir değişiklik yapmıştım klavye kullanımı ile ilgili (uzun süre tutunca türkçe hali geliyordu). Paylaşırım sizlerle sonra.

* **Dokunmatik** touchpad çok iyi çalışıyor. İpad,Iphone'daki gibi verimli ve kesintsiz bir deneyim sunuyor. Bir süre sonra Mouse kullanmayı bile bırakabiliyorsunuz bu yüzden (çünkü daha verimli, hızlı ve konforlu).

* Dokunmatik touchpad'ı kişiselliştirme imkanı var ekstra bir araç sayesinde (**Better TouchTool**). Ben bunu kullanarak Chrome'da gezmek için bazı ekstradan seçenekler ekledim (mesela üç parmak ile sağ-sol ile sekmeleri gezme, aşağı yapınca sekme kapanıyor, yukaria yapınca yeni sekme açılıyor, iki kere dokunca kapanmış sekme geliyor)

* Doğal kaydırma (**Natural Scrolling**) başta garip geldiğinden kapatmıştm. Fakat Apple ileride iOS cihazlarını Mac cihazları ile birleştireceğinden ve ileride dokunmatik ekranlı Mac'ler olacağından bu alışkanlığı kazanmak amacıyla tekrar açtım (trend oraya doğru gidiyor). Fakat fare ile bu sefer düzgün olmadı.  Bunun için de **Scroll Reverser** diye bir uygulama kuruyorsunuz. Dokunmatik doğal sürükleme kullanırken, fare normal scrolling'i kullanmış oluyor

* **Logitech M705** faresini kullanıyorum. Kullanımı, tepki süresi çok kötü çalışıyor. Logitech yazılımı kötü diyebilirim. Linux altında çok daha iyi çalışıyor çünkü bu fare.

* Basit bir yedekleme aracı olarak **Time Machine** uygulaması var. Boş bir partition sunuyorsunuz(harici veya dahili disk) kendisi saat başı tüm sistemin yedeğini alıyor. Basit ve bir çok kişinin kullanacağı bir araç olmuş.

* **Tam ekran** özelliği güzel bir şekilde entegre edilmiş (çift ekran kullanan kullanıcılar haricinde). Gnome 3 ve Unity de de kullanım tecrübelerini bu yönde geliştiriyor artık. Alışmak zor olmadı buna, keza gayet severek kullandığım bir özellik.  

* Masaüstü uygulamaları kaliteli, göze hitap eden uygulamalar.  Albenisi çok. Bir çok şirketin Mac yazılımını bulabiliyorsunuz. Ve hepsi de güzel oluyor. Uygulamalar tıpkı iPhone'daki gibi paralı oluyor. Genel olarak insanların da parayla satın aldığını sezdim. K**ullanıcı kitlesi para vermeyi normal buluyor** (bence bir emek, yazılım için bu doğru bir şey). Tabi açık kaynak kodlu yazılımlar da güzel bir şekilde çalışıyor (Chrome, Firefox, vs..). **Firefox** özellikle çok daha güzel gözüküyor. Macbook Air'in ekran kalitesi iyi olunca daha da hoşunuza gidiyor.

* Uygulama kurmak için bir sürü yol var. Ayrıca uygulama kurmak da çok farklı (kurma yöntemi açısından). App Store'dan kurmak en kolayı, tıklıyorsun ve kendi kendine kuruyor(iPhone'daki gibi)

* İnternet sitesinden indirdiğiniz kurulum dosyalarda da iki tür var. Bazıları **.pkg** ile bitiyor, bazıları ise **.dmg** ile. Pkg ile biten Windows ınstaller gibi Next, Next şeklinde ilerleyip kuruyor. Dmg ile bitenlerde karşınıza küçük bir pencere çıkıyor ve uygulama simgesini Applications klasörüne atıyorsunuz (bu da kurulmuş oluyor). Bu uygulama simgeleri de aslında birer klasör oluyor (terminal ile girip bakabilirsiniz)

* Tmux, git, vs, gibi uygulamaları Homebrew ile kurabiliyorsunuz. **Homebrew**, Gentoo Portage gibi doğrudan kaynağını indirip kuran bir paket yöneticisi.  Ayrıca **"Xcode Command Line Tools"** adında bir paket var (Xcode içinden indirebiliyorsunuz). Şimdi karışıklık burada başlıyor. Mesela X öde içinden git çıkıyor, ama Homebrew ile de kurabiliyorsunuz. Sistemde iki tane git olmuş oluyor. Homebrew *"/usr/local"* altına kuruyor, Xcode ise kendi *"/Applications/Developer/Xcode.."* deki klasörüne kuruyor.  Genel olarak git, zsh, vs gibi temel paketler Xcode Command Line Tools içinden çıkıyor, ama daha sofistike uygulamalar için Homebrew şart(mesela Tmux için). Xcode içinden çıkan uygulamaları 'xcrun uygulama_adı' şeklinde çalıştırabilirsiniz (örneğin *'xcrun git push'*).

* Xcode ile kod geliştirmek zorundasınız uzun vadede (Ojbective-C, iOS programlama için). Çünkü bir çok özelliği ve hızlılığı sadece Xcode ile elde edebiliyorsunuz. Vim ile uzun bir süre denedim yazmayı ama sonunda pes ettim.  Vim'de **clang_complete** eklentisi bile Xcode gibi hızlı ve verimli olamıyor (bir çok metodu tamamlamıyor mesela). **APİ kullanımı, belgelere bakma, snippets özelliği, code tamamlama, iOS arayüz tasarımı,vs..** gibi bir çok işi buradan yapmak zorundasınız. Fakat Xcodebuild adında, doğrudan Xcode dosyaları ile çalışan bir arayüz sunuyor Apple. Bununla Xcode ile aynı şekilde uygulamanızı derleyebiliyorsunuz. Bu otomatik betik, Jenkins gibi inşa sistemlere bağlamak, shell ile bir bağ oluşturup farklı işler yapmak istiyorsanız güzel bir araç. Çok kullanma durumum olmadı, ama güzel benziyor.

* Xcode ve diğer bir çok uygulama **Emacs kısa yolları** kullanıyor. Bu yüzden Bash altında kullandığınız bir çok kısayollu aynen bunda da kullanabilirsiniz (Ctrl+A, +E, +K, +F, +B, vs.. gibi). Xcode için [Vim eklentisi](https://github.com/JugglerShu/XVim/) de var, fakat kararsız ve Xcode'un çalışma şekli ile uygunsuz (Xcode sizi hep insert modunda olmanızı bekliyor belli komutlar için, yani mesela otomatik kod tamamlamayı tekrar açmak için insert moduna girmeniz gerekiyor)

* Her şey birbiriyle çok uyumlu. Bağlantılı bir şekilde işliyor. Profil fotoğrafınız varsa tüm uygulamalar Avatar olarak onu kullanabiliyor. Sistemin bir çok yerinde email, twitter, imessage gibi yerlere bilgi yollamak işi kolaylaştırıyor. Bir şeyleri bir yerden bir yere bırakma ile ilgili küçük ayrıntılar çokça mevcut (mesela bir dosyayı Mail simgesinin üzerine bıraktığınızda doğrudan onu yollamaya kalkıyor). **Bu kararlılığı ve bütünü hissediyorsunzu bir süre sonra. Her şey sorunsuz bir şekilde işliyor.** Zamanla alışıyorsunuz ve tıpkı iPhone'daki gibi 'Demek ki bu işler böyle olmalı' diyorsunuz (arayüz kullanım açısından).
  
* Gnome3, Ünity, Kde gibi masaüstünde kullanılan bir çok özellike Mac'de alınmış. Özellikle Gnome 3 kullanıp Mac kullanmaya başlayınca (Gnome 3 daha yeni diye söylüyorum) **bir çok benzerlik göreceksiniz**.

* iCloud'u çok kullanmıyorum. Dropbox'un Linux desteği olmasından dolayı benim için daha iyi. Fakat ilerleyen yıllarda iCloud desteği daha entegre bir şekilde çalışacağından bu konuda şüphelerim var malesef.

* İlginç ve saçma bulduğum özellikleri var. Örneğin: Uygulama silmek için **çöp kutusuna bırakıyorsunuz**. Dosya yöneticisinde (Fınder) kes yapamıyorsunuz. Kısa yol olan **Ctrl+X kullanabilirsiniz ama menüde yok**. Bir şey çöp kutusuna atmadan doğrudan silemiyorsunuz. Bunun için betikler var [Delete-immediately](https://github.com/jtbandes/delete-immediately). Save aş özelliği sadece ALT tuşuna basınca çıkıyor, o da düzgün çalışmıyor. 'Save aş' diye farklı bir dosyaya kaydetmeye çalışırsanız, **orijinal dosyayı da kaydediyor**.

* Türkiye'de Mac ile ilgili güzel kaynak az. Bunlardan [Sihirli Elma](http://www.sihirlielma.com/) kaliteli ve uzun, doyurucu içerik sunuyor. Hoşuma gitti için sizlerle de paylaşayım dedim. Yurtdışında ise camia çok farklı. **Klasik meşhur Apple fanboy'ları varken, Ünix/Geek'leri de çok**. Nasıl baktığınıza bağlı olarak değişiyor. Çok kafa takmamak lazım bu yüzden. Yine bir sürü kaynak var tabi, ben [Macrumors.com](http://www.macrumors.com/) sitesini tavsiye ediyorum. Apple camiası ve sorunları hakkında doyurucu ve kaliteli bilgi bulabilirsiniz (özellikle Forumlarında). Teknik camia ilgili hakkında ileride bir şeyler karalayacağım, şimdilik yeni yeni tanımaya başladığımdan yanlış bilgi vermek istemiyorum.


Bu kadar. Aklıma geldikçe yine bu listeye eklemeler yapacağım, genel olarak bir sürü küçük farklılıklar var. Bazıları iyi, bazıları kötü. Bence alışkanlık ve bakış açısı ile düzeltilecek şeyler. Biraz farklı bakmak ve bazı şeylerden feragat etmek gerektiriyor Mac kullanmak. Özgürlüğe aşırı önem verenler bence çok rahatsız olurlar bu sistemde. Kişisel olarak sevdim diyebilirim. Yaklaşık bir aydır akşamları kullanıyorum evde. Başlarda terminal ve tuşlara alışmamıştım ama zamanla o da geçti. Şimdi bir çok işimi Mac altından yapıyorum. Tabi Linux kullanımım değişmedi. Gündüzleri ise işimde 8-9 saat Linux kullanıyorum (saat ortalaması olarak Linux başı çekiyor). İki farklı işletim sistemi olduğundan Github, Dropbox, vs.. gibi servisleri de daha fazla kullanmaya başladım **senkron kalabilmek için**. Bunun dışında blog'da bundan sonra Mac ve özellikle Objective-C ile ilgili ipucuları da paylaşabilirim.

Hepsi bu kadar. Linux'dan Mac'e geçiş açısından başka sorunlarınız varsa ya da düşüncüleriniz varsa yorum kısmından paylaşabilirsiniz.

_(not: İngilizce klavye ile yazdım, ama okuma keyfi bozulmasın diye [Mustafa Emin Acer'in Text Deasciifier](http://turkce-karakter.appspot.com/) sitesini kullandim. Bu güzel calışmayı kullanmanızı ve tanıtmanızı tavsiye ederim.)_


