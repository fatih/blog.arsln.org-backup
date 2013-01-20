---
date: '2012-05-01 13:36:00'
layout: post
slug: blog-altyapisi-olarak-jekyll-kullanmak
status: publish
title: Blog altyapısı olarak Jekyll kullanmak
---

Blogumu RSS'den takip edenler muhtemelen değişimi görmemiştir (RSS'deki bozukluk
dışında). Bundan iki ay önce Dreamhost sunucuların genelini etkileyen bir
saldırı sonucunda hasar gördü. Merak edenler için: [Dreamhost Sites
Hacked](http://discussion.dreamhost.com/thread-134262.html). Sabah kalktığımda
bu manzara ile karşılaştığımda artık Wordpress'i terketmenin zamanı geldiğini
anlamıştım. 

[Wordpress](http://www.wordpress.org) artık işimi görmemeye başlamıştı. Her ay
güncellenmesi, durmadan ihtiyacımın olmadığı özellikleri eklemesi, güvenlik
açıkların artması, her geçen gün daha da hantalaşması,vs.. Uzun zamandır bu
hantal yapıdan kurtulmayı düşünüyordum. Çünkü Wordpress benim için sadece basit
bir blog arayüzünden fazlası değildir. Sunduğu özellikler böyle bir açık kaynak
kodlu proje için muazzam olsa da benim için gereksiz bir yükten başka bir şey
değildi. Yukarıda anlatığım durum gerçekleşince ben de soluğu
[Jekyll](https://github.com/mojombo/jekyll)'de buldum. 


Jekyll nedir?
-------------

Jekyll statik site üreticisi diye geçiyor. Bunu biraz daha açayım. Jekyll, Ruby ile yazılmış bir uygulama. Belli bir sisteme, şablona göre bir klasör oluşturup içindeki dizinleri oluşturuyorsunuz. Örneğin benim klasörümdeki dizinler şu şekilde:

![Jekyll Template](http://arsln.org/image/jekyll_template2.png)

Yukarıdaki klasörler oluştuktan sonra bu dizin içinde şu komutu çalıştırıyoruz:

<pre class="terminal">
# jekyll --safe
</pre>

Jekyll, yukarıdaki dizini tarıyor ve sonunda `_site` diye bir klasör oluşturuyor(yukarıdaki resimde yer almıyor, ona sonra değineceğim). Bundan sonra sizin tek yapmanız gereken herhangi bir tarayıcı ile bu `_site` altındaki `index.html` dosyasını açmak. Aslında tüm blogunuz ve içeriği `_site` klasörü içinde oluşmuş ve herhangi bir websunucu üzerinde (Apache,vs..) yayınlamaya hazır duruyor. Hepsi bu kadar. Herhangi bir veritabanı, kurulum,vs.. gibi adımlar yok. Jekyll'in güzel ve beni cezbeden yönlerinden biri bu.


Jekyll'de blog yazma işlemi nasıl işliyor?
------------------------------------------

Jekyll'de yazılarınızı [Markdown](http://daringfireball.net/projects/markdown/) veya [Textile](http://en.wikipedia.org/wiki/Textile_(markup_language) formatlarında yazabilirsiniz. Böyle olunca hem daha rahat ve hızlı bir şekilde yazabildiğiniz gibi, Vim, Emacs gibi metin düzenleyiciler ile de değiştirebilirsiniz (Jekyll'in bir güzel yani daha).

Bu yazıları da _post dizini altına yerleştiriyorsunuz. Peki bunun nasıl göründüğünü, yani çıktısını nasıl göreceksiniz? Yukarıda bahsettiğim gibi `_site` klasörü aslında bizim blogumuzun birebir çıktısı oluyor. Tek yapmanız gereken bir web tarayıcı ile bunu açmanız. Jekyll bir adım daha öte gidip size bir kolaylık sunuyor. `--server` parametresi ile çalıştırdığımızda 

<pre class="terminal">
# jekyll --server
</pre>

yerel bir sunucu oluşturuyor ve bize `_site` içeriğini sunmaya başlıyor(yerelde 4000 port numarasında). Yerelde doğrudan [locahost:4000](http://localhost:4000) portundan inceleyebilirsiniz sitenizi.



Örneğin ben genellikle tmux'da iki tane yan yana pencere açıyorum, birinde Jekyll sunucusu çalışıyor bir yanda da Vim açık şekilde yazımı yazıyorum. Vim'de ne zaman yazımı kaydetsem Jekyll bana son halini sunuyor:


![Jekyll-Vim çalışma akışı](http://arsln.org/image/Terminal_004.png)


Jekyll'de bloglar nerede ve nasıl host edilir?
----------------------------------------------

Burada çeşitli seçenekler var. Aklıma gelen iki tanesi şu şekilde:

1. Yerelinizde oluşan `_site` klasörünü satın aldığınız bir sunucuya yüklemek. Tabi her seferinde tüm `_site` klasörünü yüklememiniz tavsiye edilir. Bunun yerine ya bir betik yazıp sadece değişiklikleri sunucunuza yüklersiniz (web jargonunda *deploy* derler). Bunun için Google'da [Jekyll Deployment](https://www.google.com/search?q=jekyll+deployment) diye aratırsanız insanların çeşitli betikler, çözümler sunduğunu göreceksiniz.

2. Ya da Github'in [Github Pages](http://help.github.com/pages/) özelliğini kullanacaksınız (ben bu şekilde kullanıyorum). Github'ın Jekyll desteği var ve size özel subdomain veriyorlar. Ayrıca CNAME özelliği sayesinde satın aldığınız bir domain ismini de buraya yönlendirebiliyorsunuz. Mesela blog.arsln.org adresi [farslan.github.com](http://farslan.github.com) adresini işaret ediyor(bu yüzden github linkine tıklarsanız kişisel siteme yönlendirileceksiniz). Github'daki en güzel özellik doğrudan Jekyll desteği olmasıdır. Yani siz normal bir git deposu açıyorsunuz, yukarıdaki resimdeki gibi bir *Jekyll klasör şablonu* oluşturuyorsunuz ve gerisini github'a bırakıyorsunuz. Depoyu oluşturduktan sonra depda her değişiklikte (`commit`) github otomatik olarak `jekyll --safe` komutunu çalıştırıp _site klasörünü oluşturuyor. 


İyi güzel de, nasıl kurulur bu Jekyll, nasıl başlayalım?
--------------------------------------------------------

Geldik en can alıcı noktaya. Yukarıdaki anlatıklarım ile ilgili sorunun yoksa ve ben bu işi yaparım diyorsanız bundan sonrası kolay. Burada asıl konu **Jekyll Nedir** sorusuna bir cevap bulmaktı. Yani muhtemelen Jekyll'e geçmek istediniz ama bir türlü işlerin nasıl yürüdüğünü anlamadınız. Yukarıdaki anlatıklarım umarım bu konuda yardımcı olmuştur. Bundan sonra yapmanız gerekenler şunlar:

1. Sıfırdan bir blog başlamayı düşünüyoranız başta Jekyll'i yerel makinenize kurmalısınız(bu her koşulda yapılmalı). Jekyyl ana sayfasındaki [kurulum notlarına](https://github.com/mojombo/jekyll/wiki/Install) bakabilirsiniz.

2. Jekyll'i kurduktan sonra Jekyll'in [klasör yapısını ve anlamına](https://github.com/mojombo/jekyll/wiki/Usage) bakabilirsiniz. 

3. Jekyll'in altyapısı ve işlevini öğrendikten sonra asıl mesele olan kendi blogunuzu oluşturmaya geldi. Jekyll'de güzel olan kısım ise, bir uygulumanın kaynak koduna bakar gibi blog sitelerin kodlarına bakıp değiştrebilmenizdir. Bu konuda bir süre site var. Örneğin şurada bir çok kullanıcın Jekyll ile yapılmış sitelerini ve kaynak kodlarını görebilirsiniz: [Jekyll kullanıcı siteleri](https://github.com/mojombo/jekyll/wiki/Sites). İsterseniz benim Github'daki bloguma da bakabilirsiniz: [farslan.github.com](https://github.com/farslan/farslan.github.com)

4. Wordpress'iniz varsa ve geçmeyi düşünüyorsunuz [Wordpress to Jekyll](https://www.google.com/search?q=wordpress+to+jekyll) aramasını yapıp bununla ilgili belgelere bakabilirsiniz.

5. [Markdown](http://daringfireball.net/projects/markdown/) veya [Textile](http://en.wikipedia.org/wiki/Textile_(markup_language) öğrenebilirsiniz.



Jekyll konusunda bir uyarı
--------------------------

Jekyll'de RSS'den tuttun da yorumlara kadar her şeyi **kendiniz yerleştirmeniz** gerekiyor. Hatta anasayfa'da üç/dört/beş tane yazı çıkmasını sağlamak bile sizin göreviniz. Sitenin tasarımı, Jekyll konfigurasyonları, eklentileri (örneğin kod renklendirmeleri), gibi bir çok konuyu baştan veya başkalarının şablonlarına bakıp oluşturmanız gerekiyor. Yukarıda verdiğim bağlantılar bu konuda size bir önayak olacaktır.

Bu blogun okuyucusu iseniz muhtemelen bu tarz şeyler sizin için sorun oluşmayacak, ama Wordpress'i basit işler için kullanıyorsanız, Vim'in, Terminal'in yanınından bile geçmediyseniz ve şu ana kadar anlatıklarım ile ilgili soru işaretleriniz oluştuysa elinizi bile vumayın. Çünkü Jekyll terminal, shell, geliştirme gibi konularda aşınalık ve bilgi istiyor. Yani daha doğrusu Jekyll ile uğraşmak istiyor ve kullanmak istiyorsanız bu bilgiler şart.


Jekyll'in avantajları
---------------------

Benim açımdan en güzel yani Github'da hiç bir derdim olmadan kullanabilmek. Blogda kullanacağım resimleri kişisel hostumda tutuyorum. Yorumlarımı da şahane bir yorum hizmeti olan [Disqus](httpp://www.disqus.com) ile yönetiyorum. Diğer kalan tüm işlerim github üzerinde olduğu için çok hızlı ve sorunsuz bir altaypıya sahip oluyorum (hız konusu gibi). 

Bunun dışında yazılarımı Vim ile yazıp, yerelimde istediğim tarayıcıda sitemi anında görebilmek ve yazıyı oluşturduktan sonra basit bir `git push origin master` ile konsoldan github'a yollamak paha biçilmez bir deneyim sunuyor bana. Benim gibi işlerinizin çoğunu konsol üzerinden yapıyorsanız, vim/emacs kullanmayı seviyorsanız, git hastası iseniz Jekyll tam biçilmiş kaftan.

Yorum kısmında yazı ile ilgili düşünceleri ve önerilerinizi yazabilir, aklınıza takılan soruları sorabilirsiniz.





