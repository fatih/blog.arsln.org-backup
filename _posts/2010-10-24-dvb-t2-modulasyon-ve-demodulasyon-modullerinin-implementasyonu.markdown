---
date: '2010-10-24 21:54:28'
layout: post
slug: dvb-t2-modulasyon-ve-demodulasyon-modullerinin-implementasyonu
status: publish
title: DVB-T2 modülasyon ve demodülasyon modüllerinin implementasyonu
wordpress_id: '751'
categories:
- Hayat-Yaşam
tags:
- beagleboard
- demodulation
- dvb-t2
- dvb-t2 modulation
- modulation
- rx
- tx
---

Bu sene Mayıs ayın sonunda, yani yazın başlarında bölümden mezun olduğumda, geriye güzel bir bitirme Projesi de bırakmıştık.  Üçüncü sınıf sonlarında hocaların belirlediği projelerin içinden öğrenciler kendilerine uyanı seçer ve onu yapmaya çalışır. Arkadaşım Süleyman ve ben listede istediğimiz bir proje bulamayınca kendimiz yapmaya karar vermiştik (2009 yaz aylarında). Amacımız,** DVB-T2 alıcısı ve vericisini** baştan kendi imkanlarımızla oluşturup çalıştırmak idi. Kısaca DVB-T2 , Karasal Sayısal Video Yayın'ın ikinci sürümü idi. Ülkemizde birincisi bile çıkmamıştı, fakat yurtdışında, özellikle İngilterede BBC geçen senenin başında bunu kullanmaya karar vermişlerdi. Türkiy'de ise TRT'den aldığımız habere göre de bu yaz Ankara'da test yayınına başlayacaklardıç

Bizim projemiz gerçekten çok zordu, sonradan bu işi profesyonellerin bile çok uzun süreler içinde belirli kısımlarını yaptığını anlamıştık. İşin zor kısmı, [**Implementation Guide**](http://dvb.org/technology/dvbt2/) ile belirlenen modülleri anlamak ve bunları yazılıma aktarmak idi(sadece bu guide'i anlamak bile iki ayımız aldık desem). Her bir modül bile Yüksek Lisans'da birer Makale yazmaya yeterdi çünkü. Biz bu işin büyüklüğünü Proje'ye başladıktan sonra anlamıştık. Bir nevi buzdağını görünen kısmını görmüştük. Bu işe başlamak ve bitirmek delilikti resmen. Neden peki ?

Örneğin **BCH,LDPC** gibi yüksek bit performansı sunan kodlama tekniklerinin implementasyonu normal bilgisayarda yapılsa bile asla Real-Time çalışmayacaktı. Bir-iki saniyelik video görüntüsünün kodlaması 15 dk alıyordu! BBC gibi kanalar, sırf bu işler için özel yapım **FPGA** [kullanıyorlardı](http://www.bbc.co.uk/blogs/bbcinternet/2008/09/how_to_build_a_dvbt2_modulator.html) (linkte bu işin gerçekten nasıl yapıldığını görebilirsiniz.).  Süreyi bir tarafı bırakalım hadi, bu kodlama tekniklerinin, özellikle LDPC'nin implementasyonu gerçekten bizi aşan bir şey idi. Yüksek lisans'da Coding Theory görmek gerekiyordu en başından. İşte tüm bu saydıklarımın yüzünden bu proje'yi bitirmek zordu.

Sonuç olarak, Mayıs'ın sonunda bitirme projesini teslim etmemiz gerekiyordu. Uzun çabalarımızın sonunda proje'nin çekirdek kısmını bitirmeye başarmıştık. Bugün Süleyman ile konuşunca, yazdığımı algoritmaları paylacaşacağımı kendisine söyledim. Çünkü bu işi yapan kimse yok, kaldı ki bu yaptığımız proje bir çok kişinin çok işine yarayacağını düşünüyorum. Yazdığımız her fonksiyonun hangi modüllere denk geldiğini de **DIA** ile hazırladığım bir grafikte belirttim. Hangi modülün ne anlama geldiğini anlatmayacağım. Detay'a girmek istemiyorum, çok teorik ve matematiksel alanlar çünkü. Zaten DVB-T2 alanında çalışan insanlar neyin ne anlama geldiğini bilecektir.

Aşağıda modüllerin şeması mevcut, en alta da algoritmaları indireceğiniz dosya mevcut. Şemaya bakarak hangi fonksiyonun ne anlama geldiğini görebilirsiniz. Algoritmalar, **Matlab ve Octave** ile çalışır durumda (LDPC'nin bir kısmı için Matlab fonksiyonu kullandık, ayrıca Octave ile kullanırken bazı fonksiyonları mevcut değildir, kendiniz farklı yollardan yazmanız gerekiyor) . Fakat önemli olan burada algoritma tabi(yaklaşık 8-9 ay buna harçadık zamanımızı), o yüzden istediğiniz dilde implementasyonu yapabilirsiniz. Matlab(Octave)'ın array'ler ile olan kolaylığı yüzünden algoritmalar kısa gözükebilir, fakat bir C ile implementasyonu yazmak çok uzun olabilir şimdiden uyarayım :)

[gallery link="file"]

[DVB-T2 modulation ve demodulation algoritmaları](http://db.tt/F3LVrV1)

Proje'de beraber çalıştığım Süleyman'a da sonsuz teşekkürler. Bu Projenin baş mimarı kendisidir, hatta böyle bir şey yapalım mı diye yanıma gelip söyleyen de kendisi idi. Birlikte çalıştığımız sürede çok anımız oldu. Bazen öyle çıkmazlara girerdik ki, gerçekten sanki yolun sonuna varmışız gibi hissederdik kendimizi. Fakat hiç bir zaman pes etmedik, belki de en iyi huyumuz buydu. Şimdi ise Süleyman **Tübitak**'da çalışıyor, ben ise  aynı kurumun **Pardus** bölümünde işe başladım. Aylardır beraber çalıştığım arkadaşım ile aynı kurum'da çalışıyor olmak da hayatın gülümsemesi olsa gerek. 

