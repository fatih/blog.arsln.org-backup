---
date: '2006-09-01 22:22:38'
layout: post
slug: sag-tiklama-ile-iso-yakmak
status: publish
title: Sağ tıklama ile Iso yakmak
wordpress_id: '41'
categories:
- Linux
tags:
- burn
- custom actions
- ipucu
- iso
- thunar
---

Yeni kurduğum sistem için Kde bileşenleri kullanmak istemedim. Bu yüzden de hafif,sade,gtk kütüphaneli programlar kurdum. Bunlardan da biri de konsol'dan çalışan Burn uyugulaması. Bunu Thunar'daki kişisel işlevler için kullanmak bire bire.

Burn uygulamasını kuralım:





> sudo aptitude install burn






Ardından root olarak **/etc/burn.conf** doyasını kendi bilgisayarımız için düzenliyelim

Thunar'daki kişisel işlevlerden, (_Edit > Configure custom actions_) ekle butonuna basıp, aşağıdaki bilgileri doldurun.





> Name: Burn Iso
Command: Terminal -T "Burn ISO" -x sudo burn -I -n %f
File pattern: *.iso
Appears if selection contains: Other File






Ardından kayıt edin. Bundan sonra ISO dosyalarını tek sağ tıklamayla cd'ye yakabilirsiniz.

_In English : [Burn Iso with Right-click in Thunar](http://ubuntuforums.org/showthread.php?t=248538)_

