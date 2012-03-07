---
date: '2007-01-18 02:12:22'
layout: post
slug: bon-echo-ismipaketi-neden-sorun-cikartiyor
status: publish
title: 'Bon Echo ismi(paketi) neden sorun çıkartıyor ? '
wordpress_id: '138'
categories:
- Bilişim
- Linux
tags:
- Archlinux
- bon echo
- firefox
- ipucu
---

![Bon Echo](http://blog.arsln.org/wp-content/uploads/2007/01/bonecholoho.jpg)[Mürekkep](http://www.murekkep.org/)'deki Firefox splash [eklentisini](http://www.murekkep.org/firefox-splash-eklentisi) kurmak isteyince, kullandığın platform buna uygun değil diye bir hata mesajı çıkmıştı ekrana. Halbuki Firefox'un 2.0.0.1 sürümünü kullanıyordum, peki sorun nerede o zaman ? Evet Firefoxun 2.0.0.1 sürümünü kullanıyorum, ama Archlinux'da, pacman ile kurduğum Firefox paketini. Fakat Archlinux bundan  2-3 ay önce Firefox paketinin adını **Bon Echo** diye değiştirdi. 

Nedenini sorarsanız, bildiğiniz gibi Debian ile Mozilla arasındaki bir isim tartışması çıkmıştı. Debian kendi Firefox paketi için yamalar uyguluyordu, ve bundan Mozilla'nın da haberi olmuyordu. Sonuç olarak ortaya aslında kodlama olarak orijinal Firefox'dan bir farklılık vardı. Mozilla'da madem sen yamalar uyguluyorsun, o zaman Firefox ismini de kullanma demişti. Hal öyle olunca Debian ismini değiştirmeye karar [verdi](http://www.osnews.com/story.php/16009/Debian-To-Rebrand-Firefox). Firefox ismini **IceWeasel** olarak değiştirdi. 

İşte Archlinux da Debian'a uyduğu için, ismi Bon Echo diye değiştirdi. Fakat bu da bazı [sıkıntılar](http://bbs.archlinux.org/viewtopic.php?t=27460&highlight=user+agent) da beraberinde [getirdi](http://blog.andy-roberts.net/2006/11/26/bon-echo/).  Örneğin ben Greasemonkey, ya da daha önce [yazımda](http://blog.arsln.org/en-iyi-3-gmail-uyaricinotifier-uygulamasi/) da [bahsettiğim](http://blog.arsln.org/en-iyi-3-gmail-uyaricinotifier-uygulamasi/#comment-118) gibi Gmail eklentilerini kullanamıyorum. Son olarak da Splash eklentisi bunların arasına girdi.

Gelelim şimdi bu sorunu çözmek için neler yapabiliriz. 




	
  1. Adres çubuğuna _about:config_ yazarak, _general.useragent.extra.firefox_ satırındaki "**BonEcho/2.0**" kısmını "**Firefox/2.0**" olarak değiştirmek işimizi görebilir. Bunu ben denedim. Ama nedense hâlâ Bon Echo diye görüyor. Bazı kişilerde işe yaramış, denemekte fayda var. 



	
  2. User Agent Switcher eklentisini kurup, kendimize göre istediğimiz tarayıcı tanımlayabiliriz. Burada ben aşağıdaki verilere göre bir girdi oluşturdum 

_Description = Firefox 2.0.0.1 
Useragent  = Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.1) Gecko/20061222 Firefox/2.0.0.1 
Appname   = Netscape 
Appversion = 5.0 (X11; en-US) 
Platform= Linux i686 _

Bu eklentinin en güzel özelliği ise, girdiğiniz siteye göre tarayıcı görünümü değiştirebilmenizdir. Yani örneğin bir banka, internet bankacılığı sitesi için Internet Explorer kullanma koşulu koydu. Eklenti sayesinde görünümü IE olarak değiştirip, girebilirsiniz. Tabi çalışır mı çalışmaz mı bilinmez. Eklentinin tek eksik yönü iste, her defasında değiştirmeniz gerekiyor. Yani her Firefox açılışında tekrardan aktif hale getirmeniz gerekiyor.



	
  3. Son olarak da, benim yapacağım gibi, orijinal Firefox paketini indirip, onu kullanmanızdır. Hemi böylelikle işi kökten çözmüş olursunuz. Fakat bunun da eksik yönü, paket yönetim sistemi artık günceleştirmiyor. Devre dışı kalıyor. Güncelleme sizin ellinize kalıyor yani




Umarım işinize yaramıştır. Daha başka önerileriniz varsa, paylaşırsanız sevinirim.
