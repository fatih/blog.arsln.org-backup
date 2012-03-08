---
date: '2009-04-04 21:54:51'
layout: post
slug: pardusta-backuppc-kurulumu-1
status: publish
title: Pardus'ta BackupPc kurulumu - 1
wordpressid: '619'
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

**Portakal Teknoloji** staj başvuru aşamasında bana verilen projelerden biri BackupPc idi. Pardus'ta bu uygulamanın paketini bulamadığım için elden kurmam gerekiyordu. Peki BackupPc nedir ? BackupPc bu kadar güzel ve önemli yapan nelerdir?

Birincisi BackupPc yüksek performanslı, kurumsal derecede çalışabilen, çoklu platform destekleyen ağ üzerinden çalışan yedekleme uygulamasıdır. Kendisi gerekli ayarlamaları yaptıktan sonra arka planda çalışıyor ve bu sayede belirli aralıklarda ağ üzerinden diğer bilgisayarların(Masaüstü ve Dizüstü) yedeğini alıyor. Yani bir sunucu uygulamasıdır kendisi.

Kendisi birleştirme özeliği ile veri yedeklerken belirli seviye'ye kadar veriyi azaltabiliyor ve sunucu'da daha az yer kaplamasını sağlıyor. Örneğin vermek gerekirse var sayalım şirketinizde **95 adet** çalışan diz üstü bilgisayarı var. Bu bilgisayarların ortalama yedeklenecek veri büyüklüğü **3.6gb olsun**. BackupPc ile normalde **1200Gb **olması gereken veri, birleştirme ve sıkıştırma özelliği ile sadece** 150Gb yer kaplıyor.** (Eğer bir dosyanın aynısı başka bir bilgisayar'da varsa onu yedeğini almıyor mesela). Ayrıca sunucu tarafında BackupPc kurulması yeterli, istemci tarafında hiç bir şey kurulmasına gerek yok, Windows makinelerinde samba protokolü, linux makinelerinde ise ssh/rsh/nfs üzerinden tar ile yedek alabiliyor.

Şimdi sırayla nasıl kurulacağını anlatacağım. 


Kurmak için gerekenler:



	
  * perl (depo'da var)

	
  * Compress:Zlib (depo'da perl-Compress-Zlib adında bulabilirsiniz)

	
  * Archive::Zip (depo'daperl-Archive-Zip adında bulabilirsiniz)

	
  * File::Rsyncp (bu depo'da yok, onu [kendi adresinden ](http://perlrsync.sourceforge.net/)indiriyoruz)

	
  * tar (kurulu geliyor

	
  * rsync (depo'da rsync olarak bulabilirsiniz)

	
  * apache (kurulu geliyor)

	
  * mod-perl (depo'da mod_perl olarak bulabilirsiniz)


Tüm bu bileşenleri ilk önce kuruyoruz, File::Rsyncp için de dosya'yı indirdikten sonra, root olarak şu komutlar ile kuruyoruz:

** perl Makefile.PL
make
make test
make install**

BackupPc'yi kurmaya geçmeden önce backuppc adında bir kullanıcı oluşturmamız lazım. Bunu güvenlik açısından yapmamız gerekiyor, BackupPc uygulamasını bu kullanıcı kullanacak ve sadece bu kullanıcı çalıştırabilecek. Kullanıcı'yı oluşturacağız ve bir de kendisine şifre vereceğiz, bunlar sonra lazım olacak şifre'yi o yüzden unutmayalım. Kullanıcı eklemek ve şifresini değiştirmek için de şunları yapacağız:

**su -
useradd backuppc
passwd backuppc
**

Burada önemli olan **su - **olarak root girişi yapmak. Yoksa Pardus altında useradd komutunu bulamazsınız(başka diğer komutlar gibi)

Şimdi ise BackupPc'nin son sürümünü [indiriyoruz sourceforge.net'den](http://sourceforge.net/projects/backuppc/). Ardından root olarak aşağıdaki komutlar ile paketi açıp, BackuPc'nin kendi betiğini çalıştırıp kuracağız. Bu betik bizim için tüm işlemleri yapacak

** tar zxf BackupPC-3.1.0.tar.gz
cd BackupPC-3.1.0
perl configure.pl**

Şimdi size bir çok soru sorulacak, neyi nereye kurayım gibi. Dikkatlice okumanızı tavsiye ederim(ingilizce). Genellikle çoğu şeyi geçebiliriz(enter'e basarak) sadece aşağıdaki soruları benim söylediğim şekilde yaparsanız daha kolay olur sonrası için:



	
  * --> Data directory (full path) [/mnt/sda4/backup]?   (Bu kısım yedeğinizin kopyalanacağı yeri söylüyor. Artık nereye yedeklemek istiyorsanız dosyalarınızı o kısmı yazın)

	
  * --> CGI bin directory (full path) [/usr/local/BackupPC/CGI]? (Buraya sıradaki kısmı yazın, çünkü bizim dosya'mız buradan çalışacak: **/var/www/localhost/cgi-bin**)

	
  * --> Apache image directory (full path) [/var/www/localhost/htdocs/BackupPc]? (Burası da farklı olacak, bunu yazmamız lazım: **/var/www/localhost/htdocs/BackupPc**)



Şimdi BackupPc'yi çalıştırmadan önce Pardus'ta kurulu gelen Apache'yi çalıştırmamız lazım(ben kurulu geldiğini sanıyorum, eğer değilse depo'dan kolayca kurabilirsiniz).Kolay bir şekilde çalıştırıyoruz hemen:
**
sudo service apache start
sudo service apache on   **

Şu an itibariyle tüm zemini hazırladık. BackupPc çalıştırmaya müsait. Aslında BackupPc arka planda **daemon** olarak çalışması gerekiyor, yani Pardus'ta servis olarak gözükmesi lazım. Kendi içinden daemon olarak çalışması için, bir çok dağıtım için ön tanımlı olarak init.d dosyaları yer alıyor. Fakat Pardus'un farklı bir yapısı var, bu yüzden bunları kullanamıyoruz. Bunun için kendi servisimiz oluşturmamız lazım. Bunu nasıl yapılacağını bilmiyorum, fakat tahminen nasıl yapılabileceğini biliyorum. 

Pardus depolarında rsync paketine baktım, ve **comar/service.py**  adında bir dosya gördüm. Bu muhtemelen servis işini halleden dosyanın kendisi. Pisi paketi kurarken service.py'di göz önünde alıp öyle kuruyor. Bu kısım pisi paketi yaparken lazım olacak, şimdilik "manüel" olarak BackupPc'yi çalıştırmamız yeterli olacaktır.

BackupPc'yi çalıştırmak için backuppc kullanıcısı olmak lazım, bunun için de şu şekilde kullanıcı oluyoruz
**
su - backuppc**

Bu kullanıcıyı oluştururken kullandığımız şifre ile giriş yapıyoruz, ve aşağıdaki komut ile BackupPc'yi daemon olarak çalıştırıyoruz:

**/usr/local/BackupPC/bin/BackupPC -d**

Ardından Firefox ile [http://localhost/cgi-bin/BackupPC_Admin](http://localhost/cgi-bin/BackupPC_Admin) tıkladığımızda, sunucumuzun çalıştığını göreceğiz. 

Yedek alma işlemi ve_ config.pl_ dosyasının düzenlenmesi gibi kısımlar da var. Fakat ağ problemi yüzünden bunları şu an yapamıyorum. Evimde ubuntu kurulu netbook bilgisayarı var, ağ üzerinden ping yapabiliyor fakat nmblookup ile bulamıyorum, bu yüzden yönetici panelinden yedeğini alamıyorum bilgisayarın. Bunu konu hakkında[ BackupPc kullanıcı mail listesine](http://sourceforge.net/mailarchive/forum.php?forum_name=backuppc-users) bir [soru attım](http://sourceforge.net/mailarchive/forum.php?thread_name=3a8b0bbb0904040240o67a8c6bfsffb9e9cae4e7d9d3%40mail.gmail.com&forum_name=backuppc-users), şu an bu sorunu gidermeye çalışıyorum. Sorunu giderir gidermez, istemci(client) tarafından neler yapılması gerektiğini yazacağım. 

Güncelleme: [Pardus'ta backuppc kurulumu 2](http://blog.arsln.org/pardusta-backuppc-kurulumu-2/) yazısından devam edebilirsiniz




