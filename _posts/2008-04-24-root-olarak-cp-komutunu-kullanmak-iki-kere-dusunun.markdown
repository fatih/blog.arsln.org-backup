---
date: '2008-04-24 22:11:43'
layout: post
slug: root-olarak-cp-komutunu-kullanmak-iki-kere-dusunun
status: publish
title: Root olarak cp komutunu kullanmak ? İki kere düşünün
wordpressid: '419'
categories:
- Gezegen
- Linux
---

Bugün okulda birinci sınıflarla beraber maç yaptık, ardından bölümün önünde hepimiz bir araya gelmiştik. Genellikle bölümün önünde herkes birbirinden aldığı dvd,cd arşivlerini arkadaşlarına verir ya da alır. Bende arkadaşımda gördüğüm dvd paketini almıştım. Akşam üstü eve geldiğimde ise dvd'yi rip etmek yerine iso'sunu alıp sonra rip edeyim demiştim. Dvd'yi _umount_ edip, şu komutu root olarak yazıp bir imajını aldım:  
**  
dd if=/dev/dvd of=film.iso**  
  
Yaklaşık 4.6gb'lik bir dosya oluştu, bunu da benim 180gb'lik yedek olarak kullandığım sabit diske kopyalıyım dedim. Nasıl ettim, nasıl yaptım ben bile  anlamadan 1-2 sn içinde şu komutu girip hiç düşünmeden enter tuşuna basmıştım:  
  
**cp film.iso /dev/sdb5**  
  
Tahmin edin ne oldu ? 180gb'lik sabitdiskimdeki yaklaşık 20 gb veri gitti, ve .iso'nun içeriği /dev/sdb5 yerine geçti. Anlamam geç oldu, iptal ettik ama nafile. En azından diğer yedek olarak kullandığım, fotoğrafların, ders notların ve bunun gibi verilerin olduğu sabitdiske kopyalamaya denememişim.   

