---
date: '2013-05-05 12:50:00'
layout: post
slug: subvim-sublime-text-benzeri-vim-dagitimi
status: publish
title: Subvim - Sublime Text benzeri Vim dağıtımı
---

Bundan bir ay önce **[Subvim](https://github.com/fatih/subvim)** adinda yeni bir proje oluşturdum. Sublime Text sevip
de Vim'den bir türlü ayrılamayanlar benim gibi insanlar için düşünülmüştü.
Proje'yi duyurduktan sonra gördüm ki benim gibi bir sürü insan varmış:

* GitHub'da şu an itibariyle 791 yıldız aldı ve her gün artmaya devam ediyor:
  [https://github.com/fatih/subvim](https://github.com/fatih/subvim)
* GitHub'da haftanin en popüler deposu olarak listeye girdi.
* HackerNews'de uzunca konuşuldu:
  [https://news.ycombinator.com/item?id=5504051](https://news.ycombinator.com/item?id=5504051)
* Twitter'de dünyanin dört bir köşesinden kullanan insanlar yorum yaptı:
  [https://twitter.com/search/realtime?q=subvim](https://twitter.com/search/realtime?q=subvim)
* One Thing Well tumblr blogunda çıktı:
  [http://onethingwell.org/post/49262686423/subvim](http://onethingwell.org/post/49262686423/subvim)
* Addy Osmani gibiler SubVim'i paylaştı:
  [https://plus.google.com/+AddyOsmani/posts/JegDRWyawFH](https://plus.google.com/+AddyOsmani/posts/JegDRWyawFH)

Kısacası hiç ummadığım kadar rağbet gördü. Subvim gelirsek, kendisi şöyle bir şey oluyor:

![subvim screenhhost](http://arsln.org/image/subvim-screenshot.png)

Bir çok özellikleri mevcut:

* SublimeText'deki renk şemasının hemen hemen aynısi (bunun için molokai.vim
  üzerinde kendi değişiklerimi yaptım)
* SublimeText'deki kısa yollarının hemen hemen çoğu mevcut ve her biri ayni
  görevi yapiyor
* Birden fazla imleç kullanabiliyorsunuz (multiple cursor)
* Otomatik tanımlama. Bunun için YouCompleteMe eklentisinin ikili paketini
  derleyip Subvim'e dahil ettim.
* Goto symbol/definition özelliği ile bulunduğunuz dosyada herhangi bir method,
  fonksiyon veya da veri tipine gidebiliyorsunuz. Bunun için de yine Ctags'in
  derlenmiş ikili paketini ekledim ve ctags için özel değışikler mevcut.
* Kapatıp açtığınızda dosyalariniz, pencere konumlari aynen eski hali ile
  oluşturuluyor.
* .. ve [daha fazlası](https://github.com/fatih/subvim)


Şu an için sadece Mac OS X'de çalışıyor. Ileride zamanım olursa Linux altında
çalışacak şekilde özellikler ekleyeceğim.
