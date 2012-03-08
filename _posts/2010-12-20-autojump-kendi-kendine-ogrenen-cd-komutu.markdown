---
date: '2010-12-20 23:55:07'
layout: post
slug: autojump-kendi-kendine-ogrenen-cd-komutu
status: publish
title: Autojump - kendi kendine öğrenen "cd" komutu
wordpressid: '870'
categories:
- Gezegen
- Linux
tags:
- autojump
- bashrc
- basj
- cd
- github
- ipucu
- plugin
- zsh
---

Gündelik blog/github gezintilerimden birinde **Autojump'ı** keşfettim. Tek kelime ile harika. Readme dosyasından bir cümle:


> ... A quick survey among my friends revealed that between **10 and 20% of all commands they type are actually cd commands**! Unfortunately, jumping from one part of your system to another with cd requires to enter almost the full path, which isn't very practical and requires a lot of keystrokes...



 Autojump dışında elbette seçenekler mevcut, aklıma gelen ilk üç şunlar: 



	
  1. bashrc'ye  alias gitpl="cd /repo/pardus/playground/" tarzında satırlar ekleyebilirsiniz

	
  2. pushd ve popd ikilisini kullanabilirsiniz

	
  3. "cd" ve "cd -" ikilisini kullanabilirsiniz.(zsh'da mükemmel bir şey bu arada, İbrahim kulakları çınlasın : ) )



Ama bunların her biri kendi içinde sınırlıdır. Peki autojump ne yapıyor ?

Autojump, "cd" komutula girdiğiniz dizinleri ölçüyor ve onlara "**ağırlıklar**" veriyor. Siz "cd" ile gezdikçe girdiğiniz her dizinin ağırlığı değişiyor. Gezindiğiniz dizinlerden yola çıkarak size en hızlı yolu sunuyor. Tek yapmanız gereken bol bol "**cd**" komutunu kullanmak. 1-2 saat sonra autojump kullanmaya başlıyorsunuz ve şu şekilde harika bir şeyle karşılaşıyorsunuz:

Normal cd ile şunu yazıyorsunuz mesela:
`
cd /root/repo/pardus/playground/fatih.arslan/packages/chromium-dev
`

Autojump ile şunu yazıyorsunuz sadece:

`
j c
/root/repo/pardus/playground/fatih.arslan/packages/chromium-dev
`
kendisi otomatik olarak bir üsteki dizine gidiyor. Örneğin birden fazla "f" ile başlayan dizinleriniz varsa onları sıralıyor ve sadece numarasını yazıyorsunuz, örnek:
`

j f__

f__1__/home/fatih          f__2__/root/repo/pardus/playground/fatih.arslan/packages/chromium-dev/files
`

Eğer "enter" tuşuna basarsınız doğrudan /home/fatih'ye gidecek. Ama "2" tuşuna bastığınız an o dizine gideceksiniz. Girdiniğiz dizinlerin önemini ve "ağırlığını" görmek için jumpstat yazarak öğrenebilirsiniz:
`
...
54.5:  /home/shared/musique
60.0:  /home/joel/workspace/coolstuff/glandu
83.0:  /home/joel/workspace/abs_user/autojump
96.9:  /home/joel/workspace/autojump
141.8: /home/joel/workspace/vv
161.7: /home/joel
Total key weight: 1077
`

Burada **"total key weight"** dizinde geçirdiğiniz zamanı yansıtıyor. Kısaca bir dizinde çok zaman harçıyorsanız, o dizine çok gidiyorsunuz demektir. O dizinde çok iş yapıyorsunuz. Algoritmayı ve kodu tam incelemedim, ama gördüğüm kadarıyla dizin içinde çalıştırdığınız her komut için "bir" ağırlık ekliyor. Yani bir dizine girip üç saat açık da kalsa Terminal ona ağırlık vermiyor. Sadece çok iş yaptığınız dizinlere puan veriyor. 

Bu araç biraz **"anlatılmaz, yaşanılır"** cinsten bir uygulama. İndirin, kurun ve kullanın. Ne demek istediğimi çok daha iyi anlayacaksınız. Github'dan indirebilirsiniz. Bash ve Zsh'da çalışır durumda. (not bu fork edilmiş sürümü, orjinaline yine aynı sayfadan ulaşabilirsiniz):

[https://github.com/amix/autojump](https://github.com/amix/autojump)
