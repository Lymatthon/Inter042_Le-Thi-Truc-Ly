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
---------------- Dien thong tin vao bang hop dong
INSERT INTO furamadb.hopdong  VALUES ('1', '2', '2', '1', '2021-01-09', '2021-01-15', '200', '400');
INSERT INTO furamadb.hopdong  VALUES ('2', '3', '4', '2', '2021-01-12', '2021-01-18', '100', '1700');
INSERT INTO furamadb.hopdong  VALUES ('3', '3', '1', '3', '2021-02-19', '2021-02-28', '400', '2300');
INSERT INTO furamadb.hopdong  VALUES ('4', '1', '2', '1', '2021-01-23', '2021-02-02', '500', '3000');
---------------- Dien thong tin vao bang hop dong chi tiet
INSERT INTO mydb.hopdongchitiet VALUES ('1', '3', '2', '3');
INSERT INTO mydb.hopdongchitiet VALUES ('2', '2', '2', '2');
INSERT INTO mydb.hopdongchitiet VALUES ('3', '1', '3', '3');
INSERT INTO mydb.hopdongchitiet VALUES ('4', '4', '4', '1');
---------------- Dien thong tin vao bang dich vu
INSERT INTO furamadb.dichvu  VALUES ('1', 'Villa', '78', '4', '12', '1500', '1', '3', 'co san');
INSERT INTO furamadb.dichvu  VALUES ('2', 'House', '54', '2', '4', '600', '2', '2', 'co san');
INSERT INTO furamadb.dichvu  VALUES ('3', 'Room', '37', '1', '2', '300', '4', '1', 'co san');












  
  