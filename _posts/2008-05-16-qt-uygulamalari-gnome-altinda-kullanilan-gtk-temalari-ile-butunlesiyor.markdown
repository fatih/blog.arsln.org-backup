---
date: '2008-05-16 18:49:51'
layout: post
slug: qt-uygulamalari-gnome-altinda-kullanilan-gtk-temalari-ile-butunlesiyor
status: publish
title: Qt uygulamaları Gnome altında kullanılan GTK+ temaları ile bütünleşiyor
wordpressid: '437'
categories:
- Gezegen
- Linux
tags:
- gtk
- Linux
- qgtksytle
- qt
- qt 4.4
- qt4
---

Bildiğiniz gibi Qt ile yazılmış uygulamaları çevrelerine göre adapte olabiliyor. Yazdığınız bir programı Windows'da ve Mac OS X'de çalıştırdığınızda onlara ait temalarla birlikte çağrılıyor. Yani yazdığınız program her platformda kendine has bir görüntü sergiliyor. Bu da bir bütünlük sağlıyor. Sadece bu değil, örneğin "**Tamam**" ve "**İptal**" gibi butonlar da platformdan platforma değişiyor. Birinde "Tamam" butonu sağ tarafta olurken, birinde sol tarafta olabiliyor.

Fakat Gnome altında maalesef aynı bütünlük söz konusu değil. Kullananlar bilir. Böyle olunca Trolltech  "QGtkStyle" adında yeni bir [proje ortaya çıkardı.](http://labs.trolltech.com/blogs/2008/05/13/introducing-qgtkstyle/) Önceleri **QCleanlooks** ve bir kaç icon-temaları vardı, fakat şimdi bir adım ileriye gidiliyor ve kullanan Gtk+ temanın tamamı entegre oluyor. Peki böyle bir şey nasıl gözüküyor ?


![](http://blog.arsln.org/image/textedit.png)


Gördüğünüz gibi gerçekten mükemmel gözüküyor. Qt kullanmak için bir sebep daha(_bu arada Qt 4.4 sürümü için geçerli bu_). Proje üzerinde hala çalışılıyor, fakat denemek isteyenler Trolltech'in sayfasından [indirebilirler](http://labs.trolltech.com/page/Projects/Styles/GtkStyle). Ayrıca daha fazla bilgi ve ekran görüntüleri için [labs.trolltech.com'daki](http://labs.trolltech.com/blogs/2008/05/13/introducing-qgtkstyle/) habere de bakabilirsiniz.

Kaynak: [[1](http://www.golem.de/0805/59758.html)][[2](http://labs.trolltech.com/blogs/2008/05/13/introducing-qgtkstyle/)]


