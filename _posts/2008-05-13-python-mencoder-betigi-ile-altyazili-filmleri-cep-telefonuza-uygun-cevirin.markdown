---
date: '2008-05-13 14:41:30'
layout: post
slug: python-mencoder-betigi-ile-altyazili-filmleri-cep-telefonuza-uygun-cevirin
status: publish
title: Python + Mencoder betiği ile altyazılı filmleri cep telefonuza uygun çevirin
wordpress_id: '425'
categories:
- Gezegen
- Linux
- Programlama
tags:
- betik
- mencoder
- n series
- n95
- n95 linux mp4
- nokia
- Programlama
- python
- script
---

Dün akşam bash kabuğundan halletiğim bazı mencoder işlemleri için küçük bir Python betiği yazdım. Bu betik belirlediğim bir divx filmin içine altyazıyı gömerek bunu **MPEG-4(.mp4) formatına** çeviriyor. Daha önce mencoder ile bir iki şey yazmıştım hatırlarsanız fakat onların bazı eksiklikler vardı. 



  * Birinci [yazımda](http://blog.arsln.org/symbian-yuklu-telefonlarda-altyazili-film-divx-xvid-izlemek/) komut için telefona codec yüklenmeli ve divx player veya smartmovie gibi programlar ile izlenmesi gerekiyordu


  * İkinci [yazımda](http://blog.arsln.org/video-dosyalarinizi-sag-tiklayarak-320x240-formatina-donusturun/) artık herhangi bir codec yüklemenizde gerek yoktu, fakat hala **divx player** yüklememiz gerekiyordu. 


Peki nasıl telefonumuza hiç bir **ek uygulama** yüklemeden dahili oynatıcımızdan oynatabileceğiz ? N95'in desteklediği video formatları arasında şunlar var: 
_
3GPP formats (H.263)
H.264/AVC
MPEG-4
RealVideo 7,8,9/10_

Bizim yapmamız gereken bu **formatlardan** birini kullanmak. Biraz daha araştırınca web'de bu konu hakkında [iki](http://wiki.dumbot.net/Video_processing) [tane](http://notes.xiaoka.com/2008/03/29/encode-mp4-files-for-nokia-n95-with-mencoder/) belge buldum. Ben de birine göre daha önce yazdığım betiklerden de faydalanarak aşağıdaki betiği yazdım. Ayrıca şöyle bir şey var, N95 ve diğer N-serisi telefonların bazı multimedya tuşları olabiliyor. Bu tuşlar da sadece içindeki dahili Realplayer oynatıcı ile çalışıyordu. Artık oluşturduğumuz bu video'lar bu tuşlarla da uyumlu olacak.

Yazdığım betik şu şekilde, neler yaptığını sonrasında anlattım: 




[cc lang="python"]
#!/usr/bin/python
# -*- coding: utf-8 -*-

import os

def cevirici():

    ## Dizin içindeki dosyaları listele, sonu .srt ve .avi olanları ayrı ayrı kaydet
    for dosya in os.listdir(os.curdir):
        if dosya.endswith(".srt"):
            altyazi = dosya
        if dosya.endswith(".avi"):
            film = dosya

    ## Yeni oluşacak video için isim
    filmismi = raw_input("Oluşacak dosyanın adı(öntanımlı: yeni_film.mp4): ")
    if filmismi:
        if filmismi.endswith(".mp4"):
            pass
        else:
            filmismi = filmismi + ".mp4"
    else:
        filmismi = "yeni_film.mp4"

    ## Veriler mencoder komutuna verilerek dosya oluşturuluyor
    ## TODO: Bitrate, Çözünürlük gibi değeğerleri değişkenler olarak değiştir(threads=%s gibi ..)
    ##       Kullanıcıya sorulabilir?
    command = 'mencoder -sub "%s" -subcp latin5 -subfont-text-scale 4  -of \
            lavf -lavfopts format=mp4 -oac lavc -ovc \
            lavc -lavcopts threads=4:aglobal=1:vglobal=1:acodec=libfaac:abitrate=128:vcodec=mpeg4:keyint=25 \
            -ofps 25 -af lavcresample=44100 -vf harddup,scale=320:-3 "%s" -o "%s"' % (altyazi, film, filmismi)
    os.system(command)

    ## Dosyayı kontrol et
    if os.path.exists(filmismi):
        print "\n***  Tebrikler! %s dosyası oluşturuldu  ***" % filmismi
    else:
        print "***  HATA! %s dosyası oluşturulamadı  ***" % filmismi

if __name__ == '__main__':
    cevirici()
[/cc]



  1. os modülünü import ediyoruz, kendisini mencoder ve bir kaç klasör/dosya işlemlerinde kullanacağız. Filmin ve altyazının olduğu dizinde betiği çalıştırıyorsunuz. Kendisi dizindeki dosya isimlerini alıyor, ve sonu .srt ve .avi biten iki dosyayı ayrı ayrı kaydediyor(burası tam içime sinmedi değişebilir belki)



  2. Ardından oluşacak yeni filmin adını girmenizi istiyor, enter'e bastığınızda öntanımlı olarak yeni_film.mp4 oluşuyor. İsmi _örnekfilm_ ya da _örnekfilm.mp4_ olarak girebiliyorsunuz her iki durumda da örnekfilm.mp4 olarak çıkıyor(yani örneğin örnekfilm.mp4 girdiğinizde örnekfilm.mp4.mp4 olarak çıkmıyor)



  3. "command" değişkende bizim kullandığımız mencoder komutu duruyor. Daha önce aldığımız üç değişkeni bu kod içinde kullanıyoruz(altyazıyı, filmin kendi ismini ve bizim belirlediğimiz isim). Kodun nasıl çalıştığını konsoldan "man mencoder" yazarak bakabilirsiniz. Tek söylemek istediğim, threads=4 şeklindeki ibare sizin işlemci çekirdeğinizin sayısını gösteriyor. Ben bunu bilmiyordum ve hep bir çekirdek ile encoding işlemleri yapıyordum(yani threads=x ibaresi ekli değildi). Günümüzde yeni işlemcileri düşünürsek gayet işe yarar bir seçenek(Örneğin 170mb büyüklüğündeki bir dizi film 1.20 dk'da bitiyor)



  4. Son olarak eğer hata çıkmadıysa ve dosyamız oluştuysa, oluşan dosyamızı kontrol ediyor, mevcut ise "Tebrik..." mesajı çıkıyor, eğer dosya mevcut değilse "Hata..." mesajı çıkıyor


Hepsi bu kadar. Çok değiştirebilir ve yapılabilir, örneğin değişkenler kullanıcı tarafından girilebilir. Film ve altyazı adını da seçebiliriz. Bu gibi şeyleri GUI ile halletmek istiyorum, bu aralar PyQt çalışıyorum ve işe tam vakıf olduğumda arayüzünü yazmayı düşünüyorum.
