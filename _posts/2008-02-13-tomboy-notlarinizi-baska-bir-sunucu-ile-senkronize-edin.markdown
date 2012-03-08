---
date: '2008-02-13 22:26:41'
layout: post
slug: tomboy-notlarinizi-baska-bir-sunucu-ile-senkronize-edin
status: publish
title: Tomboy notlarınızı başka bir sunucu ile senkronize edin
wordpressid: '389'
categories:
- Gezegen
- Linux
tags:
- senkronize
- ssh
- synchronization
- synchronization tomboy
- tomboy
---

![tomboy-128.png](http://arsln.org/image/tomboy-128.png)[Tomboy](http://www.gnome.org/projects/tomboy/) çok harika bir uygulamadır. Kendisi ile not  tutmak, düzenlemek benim çok hoşuma gidiyor. Hemen hemen tüm bilgilerimi de Tomboy notlarına yazarım. Fakat en son bilgisayarımı sattığımda,  bilgisayarımı acilen vermem gerekiyordu ve ben de yedeğini almadığım için(çok kötü biliyorum) tüm notlarım uçmuştu. Halbuki** Google Notebook** gibi, bilgisayar dışında bir uygulma olsaydı böyle olmazdı.  Sonunda karar verdim ve Tomboy'un ssh ile senkronize olayını araştırdım. Google'da bir kaç belge çıkıyor. Ne yapmanız gerektiğini anlatayım kısaca sizlere:




	
  * İlk önce** fuse, ssh** gibi paketleri kurmamız gerekiyor. Bunlar her dağıtımda farklı olduğu için nasıl kurulacağını yazmıyorum, paket yöneticisiniz ile arayıp kolayca kurabilirsiniz. 


	
  * 
Fuse modülü yüklü olması gerekiyor, bunu  ** lsmod | grep fuse** ile öğrenebilirsiniz, değilse **modprobe fuse** ile yükleyebilirsiniz. Ayrıca kullanıcımızı da fuse grubuna dahil etmeye unutmayalım(konsolda **gpasswd -a kullanıcıismi fuse** şeklinde yapabilirsiniz, yaptıktan sonra çıkış-giriş yapalım)



	
  * Ssh daemonun çalıştığına emin olalım. Değilse çalıştıralım yoksa Tomboy'da haliyle çalışmaz. Ubuntu'da Services altında, Archlinux'da ise  /etc/rc.d altından çalıştırabiliriz(arch kullananlar **sshd ibaresini de rc.conf'a** eklemeye unutmasınlar)



	
  * Ardından Tomboy'da **"Synchronization"** sekmesi altında SSH ibaresini seçip, gereken yerleri dolduruyoruz. Folder Path(Optional) denilen kısım boş kalabilir. Tek yapmanız gereken **sunucu adını ve sunucuya giriş izni olan kullanıcı ismini** yazmaktır. Ardından ssh ile bağlanabilirsiniz.

	


  * Herşey yolundaysa başarıyla tamamladığınıza dair bir pencere çıkar karşınıza. Bundan sonra herhangi bir not'da **"Synchronize Notes"** kısmına bastığınızda, Tomboy sunucunuza bağlanacak, ve notlarınızı oraya aktaracaktır. 




Sunucunun ssh desteği olması lazım bunu yapabilmeniz için. Ayrıca senkronize olayını WebDAV ile de yapabilirsiniz(Ssh dışında bunu da kullanabilirsiniz). Webdav biraz daha uygun geldi aslında bana, bir çok kullanıcının notları aynı dizin içinde saklanabiliyor. Örneğin Tomboy kullananlar için böyle bir senkronize hizmeti açılabililir. Çok da zor olmasa gerek. 



	

