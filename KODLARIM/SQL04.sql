--ALIESES 
drop table if exists calisanlar4

CREATE TABLE calisanlar4
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);


INSERT INTO calisanlar4 VALUES(123456789, 'Ali Can','Istanbul');  
INSERT INTO calisanlar4 VALUES(234567890, 'Veli Cem','Ankara');  
INSERT INTO calisanlar4 VALUES(345678901, 'Mine Bulut','Izmir');						  
							  
SELECT * FROM calisanlar4;

--1.YOL
--Eger iki sutunun verilerini birlestirmek istersek concet sembolu || kullaniliriz.
-- iki ayri field' tek field'e aldik
SELECT calisan_id AS id,calisan_isim||''|| calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar4;

-- ' ' araya bosluk katmak istersek bunu kullanmamiz yeterli
SELECT calisan_id AS id, CONCAT(calisan_id,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar4;

-- IS NULL CONDITION
-- Arama yapilan field’da NULL degeri almis kayitlari getirir


CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);


INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar;

-- Name sutununda null olan degerleri listeleyelim
SELECT name FROM insanlar WHERE name IS NULL;

--Insanlar tablosunda sadece null olmayan degerleri listeleyiniz
SELECT name FROM insanlar WHERE name IS NOT NULL;

--Insanlar tablosunda null deger almis verileri no name olarak degistiriniz.
UPDATE insanlar SET name ='no name' WHERE name is null;




--ORDER BY CLAUSE 
/*
ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir
ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/

/*
Tablolardaki verileri siralamak icin ORDER BY komutu kullaniriz.
NATURAL (Buyukten kucuge ya da buyukten kucuge siralama yapabiliriz(sayilarla)) 

DEFAULT OLARAK kucukten buyuge dogru siralama yapar. (ASC yazarsakta ayni default ayar oldugu icin)

Eger buyukten kucuge siralamak istersek ORDER BY komutundan sonra DESC komutunu kullaniriz.
*/


CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

SELECT * FROM insanlar2;

--Insanlar2 tablosundaki datalari adres’e gore siralayin
SELECT * FROM insanlar2 ORDER BY adres;

--Insanlar2 tablosundaki datalari soyisim’e gore siralayin
SELECT * FROM insanlar2 ORDER BY soyisim;

--Insanlar2 tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar2 WHERE isim='Mine' ORDER BY ssn;

-- ssn ==> id numarasina gore kucukten buyuge siralama yapar


/*
NOT : Order By komutundan sonra field(sutun) ismi yerine field(sutun) numarasi da kullanilabilir

Insanlar2 tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
*/

SELECT * FROM insanlar2 WHERE soyisim='Bulut' ORDER BY 3;

--Insanlar2 tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar2 ORDER BY ssn DESC;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
--1.YOL
SELECT * FROM insanlar2 ORDER BY isim , soyisim DESC;

--2.YOL
SELECT * FROM insanlar2 ORDER BY isim ASC , soyisim DESC;


/*
Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
Ve yine uzunlugunu buyukten kucuge dogru siralamak istersek sonuna DESC komutunu ekleriz.
*/

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT * FROM insanlar2 ORDER BY LENGTH(soyisim) DESC;


-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

--1.YOL
SELECT isim||' '|| soyisim AS isim_soyisim FROM insanlar2 ORDER BY LENGTH(isim)+ LENGTH(soyisim);

--2.YOL
SELECT isim||' '|| soyisim AS isim_soyisim FROM insanlar2 ORDER BY LENGTH(isim||soyisim);

--3.YOL
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar2 ORDER BY LENGTH(isim)+ LENGTH(soyisim);

--4.YOL
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar2 ORDER BY LENGTH(concat(isim,soyisim));


--GROUP BY CLAUSE
--Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
--komutuyla birlikte kullanılır	


CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav;

--Isme gore alinan toplam urunleri bulun
SELECT SUM(urun_miktar) FROM manav;  -- tek bir sonuc dondurur. (2 sutun olmaz)

SELECT isim, SUM(urun_miktar) AS aldigi_toplam_urun FROM manav GROUP BY isim;



--Isme gore alinan toplam urunleri bulun ve urunleri büyükten küçüğe listeleyiniz

--1.YOL
SELECT isim, SUM(urun_miktar) AS aldigi_toplam_urunler FROM manav GROUP BY isim;

--2.YOL
SELECT isim, SUM(urun_miktar) AS aldigi_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldigi_toplam_urun DESC; 

SELECT * FROM manav;

-- Urun ismine gore urunu alan toplam kisi sayisi
SELECT urun_adi, COUNT(isim) FROM manav GROUP BY urun_adi;

SELECT isim, COUNT(urun_adi) AS aldigi_urun_cesidi FROM manav GROUP BY isim;



