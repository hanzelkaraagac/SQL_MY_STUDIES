--UNIQUE kullanimi
CREATE TABLE hastane
(
kimlik_numarasi char(11)unique, --11'den fazlasini yazamayiz. ayni veriyi birden fazla yazamayiz. Fakat 11'den az yazabiliriz.
hasta_adi varchar(20) not null, -- veri olmadan veri girilmez
hasta_soyadi varchar(20) not null, -- veri olmadan veri girilmez
cinsiyet varchar(10),
kan_grubu varchar(5),
giris_tarihi date
);

SELECT * FROM hastane;

INSERT INTO hastane VALUES ('41398207469','Ali','Coban','Erkek','0+','2022-06-03');
INSERT INTO hastane VALUES ('16482708543','Veysel','Deli','Erkek','A+','2022-12-04');
INSERT INTO hastane VALUES ('46987604280','Ayse','Yurekli','Kadin','B+','2022-11-05');
INSERT INTO hastane VALUES ('76349826417','Ayse','Yurekli','Kadin','B+','2022-11-05');
INSERT INTO hastane VALUES ('46923516871','Kemal','Vurucu','Erkek','B+',now());

DELETE FROM hastane WHERE kimlik_numarasi='41398207469';

--PRIMARY KEY
CREATE TABLE veliler
(
veliler_no char (7) PRIMARY KEY,
isim varchar (20), 
soyisim varchar (25),
not_ort real, 
kayit_tarih date
);
SELECT * FROM veliler;

INSERT INTO veliler VALUES ('1234567','Ayse','Polat','45.00',now());
INSERT INTO veliler VALUES ('7654321','Veli','Yilmaz','75.00','2022-01-29');
INSERT INTO veliler VALUES ('2598461','Cem','Aydin','85.00','2022-07-05');

SELECT * FROM veliler;

--PRIMARY KEY-FOREIGN KEY
CREATE TABLE tedarikciler
(
tedarikci_id char (5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);

SELECT * FROM tedarikciler;

CREATE TABLE urunler (
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler(tedarikci_id)
);

SELECT * FROM tedarikciler;
SELECT * FROM urunler;

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun.
“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. 
“adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id char(15)PRIMARY KEY,
isim varchar(30) unique,
maas int NOT NULL,
ise_baslama date
);

SELECT * FROM calisanlar;

CREATE TABLE adresler
(
adres_id char(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

SELECT * FROM calisanlar;
SELECT * FROM adresler;

INSERT INTO calisanlar VALUES ('1940','Hanzel','20000','2008-11-05');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');


INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');


-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');


-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');



--CHECK CONSTRAINT
--CHECK ILE BIR ALANA GIRILEBILECEK DEGERLERI SINIRLAYABILIRIZ

CREATE TABLE calisanlar2
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);
SELECT * FROM calisanlar2;

INSERT INTO calisanlar2 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10003', 'Husnu Coban' ,15000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10004', 'Asik Veysel' ,18000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10005', 'Sezai Kardesler' ,25000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10006', 'Malik Bin Halit' ,19000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10007', 'Tomris Sahana' ,3000, '2018-04-14'); -- Bunu eklemez cunku 10000'in altinda


--DQL -- WHERE KULLANIMI
SELECT * FROM calisanlar;
SELECT  isim FROM calisanlar;

--Calisanlar tablosundan maasi 5000'den buyuk olan isimleri listeleyiniz.
SELECT isim,maas FROM calisanlar WHERE maas>5000;

-- Calisanlar tablosundan ismi Veli Han olan tum verileri getiriniz.
SELECT * FROM calisanlar WHERE isim='Veli Han';

-- Calisanlar tablosundan maasi 5000 olan tum verileri listeleyiniz.
SELECT * FROM calisanlar WHERE maas='5000';


--DML --DELETE KOMUTU
DELETE FROM calisanlar; --Eger parent tablo baska bir child tablo ile iliskili ise once child table silinmelidir.
DELETE FROM adresler; -- tum tablonun icindeki verileri siler
SELECT * FROM adresler;

--Adresler tablosundan sehiri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir='Antep';

--Adresler tablosundan sehiri Ankara olan verileri silelim
DELETE FROM adresler WHERE sehir='Ankara';


CREATE TABLE ogrenciler2
(
iid int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

SELECT * FROM ogrenciler2;

INSERT INTO ogrenciler2 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler2 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler2 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler2 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler2 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(127, 'Mustafa Bak', 'Ali', 99);

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
DELETE FROM ogrenciler2 WHERE isim='Nesibe Yilmaz' OR isim='Mustafa Bak';

-- ismi Ali Can veya Merve Gul olan kayıtları silelim.
DELETE FROM ogrenciler2 WHERE isim='Ali Can' or isim='Merve Gul'; -- or yerine and kullanirsaniz silmez.

SELECT * FROM ogrenciler2;

-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
DELETE FROM ogrenciler2 WHERE isim='Ali Can' and iid='123';

-- id 'si 126'dan büyük olan kayıtları silelim.
DELETE FROM ogrenciler2 WHERE iid>126;

-- id 'si 125'dan büyük olan kayıtları silelim.
DELETE FROM ogrenciler2 WHERE iid>125;

-- id'si 123, 125 veya 126 olanları silelim.
DELETE FROM ogrenciler2 WHERE iid=123 or iid=125 or iid=126;

--“DELETE FROM ogrenciler” -tablodaki tum datalari siler, fakat tabloyu silmez.
--“DELETE FROM ogrenciler”, kodunu kullaninca bos bir tablo kalir.



drop table if exists hastane; -- tabloyu siler