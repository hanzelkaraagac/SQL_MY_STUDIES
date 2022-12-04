/*                               
* * * * * * * * * * * * * * *    char 
TABLOLAR (TABLES)           *    varchar 
HEADERS        ==> Baslik   *    real -- Ondalik sayilar icin kullanilir (Double gibi)
ROW (RECORD)   ==> Satir    *    date 
Column (Field) ==> Sütun    *
* * * * * * * * * * * * * * *

                                     * * * * * * * * * * * * * *
      			                     * SQL SERVER VERI TIPLERI *
									 * * * * * * * * * * * * * * 
									 
											    ↓ ↓ ↓
												↓ ↓ ↓
											    ↓ ↓ ↓
												
      				 	   		     * * * * * * * * * * * * * *
      				  	      1)     *  Metinsel Veri Tipleri  *
									 * * * * * * * * * * * * * * 
									 
		   
char           -- uzunlugunu bildigimiz stringler icin CHAR kullanilir.
               -- Unicode’u desteklemeyip char(n) şeklinde kullanılırlar.
			   -- 8000 karaktere kadar değer alabilirler
				  
nchar          -- Unicode destekler.
               -- maksimum 4000 karaktere kadar değer alabilir.
				  
varchar        -- uzunlugunu bilmedigimiz stringler icin VARCHAR kullaniriz.
               -- Chardan farklı olarak verinin boyutu kadar yer kaplar.
			   -- 8000 karaktere kadar depolama yapar.
			   -- Birbirinden farklı uzunlukta veri girişi yapılacağı zaman kullanılması önerilir.
			   -- varchar(MAX) kullanımı ile 2GB’a kadar depolama yapılabilir.
			   
nvarchar       -- Verinin boyutu kadar yer kaplar.
               -- Varchardan farklı olarak unicode’u destekler.
			   -- 4000 karaktere kadar değer alabilir.
			   
text           -- Belirtilenden az değer girilse bile boyutu kadar yer kaplar.
                  2GB’a kadar metinsel veri depolar.Unicode’u desteklemez.
				  
ntext          -- Text’den farklı olarak girilen karakter boyutu kadar yer kaplar ve unicode’u destekler.

real           -- Ondalik sayilar icin kullanilir (Double gibi)

date           -- tarihlerde kullaniliriz.



	      							 * * * * * * * * * * * * * * * *
      				  	      2)     * BINARY(IKILIK) VERI TIPLERI *
									 * * * * * * * * * * * * * * * * 
									 
									 
binary         -- 1 ve 0 ları temsil eden ikilik taban veri tipidir.
               -- Sabit uzunluklu veri tiplerinde kullanılırlar.
			   -- 8000 bytre’a kadar depolama yapabilir.									 

varbinary      -- Binary’den farklı olarak girilen karakter kadar yer kaplar.
               -- Bu yüzden uzunlukların değişken olduğu durumlarda tercih edilir.

image          -- Resim dosyalarını saklamak için kullanılır.
               -- En fazla 2 GB’a kadar veri depolar.
			   -- Bunun yerine varbinary(MAX) kullanılması tercih edilir.
			   
			   

		                             * * * * * * * * * * * * *   
      				  	      3)     * SAYISAL VERI TIPLERI  * 
									 * * * * * * * * * * * * * 		
									 
									 
bit             -- Bir byte uzunluğunda tam sayı veri tipidir.
                -- Genellikle evet/hayır şeklinde mantıksal bilgileri tutmak için kullanılır.
			   
int             -- 4 byte büyüklüğünde, -2 milyar /+2 milyar arasında değer tutabilen tam sayı veri tipidir.			   
			   
bigint          -- 8 byte büyüklüğünde -2⁶³ ve 2⁶³ arasında değer tutabilen tam sayı veri tipidir.	

smallint        -- 2 byte büyüklüğünde -32.768 ve 32.768 arası değer alabilen tam sayı veri tipidir.
	
tinyint         -- 1 byte büyüklğüne sahip, 0–255 arası tam sayı veriler için kullanılan tam sayı veri tipidir.

decimal,numeric -- İkisinin de kullanımı aynıdır.
                -- Bu veri tipinde saklanacak sayının basamak sayısı tanımlanabilir.
				-- Veri tipi boyutu belirtilen basamak sayılarına göre değişkenlik gösterebilir.
				-- -38 ve +38 basamak arası verileri depolayabilir.
				-- -10³⁸ , 10³⁸ arası ondalık ve tam sayı türünde veri saklayabilir.



                                     * * * * * * * * * * * * *   
      				  	      4)     * PARASAL VERI TIPLERI  * 
									 * * * * * * * * * * * * * 	
									 
									 
money          -- 8 byte boyutunda, yaklaşı -2⁶⁴ ile 2⁶⁴ arasında parasal değerleri tutmak için kullanılır.
               -- 4 basamağa kadar duyarlı ondalık tipli verileri saklar.									 

smallmoney     -- 4 byte uzunluğunda yaklaşık -214.000 ile 214.000 arası parasal değerleri tutmak için kullanılır.
               -- Money tipinde olduğu gibi 4 basamağa kadar duyarlı ondalık tipli verileri saklarken kullanılır.
			   
			   
			   
			                         * * * * * * * * * * * * * * *  
      				  	      5)     * TARIH-ZAMAN VERI TIPLERI  * 
									 * * * * * * * * * * * * * * *	
			   
			   
date           -- Tarihleri YYYY-AA-GG (yıl-ay-gün) formatında saklar.
               -- 3 byte uzunluğunda veri tipidir.	
			   
smalldatetime  -- Tarih ve zaman verilerini yıl-ay-gün ve saat-dakika-saniye-salise şeklide saklar.
               -- 4 byte uzunluğunda veri tipidir.
			   
datetime       -- YYYY-AA-GG şeklinde tarih ve zaman verilerini tutan 8 byte uzunluğunda veri tipidir.
               -- 1 Ocak 1753–31 Aralık 9999 arası veriler için kullanılır.
			   
datetime2      -- Datetime’dan farklı olarak 1 Ocak 0001–31 Aralık 9999 tarihleri arasu verileri tutan 
                  ekstra olarak salise hassasiyeti daha yüksektir.
			   -- Kapladığı alan salise hassasiyetine göre 6–8 byte arası değişebilir.
			   
time           -- Sadece saat verilerini saat-dakika-saniye-salise(7 basamaklı) şeklinde saklayan, 
                  boyutu kullanıcı tarafından değiştirilebilen 3–5 byte arası yer kaplayan veri tipidir.
				  
datetimeoffset -- Ülkelere göre değişen zaman farkını hesaplayıp tutarken kullanılır.



                                     * * * * * * * * * * * *
      				  	      5)     * DIGER VERI TURLERI  * 
									 * * * * * * * * * * * *
									 
									 
sql_variant        -- sayı,metin, binary gibi farklı veri tiplerini depolamak için kullanılan veri tipidir.
                      Yani bir sütun ya da fonksiyonda birden fazla veri tipi kullanmamız gerektiğinde
					  tercih etmeliyiz.

xml                -- XML türünde veri saklamak için kullanılır. 
                   -- Kapasitesi 2 GB’dır.
				   -- Bellekteki boyutu, saklanan XML verisine göre değişkenlik gösterir.

geometry           -- Öklid koordinat sistemine ait verileri tutmak için kullanılır.
                   -- Geometrik şekillerin en-boy-yükselik verilerini saklar.

timestamp          -- Tabloya kayıt eklendiğinde , güncellendiğinde binary türünde özel değer alan veri tipidir.

uniqueidentifier   -- 16 byte uzunluğunda benzersiz GUID tipinde veri tutar.
                   -- İki GUID birbirinden tamamen farklıdır eşit olamazlar.

hierarchyid        -- Ağaç veri modeli ve ya hiyerarşik olarak sınflandırılmış verileri saklamak için kullanılır.

geography          -- Coğrafi koordinat ve GPS verilerini tutmak için kullanılır.
			   
			        
					
					
					
					
					
					                 * * * * * * * * * * 
      				  	             *  SQL KOMUTLARI  * 
									 * * * * * * * * * * 
			   
	 SQL komutları "4" ana gruba ayrılır:
		 
			 * * * * * * * * * * * * * * * * * * * * * * * * * *
			 * Veri Sorgulama Dili (Data Query Language - DQL) *
			 * * * * * * * * * * * * * * * * * * * * * * * * * *
 
        DQL içindeki SELECT komutu ile veritabanında yer alan mevcut kayıtların 
		bir kısmını	veya tamamını tanımlanan koşullara bağlı olarak alır.
		
SELECT : Veritabanındaki verileri alır.


             * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
			 * Veri Kullanma Dili (Data Manipulation Language - DML) *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  

        DML komutları ile veritabanlarında bulunan verilere işlem yapılır.
		DML ile veritabanına yeni kayıt ekleme, mevcut kayıtları güncelleme ve silme işlemleri yapılır.
		
INSERT : Veritabanına yeni veri ekler.
UPDATE : Veritabanındaki verileri günceller.
DELETE : Veritabanındaki verileri siler.


             * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
			 * Veri Tanimlama Dili (Data Definition Language - DDL)  *
			 * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  

        DDL komutları ile veritabanı ve tabloları oluşturma, değiştirme ve silme işlemleri	yapılır:

CREATE : Bir veritabanı veya veritabanı içinde tablo oluşturur. 
ALTER  : Bir veritabanı veya veritabanı içindeki tabloyu günceller.
DROP   : Bir veritabanını veya veritabanı içindeki tabloyu siler.


             * * * * * * * * * * * * * * * * * * * * * * * * * * 
			 * Veri Kontrol Dili (Data Control Language - DCL) *
			 * * * * * * * * * * * * * * * * * * * * * * * * * *  

        DCL komutları ile kullanıcılara veritabanı ve tablolar için yetki verilir veya geri alınır.
		
GRANT  : Bir kullanıcıya yetki vermek için kullanılır.
REVOKE : Bir kullanıcıya verilen yetkiyi geri almak için kullanılır.
*/

Create Database sqlcalismalarim;

-- DDL - DATA DEFINITION LANG.
--CREATE TABLO OLUSTURMA
CREATE table ogrenciler
(
ogrenci_no char(7),
isim varchar(20),
soy_isim varchar(25),
not_ort real,
kayit_tarihi date
);

SELECT * FROM ogrenciler;

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE table ogrenci_notlari
AS -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
   -- normal tablo oluştururken ki parantezler yerine AS kullanıp 
   -- Select komutuyla almak istediğimiz verileri alırız

SELECT isim,soy_isim,not_ort FROM ogrenciler;

SELECT * FROM ogrenci_notlari;

-- DML - DATA MANUPULATION LANG.
-- INSERT (Database'e veri ekleme)

INSERT INTO ogrenciler VALUES ('1234567','Hanzel','KARAAGAC','95.00',now());
INSERT INTO ogrenciler VALUES ('1940190','Mila','KARAAGAC',85.00,'2022-12-04');
select * from ogrenciler;

--BIR TABLOYA PARÇALI VERT EKLEMEK ‡STERSEK
INSERT INTO ogrenciler (isim,soy_isim) VALUES ('Tomris','KARAAGAC');




drop table if exists ogrenciler; -- Tabloyu siler










