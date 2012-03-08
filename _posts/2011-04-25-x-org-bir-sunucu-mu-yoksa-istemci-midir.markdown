---
date: '2011-04-25 21:24:34'
layout: post
slug: x-org-bir-sunucu-mu-yoksa-istemci-midir
status: publish
title: 'X.org bir sunucu mu yoksa istemci midir ? '
wordpressid: '955'
categories:
- Gezegen
- Linux
tags:
- alıntı
- mail list
- xorg
---

Bildiğiniz gibi** X sunucusu** Linux gibi işletim sistemleri için gerekli grafik ve ekran yapılandırmasını sunar. Bunu da kendine has benzersiz bir sunucu ve istemci modeli ile yapar. Örneğin **Pardus 2011**'i başlattınız, gerekli olan tüm servisler başladıktan sonra X sunucusu başlar.  X sunucusu gelen bağlantıları bekler. Tek bir bilgisayar kullandığınız için istemci de aynı bilgisayarda çalışmaya başlar. Parolanızı girerseniz ve karşınıza masaüstü ekranınız gelir. 

Bundan sonra X sunucusu arka planda çalışır vaziyete size gerekli olan tüm işlemlerinizi yaptırır.  X sunucusu hiç bir zaman bir uygulamanın nasıl **gözükeceği** veya nasıl **çalışacağı** hakkında bilgiye sahip değildir. Uygulamanın görüntüsünü KDE, GNOME gibi büyük masaüstü ortamlarının kullandıkları araçlar belirler (**Qt, Gtk+ gibi**). Çalıştıracağınız her uygulama aslında bir istemcidir ve X sunucusuna bağlanır.  Bazen bir istemci, X sunucusuna bağlı başka bir istemciye bağlanabilir (**Xnest, Xzephyr, gibi**). 

Bu model genel olarak çoğu zaman karmaşık geliyor insanlar. Bu yüzden X.org mail listelerinde bunlarla ilgili sıkca tartışma olur. Geçenlerde yine bununla ilgili bir tartışma çıktı.  Bahsi geçen sunucu ve istemci modeli hakkında ise X.org geliştiricilerinden (aynı zamanda Fedora geliştiricisi) olan **Peter Hutterer**'in güzel bir yanıtı var:

_I never understood why people claim that one must rethink server/client when it comes to X. X server and client notion are _not_ reversed.




	
  * The X server sits there, waiting for connections.
Just like FTP servers.



	
  * The X server provides auth mechanisms, restricting which clients can connect.
Just like FTP servers.



	
  * Once a client connects, the server provides a specific protocol to communicate.
Just like FTP servers.



	
  * The protocol allows access to certain resources local to the machine.
Just like FTP servers.
(in the FTP server's case the resources are files, in the X server's case they are hardware resources)



	
  * The clients can upload data (e.g. pixel data) and download data (e.g. eventsor state information).
Just like FTP servers.



	
  * When a client disconnects, the server continues to serve the other clients.
Just like FTP servers.



	
  * A client can connect to multiple servers, uploading data and downloading data to all of them.
Just like FTP clients.



	
  * When the server shuts down, all clients are disconnected, but only from this server. Connections to other servers stay open and active.
Just like FTP clients.

_
Tartışmanının devamını [X.org listesinden](http://lists.freedesktop.org/archives/xorg/2011-April/052877.html) takip edebilirsiniz. Genel olarak X hakkında merak ettiklerinizi bu [listeye](http://lists.freedesktop.org/mailman/listinfo/xorg) üye olarak öğrenebilirsiniz.
 

