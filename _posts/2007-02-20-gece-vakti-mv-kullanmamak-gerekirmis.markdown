---
date: '2007-02-20 02:04:10'
layout: post
slug: gece-vakti-mv-kullanmamak-gerekirmis
status: publish
title: Gece vakti mv kullanmamak gerekirmiş...
wordpressid: '179'
categories:
- Hayat-Yaşam
- Linux
tags:
- hata
- mv
---

Daha yeni yaptığım hatayı başkası yapmaz herhalde. Anca benim başıma gelir. 

1 haftadır Prison Break'in Sezon 2'nin 4'üncü bölümünü indirmeye çalışıyorum. İlk denememde indirdiğim dosya **çalışmadı**, ikinci denememde dosya **fake çıktı**, üçüncü denemede available kısmının **98.0** olduğunu fark ettim yani dosya indirilemedi.

Neyse dedik elbette bir çıkış yolu vardır diye, bugün tekrar bir Torrent bulup indirmeye karar verdim.

Velakin indi de, tam **14 dk önce**. Ben ne yaptım peki, dosyayı mv ile dizi klasörüme taşıdım. Buraya kadar herşey normal. Sonraki yapacağım adım da ***.srt** dosyasını ***.avi** dosyası ile aynı olacak şekilde adlandırmak(_Bu sayede mplayer ya da dvd-çalar'da otomatik olarak altyazıyı bulup ekliyor_). Bunu da ben kolayca **_mv_ komutu** ile yaparım. Fakat gelin görün ki ben gecenin vaktinde şu komutu yazdım:

`**mv prison_break_altyazi.srt prison_break_s02e04.avi **`

Gitti tüm indirdiğim dizi. Geriye dizinde sadece _prison_break_s02e04.avi_ adında bir dosya kaldı. Tek fark _46kb_'lik bir text dosyası olması.

Bu ne bahtsızlık ya, anlamadım gitti. Şimdi 5'inci kez tekrar indirecem. Of of ..
