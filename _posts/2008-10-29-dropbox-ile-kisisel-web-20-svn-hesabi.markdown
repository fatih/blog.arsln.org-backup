---
date: '2008-10-29 21:53:12'
layout: post
slug: dropbox-ile-kisisel-web-20-svn-hesabi
status: publish
title: Dropbox ile kişisel Web 2.0 Svn hesabı
wordpressid: '556'
categories:
- Bilişim
- Gezegen
- Hayat-Yaşam
- Sanat
tags:
- dropbox
- getdropbox
- Linux
- web 2.0
---

Uzun zaman önce duyurulan bu web servisini hepiniz duymuşunuzdur tahminen. Geçenlerde [Openbox kullanan](http://www.ogmaciel.com/?p=606) birinin yazısını okurken karşıma tekrar çıkmıştı [Dropbox](https://www.getdropbox.com/). Ben de kurup deniyeyim dedim.  [Dropbox](https://www.getdropbox.com/)  Amazon'un Web Servislerini altyapısını kullanarak size **2 gb ücretsiz** çevrimiçi alan sunuyor. Bu alanı istediğiniz gibi kullanabiliyorsunuz, [Box.net](http://box.net)'deki gibi 25 mb dosya sınırı yok yani (aslında bakarsanız Box.net'in ücretli paketleri çok daha kapsamlı fakat ücretli olduğu için Dropbox ile karşılaştırma yapmam doğru olmaz). 

Bu web servisini diğerlerinden ayıran en belirgin özellik **sürüm kontrol sistem**i olması ve **3 ayrı** platformda (Linux,Mac,Windows) bu sayede kolayca eş zamanlı güncelleme imkanı bulunmasıdır. **Dropbox** sistemini kurduktan sonra "_home_" dizinininde Dropbox adında bir klasör oluşturuyor. Bu klasör, kurulan **dropbox daemonu** ile daime göz altında ve yapılan değiştermeler kayıt altına tutuluyor. Örneğin içerinize bir tane txt dosyası attınız, adı "._bashrc_" olsun. Atar atmaz bu dosya hesabınıza da yükleniyor. 2gb yeri istediğiniz gibi bu kolay yöntem ile doldurabilirsiniz. 

Şimdi örneğin tüm ayarlama dosyalarınızı bu dizine attınız. _vimrc, bashrc, conkyrc_ tarzı, sizin için gerekli ve kullandığınız tüm dosyaları atıyorsunuz buraya. Hatta klasörün içinde "dotfiles" adında bir klasör oluşturup onun içine atıp daha derli toplu yapabilirsiniz.

Ardından bu dosyalara birer symbolic link atayabilirsiniz, örneğin vim için:

**$  ln -s Dropbox/dotfiles/.vimrc .vimrc**

Şimdi bu ne demek bizim için, bundan sonra .vimrc'de yaptığınız tüm değişiklikler otomatik olarak Dropbox hesabınıza iletilecek. Bunun en güzel yanı ise **farklı bir bilgisayara **ya da **platforma** geçtiğinizde olacak. Başka bir dağıtıma geçtiğinize tek yapmanız gereken dropboxu kurmak, ve gereken bağlantıları oluşturmak. Vimrc her zaman sunucuda kalacak ve kaybolma gibi durumlarda yaşanmayacak(bana çok olmuştu). Bunun dışında sürüm kontrol sistemi olduğundan yaptığınız değişikleri her zaman geri getirebilirsiniz.

![Dropbox](http://blog.arsln.org/wp-content/uploads/tour3b.png)


**Svn, git** tarzı sistemleri kullanan kullanıcılar zaten bu tarz sistemleri çok iyi biliyorlardır. Dropbox'un yaptığı ise bu sistemleri **Web 2.0** havası katarak son kullanıcıya sunmaktır. Gayet güzel de işliyor bence. Eksik yanları ise, kurulan dropbox daemon'un kapalı kaynak olması ve bilgilerinizin yabancı bir sunucuda saklanıyor olmasıdır. Bunları benim için sorun değil diyorsanız gayet keyifle kullanabileceğinzi bir servistir kendisi. Son olarak Dropbux'u kurmak için [forumlarındaki dropbox daemon paketini](http://forums.getdropbox.com/topic.php?id=4111&replies=50) home dizinine açıp, oradan _./dropbox-dist/dropboxd_ dosyasını çalıştırmak yeterlidir. İlla nautilus kullanmak gerekmiyor yani. 

Daha fazla bilgi için hazırladıkları [video'yu izleyebilirsiniz.

 





