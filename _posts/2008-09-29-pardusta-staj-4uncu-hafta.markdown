---
date: '2008-09-29 21:14:23'
layout: post
slug: pardusta-staj-4uncu-hafta
status: publish
title: Pardus'ta staj - 4'üncü hafta
wordpress_id: '509'
categories:
- Gezegen
- Hayat-Yaşam
tags:
- pardus
- pardus stajı
- pardus'ta staj
- staj
---

Not: Bu bir yazı dizisidir. [1′inci](http://blog.arsln.org/pardusta-staj-1inci-hafta/), [2'inci](http://blog.arsln.org/pardusta-staj-2inci-hafta/) ve [3'üncü](http://blog.arsln.org/pardusta-staj-3uncu-hafta/) hafta yaptıklarımı okumak isteyebilirsiniz




	
  * **16.gün**: Subprocess ile synergy süreçini başlatıktan sonra, subprocessin metotlarından biri olan **"pid"** ile sürecin pid numarasını alıp, **"kill"** metodu ile süreci öldürebiliyorduk. Fakat bu bende çalışmıyordu. Bugün o yüzden biraz bununla uğraştım, problem günlerdir vardı aslında fakat ben hep sonraya ertelemiştim. Sonra **Python'un listelerine** bir e-posta attım ve bu konuyu belirtmiştim, kendileri de benim daha önce denediğim yöntemlerden bahsetmişti. Yani sorun başka bir yerdeydi. Sonra anladım ki **synergy'i -f** ibaresi ile çalıştırmam gerekiyormuş, diğer türlü daemon olarak çalışacak ve arka planda öldürdüğümde bile kalıntıları kalacaktı. Bunu anladıktan sonra birde subprocess'i kullanmayı da bırakıp doğrudan **QProcess** kullanmaya başladım. Kullanmamın sebebi ise madem PyQt kullanıyorum, Qt ilgili fonksiyonlar kullanayım bir bütünlük olsun demiştim(subprocess mi QProcess mi sorusunu tam cevap bulamadım yine de). Bunun dışında konsol'da çıkan synergy çıktılarını(stdout) da parse etmeye çalıştım. Düzenli ifadeler bilgim yeterli değildi, Faik abi sonra kolay bir yol gösterdi. Bu sayede doğrudan çıktıdan synergy'inin bağlanıp bağlanmadığını görebiliyordum. Bunları da **libnotify'e** bağladım. Yani bağlantı olduğunda sistem çekmecesinden bilgilendirme balonu çıkacaktı. 



	
  * **17.gün**: Tüm gün** setup.py** ile uğraşmışım, fakat sonuç alamadım. Sinirlenmişim baya :)



	
  * **18.gün**: Setup.py dosyasını halletim, kolaymış fakat ben bilmediğimden değişik şeylere bakmışım. Setup.py ile kolay bir şekilde **.tar.gz yani kaynak kod paketleri** oluşturabiliyordum. Sonra **pspec.xml** dosyası da hazırlamışım. Ardından sistem'de pisi ile kurulunca çalışıp çalışmadığını test ediyordum, her seferinde de pspec.xml'deki dosya kısmını değiştirmem gerekiyordu(kaynak değişti için sha1sum da değişiyordu). Bu yüzden Emre'nin kendi isteklerine göre yazdığı bir [betiği](http://svn.pardus.org.tr/uludag/trunk/staj-projeleri/sahip/src/tools/packager.py) [kendi isteklerime göre değiştirdim](http://svn.pardus.org.tr/uludag/trunk/staj-projeleri/sinerji/src/tools/createpackage.py).  Kendisi kaynak'tan paket oluşturuyor, ssh ile sunucuma yolluyor, sha1sum oluşturuyor, sonra bu sha1sum'u pspec.xml'e ekliyor, pisi paketini inşa etmeye başlıyor, pisi paketinin içeriğini lspisi ile gösteriyor sonrasında ise kurmak isteyip istemediğimi bana soruyor. İşleri otomatik bir yola sokuyor yani. 

	
  * 

**19.gün**: Birden fazla sunucu aynı istemci'ye istek yolladığında istekler kendi arasında **çakışıyordu**. Sadece biri bilgilendirme balonu ile gözüküyordu. Bu sorun ile baya uğraştım, kod'u bu yönde ciddi bir şekilde değiştim ve sonunda halletmiştim. Bununla beraber **notifier.py** dosyasını da değiştirdim. Günün sonuna doğru da **Işıl ve Gökçen** ile yüksek lisan, lisan, üniversite'deki olaylar, ileride ne yapabiliriz gibi konular hakkında konuştuk, keyifli bir sohbeti açıkçası. 



	
  * **20.gün**: Bugün biraz serbest geçmişti, işleri ağırdan aldım biraz galiba. Yine de daha önce eklemek istediğim otomatik tanımlama özelliğini eklemiştim. Google Suggest'de arama yaparken anlık ileti ile size özel aramaları gösteriyordu. Bu tarz bir şey, bizde ise sunucu liste'sindeki sunucuları anlık ileti şeklinde bize gösteriyordu. Şirketinizde **20-30'dan** fazla bilgisayar varsa bir bilgisayarın ismini liste'den seçmek zor olacak bu yüzden ismini biliyorsanız ilk harflerini yazarak doğrudan sunucuya ulaşmanızı sağlayabilir. Bunun ardından uygulamayı yine bir kaç test ettim ve gözüme çarpan ufak hataları düzeltim. Sonrasında ise **README, AUTHORS** gibi dosyaları oluşturdum. Birde setup.py'deki hataları da düzelttim. Tüm bunlar bittikten sonra uygulamayı **Kde-apps.org**'a ekledim ve 0.1 sürümü olarak çıktığını [açıkladım](http://www.kde-apps.org/content/show.php/Sinerji?content=89732). 

Sonrasında ise herkes vedalaştı ve stajımız resmi olarak bitmişti(herkese tekrardan çok teşekkür ederim). Güzel bir zaman geçirmenin mutluluğu ile odamın yolunu tutmuştum.

 




