---
date: '2008-09-27 10:09:42'
layout: post
slug: pardusta-staj-3uncu-hafta
status: publish
title: 'Pardus''ta staj - 3''üncü Hafta '
wordpress_id: '502'
categories:
- Gezegen
- Hayat-Yaşam
- Linux
tags:
- pardus
- pardus stajı
- pardus'ta staj
- staj
---

_Not: Bu bir yazı dizisidir. [1'inci](http://blog.arsln.org/pardusta-staj-1inci-hafta/) ve [2'inci](http://blog.arsln.org/pardusta-staj-2inci-hafta/) hafta'da yaptıklarımı okumak isteyebilirsiniz_




	
  * **11.gün** : Kod temizlemesi ile başladım. Proje'ye başlarken aniden giriş yaparak başladığım için modüler,fonksiyonlar hepsi **birbirine girmişti**. Kod'ları biraz daha düzgün bir hale getirdikten sonra, avahi'nin yolladığı verileri parse etmeye başladım. Daha önce sadece sunucu'yu alıyordum. Fakat artık seçtiğimiz bilgisayarın pozisyonu da yolluyorum. Fakat yollarken verilerde hata oluşuyor. Verileri sadece **"string"** türünde yollayabiliyorum. O yüzden kolay edilebilecek bir şekilde yollamaya çalıştım. Öğlenden sonra Faik abi gelip bir bakmıştı, avahi ile yollanan verilerde sorun çıktığını neden olduğunu da bilmediğimi anlattım, sonra kendisi ile bunu bir şekilde çözmeye başardık. Bunun dışında subprocess ile oluşturduğum süreçleri, uygulama kapatırken öldürmem gerekiyordu. Oluşan süreçlerin **pid numalarını** bir şekilde alma ve öldürme işlemlerine baktım kısaca. Günün sonuna doğru ise avahi ile yolladığım verileri parse etme fonksiyonu ile geçirdim


	
  * 
**12.gün:** Sinerji'nin kullanabilir sürümü çıktı. Avahi ile yollanan verileri parse edebiliyorum artık. Ayrıca **QSystemTray** de ekledim, yani artık Sinerji bir tray uygulaması ve doğrudan sistem erişilebilinecek. Ayrıca arayüz'deki iki tane radio butonun da sildik. Sunucudan yollanan istekler bundan sonra istemcisinin arayüzüne yansımayacak, onun yerine oluşturduğum QSystemTray'ın kendi metodu olan **showMessage()** ile gösterilecek. Yani kısaca bir balon çıkacak ve ona tıkladığımızda kabul etmiş olacağız. 


	
  * 
**13.gün ve 14.gün**: Bu günleri günlüğüme tek bir yazı olarak yazmışım. İki gündür tray işi ile uğraşıyormuşum. **showMessage()** metodu yerine DBus'un kendi bilgilendirme balonlarını kullanacağız. Çünkü Qt'nin balonlarına buton ekleyemiyoruz, DBus'un kendi balonlarına ise buton ekleyebiliriz, böylelikle istemci tarafında çıkan balonlar'da "kabul" ve "iptal" gibi buton çıkacak ayrıca. Sunucu tarafı synergy'i başlatıktan sonra, diğer bilgisayarda arka planda çalışan _sinerji._tcp arama servisi bizim sunucuyu bulacak. Sonra da bu balon çıkacak. O yüzden belirli aralıklarda sinerji servisi araması lazım uygulama. Bunu da **QTimer** ile halletmişim. Kendisi belirli aralıklarda _sinerji._tcp servisini arıyor. **Uygulama bitmiş**(böyle demişim :)). Yarın Faik abi'ye gösterip, projenin bittiğini söyleme niyetim olmuş. (Fakat bitmediğini sonraki gün anlayacağım)



	
  * **15.gün:** Faik abi'ye gösterim ve kendisi ile yaklaşık 7-8 tane yapılması gereken iş bulduk(uygulama bitmemiş yanı :)). İlk önce uygulamadaki bazı hataları düzeltim. Neler olduğunu yazmamışım günlüğüme. Ardından "Disconnect" adında bir **QDialog** oluşturmuşum. Yani bir tane bilgilendirme arayüzü. Örneğin istemci, sunucun yolladığı isteği kabul ettikten sonra ne durumda olduğunu kullanıcıyı bildirmesi lazımdı. Arayüzün kaybolup, onun yerine sistem çekmecesindeki  simgeye tıkladığımızda bu bilgilendirme arayüzü çıkması gerekiyordu. QDialog yerine ilk başta **QMessageBox** kullandım, fakat onun sinyal **yollamadığını**, bu yüzden kullanıcının tıkladığı butonları belirli fonksiyonlara bağlayamayacağımı öğrendiğim için günün sonuna doğru QDialog ile yeni bir arayüz oluşturdum.




