---
date: '2007-06-05 08:52:42'
layout: post
slug: vim-icinden-python-kodu-calistirmak
status: publish
title: Vim içinden Python kodu çalıştırmak
wordpress_id: '252'
categories:
- Gezegen
- Programlama
tags:
- ipucu
- Programlama
- python
- vim
---

Kitabı yavaş yavaş okumaya başladım. Örnekleri daha önce C kodlarını yazdığım Vim ile başladım, fakat C'deki gibi F9'a basınca derlemiyor(yorumlamıyor). Vim içinde Python için bir çok destek mevcut, bunları okumak için 

**`:help python`**

yazmanız yeterlidir. Burada bir çok örnek verilmiş de zaten(çok ayrıntılı şeyler mevcut ileriki zamanlarda tekrar gözden geçirmem gerekecek). Ben bunların bir çoğunu denedim ama hiç biri istediğim gibi olmadı. _:pyfile _komutu var fakat bu da sadece çıktının son satırını gösteriyor. _:!terminal -e 'python %'_ denedim fakat bu da terminalı açtıktan sonra hemen kapatıyordu. 

Arch forumlarını biraz gezindim ve en sonunda birinin kullandığı komutu gördüm, çok basit fakat istediğim gibiydi. Vim içerisinden Python'u çalıştırıyor, ve kullandığım dosyayı yorumluyor. Komut ise şu :

**`:!python %`**

Burada % bizim dosyamız olur. Ben bunu daha da kolaylaştırmak için, _.vimrc_'ye şu ibareyi ekledim

**`map  :!python %  `**

Evet hepsi bu kadar, artık F8 basınca anında vim içinde dosyam yorumlanıyor. Hata varsa düzeltiyorum yoksa yazmaya devam ediyorum. Vim ile daha çok şey öğreneceğiz gibi. 

_Ekleme: myavuzselim enter tuşuna çare buldu, onu da yukarıda ekledim teşekkürler_
