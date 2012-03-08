---
date: '2007-04-17 19:02:56'
layout: post
slug: rss-beslemesinin-indexlemesini-engelleyin-feedburner
status: publish
title: Rss beslemesinin indexlemesini engelleyin (Feedburner)
wordpressid: '222'
categories:
- Bilişim
- Blog
tags:
- Blog
- eklenti
- feedburner
- seo
- wordpressid
---

Bugün SEO ile ilgili bir kaç yazı okurken, **duplicate content**, yani kopyalanmış, çift girdilerin Google için negatif bir etken olduğu yazılıyordu. Google bu tip siteleri Spam olarak algılıyor, ve arama sonuçlarına dahil etmeyebiliyor. Buna dikkat edilmeli, hatta sitenizi ona göre düzenlemeniz gerekiyordu. Burada başka büyük bir etken ise, [Mürekkep.org](http://www.murekkep.org)'da da yaşadığım bir olay. Google'da mürekkep içindeki herhangi bir girdiyi aratırsanız, çoğu girdide, girdinin kendisi yerine, Feedburner'deki Rss beslemesinin içeriğini verdiğini görürsünüz. Google rss beslemeleri de indexliyordu. Bu da zaten direkt **duplicate content** olayına girdiği için, Google Mürekkep'i spam site olarak işaretleyebiliyor(_belki bu yüzden Mürekkep.org'a hiç ziyaretci gelmiyordur_). 


![noindex.jpg](http://arsln.org/image/noindex.jpg)

Bunu engellemek için [Feedburner](http://www.feedburner.com), Publicize sekmesi altında **NoIndex** altında bir hizmet sunuyor. Bu hizmet sayesinde Rss beslemesinin Arama motorları tarafından indexlenmesini engeleyebiliyorsunuz. Uzun zamandır mevcut olan bu özelliği bugün keşfettim. Hem Mürekkep için, hem de Arslanlar Şehri için bu hizmeti aktif hale getirdım. Başka bir seçenek ise [şuradaki](http://www.joostdevalk.nl/code/wordpressid/noindex-feed/) eklentiyi indirip, kurmaktır. Bu sayede Rss beslemelerinizi indexlemeye karşı koruyabilirsiniz. Ayrıca Feedburner forumlarında da bir [ipucu](http://forums.feedburner.com/viewtopic.php?t=13004) mevcut. 
