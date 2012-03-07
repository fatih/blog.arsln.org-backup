---
date: '2007-05-21 20:41:49'
layout: post
slug: en-cok-kullandiginiz-ilk-10-bash-komutlari-hangileridir
status: publish
title: En çok kullandığınız ilk 10 bash komutları hangileridir ?
wordpress_id: '241'
categories:
- Gezegen
- Linux
tags:
- bash
- komut
- Linux
- mim
---

[Pimpmyshell](http://blog.pimpmyshell.de/2007/05/21/the-top-ten-unix-shell-commands-you-use/)'de okuyunca merak edip aynısını bende uygulamadım. En çok kullanılan komutların ilk 10'u şu şekilde bende:
**
  245 ./a.out
     40 su
     18 man
     18 df
     14 ./prog
     13 killall
     13 iwconfig
     12 ls
     11 wget
     11 scrot**

./a.out ve ./prog, c kodlarını derledikten sonra çıkan çalıştırabilir dosyası. Durmadan onları açıp denediğim için tavan yapmış anlaşılan. En çok kullanılan komutları görebilmek için şu komut yeterli :

`history|awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -10
`

Sizler en çok hangi komutları kullanıyorsunuz ?  
