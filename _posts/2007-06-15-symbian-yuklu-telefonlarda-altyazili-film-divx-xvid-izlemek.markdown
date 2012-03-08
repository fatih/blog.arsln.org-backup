---
date: '2007-06-15 11:51:32'
layout: post
slug: symbian-yuklu-telefonlarda-altyazili-film-divx-xvid-izlemek
status: publish
title: Symbian yüklü telefonlarda altyazili film(divx,xvid) izlemek
wordpressid: '257'
categories:
- Bilişim
- Gezegen
- Linux
tags:
- altyazi
- divx
- ffmpeg
- Linux
- mencoder
- n95
- nokia
- subtitle
- symbian
---

Geçen hafta [N95](http://www.nokia.com.tr/A4355105) telefonu elime geçti. 1 Haftadır onu kurcalıyorum. Bir çok özelliği var, **Wifi, Gps** gibi. Benim burada en çok işime yarayan büyük ekranı ve wifi'si. Elime aldığımda aklıma ilk gelen bununla film güzel izlenir düşüncesiydi. Ekranı 2.6 inch bu yüzden örneğin herhangi bir dizi izlemek gayet keyifli olacaktı. Yapmam gereken ise filmi cep telefona yüklemek ve izlemekti. Fakat tam istediğim gibi olmadı, çok yavaşdı, altyazi yoktu, hafiza kartında çok yer kaplamıştı. 

1 gündür bunun üzerinde araştırma yaptım ve en iyi şekilde nasıl film izlenir onu bulmaya çalıştım Windows kullanmadığım için herhangi bir "Converter" adlı program yoktu haliyle, fakat hiçde üzülmedim. Onun yerine FFmpeg, mencoder gibi çok güçlü araçlar vardı. [Linux](http://blog.arsln.org/etiket/linux) altında tüm dağıtımlarda bu programlar mevcut. Herhangi bir dağıtım'a deposuna bakabilir ve görebilirsiniz. Filmler'de bunları kullandım. 

Video'muzu 320x240 formatına çevirmemiz lazım, ayrıca bunu yaparken bitrate değerini **256-512** arasında değiştirmemiz lazım. Aynı zamanda bunu yaparken altyaziyi da bir şekilde eklemem lazımdı, piyasada Symbian film oynatıcıları mevcut. Bunlardan en meşhurları [Smartmovie](www.lonelycatgames.com/?app=smartmovie) ve [DivX Mobile Player.](http://mobile.divx.com/) Smartmovie paralı olduğu için denemedim, onun yerine DivX Mobile Player indirip kurdum, ve çok da güzel oldu. Hatta bugün yeni sürümü de yayınlandı. N95'de çok güzel bir şekilde çalışıyor. 

DivX Movie Player programı malesef altyazı desteklemiyor, aslında yardım menüsünde 7 tuşu ile açılıp kapatıldığı yazılıyordu fakat bu bende çalışmadı. Belki de dosyanın ekini .sub ya da .txt olarak değiştirmek lazımdı. Ben bunlarla hiç uğraşmadım ve onun yerine daha güzel bir çözüm buldum. Mencoder sayesinde altyaziyi doğrudan filmin içine gömdüm. Ayrıca gömerken de yukarıda bahsettiğim gibi 320x240 formatına da çevirdim. Tüm bunları mencoder aracıyla yaptım. 


![n95_2.jpg](http://blog.arsln.org/image/n95_2.jpg)


[DivX Mobile Playeri ](http://mobile.divx.com/)indirip, telefonunuza kurun. Ardından gerekli olan bir Codec var, onu da [Smartmovie anasayfasında ](http://www.lonelycatgames.com/?app=smartmovie)buldum. Filmi bunsuz izlemeyi bir deneyin, eğer çalışmasa codec'i indirin. 

Daha sonra Linux'da herhangi bir konsolu açıp aşağıdaki komutu yerleştirin

**mencoder -sub alytaziadi.srt -subcp latin5 -subfont-text-scale 4  -ffourcc dx50 -vf scale=320:240 -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=256:vhq -oac copy -o yeniolusanfilmadi.avi orjinalfilmadi.avi**

Bu komutu bu hale getirine kadar 3-4 saatimi aldı fakat sonuç olarak çok güzel çalışıyor. Burada -sub ibaresinden sonra altyazimiz geliyor. -ffourcc dx50 ibaresini de eklemek zorundaydım, yoksa film telefonda çalışmıyordu. Bu ibare filminize dx50 etiketini yapıştırıyor. O olmadan da deniyebilirsiniz. scale=320x240 bu ibareyi de telefonunuzun ekran ebatına göre değiştirin. Son olarak da :vbitrate:256 ibaresi var. Burada 256'lik bir bitrate kullanılıyor. Normail filmler 800 bitrate civarinda. Ben bunu 512 ile de denedim, görüntü çok kaliteliydi fakat N95'e ara sıra takılmalar oluyordu, 256 ile hiç bir sorun yaşamadım. Bunu ortası yani 384 ise hem hızlı hem de kalite yönünden iyi olacaktır. **230mb'li**k avi dosyası:

**256 ile 70 mb
386 ile 105 mb
512 ile 140 mb**

yer tutuyor. N95'in tv çıkışı da olduğu için, filmlerinizi tv'e de izlemek istiyorsanız o zaman bitrate'i ve scale değerini olabildiğince yüksek tutun. Gördüğünüz gibi herşeyi tek bir komutla yapabildik. En güzel yanı ise altyazimizi da filmin içine yerleştirdik. Bu sayede herhangi bir sorunla da karşılaşmadık. Telefondaki son hali ise şu şekilde:


![n95_1.jpg](http://blog.arsln.org/image/n95_1.jpg)


Resimin böyle olduğun bakmayın, gerçekte çok daha kaliteli. Bunlar da ingilizce ile arama yapanlar için olsun :) : subtitle, n95, symbian, divx, s 60, howto

Kaynak : [[1](http://www.mplayerhq.hu/DOCS/HTML/en/menc-feat-rescale.html)][[2](http://www.patrickmin.com/linux/tip.php?name=subtitles)]

