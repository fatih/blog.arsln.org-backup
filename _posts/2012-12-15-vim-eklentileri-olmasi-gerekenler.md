---
date: '2012-12-15 15:45:00'
layout: post
slug: vim-eklentileri-olmasi-gerekenler
status: publish
title: Vim eklentileri (olması gerekenler)
---

Vim altında eklenti yazmak ve kullanmak başlı başına bir alan. Çok güçlü ve her
türlü işi yapmanıza olanak sağlıyor. Aslında eklenti demek bile anlamsız çoğu
zaman. Bunların her birini her gün defalarca kez kullanıyorum. Beni çok
hızlandırdığı gibi dakikalar süren işlemleri saniyeler içinde yapmamı da
sağlıyor. Uzun vadede ne kadar yararlı olduğunu anlatamam bile. Bu yüzden
kullandığım bu eklentileri bu yazıda ayrıntılı bir şekilde anlatmaya
çalışacağım. 

Tüm eklentilerin ana başlığına tıklayarak ulaşabildiğiniz gibi, hepsini birden
kullamak istiyorsanız benim düzenli olarak bakımını yaptığım ve bir sürü hatadan
arındırılmış **dotfiles** deposundan da indirip kullanabilirsiniz.  **Mac ve
Linux** altında çalışacak şekilde düzenlendi (Mac ve Linux'a özgü ifdef'ler
mevcut vimrc'de).  

[github.com/farslan/dotfiles](https://github.com/farslan/dotfiles)

Yazıya başlamadan önce bir ayrıntıyı değineyim. Vim'de kısa yolları modife etmek çok
kolay, bunun için de **leader** diye bir özellik de mevcut. `vimrc` de böyle bir
değişken tanımlayıp bir karakter atayabiliyorsunuz (örneğin benim **leader** tuşu
`,` karakteri.) 

Kullandığım eklentiler ile hep bu tuş ile kullanıyorum, bu yüzden de
örneklerimde hep `,a` , `,,w`, `,g` vs.. gibi kombinasyonlar göreceksiniz.
Örneğin `,n` kombinasyonu önce `,` tuşuna sonra da `n` tuşuna basmak anlamına
geliyor. 

---

## [ack](https://github.com/mileszs/ack.vim)

Bu en sevdiğim eklentiler arasında ilk beşe girer.
[ack-grep](http://betterthangrep.com/) adında, `grep` tarzında bir uygulama var.
Kullanmadıysanız tavsiye ederim. Bu **grep**'ten farklı olarak öntanımlı olarak bir
çok önemli parametlerle geliyor, örneğin recursive olması,.svn ve .git gibi
klasörleri atlaması, binary'leri atlaması,vs..

Bu eklenti ile doğrudan vim altından `ack-grep` çağırabiliyorsunuz. Bunu ben `,a`
kısayolun atadım. Herhangi bir kelimenin üzerine gelip `,a` yaptığınızda o
kelimeyi dizinde arıyor ve küçük bir pencere olarak gösteriyor:

![Vim altında ack-grep kullanımı](http://arsln.org/image/blog-vim-ack.png)

Sonra bu pencerede istediğiniz dosyaya `o` tuşu ile geçebiliyorsunuz. En güzeli
de `go` tuşları ile önizleme yapabilmenizdir. Yani 10 tane seçenek geldiyse her
birine `go` basa basa içeriğini görebilmenize imkan sağlıyor. `t` ve `v` tuşları
ile de sekme ve dikey olarak o dosyayı açabiliyorsunuz. Şahane bir eklenti.

## [a](https://github.com/vim-scripts/a.vim)

Kaynak kodlar ile başlık dosyaları (foo.cpp ve foo.h) arasında hızlı geçiş için
kısa yollar sunuyor. Örneğin foo.cpp ile uğraşıyorsam,  `:A` ile doğrudan foo.h
dosyasına geçiş yapıyor(`:A` yaptığımda tekrar eski dosyaya dönüyorum). `:AS,`
`:AV` ve `:AT` ile de dikey, yatay ve sekme şeklinde açabiliyorum.

## [ctrlp](https://github.com/kien/ctrlp.vim)

Bu eklenti sayesinde **ctrl+p** kısa yollu ile herhangi bir dosyaya aniden geçiş
yapabiliyorsunuz. Basit ve kullanışlı. `ctrl+p` yaptıktan sonra ilk 1-2 harfi
yazında kendisi o dizinde bulunan tüm dosyaları getiriyor. Şu şekilde bir şey:

![Vim altında ctrlp kullanımı](http://arsln.org/image/blog-vim-ctrlp.png)

Üç çeşit arama şekli var:

1. Buffer'de bulunan dosyalar 
2. En çok kullandığınız dosyalar (bunun için bir bellek tutuyor)
3. Dizinde bulunan dosyalar 

Bu ayarları istediğiniz gibi değiştirebilirsiniz. Standart olarak dizindeki
dosyaları arıyor, ama **ctrl+f** ile modu değiştirebilirsiniz (ctrlp pencersinde).
Yine sık sık kullandığım `ctrl+s,` `ctrl+v` ve `ctrl+t` kısa yolları ile dosyaları
yatay, dikey ve sekme olarak açabiliyorsunuz.


## [gist-vim](https://github.com/mattn/gist-vim)

[gist.github.com](https://gist.github.com/) servisini doğrudan kullanmanızı
sağlıyor. `:Gist` komutunu çalıştırdığınız anda kendisi tüm dosyayı gist'e aktarıp
sonra da tarayıcıyı açmanızı sağlıyor. Çok basit ve güzel. Şu komutlarını sıkca
kullanıyorum:

* `:Gist`
* `:Gist -p`
* `:'<,'>Gist`
* `:'<,'>Gist -p` 

`-p` seçeneği **"secret"** olarak yolluyor. (Ben bunu özellikle de markdown ile
yazdığım dökümanlara anında preview yapabilmek için kullanıyorum, o an bakıyorum
sonra siliyorum) `'<,'>` de visual ile seçilen kısım anlamını taşıyor. 

Visual moda herhangi bir kod parçasını seçip `:Gist`  yazdığınızda otomatik
olarak eklenir. Yine -p ile dilerseniz "secret" olarak yollama imkanınız var.
`:help gist-vim` ile daha fazla bilgiye ulaşabilirsiniz.

(Bonus: `:Gist -p` ile markdown dosyalarınız için gizli bir Gist oluşturup ön
izleme yapabilirsiniz)

## [gundo](https://github.com/sjl/gundo.vim)

Vim 7.x serisi ile beraber **"undo"** özelliği gelmişti. Şimdi bu undo özelliği
bildiğimiz geri alma özelliklerinden farklı. Eğer vim/vimrc'de `set undofile`
ayarını açtıysanız bu özelliği kullanabilirsiniz. Peki nedir bu özellik?

Bu özellike ile bir dosya üzerinde yaptığınız tüm değişikleri, **dosyayı
kapatsanız** dahi kaydediliyor. Yani örneğin bir değişiklik yaptınız, dosyayı
kaydetip çıktınız. 1-2 gün sonra tekrar açıp bildiğimiz `u` eski haline
getirebilirsiniz (hali derken tabi 10 tane değişiklik yaptıysanız en eski haline
bile getirebilirsiniz)

gundo ise "graphical-undo" anlamına geliyor. Dosya üzerinde yaptığınız tüm
değişiklikleri ağaç formatında gösteriyor:

![Vim altında gundo kullanımı](http://arsln.org/image/blog-vim-gundo.png)

Ben bunu `,g` kısa yolu ile açıp kapatacak şekilde düzenledim. Böylelikle eski
sürümlere bakıp bir sorun olduğunda kolayca geçebiliyorum.

(Bonus: Undofile özelliği ile fazladan istemediğiniz dosyalar oluşuyor. Bunları
`set undodir=/tmp` gibi bir seçenek ile değiştirebilirsiniz.)


## [nerdcommenter](https://github.com/scrooloose/nerdcommenter)

Bu da çok sade ama en çok işime yarayan eklentilerden biri. Herhangi bir kod
parçasını `comment` etmek için kullanıyorum. İki tane kısa yolu var biri
kapatıyor diğeri de açıyor

* `,cc`
* `,c<space>`

Güzel olan ise ön tanımlı olarak bir çok dili otomatik olarak tanıyor ve ona
göre `comment` ediyor kodu. Yani python kodlarının önüne `#` koyuyor, c,cpp
kodlarının önünde `\\` gibi. 

Nerdcommenter çok kapsamlı ve bir çok modu destekleyen tarafları da var.
Genelikle bu tarz eklentilerde bunlara boğulup gidebilirsiniz. `:help
nerdcommenter` ile daha fazla bilgiye ulaşabilirsiniz.


## [supertab](https://github.com/ervandew/supertab)

Vim'in muhteşemem bir completion motoru var. Bunu `ctrl+x` ile çağırabiliyorsunuz
ve sonra istediğiniz completion moda girmenizi sağlıyor(mesela ctrl+f ile `file
completion` moduna girebiliyorsunuz.) Genelikle bir çok dil için completion
eklentileri bulabilirsiniz, her biri bu motoru kullanıyor. Şu şekilde bir şey:

![Vim altında supertab kullanımı](http://arsln.org/image/blog-vim-supertab.png)

supertab ise insert modunda otomatik olarak bu modları kullanmanızı sağlıyor.
Örneğin `/usr/l<tab>` ile otomatik olarak file completionu yapıyor, yani **/usr**
dizindeki dosyaları getiriyor tab'e bastıkça. Bir çok ayrıntı özelliği de var.
Olmazsa da olur bu eklenti, ama daha da güzelleştiriyor.

## [easymotion](https://github.com/Lokaltog/vim-easymotion)

Vim'deki kelime bazlı "motion" düzenkelerini kolaylaştıran bir eklenti. Örneğin
normalde **j,k,w,b,e,f,t,d,vs..** gibi envai çeşit tanımlar vim ile dolaşabilir
ve gerekirse bunlar üzerinde işlemler yapabilirsiniz. 

**Easymotion** gezmeyi daha da kolaylaştırıyor. `,,w` ile doğrudan "w" bazlı motion
üzerinden bir harf haritası çıkartıyor, yani kelime bazlı. Sonra istediğiniz
kelimeye tek bir tıkla geçebiliyorsunuz. Örnek

    <imleç>Lorem ipsum bir başka olabilirdi

İmleç Lorem kelimesinin önünde dururken `,,w` basarak şu şekile getiriyorsunuz:

    <imleç>Lorem {a}psum {b}ir {c}aşka {d}olabilirdi

`c` tuşuna basarak "başka" kelimesine geçiyorsunuz. Aşağıda örnek bir görüntü
görebilirsiniz:

![Vim altında easymotion kullanımı](http://arsln.org/image/blog-vim-easymotion.png)

## [surround](https://github.com/tpope/vim-surround)

Surround eklentisi ile bir kelime ya da satırı belirli bir karakter ile
kapatabilirsiniz. Örneğin

    foo

kelimesini `ysw"` kombinasyonu ile

    "foo"

haline getirebilirsiniz. Ya da `yss"` ile tüm satırı kapatabilirsiniz. Hangi
karakter ile kapatmak istediğiniz size bağlı. Syntaxı berbat ama yine Vim'in
motion'larını desteklediği için idare edilebilir. Bir sonraki eklenti ile daha
bir anlamlı hale geliyor.

## [repeat](https://github.com/tpope/vim-repeat)

Bir önceki "surround" özelliğini tekrar tekrar yapmak işkence olacaktır. Mesela
birden fazla kelime veya satır için. Normalde `.` karakteri ile Vim'de bir
önceki "motion" tekrarlayabiliyorsunuz. Mesela `yy` ile bir satırı
kopyaldıysanız tekrar `.` ile bir sonraki klasörü kopyalaybilirsiniz. Kendisi
otomatik olarak son yaptığınız hamleyi yapıyor.

repeat ise bu `.` özelliğini daha da güçlü bir hale getiriyor. Surround gibi
eklentiler ile uyumlu bir şekle getiriyor. Böylelikle `.` ile kolay bir şekilde
kelimeleri veya satırları istediğiniz karakterle kapatabilirsiniz (yani tekrar
tekrar aynı tuş kombinasyonları girmenize gerek yok)


## [tagbar](http://majutsushi.github.com/tagbar/)

ctags, exuberant ctags, etags, vs.. gibi "tags" üreten uygulamalar için ayrı bir
pencere açıyor. Böylelikle kullanılan modüller, fonksiyonlar, macrolar,
enum'lar,vs.. gibi envai çeşitle bilgiyi tek bir hamlede görebilirsiniz. Bunu
ben `,b` tuşu ile kapatıp açıyorum. Görüntüsü ise şu şekilde bir şey:

![Vim altında tagbar kullanımı](http://arsln.org/image/blog-vim-tagbar.png)

(Dipnot: ctags özelliği ile dahili vim-ctags özelliği ile fonksiyonlar ve
ilintili dosyalar arasında kolayca geçiş yapabilirsiniz.)

## [autoclose](https://github.com/Townk/vim-autoclose)

Bu otomatik olarak parantez, kesme işaret,.. gibi karakterleri kapatıyor.
Örneğin `[` karakteri yazdığınızda `]` otomatik olarak ekleniyor. Ayrıca `"`
 `'`, gibi bir sürü karakter de tanımlamak mümkün. 

Güzel bir kaç özelliğe de sahip. Örneğin `"` karakterini eklediniz, kendisi
gitti bir tane daha ekledi. Siz arasını doldurmaya başladınız ve ikinci `"`
karakterin sonuna geldiniz. Burada insert modundan çıkıp `"` karakterini eş
geçeceksiniz. Ama autoclose'de bunu yapmanıza gerek yok, `"` karakteri
yazdığınızda doğrudan onu eş geçmiş olursunuz. 

Ya da iki karakter arasında iseniz ve insert modunda ilkini sildiyseniz diğeri
de otomatik olarak siliniyor.

## [fugitive](https://github.com/tpope/vim-fugitive)

Git deposu için ara sıra kullandığım bir eklenti. Kurduktan sonra herhangi bir
git deposunda (ki sadece bir git deposunda çalışır, git deposu yoksa : ile
çağıramazsınız).

* `:GStatus` ile değişen dosyaları ve sonrasında + ve - tuşları ile istediğim
dosyaları staging alanına ekleme imkanı sunuyor
* `:Gcommit` ile commit için gerekli alanı oluşturup depoya commit etmemi sağlıyor
* `:Gdiff` yana yana olarak son değişiklikleri gösteriyor (ki bu pek sorunlu
  gerçi)
* `:Git` ile git komutunu doğrudan çalıştırıp, push, pull gibi işlemlere olanak
  sağlıyor
* vs..

:Gstatus'u çalıştırıca çıkan bir ekran görüntüsü:

![Vim altında fugitive kullanımı](http://arsln.org/image/blog-vim-fugitive.png)

Normalde terminal'den ya da gui ile kullanıyorsanız bir sorun yok. Ama
MacVim ya da GVim ile güzel bir şekilde çalışıyor. Bir sürü fazla özelliği de
var. Dediğim gibi çok sık kullanmıyorum(tig + terminal ikilisini tercih
ederim) ama yine de MacVim gibi arayüzlerle iyi oluyor.

## [nerdtree](https://github.com/scrooloose/nerdtree)

**Nerdtree** başta güzel gözüken, ama pek kullanılmayan, sonra şuna bir daha göz
atayım diyerek aşık olabileceğiniz bir eklenti. Benim olmazsa olmazlardan biri
haline geldi. Yaptığı ise bulunduğunuz dizini ağaç şekilde sol tarafta
göstermesi:

![Vim altında nerdtree kullanımı](http://arsln.org/image/blog-vim-nerdtree.png)

Hemen hemen her IDE'de olan bir şey gibi düşünebilirsiniz, ama nerdtree'nin
güzelliği doğrudan Vim içinden kolayca klasör oluşturma, yer imi oluşturup
onlara hızlıca geçme, istediğiniz dosya veya klasörü ayrı sekmelerde ve ya
dikey,yatay pencerelerde açma imkanı sunmasıdır. 

Kullandıkça eliniz, ayağınız oluyor. Bunu `,n` tuşuna atadım ve kolayca kapatıp
açabiliyorum.

(Bonus: Macvim altında mouse ile normal dosya yöneticisi gibi gezebiliyorsunuz!)

## [powerline](https://github.com/Lokaltog/vim-powerline)

Powerline için çok söze gerek yok, **Insert, Normal, Recording, Visual, Tagbar,
Nerdtree, Ctrlp, Gundo,vs..** gibi envai çeşit mod için farklı renklendirme
özelliğine sahip. Yukarıda şu ana kadar paylaştığım tüm ekran görüntülerinde en
alta renkli renkli olarak mevcut

Kesinlikle tavsiye ederim. 

(Dipnot: Mac altında dotfiles/stuff'daki "Source Code Pro for Powerline" fontunu
kurarsanız "fancy" modundaki grafiksel özellikleri de görmüş olursunuz)

---

Hepsi bu kadar. Dotfiles klasöründe yukarıdakilerden farklı eklentiler de
mevcut, onlar genelikle renklendirme, dosya tanımı,vs.. gibi işler olduğundan
anlatmadım.

Bir sonraki yazımda sıkca kullandığım, bilin(mey)en Vim özelliklerini anlatmayı
düşünüyorum. Kullandığız değişik ve güzel Vim eklentileriniz varsa yorum
kısmında belirtebilirsiniz.





