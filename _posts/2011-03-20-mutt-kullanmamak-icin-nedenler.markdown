---
date: '2011-03-20 23:22:58'
layout: post
slug: mutt-kullanmamak-icin-nedenler
status: publish
title: Mutt kullanma(ma)k için nedenler
wordpress_id: '933'
categories:
- Gezegen
- Linux
tags:
- e posta
- e-mail
- Linux
- mutt
- terminal
---

E-mail istemcisi olarak [Mutt](http://www.mutt.org) kullanıyorum. [Eskiden](http://lists.debian.org/debian-user-turkish/2005/06/msg00067.html) [kalma](http://www.linuxnet.com.tr/modules.php?name=Tutorials&op=viewtut&id=59) bir bağım var, o zamandan beri severim. Ama sevmemek için de çok nedenim var. Nedenler ise şunlar:



	
  * Diğer e-posta istemcilerinde, başka birinin yazdığı mesaj'da bir kısmını seçip, o kısma cevap yazabiliyorsun. Mutt'da var mı ? Tabi ki yok. Düz "_cevap ve_r" kısmı var o kadar

	
  * [Sidebar yaması](http://svn.pardus.org.tr/pardus/2011/devel/network/mail/mutt/files/) olmasına rağmen, klasörden klasöre geçmek işkence oluyor. Benim gibi 100'den falza listeye üye iseniz zaten yandınız

	
  * Ayrı bir pencere açamıyorsunuz (Vimdeki :vs, :vnew gibi). Ayrı bir terminal açıp, mutt'u salt okunur olarak açmanız gerekiyor. Bir sürü iş anlayacağınız.

	
  * Bir işlemi iptal etmek için garip bir kombinasyon olan** ctrl+g** yapmanız gerekiyor. **ctrl+c** yapmayın, doğrudan uygulama kapanıyor

	
  * Eski üsül dikey pencere görünümü var sadece. Yeni nesil geniş ekranlarda bir sürü boş yer israf ediliyor

	
  * Bu bir dejavantaj mı bilmiyorum, ama kullanılabilinir bir hale getirmek için yüzlerce döküman okumanız ve bir hafta zaman ayırmanız gerekiyor(elbette ki 1-2 saat'de çalışır bir biçime getirebilirsiniz, ama verimli bir hale gelmezi uzun süre alır)

	
  * Bağlantıları doğrudan açamıyorsunuz ek bir uygulama kurmanız gerekiyor, e-posta adreslerini otomatik kaydetmez ekstra bir uygulama gerekiyor, resimleri doğrudan açmaz ekstra bir uygulama gerekiyor, vs ...

	
  * Cevap yazarken ayrı bir pencere açmadığı için kim ne yazmış, başkası ne yazmış, ne demiş okuyamıyorsunuz.


Bu sebeplerden dolayı ara sıra kmail,sylpheed ikilisinden birine geçiyorum. Kısa bir süre sonra geri dönüyorum Mutt'a. Nedenleri ise şunlar:

	
  * Konsoldan çalıştığı için aşırı hızlı. İstediğimi zaman kapatıp açıyorum. X'e gerek yok haliyle her durumda çalışıyor

	
  * Kısa yolları bilirseniz çok ama çok hızlı olabiliyorsunuz. Fareyi hiç kullanmadığınız için zaten başta 1-0 öndesiniz

	
  * Tıpkı vim'deki gibi **.muttrc** adında dosyanız var, istediğiniz bilgisayarda sadece bu dosyayı kopyalıyorsunuz ve tüm ayarlarınız anında sizinle beraber oluyor.

	
  * Vim'deki gibi binlerce kişiselleştirme seçenekleri mevcut

	
  * Her mesajı birer "**pipe**"'den geçirebilirsiniz. Özellikle herhangi bir mesajı mıncıklamak, parçalamak, kurcalamak istiyorsanız süper bir özellik

	
  * Bu diğer e-posta istemcilerinde de var, ama Mutt bu konuda çok daha başarılı. Cevaplarken Vim kullanıyorsunuz.

	
  * Çok güzel arama özelliğine sahip. Mesela "**~b örnek ~F**" ile sadece işaretli olan mesajlar içinde "örnek" kelimesini arıyor ve bulduklarını gösteriyor. 



Temel sorun yeni nesil kullanıcı arayüzleri ile ilgili. Vim mesela eski olmasına rağmen, geliştirici sayesinde hala çeşitli özellikler sayesinde(sekme özelliği mesela) popülerliğini koruyor. Ama aynı davranışı Mutt'da göremiyoruz. Böyle arada kaldım sanki, çok sevmeme rağmen günden güne beni sinir krizine sokuyor bu meret. Dertliyim nitekim ahali :)
