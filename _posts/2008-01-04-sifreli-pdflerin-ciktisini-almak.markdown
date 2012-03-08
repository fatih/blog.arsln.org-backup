---
date: '2008-01-04 12:54:12'
layout: post
slug: sifreli-pdflerin-ciktisini-almak
status: publish
title: Şifreli Pdf'lerin çıktısını almak
wordpressid: '375'
categories:
- Gezegen
- Linux
tags:
- drm
- evince
- kde
- kghostview
- korumalı pdf
- kpdf
- okular
- protected pdf
- şifreli pdf
---

Ellimde bir kaç tane önemli PDF var. Ders çalışırken bilgisayarın başında da çalışamıyorum, en iyisi çıktısını alayım demiştim. Fakat okuduğum PDF _"print"_ olayına karşı **korumalıydı**. Okunabiliyor ama herhangi bir çıktıya izin vermiyor. Çıktıya izin vermeyen program da bildiğimiz **Adobe Reader 8**. Neden bilgisayar'a yükledim bunu onu da anlamadım, halbuki Linux dünyasında alternatif çok, hem de daha hızlı Adobe'ye göre. 

Şifreli PDF'lerin çıktısını alabilmek için bir kaç yöntem var. **En kolayı KPDF ve ya KGhostView yüklemektir**. Her ikisi de **şifreli PDF'lerin çıktısını** alıyor. Fakat KPDF'de ayarlarda **DRM** ile ilgili bir seçenek var, onu kapatmanız lazım. Evince ile de denedim, fakat onda da çıktı işaretinin üzerine basılmıyor yani çıktı alınamıyor. 

Okular yani Kde 4.0'un yeni PDF okuyucusunda da çıktı almak mümkün, fakat onun için de derlerken **-DOKULAR_FORCE_DRM=OFF** parametresini eklemeniz [lazım](http://dot.kde.org/1195074194/1195090273/). 

Ayrıca bir başka seçenek, bende çalışmadı fakat sizde olabilir. PDF dosyasını PS'ye çevirip, onu da geri PDF'ye çevirmek olacaktır, o da şu şekilde:



> 
$ pdftops bizim.pdf out.ps
$ pstopdf out.ps out.pdf




Evet hepsi bu kadar, varsa sizin de bildiğiniz başka seçenekler buyrun ekleyin


     
