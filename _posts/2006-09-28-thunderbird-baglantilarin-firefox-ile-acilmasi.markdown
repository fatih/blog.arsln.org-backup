---
date: '2006-09-28 15:23:24'
layout: post
slug: thunderbird-baglantilarin-firefox-ile-acilmasi
status: publish
title: Thunderbird bağlantıların Firefox ile açılması
wordpress_id: '61'
categories:
- Linux
tags:
- firefox
- mailto
- thunderbird
---

Ubuntu'da tıkladığım bağlantıları thunderbird, mozilla browser ile açmaya çalışıyordu. Sonra config dosyasına baktım ve tarayıcı olarak x-www-browser olarak gördüm. Demek ki x-www-browser'i değiştirmem gerekiyordu. Bunu yapmanız için de aşağıdaki komut yeterli.



**update-alternatives --config x-www-browser**

Bu komutu root olarak yazarsanız, karşınıza muhtemelen bir liste çıkacaktır. Orada size uygun olan tarayıcıyı seçebilirsiniz.

_(sonradan gelen düzenleme: bu sayede artık Xchat'deki bağlantıları da firefox ile açabiliyorum)_
