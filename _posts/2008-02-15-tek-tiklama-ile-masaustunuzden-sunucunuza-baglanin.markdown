---
date: '2008-02-15 00:45:06'
layout: post
slug: tek-tiklama-ile-masaustunuzden-sunucunuza-baglanin
status: publish
title: Tek tıklama ile masaüstünüzden sunucunuza bağlanın
wordpressid: '391'
categories:
- Gezegen
- Linux
tags:
- gnome
- ipucu
- launcer
- Linux
- ssh
- ubuntu
---

Su aralar Gnome kullandığım için, daha önce bilmediğim bir kaç özellik öğrenmiş oluyorum. Gün içinde bir çok kez sunucuya bağlanıp işlerimi düzenliyorum. Bunu da genellikle konsol üzerinden ssh ile doğrudan yaparım(özellikle wordpressid güncellemelerinde) ya da dosya aktarımları  için **Gftp** kullanarak hallederim. Fakat bazen öyle oluyor ki hemen anında bir tane dosyayı atmam gerekiyor. 

Şimdi Gnome'da masaüstüne ya da herhangi başka bir dizine sunucunuz için özel bir klasör düzenleyebiliyorsunuz. Bu klasöre tıkladığınız an, sunucu ile bağlanıp sanki normal masaüstündeymiş gibi kullanabiliyorsunuz. Bu özellikle benim açımdan baya yararlı bir şer olduğu için hem arsln.org hem de murekkep.org için iki tane klasör hazırladım. İşin ilginç yanı bu özelliği tamamen şanş eseri buldum. Şimdi tek yapamız gereken masaüstüne sağ tıklayarak **"Create Launcher ..."** ibaresine tıklamak

![launcher.png](http://arsln.org/image/launcher.png)

, ve aşağıdaki gibi doldurmaktır:

![screenshot-create-launcher-2.png](http://arsln.org/image/screenshot-create-launcher-2.png)

Burada tek önemli olan kısım command kısmıdır. Normalede konsoldan **ssh kullanıcıismi@domain.org** gibi bir komutla bağlanmanız mümkün, burada da mantık aynı. Ayrıca belirli bir klasöre doğrudan giriş yapmak istiyorsanız onu da yapabilirsiniz. Örneğin ben kendim için şu ibareyi kullandım : **ssh://fatih@arsln.org/home/fatih/** . Burada sunucumdaki /home/fatih klasörüne doğrudan giriş yapıyorum. Sunucunuzda birden fazla klasör barındırıyorsanız bu sayede kolay bir şekilde her klasör için ayrı ayır klasörler oluşturmanız da mümkün oluyor. 
