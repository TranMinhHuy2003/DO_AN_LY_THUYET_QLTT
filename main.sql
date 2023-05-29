CREATE DATABASE QLXD;
USE QLXD;
-- tao bang
CREATE TABLE DOANHNGHIEPNK (
    MADN CHAR(4) NOT NULL,
    TENDN VARCHAR(40),
    NGAYTL DATETIME,
    DIACHI VARCHAR(40),
    SDT VARCHAR(20),
    LOAIDN VARCHAR(20)
);
CREATE TABLE LOAIXANG (
    MALX CHAR(4) NOT NULL,
    TENLX VARCHAR(40),
    MDBQ VARCHAR(20)
);
CREATE TABLE XANGDAU (
    MAXD CHAR(4) NOT NULL,
    TENXD VARCHAR(40),
    MALX CHAR(4),
    GIACOSO DECIMAL(5 , 3 ),
    THUEPHI INT
);
CREATE TABLE CUAHANG (
    MACH CHAR(4) NOT NULL,
    TENCH VARCHAR(40),
    BACCL VARCHAR(2),
    RONGDD FLOAT,
    CAOTB FLOAT,
    CAOMC FLOAT
);
CREATE TABLE NHAVANCHUYEN (
    MANVC CHAR(4) NOT NULL,
    TENNVC VARCHAR(40),
    SDT VARCHAR(20),
    DIACHI VARCHAR(40)
);
CREATE TABLE NHAP (
    MAXD CHAR(4),
    MACH CHAR(4),
    NGAYNHAP DATETIME,
    SOLUONG INT,
    GIANHAP DECIMAL(5 , 3 )
);
CREATE TABLE VANCHUYEN (
    MANVC CHAR(4),
    MAXD CHAR(4),
    NGAYVC DATETIME,
    NOIDI VARCHAR(40),
    NOIDEN VARCHAR(40)
);
CREATE TABLE DN_XD (
    MADN CHAR(4),
    MAXD CHAR(4),
    NGAYNK DATETIME
);

-- khoa chinh
ALTER TABLE DOANHNGHIEPNK ADD PRIMARY KEY (MADN);
ALTER TABLE LOAIXANG ADD PRIMARY KEY (MALX);
ALTER TABLE XANGDAU ADD PRIMARY KEY (MAXD);
ALTER TABLE CUAHANG ADD PRIMARY KEY (MACH);
ALTER TABLE NHAVANCHUYEN ADD PRIMARY KEY (MANVC);
 
-- khoa ngoai
ALTER TABLE XANGDAU ADD CONSTRAINT FK_xdMALX FOREIGN KEY (MALX) REFERENCES LOAIXANG(MALX);

ALTER TABLE NHAP ADD CONSTRAINT FK_nhapMAXD FOREIGN KEY (MAXD) REFERENCES XANGDAU(MAXD);
ALTER TABLE NHAP ADD CONSTRAINT FK_nhapMACH FOREIGN KEY (MACH) REFERENCES CUAHANG(MACH);

ALTER TABLE VANCHUYEN ADD CONSTRAINT FK_vcMANVC FOREIGN KEY (MANVC) REFERENCES NHAVANCHUYEN(MANVC);
ALTER TABLE VANCHUYEN ADD CONSTRAINT FK_vcMAXD FOREIGN KEY (MAXD) REFERENCES XANGDAU(MAXD);

ALTER TABLE DN_XD ADD CONSTRAINT FK_dnxdMADN FOREIGN KEY (MADN) REFERENCES DOANHNGHIEPNK(MADN);
ALTER TABLE DN_XD ADD CONSTRAINT FK_dnxdMAXD FOREIGN KEY (MAXD) REFERENCES XANGDAU(MAXD);

-- rang buoc 

-- du lieu
-- DOANHNGHIEPNK
INSERT INTO DOANHNGHIEPNK VALUES ("DN01","Petrolimex","1956-01-12","Q.Đống Đa, Hà Nội","02438512603","Cty cổ phần NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN02","PVOil","2008-06-06","Q.1, TP.HCM","02839106990","Cty cổ phần NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN03","Cty TNHH Thủy bộ Hải Hà","2003-09-16","Huyện Thái Thụy, Thái Bình","02273713464","Cty TNHH ngoài NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN04","Cty TNHH Hải Linh","2000-09-01","TP.Việt Trì, Phú Thọ","02103857463","Cty TNHH ngoài NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN05","NSH Petro","2012-02-14","Huyện Châu Thành, Hậu Giang","02926547979","Cty cổ phần NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN06","Cty Xuyên Việt Oil","2005-05-31","Q.3, TP.HCM","0838480480","Cty TNHH ngoài NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN07","Tổng Cty Thương mại XNK Thanh Lễ","1991-01-01","TP.Thủ Dầu Một, Bình Dương","02743829534","Cty cổ phần NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN08","PETIMEX","1992-12-11","TP.Cao Lãnh, Đồng Tháp","02773851056","Cty cổ phần NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN09","Cty Thiên Minh Đức","2001-09-04","TP.Vinh, Nghệ An","0383563507","Cty cổ phần ngoài NN");
INSERT INTO DOANHNGHIEPNK VALUES ("DN10","Mipec","2003-12-22","Q.Hoàn Kiếm, Hà Nội","02437342501","Cty cổ phần NN");
-- LOAIXANG
INSERT INTO LOAIXANG VALUES ("LX01","Xăng RON 95-III","III");
INSERT INTO LOAIXANG VALUES ("LX02","Xăng E5 RON 92-II","II");
INSERT INTO LOAIXANG VALUES ("LX03","Dầu DO 0,05S-II","II");
INSERT INTO LOAIXANG VALUES ("LX04","Dầu KO","II");
INSERT INTO LOAIXANG VALUES ("LX05","Dầu DO 0,001S-V","V");
INSERT INTO LOAIXANG VALUES ("LX06","Xăng RON 95-V","V");
-- XANGDAU
INSERT INTO XANGDAU VALUES ("XD01","Xăng E5 A92 vùng 1","LX02",22.680,8);
INSERT INTO XANGDAU VALUES ("XD02","Xăng E5 A92 vùng 2","LX02",23.130,8);
INSERT INTO XANGDAU VALUES ("XD03","Xăng A95-V vùng 1","LX06",24.530,10);
INSERT INTO XANGDAU VALUES ("XD04","Xăng A95-V vùng 2","LX06",25.020,10);
INSERT INTO XANGDAU VALUES ("XD05","Xăng A95-III vùng 1","LX01",23.630,10);
INSERT INTO XANGDAU VALUES ("XD06","Xăng A95-III vùng 2","LX01",24.100,10);
INSERT INTO XANGDAU VALUES ("XD07","Dầu Diesel 0,001S-V vùng 1","LX05",20.820,8);
INSERT INTO XANGDAU VALUES ("XD08","Dầu Diesel 0,001S-V vùng 2","LX05",21.230,8);
INSERT INTO XANGDAU VALUES ("XD09","Dầu Diesel 0,05S-II vùng 1","LX03",19.390,8);
INSERT INTO XANGDAU VALUES ("XD10","Dầu Diesel 0,05S-II vùng 2","LX03",19.770,8);
INSERT INTO XANGDAU VALUES ("XD11","Dầu hỏa vùng 1","LX04",19.480,10);
INSERT INTO XANGDAU VALUES ("XD12","Dầu hỏa vùng 2","LX04",19.860,10);
-- CUAHANG
INSERT INTO CUAHANG VALUES ("CH01","Petrolimex-01","I",6.5,2.5,5.0);
INSERT INTO CUAHANG VALUES ("CH02","Petrolimex-02","I",6.7,3.0,4.75);
INSERT INTO CUAHANG VALUES ("CH03","PVOil-01","II",7.15,2.7,5.76);
INSERT INTO CUAHANG VALUES ("CH04","PVOil-02","II",7.05,2.95,5.47);
INSERT INTO CUAHANG VALUES ("CH05","CHXD Quân đội","I",6.65,2.85,4.95);
INSERT INTO CUAHANG VALUES ("CH06","Trạm xăng dầu Tân Phú","II",8.5,2.68,6.7);
INSERT INTO CUAHANG VALUES ("CH07","Trạm xăng dầu Mỹ Thành","II",8.0,2.24,6.1);
INSERT INTO CUAHANG VALUES ("CH08","Trạm xăng dầu Đông Sài Gòn","II",6.5,2.7,5.05);
INSERT INTO CUAHANG VALUES ("CH09","Công ty CP Nhiên Liệu Sài Gòn","II",6.95,4.5,5.7);
INSERT INTO CUAHANG VALUES ("CH10","Trạm xăng dầu Dương Anh Thư","I",6.85,3.55,4.82);
-- NHAVANCHUYEN
INSERT INTO NHAVANCHUYEN VALUES ("VC01","PVTrans","02839111301","Q.1, TPHCM");
INSERT INTO NHAVANCHUYEN VALUES ("VC02","PV Trans Pacific","02838228546","Q.1, TPHCM");
INSERT INTO NHAVANCHUYEN VALUES ("VC03","Cty CP vận tải Xăng dầu VITACO","02835146024","Q.Bình Thạnh, TPHCM");
INSERT INTO NHAVANCHUYEN VALUES ("VC04","Cty CP vận tải Sản phẩm khí Quốc tế","02822205388","TP.Thủ Đức, TPHCM");
INSERT INTO NHAVANCHUYEN VALUES ("VC05","Cty CP vận tải Thủy Tân Cảng","02837425442","Thị xã Phú Mỹ, Bà Rịa-Vũng Tàu");
INSERT INTO NHAVANCHUYEN VALUES ("VC06","Cty CP vận tải Xăng dầu VIPCO","02253838680","Q.Hồng Bàng, Hải Phòng");
INSERT INTO NHAVANCHUYEN VALUES ("VC07","Cty CP vận tải 1 TRACO","02839111301","Q.Ngô Quyền, Hải Phòng");
INSERT INTO NHAVANCHUYEN VALUES ("VC08","Tổng Cty vận tải PETROLIMEX","	02435162748","Q.Đống Đa, Hà Nội");
INSERT INTO NHAVANCHUYEN VALUES ("VC09","Cty CP vận tải Xăng dầu Đồng Tháp","02773877011","TP.Cao Lãnh, Đồng Tháp");
INSERT INTO NHAVANCHUYEN VALUES ("VC10","Cty TNHH vận tải Xăng dầu Việt Nam","02432006280","Huyện Quốc Oai, Hà Nội");
-- NHAP
INSERT INTO NHAP VALUES ("XD02","CH01","2023-02-19",2500,0);
INSERT INTO NHAP VALUES ("XD06","CH01","2023-02-19",2000,0);
INSERT INTO NHAP VALUES ("XD10","CH01","2023-02-19",1500,0);
INSERT INTO NHAP VALUES ("XD12","CH01","2023-02-19",500,0);
INSERT INTO NHAP VALUES ("XD06","CH01","2023-02-27",500,0);
INSERT INTO NHAP VALUES ("XD01","CH02","2023-03-09",3000,0);
INSERT INTO NHAP VALUES ("XD05","CH02","2023-03-09",3000,0);
INSERT INTO NHAP VALUES ("XD09","CH02","2023-03-09",2000,0);
INSERT INTO NHAP VALUES ("XD11","CH02","2023-03-09",1000,0);
INSERT INTO NHAP VALUES ("XD09","CH02","2023-03-18",1000,0);
INSERT INTO NHAP VALUES ("XD02","CH03","2023-02-10",2500,0);
INSERT INTO NHAP VALUES ("XD06","CH03","2023-02-10",2000,0);
INSERT INTO NHAP VALUES ("XD10","CH03","2023-02-10",1500,0);
INSERT INTO NHAP VALUES ("XD12","CH03","2023-02-10",500,0);
INSERT INTO NHAP VALUES ("XD02","CH03","2023-03-10",2000,0);
INSERT INTO NHAP VALUES ("XD01","CH04","2023-04-01",2000,0);
INSERT INTO NHAP VALUES ("XD05","CH04","2023-04-01",2000,0);
INSERT INTO NHAP VALUES ("XD09","CH04","2023-04-01",2000,0);
INSERT INTO NHAP VALUES ("XD11","CH04","2023-04-01",1000,0);
INSERT INTO NHAP VALUES ("XD01","CH04","2023-04-26",1000,0);
INSERT INTO NHAP VALUES ("XD02","CH05","2023-02-09",2500,0);
INSERT INTO NHAP VALUES ("XD06","CH05","2023-02-09",2000,0);
INSERT INTO NHAP VALUES ("XD10","CH05","2023-02-09",1500,0);
INSERT INTO NHAP VALUES ("XD02","CH05","2023-04-20",1000,0);
INSERT INTO NHAP VALUES ("XD06","CH05","2023-04-20",1000,0);
INSERT INTO NHAP VALUES ("XD01","CH06","2023-01-31",1000,0);
INSERT INTO NHAP VALUES ("XD05","CH06","2023-01-31",1000,0);
INSERT INTO NHAP VALUES ("XD09","CH06","2023-01-31",2000,0);
INSERT INTO NHAP VALUES ("XD01","CH06","2023-03-02",1000,0);
INSERT INTO NHAP VALUES ("XD05","CH06","2023-03-09",1000,0);
INSERT INTO NHAP VALUES ("XD01","CH07","2023-02-07",500,0);
INSERT INTO NHAP VALUES ("XD05","CH07","2023-02-07",500,0);
INSERT INTO NHAP VALUES ("XD01","CH07","2023-02-25",800,0);
INSERT INTO NHAP VALUES ("XD05","CH07","2023-02-25",800,0);
INSERT INTO NHAP VALUES ("XD09","CH07","2023-03-28",1200,0);
INSERT INTO NHAP VALUES ("XD01","CH08","2023-02-28",500,0);
INSERT INTO NHAP VALUES ("XD05","CH08","2023-02-28",700,0);
INSERT INTO NHAP VALUES ("XD01","CH08","2023-03-06",2000,0);
INSERT INTO NHAP VALUES ("XD05","CH08","2023-03-06",1800,0);
INSERT INTO NHAP VALUES ("XD09","CH08","2023-03-06",1400,0);
INSERT INTO NHAP VALUES ("XD01","CH09","2023-05-16",2000,0);
INSERT INTO NHAP VALUES ("XD05","CH09","2023-05-16",2000,0);
INSERT INTO NHAP VALUES ("XD09","CH09","2023-05-16",1600,0);
INSERT INTO NHAP VALUES ("XD11","CH09","2023-05-16",500,0);
INSERT INTO NHAP VALUES ("XD09","CH09","2023-05-27",400,0);
INSERT INTO NHAP VALUES ("XD01","CH10","2023-03-09",2000,0);
INSERT INTO NHAP VALUES ("XD05","CH10","2023-03-09",2000,0);
INSERT INTO NHAP VALUES ("XD09","CH10","2023-03-09",600,0);
INSERT INTO NHAP VALUES ("XD01","CH10","2023-03-18",500,0);
INSERT INTO NHAP VALUES ("XD09","CH10","2023-03-18",900,0);
-- VANCHUYEN
-- CH01
INSERT INTO VANCHUYEN VALUES ("VC08","XD02","2023-02-15","Q.Đống Đa, Hà Nội","TP.Điện Biên Phủ, Điện Biên");
INSERT INTO VANCHUYEN VALUES ("VC08","XD06","2023-02-15","Q.Đống Đa, Hà Nội","TP.Điện Biên Phủ, Điện Biên");
INSERT INTO VANCHUYEN VALUES ("VC08","XD10","2023-02-15","Q.Đống Đa, Hà Nội","TP.Điện Biên Phủ, Điện Biên");
INSERT INTO VANCHUYEN VALUES ("VC08","XD12","2023-02-15","Q.Đống Đa, Hà Nội","TP.Điện Biên Phủ, Điện Biên");
INSERT INTO VANCHUYEN VALUES ("VC08","XD06","2023-03-23","Q.Đống Đa, Hà Nội","TP.Điện Biên Phủ, Điện Biên");
-- CH02
INSERT INTO VANCHUYEN VALUES ("VC08","XD01","2023-03-08","Q.Đống Đa, Hà Nội","Q.Phú Xuyên, Hà Nội");
INSERT INTO VANCHUYEN VALUES ("VC08","XD05","2023-03-08","Q.Đống Đa, Hà Nội","Q.Phú Xuyên, Hà Nội");
INSERT INTO VANCHUYEN VALUES ("VC08","XD09","2023-03-08","Q.Đống Đa, Hà Nội","Q.Phú Xuyên, Hà Nội");
INSERT INTO VANCHUYEN VALUES ("VC08","XD11","2023-03-08","Q.Đống Đa, Hà Nội","Q.Phú Xuyên, Hà Nội");
INSERT INTO VANCHUYEN VALUES ("VC08","XD09","2023-03-17","Q.Đống Đa, Hà Nội","Q.Phú Xuyên, Hà Nội");
-- CH03
INSERT INTO VANCHUYEN VALUES ("VC05","XD02","2023-02-09","Q.1, TP.HCM","Huyện Xuyên Mộc, Bà Rịa-Vũng Tàu");
INSERT INTO VANCHUYEN VALUES ("VC05","XD06","2023-02-09","Q.1, TP.HCM","Huyện Xuyên Mộc, Bà Rịa-Vũng Tàu");
INSERT INTO VANCHUYEN VALUES ("VC05","XD10","2023-02-09","Q.1, TP.HCM","Huyện Xuyên Mộc, Bà Rịa-Vũng Tàu");
INSERT INTO VANCHUYEN VALUES ("VC05","XD12","2023-02-09","Q.1, TP.HCM","Huyện Xuyên Mộc, Bà Rịa-Vũng Tàu");
INSERT INTO VANCHUYEN VALUES ("VC05","XD02","2023-03-10","Q.1, TP.HCM","Huyện Xuyên Mộc, Bà Rịa-Vũng Tàu");
-- CH04
INSERT INTO VANCHUYEN VALUES ("VC06","XD01","2023-04-01","Q.Đống Đa, Hà Nội","Q.Lê Chân, Hải Phòng");
INSERT INTO VANCHUYEN VALUES ("VC06","XD05","2023-04-01","Q.Đống Đa, Hà Nội","Q.Lê Chân, Hải Phòng");
INSERT INTO VANCHUYEN VALUES ("VC06","XD09","2023-04-01","Q.Đống Đa, Hà Nội","Q.Lê Chân, Hải Phòng");
INSERT INTO VANCHUYEN VALUES ("VC06","XD11","2023-04-01","Q.Đống Đa, Hà Nội","Q.Lê Chân, Hải Phòng");
INSERT INTO VANCHUYEN VALUES ("VC06","XD01","2023-04-26","Q.Đống Đa, Hà Nội","Q.Lê Chân, Hải Phòng");
-- CH05
INSERT INTO VANCHUYEN VALUES ("VC09","XD02","2023-02-09","TP.Cao Lãnh, Đồng Tháp","Huyện Tháp Mười, Đồng Tháp");
INSERT INTO VANCHUYEN VALUES ("VC09","XD06","2023-02-09","TP.Cao Lãnh, Đồng Tháp","Huyện Tháp Mười, Đồng Tháp");
INSERT INTO VANCHUYEN VALUES ("VC09","XD10","2023-02-09","TP.Cao Lãnh, Đồng Tháp","Huyện Tháp Mười, Đồng Tháp");
INSERT INTO VANCHUYEN VALUES ("VC09","XD02","2023-04-20","TP.Cao Lãnh, Đồng Tháp","Huyện Tháp Mười, Đồng Tháp");
INSERT INTO VANCHUYEN VALUES ("VC09","XD06","2023-04-20","TP.Cao Lãnh, Đồng Tháp","Huyện Tháp Mười, Đồng Tháp");
-- CH06
INSERT INTO VANCHUYEN VALUES ("VC01","XD01","2023-01-31","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC01","XD05","2023-01-31","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC01","XD09","2023-01-31","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC02","XD01","2023-03-02","Q.3, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC02","XD05","2023-03-09","Q.3, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
-- CH07
INSERT INTO VANCHUYEN VALUES ("VC01","XD01","2023-02-07","Q.3, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC01","XD05","2023-02-07","Q.3, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC01","XD01","2023-02-25","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC02","XD05","2023-02-25","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC02","XD09","2023-03-28","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
-- CH08
INSERT INTO VANCHUYEN VALUES ("VC02","XD01","2023-02-28","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC02","XD05","2023-02-28","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC02","XD01","2023-03-06","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC04","XD05","2023-03-06","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC04","XD09","2023-03-06","Q.1, TP.HCM","Q.9, TP.Thủ Đức, TPHCM");
-- CH09
INSERT INTO VANCHUYEN VALUES ("VC03","XD01","2023-05-16","Q.3, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC03","XD05","2023-05-16","Q.3, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC03","XD09","2023-05-16","Q.3, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC03","XD11","2023-05-16","Q.3, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC01","XD09","2023-05-27","Q.3, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
-- CH10
INSERT INTO VANCHUYEN VALUES ("VC04","XD01","2023-03-09","Q.1, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC04","XD05","2023-03-09","Q.1, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC04","XD09","2023-03-09","Q.1, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC03","XD01","2023-03-18","Q.3, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
INSERT INTO VANCHUYEN VALUES ("VC03","XD09","2023-03-18","Q.3, TP.HCM","Q.2, TP.Thủ Đức, TPHCM");
-- DN_XD
INSERT INTO DN_XD VALUES ("DN01","XD01","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD02","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD03","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD04","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD05","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD06","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD07","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD08","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD09","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD10","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD11","2023-01-10");
INSERT INTO DN_XD VALUES ("DN01","XD12","2023-01-10");
INSERT INTO DN_XD VALUES ("DN02","XD01","2023-01-07");
INSERT INTO DN_XD VALUES ("DN02","XD02","2023-01-07");
INSERT INTO DN_XD VALUES ("DN02","XD05","2023-01-07");
INSERT INTO DN_XD VALUES ("DN02","XD06","2023-01-07");
INSERT INTO DN_XD VALUES ("DN02","XD09","2023-01-07");
INSERT INTO DN_XD VALUES ("DN02","XD10","2023-01-07");
INSERT INTO DN_XD VALUES ("DN02","XD11","2023-01-07");
INSERT INTO DN_XD VALUES ("DN02","XD12","2023-01-07");
INSERT INTO DN_XD VALUES ("DN03","XD01","2023-01-16");
INSERT INTO DN_XD VALUES ("DN03","XD02","2023-01-16");
INSERT INTO DN_XD VALUES ("DN03","XD05","2023-01-16");
INSERT INTO DN_XD VALUES ("DN03","XD06","2023-01-16");
INSERT INTO DN_XD VALUES ("DN03","XD09","2023-01-16");
INSERT INTO DN_XD VALUES ("DN03","XD10","2023-01-16");
INSERT INTO DN_XD VALUES ("DN03","XD11","2023-01-16");
INSERT INTO DN_XD VALUES ("DN03","XD12","2023-01-16");
INSERT INTO DN_XD VALUES ("DN04","XD01","2023-01-12");
INSERT INTO DN_XD VALUES ("DN04","XD02","2023-01-12");
INSERT INTO DN_XD VALUES ("DN04","XD05","2023-01-12");
INSERT INTO DN_XD VALUES ("DN04","XD06","2023-01-12");
INSERT INTO DN_XD VALUES ("DN04","XD09","2023-01-12");
INSERT INTO DN_XD VALUES ("DN04","XD10","2023-01-12");
INSERT INTO DN_XD VALUES ("DN04","XD11","2023-01-12");
INSERT INTO DN_XD VALUES ("DN04","XD12","2023-01-12");
INSERT INTO DN_XD VALUES ("DN05","XD01","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD02","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD03","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD04","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD05","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD06","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD07","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD08","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD09","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD10","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD11","2023-02-14");
INSERT INTO DN_XD VALUES ("DN05","XD12","2023-02-14");
INSERT INTO DN_XD VALUES ("DN06","XD01","2023-01-03");
INSERT INTO DN_XD VALUES ("DN06","XD02","2023-01-03");
INSERT INTO DN_XD VALUES ("DN06","XD05","2023-01-03");
INSERT INTO DN_XD VALUES ("DN06","XD06","2023-01-03");
INSERT INTO DN_XD VALUES ("DN06","XD09","2023-01-03");
INSERT INTO DN_XD VALUES ("DN06","XD10","2023-01-03");
INSERT INTO DN_XD VALUES ("DN06","XD11","2023-01-03");
INSERT INTO DN_XD VALUES ("DN06","XD12","2023-01-03");
INSERT INTO DN_XD VALUES ("DN07","XD01","2023-02-02");
INSERT INTO DN_XD VALUES ("DN07","XD02","2023-02-02");
INSERT INTO DN_XD VALUES ("DN07","XD05","2023-02-02");
INSERT INTO DN_XD VALUES ("DN07","XD06","2023-02-02");
INSERT INTO DN_XD VALUES ("DN07","XD09","2023-02-02");
INSERT INTO DN_XD VALUES ("DN07","XD10","2023-02-02");
INSERT INTO DN_XD VALUES ("DN07","XD11","2023-02-02");
INSERT INTO DN_XD VALUES ("DN07","XD12","2023-02-02");
INSERT INTO DN_XD VALUES ("DN08","XD01","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD02","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD03","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD04","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD05","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD06","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD07","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD08","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD09","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD10","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD11","2023-01-14");
INSERT INTO DN_XD VALUES ("DN08","XD12","2023-01-14");
INSERT INTO DN_XD VALUES ("DN09","XD01","2023-03-09");
INSERT INTO DN_XD VALUES ("DN09","XD02","2023-03-09");
INSERT INTO DN_XD VALUES ("DN09","XD05","2023-03-09");
INSERT INTO DN_XD VALUES ("DN09","XD06","2023-03-09");
INSERT INTO DN_XD VALUES ("DN09","XD09","2023-03-09");
INSERT INTO DN_XD VALUES ("DN09","XD10","2023-03-09");
INSERT INTO DN_XD VALUES ("DN09","XD11","2023-03-09");
INSERT INTO DN_XD VALUES ("DN09","XD12","2023-03-09");
INSERT INTO DN_XD VALUES ("DN10","XD01","2023-01-14");
INSERT INTO DN_XD VALUES ("DN10","XD02","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD03","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD04","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD05","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD06","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD07","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD08","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD09","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD10","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD11","2023-01-09");
INSERT INTO DN_XD VALUES ("DN10","XD12","2023-01-09");

-- TRIGGER 
-- 1. Khi xoa 1 row trong LOAIXANG thi cac bang con lai cung phai xoa thong tin tuong ung

DELIMITER $$
CREATE TRIGGER del_loaixang 
BEFORE DELETE ON LOAIXANG 
FOR EACH ROW
BEGIN
	DECLARE malxdel CHAR(4);
    SELECT OLD.MALX INTO malxdel;
    SET FOREIGN_KEY_CHECKS = 0;
    DELETE FROM XANGDAU WHERE MALX = malxdel;
    SET FOREIGN_KEY_CHECKS = 1;
END$$
DELIMITER ;

-- 2. NGAYNK (DN_XD) không nhỏ hơn NGAYTL (DNNK) của một doanh nghiệp nhập khẩu xăng dầu

DELIMITER $$
CREATE TRIGGER update_dnnk 
BEFORE UPDATE ON doanhnghiepnk 
FOR EACH ROW
BEGIN
    IF (SELECT MIN(NGAYNK) FROM DN_XD WHERE MADN = NEW.MADN) < (SELECT NEW.NGAYTL) 
    THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'NGÀY NHẬP KHẨU KHÔNG ĐƯỢC NHỎ HƠN NGÀY THÀNH LẬP CỦA DOANH NGHIỆP!';
	END IF; 
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER insert_dnxd 
BEFORE INSERT ON dn_xd 
FOR EACH ROW
BEGIN
    IF (SELECT NEW.NGAYNK) < (SELECT NGAYTL FROM doanhnghiepnk WHERE MADN = NEW.MADN) 
    THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'NGÀY NHẬP KHẨU KHÔNG ĐƯỢC NHỎ HƠN NGÀY THÀNH LẬP CỦA DOANH NGHIỆP!';
	END IF; 
END$$
DELIMITER ;

-- 3. NGAYNHAP của 1 xăng dầu không được nhỏ hơn NGAYNK đầu tiên của chính nó 
DELIMITER $$
CREATE TRIGGER insert_nhap 
BEFORE INSERT ON nhap 
FOR EACH ROW
BEGIN
    IF (SELECT NEW.NGAYNHAP) < (SELECT MIN(NGAYNK) FROM DN_XD WHERE MAXD = NEW.MAXD) 
    THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'NGÀY NHẬP CỦA 1 XĂNG DẦU KHÔNG ĐƯỢC NHỎ HƠN NGÀY NHẬP KHẨU ĐẦU TIÊN CỦA CHÍNH NÓ!';
	END IF; 
END$$
DELIMITER ;

-- 4. Cửa hàng phải đạt BACCL là I hoặc II, CHIEUCAOMC phải lớn hơn hoặc bằng 4.75m, RONGDD lớn hơn hoặc bằng 6.5m
-- , CAOTUONGBAO không nhỏ hơn 2.2m thì mới được phép nhập xăng dầu để bán
DELIMITER $$
CREATE TRIGGER insert_cuahang 
BEFORE INSERT ON CUAHANG 
FOR EACH ROW
BEGIN
    IF (SELECT NEW.BACCL) NOT IN ('I','II')
    THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'BẬC CHỊU LỬA PHẢI LÀ I HOẶC II!';
	END IF;
	IF (SELECT NEW.RONGDD) < 6.5 
    THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'CHIỀU RỘNG ĐƯỜNG ĐI PHẢI LỚN HƠN HOẶC BẰNG 6.5m!';
	END IF; 
    IF (SELECT NEW.CAOTB) < 2.2 
    THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'CHIỀU CAO TƯỜNG BAO KHÔNG ĐƯỢC NHỎ HƠN 2.2m!';
	END IF; 
    IF (SELECT NEW.CAOMC) < 4.75 
    THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'CHIỀU CAO MÁI CHE PHẢI LỚN HƠN HOẶC BẰNG 4.75m!';
	END IF; 
END$$
DELIMITER ;

-- 5. GIANHAP = GIACOSO + (THUEPHI / 100) * GIACOSO
DELIMITER $$
CREATE TRIGGER insert_nhap_gianhap
BEFORE INSERT ON nhap 
FOR EACH ROW
BEGIN
	DECLARE GIACS DECIMAL(5,3);
    DECLARE THUE INT;
    SELECT GIACOSO INTO GIACS FROM xangdau WHERE MAXD = NEW.MAXD;
    SELECT THUEPHI INTO THUE FROM xangdau WHERE MAXD = NEW.MAXD;
    SET NEW.GIANHAP = GIACS + (THUE * 1.0 / 100) * GIACS;
END$$
DELIMITER ;



