---
date: '2007-06-03 13:47:59'
layout: post
slug: fdm-mutt-ve-msmtp-ile-e-postalarinizi-daha-verimli-ve-duzenli-kullanin
status: publish
title: Fdm, Mutt ve Msmtp ile e-postalarınızı daha verimli ve düzenli kullanın
wordpressid: '250'
categories:
- Gezegen
- Linux
tags:
- Archlinux
- e posta
- fdm
- howto
- ipucu
- Linux
- mail
- msmtp
- mutt
- muttrc
---

Finaller bitti sonunda, ve bende üstümden kalkan bu yük sonucunda uzun zamandır kullanmadığım, ama kurup kullanmak istediğim bir çok uygulamayı tekrar kullanmaya karar verdim. Bunlardan biri de öncelerden kullandığım ve ondan bu yana onun gibi bir uygulama bulamadığım [Mutt](http://www.mutt.org)'dur. Mutt'u daha önce Exim4, Procmail ve Fetchmail ile kullanmıştım. Şimdilerde bir çok şey değişmiş. _(Resim: [LinuxBrit](http://linuxbrit.co.uk/mutt/))_

![Mutt](http://blog.arsln.org/image/mutt_index2.png)


Fetchmail ve Procmail yerine [Fdm](http://fdm.sourceforge.net/) kullandım. Tek bir programla mailleri topluyorum ve filtreleyebiliyorum. İlk başta biraz uğraştırdı fakat Google sağolsun bir çok şeyi buldum. Mail yollamak için de [Msmtp](http://msmtp.sourceforge.net/) kullandım. Ufak bir yazılım ve kolayca kurdum. İşleyiş olarak fdm > mutt > msmtp şeklidnde gidiyor.  Ardından da dosyaları düzenleme başladım. Muttrc'ye ne kadar zaman ayırdığımı bilmiyorum, ama daha çok şey var yapmam gereken. Bu yüzden Mutt kullananlar muttrc'lerini paylaşabilirler çok sevinirim :)  

Her neyse gelelim Archlinux altında nasıl bu işleri hallettiğime. İlk önce tüm paketleri kurdum. 

` pacman -S fdm mutt msmtp urlview`

ardından sırayla teker teker dosyaları düzenledim. Dosyalar ilk başta oluşturulmadığı için teker teker oluşturdum. Dosyaları kendin bilgileriniz doğrultusunda değiştirin. Zaten çok açıklayıcı bir söz dizimine sahip. Kısa kısa notlar da ekledim. Dosyaları sırayla şu şekilde:



**~/.fdm.conf**

[source:xml]

## Klasörlerin yerini belirmek için
$mail = "/mnt/yedek/mail"

## Burasını tam anlamadım, araştırmam lazım
action "drop" drop

## Klasörler oluşturuluyor. Mail-sistemi olarak maildir kullandım

action "inbox" maildir "${mail}/inbox"
action "sent" maildir "${mail}/sent"
action "trash" maildir "${mail}/trash"
action "spam" maildir "${mail}/spam"
action "draft" maildir "${mail}/draft"

action "yedek" maildir "${mail}/yedek"
action "murekkep" maildir "${mail}/murekkep"
action "arslanlarsehri" maildir "${mail}/arslanlarsehri"

action "linux" maildir "${mail}/linux"
action "linux-masaustu" maildir "${mail}/linux-masaustu"
action "linux-programlama" maildir "${mail}/linux-programlama"
action "linux-sohbet" maildir "${mail}/linux-sohbet"

## Mail hesabları belirleniyor. Gmail için pop3s, diğerleri için pop3 kullanılması lazım. Istenildiği kadar eklenebiliyor

account "lala hesabı" pop3s server "pop.gmail.com" port 995 user "lalala@gmail.com" pass "şifre"
account "hede hesabı" pop3s server "pop.gmail.com" port 995 user "hedehede@gmail.com" pass "şifre"

## Spam dosyalarını spam klasörüne yolla
match "^X-Spam-Status: Yes" in headers action "spam"

## Filtreler belirleniyor. Bir çok düzenleme yapılabiliyor. Son 4'ü mail-listeleri için

match "^FROM:.*wordpressid@blog.arsln\\.org" in headers action "arslanlarsehri"
match "^FROM:.*wordpressid@murekkep\\.org" or "^FROM:.*murekkep@murekkep\\.org" in headers action "murekkep"

match "^To:.*linux@liste.linux.org.tr" in headers action "linux"
match "^To:.*linux-masaustu@liste.linux.org.tr" in headers action "linux-masaustu"
match "^To:.*linux-programlama@liste.linux.org.tr" in headers action "linux-programlama"
match "^To:.*linux-sohbet@liste.linux.org.tr" in headers action "linux-sohbet"

## Yukarıdakiler haricindekilerin hepsi "inbox" klasörüne yönlendirilsin

match all action "inbox"
[/source]

**~/.msmtprc**

[source:xml]
account default
host smtp.gmail.com
from sabutay@gmail.com
user sabutay@gmail.com
password hedehöde
port 587
auth on
tls on
tls_trust_file /home/fatih/.authenticate/ca.pem 

account fatihliste
host smtp.gmail.com
from fatih.liste@gmail.com
user fatih.liste@gmail.com
password hedehöde
port 587
auth on
tls on
tls_trust_file /home/fatih/.authenticate/ca.pem
[/source]

Gmail kullananlar bir şey daha yapması gerekiyor. Bunu da Archlinux wikisi sayesinde öğrendim. Yoksa çalışmıyordu. Belli bir sertifika varmış, onu indirip, msmtp'ye tanıtırmanız lazım. Yukarıdaki örnekte gördüğümüz gibi benimkini yeri belli. Bunu yapmak için de şu komutları yazmanız yeterli

[source:xml]
mkdir ~/.authenticate
chmod 0700 ~/.authenticate
wget --no-check-certificate https://www.verisign.com/support/thawte-roots.zip
unzip -p thawte-roots.zip 'Thawte Server Roots/ThawtePremiumServerCA_b64.txt' > ~/.authenticate/ca.pem
chmod 0600 ~/.authenticate/ca.pem
[/source]

Yukarıdaki örnek esmtp sayfasından alıntıdır. Fakat wget için bir ibare eklemek zorunda kaldım, ve sertifikanın adı değiştiği için onu da değiştirmem gerekiyordu. Kısaca indirip, home dizini içinde bir yere kaydediyor. Bunu da .msmtprc dosyasında belirtiyoruz.

**~/.muttrc**

[source:xml]
set mbox_type=maildir

set mbox="/mnt/yedek/mail/yedek"  		## İnbox'a gelen mail'ler buraya geliyor
set spoolfile="/mnt/yedek/mail/inbox"	## Ana klasörünüz
set folder="/mnt/yedek/mail/"			## E-posta dizini
set record="/mnt/yedek/mail/sent/"		## Yollanmış e-postaları buraya kaydet
set postponed="/mnt/yedek/draft"		## Taslakları buraya kaydet

## Hook ayarları. Hook ayarları ile Mutt'u daha ayrıntılı şekilde ayarlayabiliriz. Aşağıdaki örnekteki gibi.

folder-hook . set sort=threads 	## Tüm klasörleri thread olarak göster, yani mail listelerine uygun bir şekilde
folder-hook /mnt/yedek/mail/inbox set sort=date-received ## Fakat inbox dosyasını geliş tarihine göre sırala 

## Tüm gönderiler için standart e-postamı kullanan, fakat listeler için ayrı olsun

set pager_index_lines=10  		## Yukarıda 10 satır indexi gösterir.
set fast_reply 					## Başlığı sormadan cevapla.
set nomark_old					## Mutt'u kapanınca okunmamış e-postaları okunmuş olarak işaretleme 
set charset=utf-8  				## Türkçe karakter için
set user_agent 					## User-agent bilgilerini mail'e ekliyor
set delete=ask-yes				## Onaylanmış olarak sor, doğrudan entere basınca siler
set editor="vim"				## Metin Düzenleyici'yi vim olarak belirle
set realname="Fatih ARSLAN"		## Gerçek ismi belirle
set include=yes					## Alıntı yaparak cevapla
set indent_str="> "				## Alıntı formatını belirle
set forward_format="Fwd: %s"	## Forward edilen mesajın başlığını belirliyor
set askcc=no					## CC satırını sorma
set check_new=yes				## Klasörlerde yeni mail'lere bakıyor
set mail_check=5				## Her 5 saniye'de bir kontrol et
unset edit_headers				## CC, BCC gibi şeyleri sorma
set signature="~/.signature"	## İmzanın yerini belirt

### Header Bilgilerim

my_hdr X-Operating-System: `uname -sr`
my_hdr X-JabberID: sabutay@gmail.com
my_hdr X-Homepage: http://blog.arsln.org

### Aliaslar için

set alias_file=~/.muttalias
set sort_alias = alias
source  ~/.muttalias

### Header bölümünde sadece "from", "resent-from" "reply-to",
### "x-mailer" "user-agent" "date" "to" "cc" ve"subject" olacak

ignore *
unignore from resent-from reply-to x-mailer user-agent date to cc subject

### Header sıralamasi nasıl olsun?

hdr_order From: Resent-From: Reply-To: X-Mailer: User-Agent: Date: To: Cc: Subject:

### Mailbox listesi:
mailboxes +inbox +arslanlarsehri +murekkep +yedek +linux-programlama +linux +linux-sohbet +linux-masaustu 

### Hangi mail-listelerine üye isek onları buraya yazıyoruz.
subscribe linux linux-masaustu linux-sohbet linux-programlama 

## Tuş atamalar, değişkenler

macro index G "!fdm fetch\n"   "Fdm'yi çalıştırır"
macro pager    G "!fdm fetch\n"   "Fdm'yi çalıştırır"

macro index \cb   "|urlview\n" "Bağlantıları urlview ile tarayıcımıza aktarır"
macro pager \cb   "|urlview\n" "Bağlantıları urlview ile tarayıcımıza aktarır"

bind index c change-folder
bind pager c change-folder
bind index y next-new

macro index S "| spamassassin -r" "E-posta'yı spam olarak işaretle"

### E-postalar hangi programla yollanacak ? Burada msmtp olarak ayarladık. 
set sendmail="/usr/bin/msmtp" 
set use_from=yes
set sendmail_wait=0          
set from=sabutay@gmail.com
set envelope_from=yes 
set realname="Fatih ARSLAN"

### Mutt renklendirme(Daha ayrıntılı bakmam gerekiyor)

color normal default default
color hdrdefault cyan            default
color signature green           default
color attachment brightyellow    default
color indicator brightyellow    default
color quoted green           default
color quoted1 white           default
color tilde blue            default
color tree red             default
color body cyan            default "[-a-z_0-9.%$]+@[-a-z_0-9.]+\\.[-a-z][-a-z]+"
color body              brightwhite     default "(http|ftp|news|telnet|finger)://[^ \">\t\r\n]*"
color body              brightwhite     default "mailto:[-a-z_0-9.]+@[-a-z_0-9.]+"
color header            brightmagenta   default ^(Date):
color header            brightyellow    default ^Subject:
color body              brightred       default " [;:]-*[)>(<|]" 
[/source]

Muttrc'yi düzenlemek en çok vaktimi aldı. Onlarca .muttrc dosyası inceledim, ve belki sadece %20 kısım'ı halletmişimdir. Çünkü aşırı derece düzenleme mevcut. Hemen hemen herşeyi değiştirebiliyorsunuz. Yukarıdaki dosyamda yardımcı olsun diye çoğunluk hepsinin üstüne, sağına notlar ekledim. Onun haricinde urlview programını kurdum bu sayede mutt içindeki bağlantıları Firefox içinde açabilecektim. Fakat denediğimde lynx'de açtığını gördüm. Biraz araştırınca url-handler.sh adında bir dosyayı değiştirmek gerektiğini gördüm, o da /usr/bin altında. Onu da Firefox'u açacak şekilde ayarladım.

[source:html]
https_prgs="/opt/firefox/firefox:XW"
http_prgs="/opt/firefox/firefox:XW"
[/source]

Bunun haricinde **.muttalias** adında ayrı bir dosya oluşturdum, buraya da mail adresleri kaydediyorum. Bunu kolayca a tuşu ile yapabilirsiniz. Sonra e-posta adreslerini kolayca .muttalias dosyasına kaydediliyor. Mail gönderim için  tuşu ile aliaslar arasında seçim yapabilirsiniz. Onun haricinde kullandığım Xfce sisteminde bir kaç değişiklik yaptım. Panel'e maildir dosyalarını gözlemleyen bir mail bildirici ekledim. Yeni e-posta'ları bu sayede anında görebiliyorum. Gelen mail'leri açmak için de bir kısayol ekledim. Ctrl + 2 tuşu ile Terminal içinde Mutt açılıyor(terminal -e 'mutt -y'). Okuyorum, ve q tuşunu bastığımda mutt terminal ile birlikte kapanıyor. Daha verimli olamazdı benim için.

Evet hepsi bu kadar. Mutt kullanımına girmeyeceğim çünkü çok uzun bir konu, belki başka bir yazımda ufak tefek şeyler anlatabilirim. Mutt hakkında sorularınız varsa bu yazı altında bildiğim kadarıyla cevaplamaya çalışırım.  
