---
date: '2008-09-25 18:52:46'
layout: post
slug: pardusta-staj-2inci-hafta
status: publish
title: 'Pardus’ta staj - 2′inci hafta '
wordpress_id: '500'
categories:
- Gezegen
- Hayat-Yaşam
tags:
- pardus
- pardus stajı
- pardus'ta staj
- staj
---

_Not: Bu bir yazı dizisidir. [1'inci hafta'da](http://blog.arsln.org/pardusta-staj-1inci-hafta/) yaptıklarımı okumak isteyebilirsiniz_




	
  * **6.gün:** Bugün avahi ile hem servis oluşturma hem de servise arama işiyle uğraştım. Sonrasında ise arama ve bulma işlemlerini halletikten sonra bunları birer **fonksiyon** haline getirdim. Böylelikle istediğim her servis için ayrı ayrı modül yazmak zorunda kalmadım. Bunun dışında PyQt4 kullandığım için DBusGmainLoop yerine DbusQtMainLoop kullanmam gerektiğini öğrendim. İnternet'te bu konuda pek bilgi bulamamıştım, fakat sonra Google Codesearch'de bir şeyler buldum ve entegre etmeye başarmıştım.(Blog'a da [bir yazı](http://blog.arsln.org/sinerji-programi/) yazmışım bu aralar)


	
  * 
**7.gün:** Bugün tüm gün **createsynergy.py** adlı modülü oluşturma ile uğraşmışım. Bu biraz kafamı kurcalıyordu nasıl yaparım ederim diye. Synergy'nin ayarların kaydedildiği bir dosya var ve biz Synergy'i çalıştırdığımızda bu dosyadan verileri okuyarak başlıyor. Sinerji'de ise ayarladıktan sonra bu dosya oluşması lazım ki Synergy bu dosyayı okusun. İlk başlarda zor gelmişti, yapamamıştım. Hatta o gün bu konuda mesai bitimine kadar da bir şey yapamadığımı hatırlıyorum. Akşam odamda düşünürken birden dank etti ve yazmaya başlamıştım ve bitirmiştim. 



	
  * **8.gün:** synergy.conf dosyasını oluşturmayı yapabiliyordum. Fakat parse etmeyi bilmiyordum. Yani parse işini halleden modülü yazmamıştım. Onu da bugün bitirdim. Kullanıcı sinerji'yi çalıştırdığında ilk önce bu dosya'yı okuyarak daha önceki ayarları arayüze yansıtacak. Yani her zaman her seferinde aynı işleri yapmaktan kurtaracaktı. Bunun dışında _sinerji._tcp servisini oluşturma ve bulma koduyla ilgilendim. Henüz bilmediğim bir nedenle iki tane servisi ayna arattığımda **uygulama çöküyordu**. Ya da aynı anda arama ve bulma yapınca da çöküyordu. Bunun nedenini bulamamıştım bugün(Sonraki günler çözüme ulaştım ama)



	
  * **9.gün:** Günlüğümde bu gün için **2-3 satırlık** çok kısa bir şey yazmışım. Hala aynı anda arama ve bulma işi ile uğraşıyormuşum bu gün. Fakat henüz çözememişim olayı. Birde sinerji.py yani bizim ana betiğimizdeki avahi ile olan kısımları ayırıp modül olarak **ayrı bir dosya** olarak yazmışım. Galiba bir iş bitmeden başka bir işe başlayamıyorum. 2 gündür uğraştım bu konu üzerinde.



	
  * **10.gün:** Bugün 2 gündür uğraştığım çökme problemini **çözmüşüm**. Sorun DBusQtMainLoop olayının her seferinde çalışmasından kaynaklanıyormuş. Ben bu çalıştırma işini avahi'deki arama ve oluşturma fonksiyonların başına koymuştum. Fakat **sadece bir kere** çalıştırmam yeterliymiş. Bunu **main() altına** koyduktan sonra sorunsuz bir şekilde iki tane aramayı aynı anda çalıştırmaya başardım. Yani artık hem _workstation._tcp hem de _sinerji._tcp servislerini ağ'da arayabiliyordum. Ayrıca bunun dışında artık sunucu'yu başlatıktan sonra, verileri yollamaya da başardım. Yani oluşturduğum _sinerji._tcp servisi ile verileri de yollayabiliyordum. Birde son olarak **os.system yerine subprocess** kullanmaya başladım. Normalde os.system ile bash üzerinden istediğimiz komutları çalıştırabiliyorduk. Fakat sonra Gökçen bunun iyi bir fikir olmadığını söyledi bana. Çünkü kullanıcı ayarlarda "rm -rf /" gibi bir isim girebilir ve biz bunu çalıştırabiliriz. Subprocess'de bu olay yok, ön tanımlı olarak bash kapalı geliyor. Kendi içinde çalıştırıyor.






