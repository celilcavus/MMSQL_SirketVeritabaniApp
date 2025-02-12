﻿create database SirketVeritabani
go
use SirketVeritabani

create table BIRIM(
ID INT IDENTITY(1,1) PRIMARY KEY,
BIRIM_AD NVARCHAR(50)
)
GO
INSERT INTO BIRIM (BIRIM_AD) VALUES ('KALİTE'),('İDARİ'),('ARGE'),('TEKNİK');

create table UNVAN(
ID INT IDENTITY(1,1) PRIMARY KEY,
UNVAN_AD NVARCHAR(50)
)
INSERT INTO unvan VALUES ('MÜHENDİS'),('İK UZMANI'),('TEKNİSYEN');

create table IL(
ILID CHAR(2) PRIMARY KEY,
IL_AD VARCHAR(30) UNIQUE NOT NULL
)
INSERT INTO IL VALUES ('06','ANKARA'),('34','İSTANBUL'),('35','İZMİR');

CREATE TABLE ILCE(
ILCEID INT IDENTITY(1,1) PRIMARY KEY,
ILCE_AD VARCHAR(30) NOT NULL,
ILID CHAR(2) NOT NULL REFERENCES IL(ILID),
CONSTRAINT ILCETEKIL UNIQUE (ILCE_AD,ILID))

INSERT INTO ilce VALUES 
('ÇANKAYA','06'),('POLATLI','06'),('YENİMAHALLE','06'),('AVCILAR','34'),
('BEYLİKDÜZÜ','34'),('ESENYURT','34'),('BUCA','35'),('KARŞIYAKA','35'),('KONAK','35');


CREATE TABLE proje (
proje_no INT IDENTITY(1,1) PRIMARY KEY,
proje_ad VARCHAR(20) UNIQUE NOT NULL,
baslama_tarihi DATE NOT NULL,
planlanan_bitis_tarihi DATE NOT NULL
);

INSERT INTO proje VALUES
('TEMİZ DÜNYA','2021.01.20','2023.01.11'),
('GÜVENLİ INTERNET','2021.05.15','2023.06.09'),
('MUTLU ŞEHİR','2021.07.11','2023.11.29'),
('AKILLI EVLER','2021.02.10','2023.11.29'),
('SESSİZ ORTAM','2021.03.01','2013.11.29');

CREATE TABLE personel (
personel_no INT IDENTITY(1,1) PRIMARY KEY,
ad VARCHAR(25) NOT NULL, 
soyad VARCHAR(25) NOT NULL,
cinsiyet CHAR(1) NOT NULL,
dogum_tarihi DATE NOT NULL,
dogum_yeri INT REFERENCES ilce(ILCEID) NOT NULL,
baslama_tarihi date NOT NULL,
birim_no INT REFERENCES birim(ID) NOT NULL,
unvan_no INT REFERENCES unvan(ID) NOT NULL,
calisma_saati TINYINT NOT NULL,
maas MONEY NOT NULL,
prim MONEY DEFAULT 0
);

INSERT INTO personel VALUES
('Ahmet','EKİNCİ','E','1985.03.25',2,'2002.03.01',1,1,35,2500,350),
('Burak','TURHAN','E','1980.04.15',3,'2002.05.03',2,2,30,2800,250),
('Ceyda','SAKARYA','K','1983.03.23',7,'2005.05.12',2,3,30,3000,250),
('Demet','ÇOLAK','K','1982.05.05',5,'2005.06.17',3,3,40,2800,350),
('Evrim','ÇITAK','K','1987.12.05',1,'2000.01.12',2,1,30,4500,500),
('Figen','ESMER','K','1982.10.22',4,'1998.05.07',1,2,35,4000,250),
('Galip','TANAR','E','1983.02.28',9,'1997.05.07',1,2,35,5200,450),
('Emir','YANIK','E','1975.05.07',2,'2010.07.17',2,2,45,4500,450),
('Ilgın','ACI','E','1974.05.01',2,'2000.08.18',3,2,40,4200,400),
('İskender','TAŞ','E','1974.07.02',7,'1995.09.05',4,1,40,4400,400),
('Jale','CAN','K','1976.09.18',	5,'1998.10.12',2,2,45,3250,450),
('Kamil','ALBAYRAK','E','1976.08.19',9,'2000.11.25',1,2,30,5200,250),
('Leman','HASKIRIŞ','K','1978.09.20',6,'1999.10.27',1,2,35,4200,350),
('Meltem','UYSAL','K','1985.08.04',6,'2000.05.27',1,2,30,2500,100),
('Necati','UYSAL','E','1990.12.01',4,'2000.03.06',2,1,30,2000,150),
('Osman','UYSAL','E','1982.02.15',6,'1995.05.12',4,3,30,4800,150),
('Ömer','BUZDAĞ','E','1980.10.30',5,'2001.08.10',1,2,40,4800,400),
('Perihan','KANAT','K','1980.10.28',4,'2001.07.11',4,1,30,2200,300),
('Ramiz','ÇAKIR','E','1981.11.19',7,'2001.07.30',4,3,30,2700,300),
('Sertaç','KÖSEDAĞ','E','1981.12.20',9,'2002.12.20',3,2,30,2900,350),
('Şefik','ÇAPANOĞLU','E','1982.02.20',6,'1998.05.25',3,3,30,4800,200),
('Taner','BOZOKLU','E','1983.07.21',5,'2005.09.05',1,2,30,3000,200),
('Utku','DUMAN','E','1975.06.13',6,'2005.03.05',1,3,30,2800,200),
('Ümit','ŞİRİN','E','1978.04.02',7,'1998.04.04',2,2,35,3300,250),
('Veysel','ERTÜZÜN','E','1980.07.03',3,'2002.07.18',4,3,35,3100,300),
('Yakup','GÖKÇE','E','1975.06.18',2,'2002.03.25',4,3,35,3100,450),
('Zeliha','CANİŞ','K','1978.03.03',5,'2005.08.13',1,3,40,2500,500);

CREATE TABLE cocuk (
cocuk_no INT IDENTITY(1,1) PRIMARY KEY,
ad VARCHAR(25) NOT NULL, 
soyad VARCHAR(25) NOT NULL,
cinsiyet CHAR(1),
dogum_tarihi DATE UNIQUE NOT NULL,
dogu_yeri INT NOT NULL REFERENCES ilce(ILCEID),
personel_no INT NOT NULL REFERENCES personel(personel_no)
);

INSERT INTO cocuk VALUES
('Emin','ESMER','E','2016.05.21',5,6),
('Selen','BUZDAĞ','K','2015.09.11',1,17),
('Akif','ÇAKIR','E','2018.01.05',1,19),
('Halide','ESMER','K','2017.12.10',8,6),
('Jülide','BUZDAĞ','K','2016.03.03',6,17),
('Elif','BUZDAĞ','K','2013.11.11',2,17);


CREATE TABLE gorevlendirme (
gorevlendirme_no INT IDENTITY(1,1) PRIMARY KEY,
proje_no INT NOT NULL REFERENCES proje(proje_no),
personel_no INT NOT NULL REFERENCES personel(personel_no),
CONSTRAINT projePersonelTekil UNIQUE (proje_no,personel_no)
);

INSERT INTO gorevlendirme VALUES 
(1,3),(1,5),(1,7),(1,8),(1,11),(2,1),
(2,3),(2,5),(2,10),(2,12),(2,13),(3,3),
(3,4),(3,9),(3,15),(3,19),(3,21),(3,25),
(3,27),(4,2),(4,3),(4,8),(4,10),(4,20),
(4,27),(5,3),(5,5),(5,11),(5,21),(5,26);


/*=================== TAMAMLANDI =================== */