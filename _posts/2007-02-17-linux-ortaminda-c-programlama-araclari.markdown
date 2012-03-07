---
date: '2007-02-17 22:50:44'
layout: post
slug: linux-ortaminda-c-programlama-araclari
status: publish
title: Linux ortamında C programlama araçları
wordpress_id: '176'
categories:
- Linux
tags:
- c
- compile
- emacs
- gcc
- ide
- jedit
- Linux
- Programlama
- scite
- tea
- vim
---

![C Terminal](http://blog.arsln.org/image/cprogterminal.jpg)Okulda bu sene C ile programla dersini alacağız. Bundan 1 sene önce başlamıştım C ile uğraşmaya, sonra ama nedeni olmayan bir sebebden dolayı bıraktım. Şimdilerde yine bu fırsat ellime geçti, ve okul ile beraber kendimi bu alanda geliştirmeyi düşünüyorum. İleride ise kendi adıma Açık Kaynak camiası için bir program yazıp, bu vesiyle de teşekkür etmiş olacağım. Ayrıca bu sayede öğrendiklerimi pekiştirme ve uygulama fırsatım  da doğacak.

Gelelim **Linux altında C ile programlamak** için hangi araçları kullanabileceğimize. Bunun için bir çok metin düzenleyici ya da IDE'ler mevcut.  Bazıları çok kapsamlı, bazıları ise sade ve pek bir özelliği yok. Size uygun olan hangisi ile onunla yolunuza devam edin. İlk önce en temel bilgi ile başlayalım. C kaynak kodunu Linux altından nasıl derlerim ? Bu sorunun cevabı şu şekilde



Linux altında C kaynak kodlu bir dosyayı derlemek için aşağıdak kodu yazmanız yeterlidir:

`**gcc -o programınadı kaynakkodu.c**`
  


Bu komut ile **kaynakkodu.c** dosyasını derleyebilirsiniz. Herhangi bir hata çıkmadığı taktirde, aynı dizin içinde **programınadı** altında bir dosya oluşturlacaktır. O da bizim çalıştırabilir dosyamızdır. Onu da **./programınadı** şeklinde çalıştırabilirsiniz.



	
  1. **C** kodunu yazmak için elbete çok basit bir Metin düzenleyici de işimizi görür. Fakat şöyle bir dejavantaj var.  Yazdığınız kodu ayırma durumunuz yoktur, ya da syntax renklendirmesi mevcut değildir. Renklendirme çok önemlidir. Bu sayede yazdığın kodları güzel bir şekilde ayırt edebilirsiniz ve hatalarınızı da kolayca görebilirsiniz. Syntax renklendirmesi sağlayan bir kaç tane metin düzenleyici şu şekilde

  

**Scite, Kate, Gedit, jEdit, Tea**
  

Yukarıdaki saydıklarımın hepsinde bu özellik var. Fakat [Scite](http://scintilla.sourceforge.net/) programın bir güzelliği daha var. o da şu. C ile yazdığınız programı direkt programın içinden derleyebilirsiniz. Bu özellik gerçekten çok güzel, yazdığınız programı bu sayede hemen inceleyebilirsiniz. Ayrıca hafif ve sekme özelliği de mevcut. Kate Kde masaüstü yöneticisine ait bir metin düzenleyici, [Gedit](http://www.gnome.org/projects/gedit/) ise Gnome'a ait bir metin düzenleyici. Her ikisi de görevlerini yeterince yerine getiriyor. Hatta çok da güzel programlar haline geldi. İleriki senelerde daha da gelişecektir. Kde ve ya Gnome yüklü olması gerekmiyor, fakat her iki programda da kurulum aşamasında bir kaç kütüphaneye gerek duyulabilir.

[jEdit](http://www.jedit.org/) java ile yazılmış bir düzenleyici. Biraz hantal geldi bana, fakat 150 üzerinde eklenti seçeneği ile hemen hemen her türlü ihtiyaçınızı karşılayabilir. [Tea](http://tea-editor.sourceforge.net/) ise 0.4 mb büyüklüğünde, hafif ve çok sade bir düzenleyici.



	
  2. **Diğer** yandan IDE yani grafiksel olarak bize bir çok araç sunan programlar var. Bunlardan en önemli iki Program ise [Kdevelop](http://www.kdevelop.org/) ve [Anjuta](http://http://anjuta.sourceforge.net/). Kdevelop Kde için, Anjuta da Gnome için. Tabi hangi masaüstü yöneticisini kullanırsanız kullanın, her ikisini de kullanabilirsiniz. Fark etmiyor yani. Bu tip programları kullanmak ilk başta çok karmakarışık gelebilir. Hatta sizin kod yazmanızda bile engel olabilir. Çünkü içinde zilyon tane özellik barındıyor, ve ilk başlangıçta hiç birine ihtiyaçınız yoktur.Fakat ileride büyüp projelere başlarsanız, ya da rahat bir ortam isterseniz sizin için çok uygun olacaktır. Örneğin Konsol ile aynı anda çalıştırabilir. Otomatik fonksyon tanımlama, derleme seçenekleri, etiket sistemi,csv sunucusuna bağlanma gibi bir çok güzel özellikler mevcut. Her ikisini de kurup denedim, benim Anjuta daha çok hoşuma gitti. Kdevelop'da derleme düğmesini bulamadım gitti.


  

	
  3. **Son** olarak da [Vim](http://www.vim.org/) ve [Emacs](http://www.gnu.org/software/emacs/) tarzında bir şey kullanabilirsiniz.İkisini de en sona bıraktım çünkü kullanması yeni başlayanlar için kabus haline gelebilir. Bu iki "araç" ilk başta herkesin gözünü korkutabilir. Özellikle Vim'in kullanımı gerçekten apayrı bir şey. Fakat sadece başlangıç için. Bu iki araçtan birini seçerseniz, başlangıçta çok zor bir süreç sizi bekleyebilir. Alışma aşamasında hatta vazgeçebilirsiniz bunları kullanmaktan, fakat sabrederseniz ve devam ederseniz, ileride ektiğiniz meyveleri toplarsınız.

Araç diyorum çünkü gerçekten çok değişik özelliklere sahip Vim ve Emacs. Programcıların olmazsa olmazlarından diyebilirim. Vim kullanan Emacs kullanmaz, Emacs kullanan ise Vim kullanmaz. Yıllardır da bu iki araç arasında amansız bir rekabet var.Vim'e gelirsek. Vim kendi içinde C programlamak için işinizi kolaylaştıran özellikle barındırıyor. Bunları bir sonraki yazımda "V ile C programlama" altında anlatacağım. Zaten Vim deyince akan sular durur. Çok kapsamlı ve ayrı bir olay. Öğrenmesi zamanınızı alabilir.




Sonuç olarak başangıçta normal düz metin düzenleyiciler ile başlayın, Kate ve ya Gedit bunun için uygundur. Sonraları ise büyük projelerde Kdevelop ya da Anjuta kullanmanızı tavsiye ederim. Vim ve ya Emacs konusuna gelirsek, her ikisinin de kulvarı farklı, çok azimli iseniz o zaman Vim'e bir şanş tanıyın derim. Yoksa hiç bulaşmayın. Emacs Vim'e göre başlangıçta daha kolaydır kullanımı. Bu iki araçı anca  ilerledikce ve kullandıkça ne kadar güçlü olduğunu anlayabilirsiniz. Sonra da vay be altımda böyle enfes bir program varmış da benim haberim yokmuş diyebilirsiniz. Karar sizin :)
