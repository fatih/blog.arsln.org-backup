---
date: '2008-03-14 18:13:46'
layout: post
slug: javaya-nasil-baslanilir
status: publish
title: Java'ya nasıl başlanılır ?
wordpressid: '402'
categories:
- Gezegen
- Linux
- Programlama
tags:
- howto
- ide
- ipucu
- java
- jdk
- jre
- netbeans
- sun
---

![java_logo.gif](http://arsln.org/image/java_logo.gif)Geçen ki [Sun](http://tr.sun.com/) [seminerden](http://arsln.org/sun-ve-google-seminerleri/) sonra [Java](http://www.java.com/tr/)'yı iyice merak etmeye başladım. İnternet'te biraz araştırdıktan sonra çat çut bir şeyler öğrendim. Daha önce C ve biraz Python ile aşinalığım vardı, fakat Java nasıl bir şey ? Derleyicisi nasıl çalışır ? Belirli bir IDE var mı? Bu gibi sorular kafamı meşgul etti. Kısaca benim gibi başlamak isteyenlere kısaca bir kaç şey anlatacağım. [Ubuntuforums](http://ubuntuforums.org/showpost.php?p=4504794&postcount=4)'da biri bunu güzel bir şekilde özetlemiş, onu kendimce çevirip sunuyorum:

Üç tane genel [Java](http://www.java.com/tr/) API'si var, bunlar da şu şekilde:
**
Java Standard Edition(SE) **- Masaüstü Uygulamaları
****Java Enterprise Edition(EE)** - Kurum ve web uygulamaları 
Java Micro Edition(ME)** - Gömülü sistemler için uygulamalar(örneğin cep telefonları)

Genel olarak normal bir kullanıcı bir masaüstü uygulaması programlayacağını düşündüğümüzde Java SE kullanacaktır. Ayrıca iki tane önemli kısımı var Java'nın, bunlar JDK ve JRE:

**Java Development Kit(JDK)**, geliştiricilerin uygulamalar geliştirmesi için gerekli araçları içeriyor.
Java Runtime Enviroment(JRE)**, bu da Java uygulamaların çalışması için gereken ortam.

Bilgisayarınıza bu bileşenlerin en güncel sürümünü kurmanız gerekiyor. Şimdilik en güncel sürümü 6'dır. Linux altında paket yöneticisi ile bunları kurabilirsiniz. Tüm paketleri kurduktan sonra herhangi bir uçbirimi(konsol'u) açıp şu komutu girerek kurulu olup olmadığına bakıyoruz:

**java -version**

Bendeki çıktı:

**fatih ~ $  java -version
java version "1.6.0_03"
Java(TM) SE Runtime Environment (build 1.6.0_03-b05)
Java HotSpot(TM) Server VM (build 1.6.0_03-b05, mixed mode)**

Evet her şey kurduk ve artık Java geliştirmeye hazırız. Tek eksiğimiz bir tane metin editörü, ya da sizin işinizi kolaylaştıracak IDE'ler. Piyasa'da meşhur olan iki tane büyük IDE var, bunlar [Eclipse](http://www.eclipse.org/) ve [Netbeans](http://www.netbeans.org/). Ben kendi bilgisayarıma Netbeans kurdum, isterseniz diğerini de kurabilirsiniz. Tıpkı Vim ve Emacs gibi seveni çok olduğu için hangisinin daha iyi olduğuna siz karar veriniz. Bazı Linux dağıtımlarında hâlâ 5.5 var, bazılarında ise 6.0.1 sürümü mevcut. 5.5 var ise doğrudan sitesine girip indirin. İndirdikten sonra

**chmod +x netbeans-6.0.1-ml-linux.sh
./netbeans-6.0.1-ml-linux.sh**

adımlarını konsoldan girerek kurunuz. Gerçekten çok kolay bir kurumu var, istediğiniz yere de kurabilirsiniz. Ayrıca daha önce 5.5 kurduysanız hiç bir şekilde ona müdahale etmeyecektir. Şimdi tek yapmanız gereken iyi bir kitap alıp çalışmaya başlamak. Kitap yerine İnternet'te de bir çok Java belgesi bulabilirsiniz.



 


