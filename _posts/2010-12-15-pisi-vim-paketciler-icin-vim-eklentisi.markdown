---
date: '2010-12-15 00:37:52'
layout: post
slug: pisi-vim-paketciler-icin-vim-eklentisi
status: publish
title: Pisi.vim - Paketciler icin Vim eklentisi
wordpress_id: '845'
categories:
- Gezegen
- Linux
tags:
- pardus
- pisi
- plugin
- python
- vim
- vim plugin
---

Vim'i çok **seviyoruz**. Ofiste Vim kullananların sayısının haddi hesabı yok. Geliştiricilerin hemen hemen hepsi paketlerle uğraşıyor, özellikle **pspec.xml** dosyası ile uğraşırken kimi zaman küçük Vim ipucuları da paylaşıyoruz bu yüzden. Bir ara **İbrahim** ve **Ozan** ile her gün 10-20 dk arasında yeni macrolar deniyorduk. Git zaman gel zaman bu ipucular büyüdü ve birer Macro haline geldi. Benim .vimrc'de bu Macroların çeşidi ve sayısı artınca bunları paylaşmaya karar verdim.

Macrolar küçük işler için iyi olsa da, iş büyünce pek güvenli olmayabiliyor. Bu yüzden [Python](http://vimdoc.sourceforge.net/htmldoc/if_pyth.html) ile tekrar hepsini yazdım. Böylelikle daha okunaklı oldu (Vim'de macro yazmış olanlar ne demek istediğimi iyi anlayacak) hem de bakımı daha verimli oldu. Geliştirici listesinde detaylı bir [yazı yazdım](http://liste.pardus.org.tr/gelistirici/2010-December/026877.html), onu okumanızı tavsiye ederim.  <del>Eklentiyi uludag/trunk altına yerleştirdim, yeni sürümü her daim svn sunucusundan indirebilirsiniz</del> Eklentiyi artık github'dan indirebilirsiniz(10.01.2012):

[https://github.com/farslan/pisi-vim](https://github.com/farslan/pisi-vim)

İndirdikten sonra .vim/plugin/ altına atıyorsunuz. Sonrasında, "normal" moda iken F2 ile başlayan kısayollarını kullanarak aşağıdaki eylemleri yapabilirsiniz

`
h  pspec.xml'deki arşiv dosyalarını indiri ve sha1sum günceller
c  history tag'in altına yeni bir  tag'i oluşturur
o  pspec.xml'deki anasayfayı xdg-open ile açar
p  files dizine konulan, .patch ve .diff uzantılarını ekler
w  pscep.xml açıksa actions.py dikey olarak açar, ya da tam tersi
d  vimdiff kullanarak yanyana dosyanın son halini gösterir
t  comment tagina yazdığınız bölümden commit için dosya oluşturur
s  bir üsteki dosyayı bir güzel commit eder :)
`

Az da olsa bir iki paketle uğraşan kişilerin, yukarıdaki fonksiyonların ne kadar işe yarar olduğunu görecektir. İleride, test edilikten sonra vim paketine de dahil etmeye düşünüyorum. Bakalım zaman ne gösterecek. 

Detaylı anlatım ve kullanım için yukarıda da değindiğim gibi [geliştirici listesindeki yazıyı](http://liste.pardus.org.tr/gelistirici/2010-December/026877.html) okuyabilirsiniz(hatta okumanız tavsiye edilir :)).
