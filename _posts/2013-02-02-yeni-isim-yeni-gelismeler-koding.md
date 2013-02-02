---
date: '2013-02-02 15:30:00'
layout: post
slug: yeni-isim-yeni-gelismeler-koding
status: publish
title: Yeni işim, yeni gelişmeler - Koding
---

Bundan yaklaşık iki-buçuk yıl önce "[yeni bir
başlangıç](http://blog.arsln.org/yeni-bir-baslangic/)" başlığı ile Pardus'ta ise
başladığımı paylaşmıştım. O zaman çok heyecanlı ve mutluydum. Uzun zamandır,
[Pardus'tan ayrıldıktan](http://blog.arsln.org/pardus-ayrilisim-ve-sonrasi/)
sonra ilk defa o anki mutluluğu ve heyecanı tekrardan yaşıyorum.

Yeni bir maceraya yelken açmış bulunmaktayım. Şubat ayı
itibariyle [Koding.com](https://www.koding.com)'de çalışmaya başladım. İnanılmaz
heyecanlı bir projede inanılmaz insanlarla çok güzel işler yapma fırsatı elde
ettim. Pardus projesinden çok yakın iki arkadaşım (Gökmen Göksel ve Bahadır
Kandemir) de Koding'de çalışmaya başladı(çok daha öncesinden). Onlarla tekrar
olmak da mutlu verici bir gelişme. Koding'in kurucuları(Devrim Yaşar ve Sinan
Yaşar) da bu konuda çok iyi ve işi bilen insanların olması ve en önemlisi de
geliştiricilerin halden anlamaları benim açımdan daha da mutlu verici bir
gelişme.

Yaklaşık iki aydır Koding için iki tane uygulama yazdım ([Rails
Dashboard](https://github.com/farslan/RailsDashboard.kdapp) ve [Django
Dashboard](https://github.com/farslan/Django.kdapp)), iki tane uygulama
geliştirmek üzereyim ve bunların üzerine uygulamaları yazarken kullandığımız KD
Framework'un [teknik dokümantasyon
sürecini](https://github.com/farslan/koding-wiki) de başlatmış bulunmaktayım.
Bunların hepsini akşamları boş zamanımda yapmaya çalıştım. Uzun ve yorucu bir
süreçti (kabul), ama özellike Devrim abinin bu süreçteki tutumu ve yaklaşımı bu
işi sevmemi ve sahiplenmemi sağladı. Bundan sonra her günümü çok daha verimli ve
Koding endeksli çalışıyor olabileceğim. Heyecanlı ve güzel bir iş kısacası. 

## Koding nedir?

![Koding activity alanı](http://arsln.org/image/koding-activity.png)

Koding'e biraz değineyim. Koding.com iki türk kardeşin kurduğu (Devrim Yaşar ve
Sinan Yaşar), A.B.D, San Francisco menşeili bir şirket. Önümüzdeki sene bolca
duyacağınız bu ismi bir yere not alın. Koding.com sayesinde dünyanın neresine
giderseniz gidin, tek bir tıkla tüm geliştirme ortamınıza ulaşabileceksiniz.
Yani bildğiniz terminal(evet kendinize ait bir Linux sanal makinesi),
dosyalarınız için depolama alanı, yüzlerce farklı frameworku,vs.. gibi
seçenekler mevcut. Ve size ait bir şubdomainiz bile var. Bu daha başlangıç
diyebilirim. Daha inanılmaz özellikler sırayla devreye girecek.

Bu çalışma ortamını örnek vermek gerekişe şu şekilde kullanıyorum:
arslan.koding.com/docs altında, Koding.com içinde uygulama yazabileceğiniz bir
framework'un dokümantasyonları mevcut. Bunların son bir aydır kendim yazmaya
çalışıyorum. Bu adreste yer alan dokümanların hepsi aslında bir [github
deposunda](https://github.com/farslan/koding-wiki)
markdown olarak saklanıyor. Ben yeni doküman ekledikten sonra Koding'e giriş
yapıp bu değişikleri terminal ile kolay bir şekilde alıyorum(git pull). Sonra
bunları yine terminal altında [markdoc](http://markdoc.org/) ile html
sayfalarına çeviriyorum. Ve tüm bunlar doğrudan hiç bir şey yapmadan
[arslan.koding.com/docs](http://arslan.koding.com/docs) yüklenmiş oluyor.  Yani
anlayacağınız web sitemi buradan sunduğum gibi, geliştirmesini ve bakımını da
Koding üzerinden yapıyorum. Aşağıda ise Koding içinden bu dökümanlara
ulaşabileceğiniz uygulamanın ekran görüntülerini görebilirsiniz:

![Koding belgelendirm](http://arsln.org/image/koding-docs.png)

## Herkes için farklı imkanlar

İnanılmaz değil mi? Fakat bununla bitmiyor. Söylece bir hayal edin ve şunları
bir düşünün:

* Sınıf arkadaşınla bir C++ örneğini denemek için Koding'e giriş yaptınız ve
  ikiniz de kendi sanal makinelerinizde kodu derleyip sonuçlarını gördünüz. Aynı
  kod parçasını beraber aynı anda düzenliyorsunuz. Onun makinesinde bilmem ne
  aracı kurulmamış, sende kod parçası yokmuş, gibi şeyler tarihe karıştı.

* Netbook, ChromeOS, iPad gibi kısıtlı imkanlara sahip bir cihazdan Koding'e
  giriş yaptınız ve altınızdaki makine ile terminal, depolama alanı ve şahsınıza
  ait bir sanal makine üzerinde geliştirmenizi yapabiliyorsunuz (linode'da ssh
  bağlanmaktan farklı bu, ssh'e gerek yok çünkü her şey web tabanlı ve zeki,
  düşünülmüz bir arayüze sahip)

* Sabah evden çıkarken çok önemli bir kodu yazmayı unuttunuz ve müşteriye eksik
  bir halde gönderdiniz (ya da bilgisayarınız almayı unuttunuz yanınızda!).
  Arkadaşınızın laptop'undan Koding'e giriş yapıp geliştirmeyi devam edip
  müşteriye kalan eksiklikleri tekrar gönderiyorsunuz.

* SQL (MondgoDB, MySQL,vs..) öğrenmek istiyorsunuz, Linux nedir bilmiyorsunuz
  öğrenmek istiyorsunuz, Rails, Django gibi web framework'u öğrenmek
  istiyorsunuz, Git,Vim gibi araçları öğrenmek istiyorsunuz'vs.. her şey Koding
  ile mümkün!  MySQL gibi bir veritabanını tek tıkla aktif hale
  getirebiliyorsunuz, Linux zaten terminal ile hazır kurulu geliyor,Rails kurmak
  tek tıklık bir şey, vs..

* Hakkari'deki bir öğrenci, Ethiopia'daki bir genç, Güney Amerika'daki
  mühendisler,vs.. herkesi en kısıtlı bilgisayarla bile dünyanın en güzel
  teknolojilerini tek bir tarayıcı ve internet bağlantısı ile sunabiliyorsun.
  Bundan daha güzel bir şey olabilir mi sizce?

Evet bunları hayal edin dedim, ama bunların çoğu hayalden öte gerçek. Ve Koding
ile bunları yapma fırsatı elde edeceksiniz. Önümüzdeki senelerde eğer
başarabilirsek inanılmaz ve devrimsel bir ürün ortaya çıkacak. Normalde herkese
uzak olan bir çok teknolojiye ulaşma imkanınız olacak.

## Son durum

![Koding San Francisco ofis](http://arsln.org/image/koding-sf.png)

Önümde üç haftalık bir San Francisco ziyareti var. Oradaki ofiste 3 hafta
boyunca Koding'deki backend teknolojilerini yakından takip edip üzerine bir
şeyler de ekleyeceğim ve kuracağım. Hem benim açımdan da bir nevi 'kick-start'
ölmüş olacak (işi hızlıca öğrenip, giriş yapabilmek bizim gibi uzaktan çalışan
insanlar için önemli) hem de Koding bünyesinde çalışan diğer insanları da
tanımış olacağım. Kuzey Amerika kıtasını da ilk defa göreceğim için o açıdan da
biraz heyecanlıyım. Hadi hayırlısı.

