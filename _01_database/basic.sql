DROP DATABASE IF EXISTS furamadb;
CREATE SCHEMA IF NOT EXISTS furamadb;
USE furamadb;

CREATE TABLE IF NOT EXISTS furamadb.ViTri (
  idViTri INT PRIMARY KEY NOT NULL,
  TenViTri VARCHAR(45)
  );
  
CREATE TABLE IF NOT EXISTS furamadb.TrinhDo (
  idTrinhDo INT PRIMARY KEY NOT NULL,
  TrinhDo VARCHAR(45)
 );
 
 CREATE TABLE IF NOT EXISTS furamadb.BoPhan (
  idBoPhan INT PRIMARY KEY NOT NULL,
  TenBoPhan VARCHAR(45) 
  );
  
  CREATE TABLE IF NOT EXISTS furamadb.NhanVien (
  idNhanVien INT PRIMARY KEY NOT NULL,
  HoTen VARCHAR(45),
  idViTri INT,
  idTrinhDo INT,
  idBoPhan INT,
  NgaySinh DATE,
  SoCMTND VARCHAR(45),
  Luong VARCHAR(45),
  SDT VARCHAR(45),
  Email VARCHAR(45),
  DiaChi VARCHAR(45),
  CONSTRAINT FK_NhanVien_ViTri
    FOREIGN KEY (idViTri)
    REFERENCES furamadb.ViTri (idViTri),
  CONSTRAINT FK_NhanVien_TrinhDo
    FOREIGN KEY (idTrinhDo)
    REFERENCES furamadb.TrinhDo (idTrinhDo),
  CONSTRAINT Fk_NhanVien_BoPhan
    FOREIGN KEY (idBoPhan)
    REFERENCES furamadb.BoPhan (idBoPhan)
  );
  
  CREATE TABLE IF NOT EXISTS furamadb.KieuThue (
  idKieuThue INT NOT NULL,
  TenKieuThue VARCHAR(45),
  Gia INT,
  PRIMARY KEY (idKieuThue)
  );
  
  CREATE TABLE IF NOT EXISTS furamadb.LoaiDichVu (
  idLoaiDichVu INT NOT NULL,
  TenLoaiDV VARCHAR(45),
  PRIMARY KEY (idLoaiDichVu)
  );
  
  CREATE TABLE IF NOT EXISTS furamadb.DichVu (
  idDichVu INT NOT NULL,
  TenDichVu VARCHAR(45),
  DienTich DECIMAL(2),
  SoTang INT,
  SoNguoiToiDa VARCHAR(45),
  ChiPhiThue VARCHAR(45),
  idKieuThue INT,
  idLoaiDichVu INT,
  TrangThai VARCHAR(45),
  PRIMARY KEY (idDichVu),
  
  CONSTRAINT FK_DichVu_KieuThue
    FOREIGN KEY (idKieuThue)
    REFERENCES furamadb.KieuThue (idKieuThue),
  CONSTRAINT FK_DichVu_LoaiDichVu
  FOREIGN KEY (idLoaiDichVu)
    REFERENCES furamadb.LoaiDichVu (idLoaiDichVu)
    );
    
CREATE TABLE IF NOT EXISTS furamadb.LoaiKhach (
  idLoaiKhach INT NOT NULL,
  LoaiKhach VARCHAR(45),
  PRIMARY KEY (idLoaiKhach)
  );
  
  CREATE TABLE IF NOT EXISTS furamadb.KhachHang (
  idKhachHang INT NOT NULL,
  idLoaiKhach INT,
  HoTen VARCHAR(45),
  NgaySinh DATE,
  SoCMTND VARCHAR(45),
  SDT VARCHAR(45),
  Email VARCHAR(45),
  DiaChi VARCHAR(45),
  PRIMARY KEY (idKhachHang),
  CONSTRAINT FK_KhachHanh_LoaiKhach
    FOREIGN KEY (idLoaiKhach)
    REFERENCES furamadb.LoaiKhach (idLoaiKhach)
);

CREATE TABLE IF NOT EXISTS furamadb.HopDong (
  idHopDong INT NOT NULL,
  idNhanVien INT,
  idKhachHang INT,
  idDichVu INT,
  NgayLamHopDong DATE,
  NgayKetThuc DATE,
  TienDatCoc INT,
  TongTien INT,
  PRIMARY KEY (idHopDong),
  CONSTRAINT FK_HopDong_NhanVien
    FOREIGN KEY (idNhanVien)
    REFERENCES furamadb.NhanVien (idNhanVien),
  CONSTRAINT FK_HopDong_DichVu
    FOREIGN KEY (idDichVu)
    REFERENCES furamadb.DichVu (idDichVu),
  CONSTRAINT FK_HopDong_KhachHang
    FOREIGN KEY (idKhachHang)
    REFERENCES furamadb.KhachHang (idKhachHang)
    );
    
CREATE TABLE IF NOT EXISTS furamadb.DichVuDiKem (
  idDichVuDiKem INT NOT NULL,
  TenDichVuDiKem VARCHAR(45),
  Gia INT,
  PRIMARY KEY (idDichVuDiKem)
  );

CREATE TABLE IF NOT EXISTS furamadb.HopDongChiTiet (
  idHDCT INT NOT NULL,
  idHopDong INT NULL,
  idDichVuDiKem INT NULL,
  SoLuong INT NULL,
  PRIMARY KEY (idHDCT),
  CONSTRAINT FK_HDCT_HD
    FOREIGN KEY (idHopDong)
    REFERENCES furamadb.HopDong (idHopDong),
  CONSTRAINT FK_HDCT_DVDK
    FOREIGN KEY (idDichVuDiKem)
    REFERENCES furamadb.DichVuDiKem (idDichVuDiKem)
    );
  
  ------ cau 1 --------------
  ---------------- Dien thong tin vao bang Bo Phan
INSERT INTO furamadb.bophan VALUES ('1', 'Sale – Marketing');
INSERT INTO furamadb.bophan VALUES ('2', 'Hanh Chinh');
INSERT INTO furamadb.bophan VALUES ('3', 'Phuc Vu');
INSERT INTO furamadb.bophan VALUES ('4', 'Quan Ly');
---------------- Dien thong tin vao bang Vi Tri
INSERT INTO furamadb.vitri  VALUES ('1', 'Le Tan');
INSERT INTO furamadb.vitri  VALUES ('2', 'Phuc Vu');
INSERT INTO furamadb.vitri  VALUES ('3', 'Chuyen Vien');
INSERT INTO furamadb.vitri  VALUES ('4', 'Giam Sat');
INSERT INTO furamadb.vitri  VALUES ('5', 'Quan Ly');
INSERT INTO furamadb.vitri  VALUES ('6', 'Giam Doc');

---------------- Dien thong tin vao bang TrinhDo----
INSERT INTO furamadb.trinhdo  VALUES ('1', 'Dai Hoc');
INSERT INTO furamadb.trinhdo  VALUES ('2', 'Trung Cap');
INSERT INTO furamadb.trinhdo  VALUES ('3', 'Cao Dang');
INSERT INTO furamadb.trinhdo  VALUES ('4', 'Sau Dai Hoc');
---------------- Dien thong tin vao bang Loai Khach
INSERT INTO furamadb.loaikhach  VALUES ('1', 'Diamond');
INSERT INTO furamadb.loaikhach  VALUES ('2', 'Platinium');
INSERT INTO furamadb.loaikhach  VALUES ('3', 'Gold');
INSERT INTO furamadb.loaikhach  VALUES ('4', 'Silver');
INSERT INTO furamadb.loaikhach  VALUES ('5', 'Member');
---------------- Dien thong tin vao bang Loai dich vu
INSERT INTO furamadb.loaidichvu  VALUES ('1', 'Cao cap');
INSERT INTO furamadb.loaidichvu  VALUES ('2', 'Mien phi');
INSERT INTO furamadb.loaidichvu  VALUES ('3', 'Thong thuong');
---------------- Dien thong tin vao bang Khach Hang
INSERT INTO furamadb.khachhang VALUES ('1', '4', 'Le Van', '1993-1-12', '2232434', '0901999212', 'levan@gmail.com', 'Da Nang');
INSERT INTO furamadb.khachhang VALUES ('2', '2', 'My Quyen', '2000-09-01', '22343425', '0911992888', 'levan01@gmail.com', 'Sai Gon');
INSERT INTO furamadb.khachhang VALUES ('3', '3', 'Khai Vinh', '1999-12-01', '43324345', '0922837465', 'vinh@gmail.com', 'Bac Ninh');
INSERT INTO furamadb.khachhang VALUES ('4', '2', 'Truc Ly', '2002-12-12', '8787873', '0234645322', 'ly@gmail.com', 'Lang Son');
INSERT INTO furamadb.khachhang  VALUES ('5', '3', 'Khai Vinh', '1999-09-12', '1215122', '0901999542', '125@gmail.com', 'Binh Dinh ');
INSERT INTO furamadb.khachhang  VALUES ('6', '4', 'Le Van', '1998-05-01', '1542213', '0932121254', 'hihi@gmail.com', 'Khanh Hoa');
INSERT INTO furamadb.khachhang  VALUES ('7', '1', 'Thai', '1998-06-01', '1212511', '26321646', 'hung@gmail.com', 'Quang Ngai');
INSERT INTO furamadb.khachhang  VALUES ('8', '1', 'Tran', '1998-07-01', '12544512', '415645436', 'tran@gmail.com', 'Vinh');
INSERT INTO furamadb.khachhang  VALUES ('9', '2', 'Tran Linh', '1998-05-11', '1124412', '12154852154', 'linh@gmail.com', 'Quang Ngai');
INSERT INTO furamadb.khachhang  VALUES ('7', '2', 'Lanh Nguyen', '1978-09-26', '432656645', '0901999385', 'lanh@gmail.com', 'Binh Duong');

---------------- Dien thong tin vao bang Dich Vu Di kem
INSERT INTO furamadb.dichvudikem  VALUES ('1', 'massage', '100');
INSERT INTO furamadb.dichvudikem  VALUES ('2', 'karaoke', '120');
INSERT INTO furamadb.dichvudikem  VALUES ('3', 'thuc an', '220');
INSERT INTO furamadb.dichvudikem  VALUES ('4', 'nuoc uong', '80');
INSERT INTO furamadb.dichvudikem  VALUES ('5', 'thue xe', '120');
---------------- Dien thong tin vao bang kieu Thue
INSERT INTO furamadb.kieuthue  VALUES ('1', 'Theo gio', '200');
INSERT INTO furamadb.kieuthue  VALUES ('2', 'Theo ngay', '1300');
INSERT INTO furamadb.kieuthue  VALUES ('3', 'Theo thang', '6200');
INSERT INTO furamadb.kieuthue  VALUES ('4', 'Theo nam', '19000');
---------------- Dien thong tin vao bang nhan vien
INSERT INTO furamadb.nhanvien  VALUES ('1', 'Tran Tran', '2', '2', '3', '2000-12-09', '8989809', '2000', '0901', 'abc@gmail.com', 'Quang ngai');
INSERT INTO furamadb.nhanvien  VALUES ('2', 'Quang Vu', '3', '1', '2', '1999-09-23', '3334090', '1900', '0232', 'hya@gmail.com', 'Da Nang');
INSERT INTO furamadb.nhanvien  VALUES ('3', 'Lan Vien', '1', '3', '1', '1998-07-22', '7777754', '2990', '0902', 'lan@gmail.com', 'Thanh Hoa');
INSERT INTO furamadb.nhanvien  VALUES ('4', 'Truc Vy', '4', '4', '4', '1990-02-22', '6666345', '3322', '0898', 'Vytruc@gmail.com', 'Da Nang');
INSERT INTO furamadb.nhanvien  VALUES ('5', 'Yen Nhan', '2', '1', '2', '1990-02-20', '21511235', '1254', '124874', 'nhan@gmail.com', 'Da Nang');
INSERT INTO furamadb.nhanvien  VALUES ('5', 'Tran Thanh', '1', '2', '2', '1990-02-23', '0943096', '34565', '43534', 'tranthan@gmail.com', 'Hai Chau');
INSERT INTO furamadb.nhanvien  VALUES ('6', 'Hari Won', '2', '3', '3', '1990-02-24', '45636446', '36543', '3453', 'won@gmail.com', 'Hai Chau');


---------------- Dien thong tin vao bang dich vu
INSERT INTO furamadb.dichvu  VALUES ('1', 'Villa', '78', '4', '12', '1500', '1', '3', 'co san');
INSERT INTO furamadb.dichvu  VALUES ('2', 'House', '54', '2', '4', '600', '2', '2', 'co san');
INSERT INTO furamadb.dichvu  VALUES ('3', 'Room', '37', '1', '2', '300', '4', '1', 'co san');
---------------- Dien thong tin vao bang hop dong
INSERT INTO furamadb.hopdong  VALUES ('1', '2', '2', '1', '2021-01-09', '2021-01-15', '200', '400');
INSERT INTO furamadb.hopdong  VALUES ('2', '3', '4', '2', '2021-01-12', '2021-01-18', '100', '1700');
INSERT INTO furamadb.hopdong  VALUES ('3', '3', '1', '3', '2021-02-19', '2021-02-28', '400', '2300');
INSERT INTO furamadb.hopdong  VALUES ('4', '1', '2', '1', '2021-01-23', '2021-02-02', '500', '3000');
INSERT INTO furamadb.hopdong  VALUES ('5', '2', '2', '2', '2019-01-03', '2019-01-13', '232', '2000');
INSERT INTO furamadb.hopdong  VALUES ('6', '3', '3', '2', '2019-02-05', '2019-02-28', '225', '2301');
INSERT INTO furamadb.hopdong  VALUES ('7', '2', '4', '3', '2019-03-03', '2019-03-05', '164', '1200');
INSERT INTO furamadb.hopdong  VALUES ('8', '1', '1', '2', '2019-04-03', '2019-04-21', '498', '1540');
INSERT INTO furamadb.hopdong  VALUES ('9', '3', '2', '1', '2018-04-13', '2018-04-20', '233', '1000');
INSERT INTO furamadb.hopdong  VALUES ('10', '2', '3', '2', '2018-08-13', '2018-08-23', '222', '1200');
INSERT INTO furamadb.hopdong  VALUES ('11', '1', '3', '1', '2018-04-23', '2018-05-01', '151', '1300');
INSERT INTO furamadb.hopdong  VALUES ('12', '1', '3', '3', '2019-01-05', '2019-01-15', '200', '1300');
INSERT INTO furamadb.hopdong  VALUES ('13', '2', '7', '3', '2019-01-06', '2019-01-18', '300', '13000');
INSERT INTO furamadb.hopdong  VALUES ('14', '3', '8', '2', '2019-01-07', '2019-01-21', '115', '135410');
INSERT INTO furamadb.hopdong  VALUES ('15', '4', '9', '1', '2019-01-09', '2019-02-15', '2131', '15440');
INSERT INTO furamadb.hopdong  VALUES ('16', '2', '7', '3', '2019-01-08', '2019-01-20', '1545', '1574542');
INSERT INTO furamadb.hopdong  VALUES ('14', '2', '7', '3', '2016-01-08', '2016-01-09', '23', '123');
INSERT INTO furamadb.hopdong  VALUES ('14', '1', '3', '5', '2019-12-12', '2019-12-13', '213', '12313');
INSERT INTO furamadb.hopdong  VALUES ('15', '2', '4', '6', '2019-12-12', '2019-12-15', '123', '1233');
INSERT INTO furamadb.hopdong  VALUES ('16', '2', '1', '6', '2019-12-12', '2019-12-18', '123', '2142');
INSERT INTO furamadb.hopdong  VALUES ('17', '2', '3', '6', '2019-12-12', '2019-12-20', '444', '14223');



---------------- Dien thong tin vao bang hop dong chi tiet
INSERT INTO furamadb.hopdongchitiet VALUES ('1', '3', '2', '3');
INSERT INTO furamadb.hopdongchitiet VALUES ('2', '2', '2', '2');
INSERT INTO furamadb.hopdongchitiet VALUES ('3', '1', '3', '3');
INSERT INTO furamadb.hopdongchitiet VALUES ('4', '4', '4', '1');
INSERT INTO furamadb.hopdongchitiet  VALUES ('5', '2', '2', '1');
INSERT INTO furamadb.hopdongchitiet  VALUES ('6', '3', '3', '2');
INSERT INTO furamadb.hopdongchitiet  VALUES ('7', '1', '4', '3');
INSERT INTO furamadb.hopdongchitiet  VALUES ('8', '5', '1', '5');
INSERT INTO furamadb.hopdongchitiet  VALUES ('9', '10', '3', '1');
INSERT INTO furamadb.hopdongchitiet  VALUES ('10', '11', '2', '3');
INSERT INTO furamadb.hopdongchitiet  VALUES ('11', '14', '3', '2');
INSERT INTO furamadb.hopdongchitiet  VALUES ('12', '15', '2', '1');
INSERT INTO furamadb.hopdongchitiet  VALUES ('13', '16', '4', '4');
INSERT INTO furamadb.hopdongchitiet  VALUES ('14', '13', '4', '1');
INSERT INTO furamadb.hopdongchitiet  VALUES ('15', '11', '4', '2');
INSERT INTO furamadb.hopdongchitiet  VALUES ('16', '12', '4', '2');
INSERT INTO furamadb.hopdongchitiet  VALUES ('17', '13', '4', '3');
INSERT INTO furamadb.hopdongchitiet  VALUES ('18', '12', '4', '2');
INSERT INTO furamadb.hopdongchitiet  VALUES ('19', '11', '4', '1');
INSERT INTO furamadb.hopdongchitiet  VALUES ('20', '13', '4', '2');
INSERT INTO furamadb.hopdongchitiet  VALUES ('21', '12', '4', '2');
INSERT INTO furamadb.hopdongchitiet  VALUES ('22', '12', '4', '1');



----- cau 2 ----
select * from nhanvien
where  HoTen LIKE 'H%' or HoTen LIKE 'L%' or HoTen LIKE 'T%' and length(HoTen)<=15;

----- cau 3 ------
select * from khachhang
where DiaChi like "Da Nang" or DiaChi like "Quang Tri" and year(NgaySinh) between 1971 and 2003;

---- cau 4 ---

select hopdong.idKhachHang,hopdong.idDichVu, hopdong.NgayLamHopDong,hopdong.NgayKetThuc, count(*), loaikhach.LoaiKhach from hopdong
 join khachhang on hopdong.idKhachHang = khachhang.idKhachHang
 join loaikhach on khachhang.idLoaiKhach = loaikhach.idLoaiKhach
where loaikhach.LoaiKhach = 'Diamond'
group by hopdong.idKhachHang
order by count(*) asc;

----- cau 5 ------
select khachhang.idKhachHang, khachhang.HoTen, loaikhach.LoaiKhach, hopdong.idHopDong, dichvu.TenDichVu, hopdong.NgayLamHopDong,hopdong.NgayKetThuc, (dichvu.ChiPhiThue + hopdongchitiet.SoLuong * dichvudikem.gia)as TongTien  from khachhang
 join loaikhach on khachhang.idLoaiKhach = loaikhach.idLoaiKhach
 join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
 join dichvu on hopdong.idDichVu = dichvu.idDichVu
 join hopdongchitiet on hopdong.idHopDong = hopdongchitiet.idHopDong
 join dichvudikem on hopdongchitiet.idDichVuDiKem = dichvudikem.idDichVuDiKem
group by khachhang.idKhachHang;

----- cau 6 ------
select dichvu.idDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.ChiPhiThue, loaidichvu.TenLoaiDV from dichvu
join loaidichvu on dichvu.idLoaiDichVu = loaidichvu.idLoaiDichVu
where dichvu.idDichVu not in ( select 
hopdong.idDichVu from hopdong
where hopdong.NgayLamHopDong between '2019-01-01' and '2019-03-31'
);

------ cau 7 ------------
select dichvu.idDichVu, dichvu.TenDichVu, dichvu.DienTich, dichvu.songuoitoida, dichvu.ChiPhiThue, loaidichvu.TenLoaiDV from dichvu 
join hopdong on dichvu.iddichvu = hopdong.iddichvu
join loaidichvu on dichvu.idLoaiDichVu = loaidichvu.idLoaiDichVu
where year(hopdong.ngaylamhopdong)=2018 and hopdong.iddichvu = (select dichvu.iddichvu from dichvu
where dichvu.iddichvu not in 
(select hopdong.idDichVu from hopdong
join dichvu on hopdong.idDichVu = dichvu.idDichVu
where year(hopdong.NgayLamHopDong) = 2019));

----- cau 8
-- -cach 1---
select distinct hoten  from khachhang;

-- -cach 2---
select hoten from khachhang 
group by hoten;

---- cach 3


---- cau 9
select month(hopdong.ngaylamhopdong) as thang, count(hopdong.idhopdong) as sokhachhang from hopdong
where year(hopdong.ngaylamhopdong)='2019'
group by thang;

---- cau 10
select hopdong.idhopdong, count(hopdongchitiet.idHDCT) as SoLuongDichVuDiKem, hopdong.ngaylamhopdong, hopdong.ngayketthuc, hopdong.tiendatcoc
from hopdong
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
group by hopdong.idhopdong;

---- cau 11

select khachhang.hoten, loaikhach.loaikhach, dichvudikem.tendichvudikem, khachhang.diachi from hopdong
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
join khachhang on hopdong.idkhachhang = khachhang.idkhachhang
join loaikhach on khachhang.idloaikhach = loaikhach.idloaikhach
join dichvudikem on hopdongchitiet.idDichVuDiKem = dichvudikem.idDichVuDiKem
where loaikhach.loaikhach = 'Diamond' and khachhang.diachi = 'Quang Ngai' or khachhang.diachi = 'vinh';

----- cau 12
select hopdong.idhopdong, nhanvien.hoten, khachhang.hoten, khachhang.sdt, dichvu.tendichvu, count(idHDCT) as SoLuongDichVuDiKem
from hopdong
join nhanvien on hopdong.idnhanvien = nhanvien.idnhanvien
join khachhang on hopdong.idkhachhang = khachhang.idkhachhang
join dichvu on hopdong.iddichvu = dichvu.iddichvu
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
where hopdong.NgayLamHopDong between '2019-10-01' and '2019-12-31'
and dichvu.iddichvu not in 
(select hopdong.idDichVu from hopdong
join dichvu on hopdong.idDichVu = dichvu.idDichVu
where hopdong.NgayLamHopDong between '2019-01-01' and '2019-06-30')
group by dichvu.tendichvu;

----- cau 13
select dichvudikem.tendichvudikem, count(*) as Solansudung from hopdong
join khachhang on hopdong.idkhachhang = khachhang.idkhachhang
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
join dichvudikem on hopdongchitiet.iddichvudikem = dichvudikem.iddichvudikem
group by dichvudikem.tendichvudikem;

----- cau 14
select hopdong.idhopdong, loaidichvu.tenloaiDV, dichvudikem.tendichvudikem, count(hopdong.idhopdong) as SoLanSuDung
from hopdong
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
join dichvudikem on hopdongchitiet.iddichvudikem = dichvudikem.iddichvudikem
join dichvu on hopdong.iddichvu = dichvu.iddichvu
join loaidichvu on dichvu.idloaidichvu = loaidichvu.idloaidichvu
group by dichvudikem.tendichvudikem 
having SoLanSuDung = 1;

---- cau 15
select nhanvien.idnhanvien, nhanvien.hoten, trinhdo.trinhdo, bophan.tenbophan, nhanvien.sdt, nhanvien.diachi, count(hopdong.idhopdong) as SoLuongHopDong
from hopdong
join nhanvien on hopdong.idnhanvien = nhanvien.idnhanvien
join trinhdo on nhanvien.idtrinhdo = trinhdo.idtrinhdo
join bophan on nhanvien.idbophan = bophan.idbophan
where year(hopdong.ngaylamhopdong) between '2018' and '2019'
group by nhanvien.idnhanvien
having SoLuongHopDong <=3;

---- cau 16
SET SQL_SAFE_UPDATES = 0;
delete from furamadb.nhanvien
where nhanvien.idnhanvien not in 
(select nhanvien.idnhanvien 
from (select * from furamadb.nhanvien) as nhanvientemp
join furamadb.hopdong on hopdong.idnhanvien = nhanvien.idnhanvien
group by nhanvien.idnhanvien);

---- cau 17




---- cau 18
SET SQL_SAFE_UPDATES = 0;
update hopdong 
set hopdong.idkhachhang = null
where year(hopdong.ngaylamhopdong) = 2016;
delete from hopdong 
where year(hopdong.ngaylamhopdong) = 2016;

----- cau 19
SET SQL_SAFE_UPDATES = 0;
update furamadb.dichvudikem
set dichvudikem.gia = dichvudikem.gia * 2
where dichvudikem.idDichVuDiKem in 
(select hopdongchitiet.iddichvudikem from hopdongchitiet
join hopdong on hopdongchitiet.idhopdong = hopdong.idhopdong
where year(hopdong.NgayLamHopDong) = 2019
group by hopdongchitiet.iddichvudikem
having count(hopdongchitiet.idHDCT) >= 10);

----- cau 20
select nhanvien.idnhanvien as id , nhanvien.HoTen, nhanvien.Email, nhanvien.SDT, nhanvien.NgaySinh, nhanvien.DiaChi from nhanvien
union
select khachhang.idKhachHang as id, khachhang.HoTen, khachhang.Email, khachhang.SDT, khachhang.NgaySinh, khachhang.DiaChi from khachhang;


---- SQL advance -----
 ----- cau 21
drop view if exists V_NHANVIEN;
create view V_NHANVIEN as
select nhanvien.idNhanVien, nhanvien.HoTen, nhanvien.idViTri, nhanvien.idtrinhdo, nhanvien.NgaySinh, nhanvien.SDT, nhanvien.Email, nhanvien.SoCMTND, nhanvien.luong, nhanvien.diachi  from nhanvien
join hopdong on hopdong.idNhanVien = nhanvien.idNhanVien
where nhanvien.DiaChi = 'Hai Chau' and hopdong.NgayLamHopDong = '2019-12-12'
 ;
 
 ---- cau 22
SET SQL_SAFE_UPDATES = 0;
update V_NHANVIEN
set v_nhanvien.diachi = 'Lien Chieu';

---- cau 23

create index IX_KHACHHANG on khachhang(idkhachhang);
drop index IX_KHACHHANG on khachhang;
----- cau 24

create index IX_SoDT_DiaChi on khachhang(sdt, diachi);
drop index  IX_SoDT_DiaChi on khachhang;


---- cau 25

DELIMITER //
create procedure Sp_1(
in id_delete INT,
OUT message varchar(45)
)
If id_delete in (select idkhachhang from khachhang) then
begin 
	delete from khachhang where khachhang.idkhachhang = id_delete;
    set message = 'Khach hang da duoc xoa';
end;
else
begin
	set message = 'Khach hang khong ton tai';
end;
end if;
// delimiter ;
start transaction;

call Sp_1 (7,@message);
select @message;

rollback;

---- cau 26
DELIMITER //
create procedure Sp_2(
in id_addnew INT,
   idNhanVien INT,
   idKhachHang INT,
   idDichVu INT,
   NgayLamHopDong DATE,
   NgayKetThuc DATE,
   TienDatCoc INT,
   TongTien INT,
OUT message varchar(45)
)
If  id_addnew not in (select idHopDong from hopdong)
and idNhanVien in (select idnhanvien from nhanvien)
and idKhachHang in (select idKhachHang from khachhang)
and idDichVu in (select idDichVu from dichvu)
then
begin 
	insert into hopdong 
    value('id_addnew','idNhanVien','idKhachHang','idDichVu','NgayLamHopDong','NgayKetThuc', 'TienDatCoc','TongTien');
    set message = 'Hop dong da duoc them moi';
end;
else
begin
	set message = 'Kieu du lieu khong hop le';
end;
end if;
// delimiter ;
start transaction;

call Sp_1 (7,@message);
select @message;

rollback;
---- cau 27
create table hopdong_remain (
SoLuongHopDongConLai INT primary key

);
drop trigger if exists Tr_1;
create trigger Tr_1
		after delete on hopdong
        for each row
        update hopdong_remain
        set SoLuongHopDongConLai = count(idhopdong);
        select * from hopdong_remain;        
SHOW TRIGGERS;
---- cau 28
drop trigger if exists Tr_2;
create table alert (
message varchar(50)
);
create trigger Tr_2
		before update on hopdong       
        for each row
        if new.ngayketthuc - hopdong.ngaylamhopdong >= 2 then
        update hopdong
        set hopdong.ngayketthuc = new.ngayketthuc
        else 
        update alert
        set message = 'Ngay ket thuc hop dong phai hon ngay bat dau hop dong'
        end if;
        ;
     
SHOW TRIGGERS;

----- cau 29
---- cau a
DROP FUNCTION IF EXISTS func_1;
DELIMITER //
CREATE FUNCTION func_1(SoTien int)
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE dem int;
    set dem = (select count(DISTINCT iddichvu) from hopdong where TongTien > money);
	-- return the student level
	RETURN (dem);
END//
DELIMITER ;
SELECT func_1 (2000000);

--- cau b




----- cau 30
DELIMITER //
create procedure Sp_3(
IN loaiDV varchar(45),
OUT message varchar(45)
)
If loaiDV in (select tendichvu from dichvu
			join hopdong on dichvu.iddichvu = hopdong.iddichvu
			where year(hopdong.ngaylamhopdong) between '2015' and '2019'
) then

begin 
	delete from dichvu where dichvu.tendichvu = loaiDV;
    set message = 'Thong tin dich vu da duoc xoa';
end;
else
begin
	set message = 'Thong tin dich vu khong ton tai';
end;
end if;
// delimiter ;
start transaction;

call Sp_3 ('room',@message);
select @message;

rollback;





 

 










  
  