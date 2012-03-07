---
date: '2010-03-28 00:58:47'
layout: post
slug: yeni-baslayanlar-icin-beagleboard_1_kisim
status: publish
title: Yeni başlayanlar için BeagleBoard (1. Kısım)
wordpress_id: '662'
categories:
- Bilişim
- Gezegen
- Linux
tags:
- arm
- beagleboard
- cortex
- dsp
- octave
- pardus
- pardus arm
- rs232
- ti
---

2010'un ilk yazısını yazmaktayım. Aslına bakarsınız çok yazıyorum (kişisel defterime) ve bir çok bilgi öğreniyorum, fakat nedense bunları gelip de buraya yazmıyorum. Her zamanki gibi bu da geçer diyelim ve yolumuza devam edelim :)

Bu yıl [okulum](http://ee.hacettepe.edu.tr/) bitiyor, şurada 2 ayım kaldı (Evet zaman çabuk geçiyor, bu yaz da bu blog'un 4'üncü yılı olacak :) ). Okul biterken de, çoğu mühendislik bölümleri gibi, bizim de bitirme projemiz var (Daha önce USRP projesi vardı, o değişti). Arkadaşım Süleyman ile DVB-T2 alıcısı ve vericisi üzerinde çalışıyoruz. Bu DVB-T2 konusu çok karmaşık olduğundan ona hiç girmiyorum (ilgilenenler için: Input Processing ve BICM kısımları kodlandı). 

Bu yazdığımız kodları, [BeagleBoard](http://beagleboard.org/) üzerinde çalıştıracağız, aslında üzerindeki DSP çipi kullanacaktık, fakat projenin zor olması ve vakit olmayışından real-time olmayacak alıcılar ve vericiler. ARM üzerinde  [Angstrom dağıtım](http://www.angstrom-distribution.org/)ı çalışacak. Octave, bir takım küçük betikler sayesinde de proje için geliştirdiğimiz algoritmaları çalıştıracağız. Bakalım sonuç nasıl olacak.

Aşağıda Amerika'dan TI tarafından kazandığımız kartı görebilirsiniz:

[![](http://blog.arsln.org/wp-content/uploads/bb_3.jpg)](http://blog.arsln.org/wp-content/uploads/bb_3.jpg)

Bir tanesini de Türkiye Resmi TI kanalı tarafından aldık. Her iki tarafa da teşekkür ediyorum. Bu cihazlar geldi gelmesine, fakat alırken  sadece kartın kendisi geliyor. Diğer tüm kabloları ve eşyaları siz almanız gerekiyor.

Kartın özelliklerini biliyorsunuzdur  (bundan sonra  [BB](http://beagleboard.org/) diye devam edeceğim), eğer bunu okuyorsanız, zaten almışsınızdır ve yavaş yavaş ne yaparım, nasıl ilerlerim aşamasındasınızdır. Bize bu kartlar geldiğinde, bir liste çıkarmıştık. Soru şuydu, neler alınmalı ? Kısa bir araştırma'dan sonra şunlara karar verdik(fiyatlarını da yazıyorum):



	
  1. Güç kaynaklı USB-HUB** (15 Lira)**

	
  2. 5 Volt Güç kaynağı (800mA-1000mA)** (10 Lira)**

	
  3. Usb Klavye ve Usb Fare

	
  4. HDMI to DVI kablosu (**15 Lira**)

	
  5. 2-3 tane USB uzatma kablosu (**10 Lira**)

	
  6. RS232 dişi başlık (**2-3 Lira**)

	
  7. 2 tane 3'lü soket ve bunlarla beraber de kablo (**1-2 Lira**)

	
  8. USB to RS232 cihazı (**15 Lira**)

	
  9. USB Ethernet kablosu (**15 Lira**)

	
  10. En az 4gb'lik SDHC hafiza kartı (**30 Lira**)


Bu liste'de şunlara dikkat edin.

	
  * **Usb Hub** alacaksanız kesinlikle güç kaynaklı alın, bu BB'de akım çok sorunlu, bir tane USB girişi var ve fareydi, klavyeydi derken bir sürü USB'li cihaz takacaksınız. Her biri akım  çekeceğinden, cihaz'da sorunlar başlayacak.  



  * Güç kaynağı alırken, kesinlikle aldığınız yerde test etirin, içinde regulatör var mı diye sorun, 5 volt diye alırsınız, fakat 5.3 volt verir, cihazı çöpe atarsanız söyleyeyim(**BB maksimum 5.2 V destekliyor**). Olmadı **7805 gibi bir regülator** takabilirsiniz bu güç kaynağına, ama onu da tavsiye etmem (güvenemiyorum çünkü, birde akım sınırlayıcı yok bunlarda). Olmadı 723 alıp onu da kullanabilirsiniz, bunda akım'ı da sınırlayabilirsiniz. Ama bu kadar abartmaya gerek yok bence. Kaliteli bir güç kaynağı buldunuz mu yeterlidir. Onun dışında 1A oluyor genelikle bu güç kaynakları, biz ilk başta 1A çok olacağından biraz korkmadık değil, çünkü 600mA civarında bir şey iyi olur demişlerdi, fakat herhangi bir sorun çıkmadı bizde.O yüzden bir şey diyemeyeceğim o yüzden.

	
  * USB uzatma kabloları **kesin alın**, çok işinize yarayabilir.

	
  * BB'nin üzerinde bir RS232 serial soketi var. Buradan bilgisayarınzıda RS232 girişi varsa doğrudan bağlayabilirsiniz. Onun için aşağıdaki resimdeki gibi bir kablo gerekiyor:
[![BeagleBoard RS232 Seri Kablosu](http://blog.arsln.org/wp-content/uploads/bb_1.jpg)](http://blog.arsln.org/wp-content/uploads/bb_1.jpg)
Peki biz böyle bir şey bulabildik mi ? Evet, doğru bildiniz, bulamadık :) Biz de gittik kendimiz yaptık. Bunun için RS232 ve BB arasındaki [kablo düzeneğine](http://elinux.org/images/2/2c/Flyswatter-ti-uart.pdf) baktık, aşağıda düzeneği görebilirsiniz:
[![](http://blog.arsln.org/wp-content/uploads/bb_2.png)](http://blog.arsln.org/wp-content/uploads/bb_2.png)
Yaptığımız kablo da aşağıdaki fotoğraftan görülüyor. 10'lu soket bulamadığımızdan iki tane 3'lü aldık o şekilde yaptık. Bu şekilde yaparsanız sorun çıkmaz:

[![](http://blog.arsln.org/wp-content/uploads/bb_4.jpg)](http://blog.arsln.org/wp-content/uploads/bb_4.jpg)

Bunla uğraşamam diyorsanız, gidip** Usb to RS232** cihazı alabilirsiniz. USB üzerinden iletişim sağlayabilirsiniz. Fakat dikkat edin ki başı dişi olsun, yoksa bilgisayara takamazsınız bizimki gibi :)

	
  * HDMI to DVI kablosunu aldınız, eve geldiniz, baktınız ki sizde DVI girişi yok ekranda. Herkesin yaptığı gibi başına DVI to VGA dönüştürücü takıyorsunuz. Evet, bunu yapmayın ! BB analog sinyallerini kabul etmiyor (tasarım yaparken eklememişler, ekleseler çok şey kaybedecekler sanki), yani **VGA yaparsanız hiç bir görüntü elde edemezsiniz.** O yüzden, kablo bozuktur ya da cihaz bozuktur demeyin :)

	
  * Hafıza kartı alımında, SD veya SDHC fark etmiyor, ikisini de gönül rahatlığı ile alabilirsiniz. Bunun dışında, SDHC alırsanız, **CLASS 6** olmasına dikkat edin, böyle yavaş biz cihazda, kesinlikle hızlı bir kart olmasını isteyebilirsiniz.

	
  * USB to Ethernet cihazını da alırken dikkatli olun, bizimki galiba bozuk çıktı, ne zaman internet'e girsek, cihaz kendinden geçiyor. USB'de sorun çıkartıyor meret. Sorunu tam çözemedik, yeni Angstrom çekirdeği ile denedim, onda da aynı sorun çıkartı, yanı sorun kesinlikle modüllerde değil. Ya bizim USB HUB'da sorun var, ya da bu cihaz bozuk. Bulursam sorunu yazarım buraya


Evet hepsi bu kadar. Biz bunların hemen hemen hepsini Ankara'daki konya sokağından aldık, sadece SDHC kartını media-markt'dan aldık. Bulunmayacak şeyler değil.

Bundan sonra ikinci yazımda, BB üzerine Angstrom İşletim sistemni nasil yükleriz onu anlatacağım. Bunun için bir kaç şey yapmamız lazım, onları tek tek yazmayı düşünüyorum. Bakalım ileride, **[Pardus'un Arm tabanlı dağıtımı](http://svn.pardus.org.tr/pardus/playground/memre/arm/repos/cortex-a8/)** da çıkacak. Onu da çok merak ediyorum. Bu ARM konusu da çok muazzam bir şekilde ilerliyor, bir sürü cihaz, bir sürü işletim sistemi. Alanı çok geniş, BB gibi ucuz ve tamamen açık-kaynak camiası ile **uyumlu** bir şekilde çalışan cihazların etkisi ile daha da gelişecek diye düşünüyorum.
