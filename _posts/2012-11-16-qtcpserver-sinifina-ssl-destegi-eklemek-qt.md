--- 
date: '2012-11-16 14:25:46'
layout: post
slug: qtcpserver-sinifina-ssl-destegi-eklemek-qt
published: true
title: QTcpServer sınıfına SSL desteği eklemek (Qt)
---

Qt ile yazdığımız bir sunucu uygulaması için SSL desteği eklememiz gerekiyordu.
Bunun için araştırma yaptığımda yine her zamanki gibi karışık ve herşeyi baştan
anlatan bir yazı bulamayınca, şu an okuduğunuz blog yazısı ortaya çıktı.

Sunucumuz [QTcpServer](http://qt-project.org/doc/qt-4.8/qtcpserver.html)
sınıfından üretilmiştir. Genelikle herkes bu temel
sunucu üzerinden kendi sunucularını yazarlar. Burada tek sorun
[QTcpServer](http://qt-project.org/doc/qt-4.8/qtcpserver.html), QTcpSocket
sınıfını kullanıyor. Bu sınıfın da SSL desteği mevcut değil.  Qt API
belgelerine baktığımda bununla ilgili
[QSslSocket](http://qt-project.org/doc/qt-4.8/qsslsocket.html) diye SSL
protokolu kullanan bir sınıf olduğunu gördüm. Bunun için QTcpServer'in
kullandığı üç tane `virtual` fonksiyonu tekrar yazmamız gerekiyor. Bu
fonksiyonlar sırayla şunlar:

*  [incomingConnection()](http://qt-project.org/doc/qt-4.8/qtcpserver.html#incomingConnection)
*  [nextPendingConnection()](http://qt-project.org/doc/qt-4.8/qtcpserver.html#nextPendingConnection)
*  [hasPendingConnections()](http://qt-project.org/doc/qt-4.8/qtcpserver.html#hasPendingConnections)

İlk başta `incomingConnection()` desteğini değiştirelim. 
**QTcpServer** bu fonksiyonu her yeni bağlantıda çağırıyor. Sonra bir tane
**QTcpSocket** oluşturuyor, soket tanımlıyor ve bunu da dahili bir listeye
ekliyor. Bu dahili liste de `nextPendingConnection()` veya
`hasPendingConnections()` gibi fonksiyonlar ile uyum halinde çalışıyor.
Bunların hiç birini siz yapmıyorsunuz. Hepsi otomatik olarak **QTcpServer**
tarafından yapılıyor. SSl desteği için aşağıdaki gibi bunu yeniden yazmamız
gerekiyor(reimplementation):

{% highlight cpp %}
void Server::incomingConnection(int socketDescriptor)
{
	QSslSocket *socket = new QSslSocket(this); 
	socket->setProtocol(QSsl::SslV3);  // TODO: Or other protocols, like tls, sslv2? Research...

	// For now these files should be reside in the same folder as the application
	socket->setPrivateKey("server.key"); // $ openssl genrsa -out server.key 2048
	socket->setLocalCertificate("server.crt"); // $ openssl req -new -x509 -key server.key -out server.crt -days 1095

	if (socket->setSocketDescriptor(socketDescriptor)) {
		pendingConnections->enqueue(socket); // Will be used in nextPendingConnection()

		// newConnection() is emmited within QTcpServerPrivate. No need to emit it manually.
		// However encrypted() is emitted if QSslSocket enters encrypted mode.
		// Useful for debugging or other stuff.
		// TODO: we might need sslErrors() signal implementation
		connect(socket, SIGNAL(encrypted()), this, SLOT(ready())); 

		socket->startServerEncryption(); //  Initiate the SSL handshake
	} 
	else { 
		delete socket; 
	}
}
{% endhighlight %}

Koda yorumlar eklediğimden detaya girmeyeceğim, sadece **pendingConnections**
kısmını anlatayım. **QTcpServer** bildiğiniz gibi kendi listesini tutuyor.  Fakat
bizim `nextPendingConnection()` ve diğer fonksiyonları ile çalışması için
oluşturduğumuz **QSslSocket**i bu listeye dahil etmemiz gerekiyor. Fakat böyle
bir liste olmadığından kendimiz  bir **QQueue<QSslSocket*>** veri tipi oluşturup
ona ekliyoruz. [FIFO veri
tipinde](http://en.wikipedia.org/wiki/Queue_(abstract_data_type)) olduğundan
gelen bağlantıların düzgün bir şekilde gitmesi açısından da önemli. Sırada
`nextPendingConnection()` sınıfı var, onu da şu şekilde
değiştiriyoruz:


{% highlight cpp %}
QTcpSocket* Server::nextPendingConnection()
{
	// Return the next connection in the queue. If there is none,
	// return 0.
	if (pendingConnections->isEmpty()) {
		return 0;
	} else {
		return pendingConnections->dequeue();
	}
}
{% endhighlight %}

Burada gördüğünüz gibi daha önce oluşturduğumuz QQueue listesindeki socketleri
geri dönderiyoruz. Geri dönüş veri tipi QTcpSocket* olması da bir sorun değil,
çünkü QSslSocket de QTcpSocketin bir altsınıfı olduğundan aynı sayılır o
anlamda. Tabi son olarak `hasPendingConnections()` de bu QQueue listesinden dönüş
yapması gerektiğinden onu da şu şekilde değiştiriyoruz:


{% highlight cpp %}
bool Server::hasPendingConnections() const
{
    return !pendingConnections->isEmpty();
}
{% endhighlight %}

Header dosyalarına gerekli olan **QSslSocket, QQueue, vs..** gibi kitaplıkları
eklemeyi unutmayın. Ayrıca pendingConnectionsi de tanımlamaya unutmayın. Bir de
`ready()` diye bir slot var. `incomingConnection(`) sınıfında SSL şifrelemesi
gerçekleştiğinde `encrypted()` diye bir sinyal gönderiliyor. Bende bu slot
içinde sadece bir `qDebug()` çıktısı var ve adı üzerinde debug için
kullanıyorum. Siz kendiniz için kullanabilirsiniz.

Son olarak da sonradan gördüğüm bir yardımcı kitaplıktan bahsedeyim. Bizim
yazdığımız sunucu modifiye edildiğinden bize pek uymuyordu ama
[libqxt](http://dev.libqxt.org/libqxt/wiki/Home) diye Qt eklenti kütüphaneleri
var. Gerçekten güzel bilgiler mevcut. Örneğin network altında doğrudan SSL
kullanan bir tane sunucu sınıfı
[qxtsslserver](http://dev.libqxt.org/libqxt/src/de05d2b60c54a04039dfaafdd54018fab6f24ace/src/network/qxtsslserver.cpp?at=master)
mevcut. Eğer size uygunsa yukarıda yaptığım modifikasyonları yapmadan doğrudan
bunu kullanabilirsiniz.
