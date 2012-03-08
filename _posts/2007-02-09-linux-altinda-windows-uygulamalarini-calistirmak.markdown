---
date: '2007-02-09 00:13:39'
layout: post
slug: linux-altinda-windows-uygulamalarini-calistirmak
status: publish
title: 'Linux altında Windows uygulamalarını çalıştırmak '
wordpressid: '170'
categories:
- Bilişim
- Linux
tags:
- Linux
- oyun
- sanal
- virtual
- virtualbox
- windows
- wine
- world of warcraft
- wow
---

İnternet'de gezinirken, bir yazı görmüştüm. Çoğunu bilsem dahi, bunların özetini çıkartıp ve Türkçe'ye çevirmek iyi olur diye düşündüm. Belki birilerin işine yarar. Fakat tam çeviri sayılmaz, yazının ana başlıklarını ve bir kaç fikri aldım, onun haricinde çoğu yerde kendi fikrimi ve yorumum var.

Linux altında hemen hemen istediğimiz her türlü yazılımı bulmak mümkün. Fakat ya yoksa ? Tabi Windows'a geçip yüklemek başka bir seçenek, ama burada özellikle Linux'a geçiş yapmış olanlar ve Linux kullananlar olduğu için Windows altında bir şey yapmıyoruz. Burada saydıklarım Linux altında olacaktır. Yazılımları çalıştırmak için bir kaç yol var, ve bunlardan en önemli 5'i ise sırayla şu şekilde:



**1.Yazılım yerine Linux altında açık-kaynaklı başka bir uygulama kullanın**

Birisi gelip bana Linux altında "_Windows X Uygulaması_" nasıl çalıştıracağımı sorunca, ilk önce ona, o X uygulaması yerine, Linux altındaki seçenekleri sıralıyorum. Bir çok Windows uygulaması için, yüksek kalitede açık-kaynaklı alternatif uygulamalar vardır. Ve buradaki en büyük engel ise, Linux kullanmayan insanların bu uygulamaları bilmemeleridir.

Örneğin, **Winamp** uygulaması için Linux altında ondan daha iyi olan [Amarok](http://amarok.kde.org/) uygulaması vardır. Şimdi diyeceksiniz ki neden iyi ? Amarok ile, _şarkı sözlerini otomatik olarak getirebiliyorsunuz, oluşturduğunuz çalma listelerini cd'ye çekebiliyorsunuz, albüm kapaklarını otomatik olarak getirebiliyorsunuz_, ve daha nice güzel özellikler. Burada şimdi onları saymaya çalışırsam, bu sayfayı açarım. Buradaki önemli nokta, insanların bunu bilmemesi.

Bunun için en iyi yer, [www.osalt.com](http://www.osalt.com) sitesine bakmaktır. Bu site'de Windows uygulamasının ismini yazarsanız, size Linux altındaki ona karşılık gelen tüm açık-kaynak uygulamalarını gösterecektir. **Osalt** bu alanda gerçekten çok iyidir. Hemen hemen her türlü Windows uygulamasına bir karşılık bulabilirsiniz. Başka bir yol ise, Türkçe Linux forumlarına sormaktır. Burada benim de içimde bulunduğum [Lapis forumuna](http://www.linux-sevenler.org/) sorunuzu sorabilirsiniz. Şu şu programı kullanıyorum, Linux altında ne gibi alternatifler var diye sorarsanız eminim arkadaşlar da size yardım edecektir

![Osalt](http://arsln.org/image/linuxwin3.jpg)
  


**2.Linux için geliştirilmiş ticari yazılımları satın aldın**

Eğer kullandığınız yazılımın açık-kaynak kodlu uygulamasını bulamıyorsunuz, onun yerine yazılmış ticari bir yazılımı satın alın.Örneğin **Autocad** için bir çok açık-kaynaklı program var, fakat belki hiç biri sizin istediğiniz işlemleri yerine getirecek kadar güçlü ve kaliteli değildir. Bu aşamada örneğin, yazılmış başka bir uygulama var. Onun adı da [BricsCad](http://www.bricscad.com/). Bu uygulama ihtiyaçlarınız karşılayacak şekilde yazılmıştır, ve ayrıca Autocad'e ödediğiniz paranın çok az bir miktarına sahip olabilirsiniz.

Açık-kaynaklı bir programı bulamadıysanız bu şekilde ticari bir yazılımı satın alabilirsiniz. Daha fazla ticari yazılımlar için YoLinux sitesine [bakabilirsiniz](http://www.yolinux.com/TUTORIALS/LinuxCommercialApplications.html).

**3. Wine kullanarak programı Linux altında çalıştırın**

Açık kaynaklı bir program bulamıyorsanız, Windows altındaki programı Linux altında çalıştırmak mümkündür. Bunu sağlayan programın adı ise **[Wine](http://www.winehq.com/)**. Wine Linux atlında Windows çevresini taklit ederek, size Linux altında Windows uygulamalarını kurmanızı sağlar. Örneğin oyun oynayan bir çok kişi bu sayede oyunlarını Linux altında oynayabilirler. **Warcraft 3, Starcraft, Guild Wars, Wow**, gibi bir çok oyunu bu sayede oynamak mümkün.

Fakat çalışıp çalışmayacağı kullanacağınız yazılıma bağlı sonuç olarak. En iyisi hangi oyunların ya da programların çalıştığını öğrenmek için Wine'nin kendi ana sitesine [bakabilirsiniz](http://appdb.winehq.org/browse_by_rating.php). Ayrıca bir kaç alan için geliştirilmiş yazılımlar da var wine'den hariç. Örneğin [**Cedega**](http://www.transgaming.com/) sadece oyunlar üzerine kurulmuş bir program, aynı Wine gibi çalışır, fakat oyunlar için daha çok optimize edilmiş araçları vardır. Cedega ile Linux altında oyun kurmak daha kolaydır bu sayede. Fakat yıllık **55 dolar **gibi bir meblağ ödemeniz gerekmektedir. World of Warcraft'ı Linux altında oynamak isteye bir çok kişi bu program sayesinde oynayabiliyorlar.Aşağıdaki resim Wow'un Linux altında çalıştığını görebilirsiniz.

![Wow](http://arsln.org/image/linuxwin4.jpg)

  

**4. Windows'u sanal makine'de çalıştırmak**

Öncelerde sanallaştırma pek yaygın değildi, ve insanlar bilgisayarlarını iki tane işletim sayesinde çalıştırıp, diğerine geçmek isterken de kapatıp açıyorlardı. Windows ve Linux bir makinede kurulu ise, başlangıçta Linux ya da Windows'u seçerek istedikleri işletim sistemlerine ulaşmak mümkündür. Fakat hal böyle olunca, her defasında bilgisayarı yeniden başlatmaları gerekiyor. Bu da her defasında zaman kaybı demektir.Bunu önlemek için Linux altında bir sanal makine kurarak, Windows'u çalıştırabilirsiniz. Yani hem Linux hem de Windows aynı anda çalıştırmanız mümkün. Tabi sanal makine ile çalıştırdığınız Windows o kadar hızlı olmayacaktır, yine'de kayda değer bir şey. Bunun için piyasa'da bir çok program mevcut. [Virtualbox ](http://www.virtualbox.org/)bunlardan biri.

![Virutal Linux](http://arsln.org/image/linuxwin2.jpg)
  

**5. Uygulamayı uzaktaki bir Windows makinesinde çalıştırın**

Son olarak Windows uygulamalarını çalıştırmak için, uygulamayı başka bir Windows uygulamasında çalıştırmaktır ve bu uygulamayı yerel makinenizde kontrol etmektir. Buna çoğunlukla "_Terminal Services_" denir, ve Windows sunucusunda çalışır. Bu yöntem Windows Xp Pro'ya kolayca [rdesktop](http://www.rdesktop.org/) sayesinde bağlanmak demektir. Aşağıdaki resim'de bu sayede Macromedia Dreamweaver'ın Ubuntu Linux altında çalıştığını görebilirsiniz.

![Remote](http://arsln.org/image/linuxwin1.jpg)

  

Yazının kaynağı ise [şurada](http://useopensource.blogspot.com/2007/02/five-ways-to-use-windows-apps-in-linux.html). Tristan Rhodes'a bu yazı için teşekkürler. Umarım sizin işinize yaramıştır. Eklemek istediklerinizi  buraya ekleyebilirsiniz.
