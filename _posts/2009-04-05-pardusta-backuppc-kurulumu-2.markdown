---
date: '2009-04-05 12:18:25'
layout: post
slug: pardusta-backuppc-kurulumu-2
status: publish
title: Pardus'ta BackupPc kurulumu - 2
wordpressid: '624'
categories:
- Bilişim
- Gezegen
tags:
- backup
- backuppc
- Linux
- pardus
- rsync
- yedek
---

Dün [birinci kısımda](http://blog.arsln.org/pardusta-backuppc-kurulumu-1/) BackupPc'yi nasıl kuracağımız anlattım. Bu kısımda ise client(istemci) ve sunucu kısmında neler yapmamız gerektiğini söyleyeceğim. Mail listesinden aldığım cevaplar pek işe yaramadı çünkü hata başka yerdeymiş. Nmblookup komutunun çalışması için istemci'de samba kurulu olması gerekiyormuş. O yüzden istemci tarafında samba'yı kurmayı unutmayın.

BackupPc veri aktarımı için SSH kullanıyor. Bunu kullanabilmesi için sunucu'daki anahtarlarımızı istemci'ye aktarmamız lazım. Yani sunucu'ya bağlanmak isteyen her kişi'ye sunucu'da oluşturduğumuz anahtarları yollamamız lazım. Bu biraz zahmetli iş ama İnternet'te yaptığım araştırmalar sonucunda basit bir [belge](http://www.debian-administration.org/articles/588) buldum. Şimdi sırayla şu işlemleri yapalım:




#### **İstemci(Client) Tarafında:**


Linux olduğunu varsayarak, backuppc kullanıcısını eklememiz lazım. Bunu bir önceki [belgemden](http://blog.arsln.org/pardusta-backuppc-kurulumu-1/)u nasıl yaptığımı görebilirsiniz. Ayrıca bu bilgisayar'da rsync kurulu olması gerekli, çünkü veri aktarımını rsync üzerinden yapacağız(BackupPc, rsync dışında tar gibi metotları kullanmamıza da izin veriyor). Rsync'i sadece backuppc kullanacak, bu yüzden ona root işlemleri gerektiren işlemlerde izin vermemiz lazım. Her defasında şifre girmek de işimize gelmediği için, sudoers dosyasına rsync için özel izin vereceğiz. Onu da şu şekilde yapacağız:

**echo "backuppc  ALL=NOPASSWD: /usr/bin/rsync" >> /etc/sudoers**

Artık backuppc kullanıcı, rsync root kullanıcısı olarak kullanabilecek ve herhangi bir şifre girmemize gerek kalmayacak.


#### **Sunucu tarafında:**


**su backuppc**

diyerek backuppc kullanıcı moduna giriyoruz, sonra da açık bir tane anahtar üretiyoruz

**ssh-keygen -t rsa -C "backuppc"**

Sonra bu anahtarı bizim istemci'ye gönderiyoruz. Bunu ssh-copy-id komutu ile kolayca yapabiliriz. Fakat bu betik Pardus'ta olmadığı için ilk önce betiği indirip /usr/bin dizinine aktarmamız lazım. Betiği [openssh sitesinden](http://www.chiark.greenend.org.uk/ucgi/~cjwatson/cvsweb/openssh/contrib/ssh-copy-id?rev=1.8;content-type=text%2Fplain) indirebilirsiniz. Betiği ssh-sopy-id olarak kaydedin, ardından /usr/bin dizinine kopyalayın ve çalıştırabilinir izni verin. Şu şekilde yapabiliriz:

**cp ssh-copy-id /usr/bin
chmod +x /usr/bin/ssh-copy-bin**

Bunları yaptıktan sonra aşağıdaki komut ile istemci'ye bağlanıyoruz, ssh-copy-id komutu otomatik olarak bizim anahtarlarımız karşı tarafa ekleyecek:

**ssh-copy-id backuppc@192.168.1.3**

Burada önemli olan yukarıdaki 192.168.1.3 kısmı sizde **değişik** olacak, istemci tarafındaki ip neyse onu yazmanız lazım. Onu artık kolayca karşı tarafdan öğrenmeniz gerekecek(yan not: sinerji projesini geliştiriken biz bu sorunu avahi ile güzel bir şekilde çözmüştük, aslında backuppc için de böyle bir şey yapılabilinir)
Yukarıdaki komutu uyguladıktan sonra, ssh ile istemci'ye giriş yapacağız(güevenlik açısından).

**ssh backuppc@hapkido**

~/.ssh/authorized_keys dosyasının başına bir kaç şey eklememiz lazım. Bu sayede sadece bir tane sunucu'dan giriş yapmamızı sağlayacak. Bu da güvenliği biraz daha artıracak.

**vim ~/.ssh/authorized_keys**

Yukarıdaki komutu yazarak, bu dosyanın önüne from="sunucu'nun hostname" yazacağız, burada sunucunun alan adı neyse onu yazmamız lazım, bendeki örnek şu şekilde:
_
from="fatih-pardus" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvWh3e ....._

Her şeyi tamamladık şimdilik. İster sunucu'dan ister istemci'den her türlü giriş yapabilirsiniz CGI'ye. BackupPc'yi konsoldan kullanmak yerine web tarayıcınızdan kullanmanız mümkün. Bunu ilk yazımda anlatmıştım. Bu cgi'ye giriş yapabilmeniz için(şifresiz), BackupPc'nin host dosyasını değiştirmemiz lazım, bu host dosyası /etc/Backups/hosts olarak bulabilirsiniz. Bu dosyayı açıyoruz ve aşağıdaki gibi değiştiriyoruz:

_host        dhcp    user    moreUsers     # <--- do not edit this line
samsung  0      fatih   backuppc
#farside    0       craig   jill,jeff     # <--- example static IP host entry
#larson     1       bill                  # <--- example DHCP host entry_

Yukarıda, samsung benim istemcinin alan adı, 0 ise static-ip kullandığım anlamına geliyor, eğer dhcp kullanıyorsanız bunu 1 yapın. Ardından şifresiz olarak kullanılmasını istediğiniz kullanıcı adını yazın. Benim diğer bilgisayardaki kullanıcı adım yine fatih olduğundan ben'de fatih yazıyor. Sonrasında ise başka kullanıcıların da giriş yapabilmesini sağlayabiliyorsunuz, örneğin laptopunuzu sadece siz değil, başkaları da kullanıyorsa onlar da giriş yapmak isteyebilir. Ben burada deneme amaçlı olarak backuppc yazdım. Siz farklı bir şey yazabilirsiniz.

Ardından sunucu tarafından http://localhost/cgi-bin/BackupPC_Admin yazarak, yada istemci tarafından http://192.168.1.2/cgi-bin/BackupPC_Admin yazarak giriş yapabiliriz web arayüzünde. 192.168.1.2 ise **benim** sunucunun ip adresi, istemci tarafından bağlanmak istiyorsanız buradan giriş yapabilirsiniz.

Artık arayüzü biraz kurcalayabilirsiniz. Eğer her şey düzgün bir şekilde çalıştıysa size doğrudan istemci hakkında bilgiler gösterecektir. Şimdi ise rsync kullanacağımızı ve bunun doğru bir şekilde çalışmasını sağlamamız için komutları değiştirmemiz lazım. Tüm bunları** /etc/BackupPc/config.pl **dosyasından da yapabilirsiniz. Bu tarz config dosyalarını düzenlemekte sıkıntı çekmiyorsanız doğrudan oradan da işlemlerinizi yapabilirsiniz. Ben buradan daha kola bir yolunu anlatacağım. Burada bir iki hata ile karşılaşmıştım, onları da araştırma sonucunda değiştirdim. Yapmanız gerekenler ise şunlar



	
  * "Edit Hosts" kısmına tıklayın

	
  * "xfer" sekmesine tıklayın

	
  * "xfermethod"'u "smb"'den "rsync" olarak değiştirin

	
  * Ardından "RsyncClientCmd" kısmını **$sshPath -q -x -l backuppc $hostIP sudo $rsyncPath $argList+** olarak değiştirin

	
  * "RsyncClientRestoreCmd" kısmını da **$sshPath -q -x -l backuppc $hostIP sudo $rsyncPath $argList**+ olarak değiştirin

	
  * "save" tıklayıp kaydedin.


Artık herşey tamamdır, yedekleme zamanı geldi
**"Host Summary" **tıklayın, oradan ise istemcinin üzerine tıklayın ve **"Start Full Backup"** tıklayarak yedeğinizi alabilirsiniz.

Herhangi bir sorunla karşılaşmanız durumunda, [BackupPc kullanıcılar listesinden ](http://sourceforge.net/mailarchive/forum.php?forum_name=backuppc-users)gereken yardımı alabilirsiniz.
