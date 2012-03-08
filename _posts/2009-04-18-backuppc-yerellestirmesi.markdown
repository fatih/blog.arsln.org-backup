---
date: '2009-04-18 21:42:24'
layout: post
slug: backuppc-yerellestirmesi
status: publish
title: BackupPc yerelleştirmesi
wordpressid: '632'
categories:
- Bilişim
- Gezegen
- Linux
tags:
- backuppc
- staj
- translation
- yerelliştirme
---

**Portakal Staj **başvuru'sundaki üçüncü aşamam BackupPc'yi **yerelleştirmek**. Normalde .po dosyaları vardır bunlar kolayca yerelleştirebiliniyor.Birde belki bileniniz vardır, zamanında [eklentiler.mozilla.org.tr](http://eklentiler.mozilla.org.tr)'de Türkçe eklentiler sunuyorduk(Bak bunu tamamen unutmuşum, CV'ye yazmam gerekiyor :)). Gayet de başarılıydı. Bu iş ise zordu biraz, çünkü .xpi dosyaları açmak gerekiyordu içindeki dosyaları düzenlemek ise zor olabiliyordu bazen. Fakat sonrasında bir takım olaylar oldu ve sebepsiz yere yüzlerce hakarete varan mailler aldık. Neyse ki sonra [Babelzilla](http://www.babelzilla.org/) platformu ortaya çıktı ve biz bu işleri buradan devam etmiştik. Ben çok devam edemedim zaten, şimdi kimler yerelleştirme ekibinde bilmiyorum.

**BackupPc** geri dönersek, arka planda çalışan bir uygulama olduğundan yerelleştirecek pek bir şey yok, fakat BackupPc'nin web arayüzü yerelleştirmeye gayet müsait. Bu sebepten dolayı BackupPc kullanıcıları listesine bir mail [attım](http://sourceforge.net/mailarchive/forum.php?thread_name=3a8b0bbb0904111105r54f9f2ecuc74ec3edda04ca9%40mail.gmail.com&forum_name=backuppc-users). Nasıl yapabileceğimi ve belirli prosedürler var mı diye sordum. 

Gelen cevap ise şu şekildeydi:



> You should look in lib/BackupPC/Lang. Each language has its own
file. You can copy copy en.pm (English) to tr.pm (Turkish) and
then edit it with the translation of each string. Don't change
any of the html or variable names prefixed by "$" - just the
English text.
[...](http://sourceforge.net/mailarchive/message.php?msg_name=3426b458-3e8c-4d63-8b9e-6838b61f2bc5)



Ben de o zaman bu işe başlayacağım, bitirince size dosyayı yollarım diye cevap yazdım. Craig ise bana şu cevabı yazdı:



> Sure.  You can just send it to me and I will include it in CVS
and the next release.



Daha henüz başlamadım, fakat kısa zamanda başlayacağım. Gelişmeleri buradan takip edebilirsiniz.











