---
date: '2010-09-23 09:25:57'
layout: post
slug: vimde-goreceli-numaralar-relative-numbers
status: publish
title: Vim'de göreceli numaralar (relative numbers)
wordpress_id: '738'
categories:
- Gezegen
- Programlama
tags:
- ipucu
- vim
---

Vim 7.3 sürümü ile göreceli numaralar kullanabiliyoruz. Aşağıdaki satırı eklemeniz gerekiyor .vimrc'ye:

**set relativenumber
**
Bu ne anlama geliyor peki ? Bundan sonra bulunduğunuz satır her zaman **"0"** değerini alıyor. **hjkl** gibi yön değiştirme tuşlarını kullanırken, ya da 8 satır birden silecekseniz, küçük bir matematik hesabı yapmanıza gerek kalmayacak. Sadece **:satırnumarası** kullanırken gerçek satır numaralarını yazmanız gerekiyor, onun yerine doğrudan **5j **gibi işlemler ile istediğiniz satıra gidebilirsiniz. Genelikle çalışılan alandaki satırlar dışına pek çıkılmadığından mantıklı görünüyor. Benim şimdiden olmazsa olmaz özelliklerimin arasına girdi. Aşağıda bununla ilgili ekran görüntüsünü görebilirsiniz:
[![](http://blog.arsln.org/wp-content/uploads/vim_relativenumbers.png)](http://blog.arsln.org/wp-content/uploads/vim_relativenumbers.png)
