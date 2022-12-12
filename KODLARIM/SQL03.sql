id isim, veli_isim , yazili_notu

CREATE TABLE ogrenciler3
(
id int,
isim varchar(20),
veli_isim varchar(30),
yazili int
);

INSERT INTO ogrenciler3 VALUES(122,'Kyubra','Burak',80);
INSERT INTO ogrenciler3 VALUES(123,'Ali Can','Hasan',75);
INSERT INTO ogrenciler3 VALUES(124,'Merve Gul','Ayse',85);
INSERT INTO ogrenciler3 VALUES(125,'Kemal Yasa','Hasan',85);
INSERT INTO ogrenciler3 VALUES(126,'Nesibe Yilmaz','Ayse',95);
INSERT INTO ogrenciler3 VALUES(127,'Mustafa Bak','Can',99);
INSERT INTO ogrenciler3 VALUES(127,'Mustafa Bak','Ali',99);

SELECT * FROM ogrenciler3;

-- ismi Kyubra olan kayıtları silelim.
DELETE FROM ogrenciler3 WHERE isim ='Kyubra';

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
DELETE FROM ogrenciler3 WHERE isim='Nesibe Yilmaz' or isim='Mustafa Bak';


--DML -- truncate kullanmi
--Truncate hepsini siler ama spesifik silmez.(sartli silme yapmaz)

TRUNCATE ogrenciler3; --Tablo icerigini siler

drop table if exists ogrenciler3; --tabloyu varsa siler

drop table ogrenciler3; --tabloyu siler

-------------------------------------------

CREATE TABLE talebeler
(
id char(3) PRIMARY KEY,
isim varchar(50),
veli_isim varchar(50),
yazili_notu real
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan', 75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse', 85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan', 85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse', 95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can', 99);


CREATE TABLE notlar
(
talebe_id char(3),
ders_adi varchar(20),
yazili_notu real,
CONSTRAINT notlar_fk FOREIGN KEY(talebe_id) REFERENCES talebeler(id)
on delete cascade -- methodu ile child silinmeden parent silinmiyordu. bu yontem ile silebiliyoruz.
);


INSERT INTO notlar VALUES ('123','kimya', 75);
INSERT INTO notlar VALUES ('124', 'fizik', 65);
INSERT INTO notlar VALUES ('125', 'tarih', 90);
INSERT INTO notlar VALUES ('126', 'Matematik', 90);

SELECT * FROM talebeler;
SELECT * FROM notlar;

-- notlar tablosundan talebe_id'si 123 olan datayi silelim.
DELETE FROM notlar WHERE talebe_id='123';

--talebeler tablosunda id si 126 olani silelim
DELETE FROM notlar WHERE talebe_id='126';



--IN CONDİTİON


CREATE TABLE musteriler(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);


INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler;

--musteriler tablosundan urun ismi Orange,Apple,Apricot olan datalari listeleyiniz.
SELECT * FROM musteriler WHERE urun_isim IN('Orange','Apple','Apricot');

SELECT * FROM musteriler WHERE  urun_isim ='Orange' OR urun_isim ='Apple' OR urun_isim ='Apricot';

--musteriler tablosundan urun ismi Orange,Apple,Apricot disindaki datalari listeleyiniz.
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot');


--BETWEEN CONDITION

--between 20 and 40 dersek 20 ve 40 dahil
--20 ve 40 arasindaki urun_id'leri listeleyiniz. (20 ve 40 dahil)

--1.YOL
SELECT urun_id FROM musteriler WHERE urun_id >=20 AND urun_id <=40;

--2.YOL
SELECT urun_id FROM musteriler WHERE urun_id BETWEEN 20 AND 40;

--10 ve 30 arasindaki urun_id'leri listeleyiniz. (10 ve 30 dahil)
SELECT urun_id FROM musteriler WHERE urun_id BETWEEN 10 and 30;

--20 ve 40 arasinda olmayan urun_id'leri listeleyiniz. (20 ve 40 dahil)
SELECT urun_id FROM musteriler WHERE urun_id NOT BETWEEN 20 and 40;


--SUBQUERIES

CREATE TABLE calisanlar3
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', null, 'Vakko');


CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

SELECT * FROM markalar;


-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini
-- ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
SELECT isim,maas FROM calisanlar3 
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_Sayisi>15000);


--Marka_id'si 101'den buyuk olan marka calisanlarinin 
--isim, maas ve sehirlerini listeleyiniz.
SELECT isim,maas,sehir FROM calisanlar3
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);


--AGGREGATE METHOD

--Calisanlar3 tablosunun maksimum maas'i listeleyelim
--1.YOL
SELECT MAX(maas) AS en_yuksek_maas FROM calisanlar3;

--2.YOL --isimle beraber gormek istersek
SELECT maas,isim AS en_yuksek_maas FROM calisanlar3 ORDER BY maas DESC OFFSET 1 LIMIT 1 ;


/*
	Eger bir sutuna gecici olarak bir isim vermek istersek AS komutunu yazdiktan sonra
vermek istedigimiz ismi yazariz.
*/


--Calisanlar tablosundan minimum maasi listeleyelim
--1.YOL
SELECT MIN(maas) FROM calisanlar3;

--2.YOL --isim ve sehirle beraber gormek istersek
SELECT maas,isim,sehir FROM calisanlar3 ORDER BY maas LIMIT 1;

--Calisanlar tablosundaki maaslarin toplamini listeleyiniz
SELECT SUM(maas) FROM calisanlar3;

--Calisanlarin tablosundaki maas'larin ortalamasini listeleyiniz
SELECT AVG(maas) FROM calisanlar3;

SELECT ROUND (AVG(maas)) FROM calisanlar3; --Sadece sayiyi verdi noktadan sonrasini vermedi

SELECT ROUND (AVG(maas),2) FROM calisanlar3; --noktadan sonra gormek istedigimiz kadar sayi'yi yazariz.

--Calisanlar tablosundaki maas'larin sayisini listeleyiniz
SELECT COUNT(maas) FROM calisanlar3;
--count dedigimiz de satirlari sayar
--ikisinin arasindaki fark eger null varsa * koydugumuzda onu sayar ama maas olarak yazdigimizda onu saymayacaktir.

SELECT count(*) FROM calisanlar3;
 --yildizda koysak satirlari sayacaktir.
 --null olsada satir sayacaktir.

/*
Eger count(*) kullanirsak tablodaki tum satirlarin sayisini verir.
Sutun adi kullanirsak o sutundaki sayilari verir.
*/


--AGGREGATE METHODLARDA SUBQUERY
--Her markanin id'sini, ismini ve toplam kac sehirde bulundugunu listeleyen bir SORGU yaziniz


SELECT * FROM markalar;

SELECT marka_id,marka_isim,(SELECT COUNT(sehir) FROM calisanlar3
WHERE (marka_isim=isyeri)) FROM markalar;


SELECT marka_id,marka_isim,
(SELECT count(sehir)  AS sehir_sayisi FROM calisanlar3
 --count yazan yere sehir yazisi yazdik
WHERE marka_isim=isyeri) FROM markalar;

SELECT * FROM markalar;
SELECT * FROM calisanlar2;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim, calisan_sayisi,
(SELECT SUM(maas) AS toplam_maas FROM calisanlar3
WHERE isyeri=marka_isim) FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim, calisan_sayisi,
(SELECT MIN(maas) AS minimum_maas FROM calisanlar3 WHERE marka_isim=isyeri),
(SELECT MAX(maas) AS maximum_maas FROM calisanlar3 WHERE marka_isim=isyeri)
FROM markalar;




--VIEW KULLANIMI
/*
Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen sorgulama yerine
view'e atadigimiz ismi SELECT komutuyla cagiririz.
*/


Create VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT Max(maas) FROM calisanlar3 WHERE isyeri=marka_isim) as enyuksekmaask,
(SELECT Min(maas) FROM calisanlar3 WHERE isyeri=marka_isim) as endusukmaas
FROM markalar;

SELECT * FROM maxminmaas;


-- 							EXISTS CONDITION
/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar
*/



CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart;
SELECT * FROM nisan;

/*
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
 URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
 MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
*/
SELECT urun_id,musteri_isim FROM mart
WHERE EXISTS
(SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id);


/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/

SELECT urun_isim,musteri_isim FROM nisan
WHERE exists(SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim);


--DML ==> (ic mimar tablonun icerisindeki verileri guncelleme) -- UPDATE
--UPDATE

CREATE TABLE tedarikciler2 -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);


INSERT INTO tedarikciler2 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler2 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler2 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler2 VALUES (104, 'Apple', 'Adam Eve');


CREATE TABLE urunler2 -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler2 FOREIGN KEY(ted_vergino) REFERENCES tedarikciler2(vergi_no)
on delete cascade
);    


INSERT INTO urunler2 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler2 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler2 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler2 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler2 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler2 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler2 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');


SELECT * FROM tedarikciler2;
SELECT * FROM urunler2;

/*
UPDATE tablo_adi
SET sutun_ismi = 'Istenen veri' WHERE sutun_ismi='istenen veri'; 
*/

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
UPDATE tedarikciler2 SET firma_ismi = 'VESTEL' WHERE vergi_no = 102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler2 SET firma_ismi = 'Casper', irtibat_ismi = 'Ali Veli' WHERE vergi_no = 101;

SELECT * FROM tedarikciler2;
SELECT * FROM urunler2;

-- urunler2 tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler2 SET urun_isim = 'Telefon' WHERE urun_isim = 'Phone';

-- urunler2 tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler2 SET urun_id = urun_id + 1 WHERE urun_id > 1004;

SELECT * FROM urunler2;
SELECT * FROM tedarikciler2;


-- urunler2 tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
UPDATE urunler2 SET urun_id = urun_id + ted_vergino;

-- * urunler2 tablosundan Ali Bak’in aldigi urunun ismini, tedarikciler2 tablosunda irtibat_ismi 
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

UPDATE urunler2 SET urun_isim = 
(SELECT firma_ismi FROM tedarikciler2 WHERE irtibat_ismi = 'Adam Eve')  WHERE musteri_isim = 'Ali Bak';



SELECT * FROM urunler2;
SELECT * FROM tedarikciler2;

--Urunler2 tablosunda laptop satin alan musterilerin ismini,
--firma_ismi Apple’in irtibat_isim’i ile degistirin.
UPDATE urunler2 SET musteri_isim =
(SELECT irtibat_ismi FROM tedarikciler2 WHERE firma_ismi = 'Apple') WHERE urun_isim = 'Laptop';







DELETE  FROM tedarikciler2
