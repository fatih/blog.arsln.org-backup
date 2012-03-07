---
date: '2007-05-06 18:05:53'
layout: post
slug: slim-kullananlara-tavsiye
status: publish
title: Slim kullananlara tavsiye
wordpress_id: '234'
categories:
- Gezegen
- Linux
tags:
- ipucu
- slim
---

Başlangıç yöneticisi olarak Slim kullanıyorum. Çok hafif ve basit bir uygulama. Arch'da rc.conf'a "slim" yazmak yeterli gerisini kendisi hallediyor. Geçenlerde [filelight](http://blog.arsln.org/filelight/) ile sabit diskimi temizlemek için açmıştım. Büyük dosyaları anında görebiliyorum filelight sayesinde. root dizininde /var/log altında **800 mb'lık** bir dosya gördüm. 

Biraz şaşırdım açıkcası, 800mb ne olabilir ki, yoksa acaba root seviyesinde iken yanlışıkla dosya mı oraya kopyaladım diye düşündüm. Daha ayrıntıya inince bu dosyanın **slim.log** adında bir dosya olduğunu gördüm. Tek bir dosya ve 800mb yer kaplıyordu. Vim ile açıp bir baktım, hemen hemen herşeyi tutmuş. Her şey tamam da 800mb log mu olur ? Bir hata olsa gerek, yoksa bu kadar olmaması lazım. Slim kullanıyorsanız, böyle bir şişme olduysa silmeyi unutmayın. Herkese Slim'i tavsiye ediyordum, sistemi şişirmez diye, hiç de öyle değilmiş.
