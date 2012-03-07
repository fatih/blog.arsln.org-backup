---
date: '2006-12-01 15:43:04'
layout: post
slug: video-dosyalarini-sag-tiklama-ile-tvde-acmak
status: publish
title: Video Dosyalarını Sağ Tıklama Ile Tv’de Açmak
wordpress_id: '92'
categories:
- Linux
tags:
- custom actions
- ipucu
- thunar
- video
---

Bu ipucu özellikle ikinci bir Ekran, ya da Tv kullananlar için geçerlidir.
Küçük bir betik yazdım. Betik sayesinde, herhangi bir film dosyasını direkt ikinci ekranda ya da tv'de tam ekran olarak açıyor. Ayırca alt yazı olup olmadığına da bakıyor. Eğer altyazı varsa, onu da türkçe karakter kodlamasına göre, ve yazının büyüklüğü 4 olarak ayarlıyor. Bunu siz isteğinize göre değiştirebilirsiniz tabi.

Betik:



> #!/bin/bash

for D in *.[sS][rR][tT] ; do

DISPLAY=:0.1 mplayer -fs -vo sdl -subcp latin5 -subfont-text-scale 4 "$D" "$1" 

done
exit 0 






Bu betiği ,/usr/bin altına tvdenac.sh olarak kayıt edip, **chmod +x tvdenac.sh** yazarak da izinlerini verin.

Artık terminal'dan
**
tvdenac.sh film
**
yazarak kullanabilirsiniz. Bunu daha kullanışlı bir hale getirmek için, benim kullandığım dosya yöneticisi'nde(Thunar) şu şekilde ekledim.

_(Edit > Configure custom actions)

Name: Tv'den aç...
Command : /usr/bin/tvdenac.sh %f
Appaearance Conditions
File Pattern : *
Appears if selection contains: Video File_

Bu kadar, bundan sonra herhangi bir filme sağ tıklayınca, şöyle bir menu çıkacak. burdan da **Tv'den aç ... **şeklinde bir ibare oluşacak. Bunu tıklayınca görüntü direkt ikinci ekran ya da tv'de açılacak, tam ekran ve alt yazı varsa, alt yazı eklenmiş hali ile.

![tv](http://img149.imageshack.us/img149/5898/tvdenbm1.jpg)
