---
date: '2009-03-27 20:28:08'
layout: post
slug: pandorayi-tek-tikla-dinlemek
status: publish
title: Pandora'yı tek tıkla dinlemek
wordpress_id: '603'
categories:
- Bilişim
- Gezegen
tags:
- Linux
- mozilla prism
- pandora
---

Başlık bulma konusunda pek iyi değilim, artık bu şekilde idare edin. Demek istediğim aslında şu, Pandora Türkiye'de dinlenemiyor, bir aralar oluyordu fakat kapattılar. Sonraları **globalpandora** diye bir şey çıktı fakat onun da sonu çabuk geldi. Proxy üzerinden dinleyebiliyoruz artık sadece. Bunun için de tarayıcımızdaki proxy ayarları değiştirmek lazım.

Bunun da  dezavantajları var, tüm şifreleriniz ve özel bilgileriniz proxy üzerinden iletileceği için pek güvenli sayılmayabilir. Ne yapabilirdik peki, site'ye özel proxy yapabilirdik, yani www.pandora.com sitesine girdiğimizde bizim proxy devre'ye girecekti. Bunu [FoxyProxy](http://foxyproxy.mozdev.org/) ile yapabildiğini öğrendim. Sonra da bu şekilde kullandım, ama müzik dinlemek için Firefox'u açmak pek hoşuma gitmedi. Last.Fm gibi istemci olsa tadından yenmezdi.

Burada yapabileceğim bir şey var, oda [Mozilla Prism](http://labs.mozilla.com/projects/prism/) kullanmaktı. Sayesinde web sitelerine uygulama gibi çalıştırabilecektik. Her ne kadar uygulama olmasa bile güzel bir şey bence. Benim yaptığım ise, Mozilla Prism'de proxy'ı devreye sokmaktı.  Şimdi aşağıda gördüğünüz gibi simge'ye tıkladığım an Pandora'yı dinleyebiliyorum

[![pandora](http://blog.arsln.org/wp-content/uploads/pandora-300x221.png)](http://blog.arsln.org/wp-content/uploads/pandora.png)

Tüm bunları şu şekilde yaptım:



	
  1. Mozilla Prism sayfasından, Prism'in [standalone uygulamasını](http://people.mozilla.com/%7Emfinkle/prism/prism-0.9.en-US.linux-i686.tar.bz2) indiriyoruz

	
  2. Bu uygulamayı  /opt dizinine açıyoruz. Orada /opt/prism diye bir klasör oluşacak

	
  3. En son[ flash sürümünü indiriyoruz](http://get.adobe.com/flashplayer/) , içinden çıkan **libflashplayer.so** dosyasını  **/opt/prism/plugins** klasörüne atıyoruz(eğer plugins klasörü yoksa oluşturuyoruz onu)

	
  4. İstediğiniz bir metin editörü ile **/opt/prism/xulrunner/greprefs/all.js** dosyasını açıyoruz ve aşağıdaki satırları **

pref("network.proxy.type",                  0);
pref("network.proxy.autoconfig_url", "");**

şu şekile çeviriyoruz

**pref("network.proxy.type",                  2);
pref("network.proxy.autoconfig_url", "http://pac.byterelay.com/");**

Bu satırlar 750'ini satırda ve birbirinden ayrı yerdeler, biraz aramanız gerekecek

	
  5. İşimiz bitti sayılır, şimdi konsoldan **/opt/prism/prism** açıyoruz ve [www.pandora.com](http://www.pandora.com) ve Desktop seçeneğini tıklıyoruz

	
  6. Başka adım yok :)


