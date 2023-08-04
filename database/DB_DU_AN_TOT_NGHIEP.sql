CREATE DATABASE DB_DU_AN_TOT_NGHIEP;
USE DB_DU_AN_TOT_NGHIEP

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE hang_dien_thoai(
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ten VARCHAR(50) NULL,
  xuat_su VARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);
--select ct.* from imei i left join chi_tiet_san_pham ct on i.id_chi_tiet_san_pham=ct.id where i.id= '74B8C5C7-7139-4D16-8442-34C456CF9756'
--select ct.* from chi_tiet_san_pham ct left  join imei  i on ct.id=i.id_chi_tiet_san_pham left join hoa_don_chi_tiet hd on i.id=hd.id_imei where hd.id='96E06F89-7177-43E8-A95B-133FFB18529C'
select * from imei
--select*from imei where id_chi_tiet_san_pham = 'AD9DD38E-12DB-4314-BA18-50AE7C292626'
select*from hoa_don_chi_tiet
delete from hoa_don
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE anh(
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ten VARCHAR(50) NULL,
  url_anh1 VARCHAR(MAX) NULL,
  url_anh2 VARCHAR(MAX) NULL,
  url_anh3 VARCHAR(MAX) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE chip(
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ten VARCHAR(50) NULL,
  loai_cpu VARCHAR(50) NULL,
  so_nhan int DEFAULT 8,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE ram(
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  dung_luong VARCHAR(30) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE rom(
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  dung_luong VARCHAR(30) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE man_hinh (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  thong_so NVARCHAR(50) NULL,
  loai_cam_ung NVARCHAR(100) NULL,
  ti_le_khung_hinh VARCHAR(50) NULL,
  cong_nghe_man_hinh VARCHAR(100) NULL,
  do_phan_giai VARCHAR(50) NULL,
  tan_so_quet VARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE camera (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  thong_so NVARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE mau_sac(
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ten NVARCHAR(30) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE san_pham (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ten VARCHAR(50) NULL,
  he_dieu_hanh VARCHAR(50) NULL,
  so_sim INT DEFAULT 1,
  bluetooth VARCHAR(50) NULL,
  ho_tro_mang VARCHAR(50) NULL,
  cong_giao_tiep NVARCHAR(100) NULL,
  thong_so_wifi VARCHAR(50) NULL,
  kich_thuoc VARCHAR(50) NULL,
  trong_luong VARCHAR(50) NULL,
  chat_lieu VARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang INT DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL,
  id_hang UNIQUEIDENTIFIER NULL,
  id_anh UNIQUEIDENTIFIER NULL,
  id_man_hinh UNIQUEIDENTIFIER NULL,
  id_camera UNIQUEIDENTIFIER NULL,
  FOREIGN KEY (id_hang) REFERENCES hang_dien_thoai(id),
  FOREIGN KEY (id_man_hinh) REFERENCES man_hinh(id),
  FOREIGN KEY (id_camera) REFERENCES camera(id),
  FOREIGN KEY (id_anh) REFERENCES anh(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE dung_luong_pin (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  thong_so VARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE pin (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  loai_pin VARCHAR(50) NULL,
  cong_nghe_pin VARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang INT DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL,
  id_dung_luong UNIQUEIDENTIFIER NULL,
  FOREIGN KEY (id_dung_luong) REFERENCES dung_luong_pin(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE khuyen_mai (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ten NVARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  ngay_bat_dau DATE NOT NULL,
  ngay_ket_thuc DATE NOT NULL,
  loai_giam_gia VARCHAR(20) NULL,
  hinh_thuc_giam_gia VARCHAR(20) NULL,
  so_tien_giam  decimal(20, 0) NULL,
  tinh_trang INT DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE chi_tiet_san_pham (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  id_san_pham UNIQUEIDENTIFIER NULL,
  id_mau_sac UNIQUEIDENTIFIER NULL,
  id_chip UNIQUEIDENTIFIER NULL,
  id_ram UNIQUEIDENTIFIER NULL,
  id_rom UNIQUEIDENTIFIER NULL,
  id_pin UNIQUEIDENTIFIER NULL,
  url_anh VARCHAR(255) NULL,
  gia_nhap  decimal(20, 0) NULL,
  gia_ban  decimal(20, 0) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang INT DEFAULT 0,
  nam_bao_hanh INT NULL,
  so_luong_ton INT NULL,
  mo_ta NVARCHAR(MAX) NULL,
  FOREIGN KEY (id_san_pham) REFERENCES san_pham(id),
  FOREIGN KEY (id_mau_sac) REFERENCES mau_sac(id),
  FOREIGN KEY (id_chip) REFERENCES chip(id),
  FOREIGN KEY (id_ram) REFERENCES ram(id),
  FOREIGN KEY (id_rom) REFERENCES rom(id),
  FOREIGN KEY (id_pin) REFERENCES pin(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE san_pham_giam_gia(
id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
id_chi_tiet_san_pham UNIQUEIDENTIFIER null,
id_khuyen_mai UNIQUEIDENTIFIER null,
tinh_trang int DEFAULT 0,
mo_ta NVARCHAR(MAX) NULL,
FOREIGN KEY (id_chi_tiet_san_pham) REFERENCES chi_tiet_san_pham(id),
  FOREIGN KEY (id_khuyen_mai) REFERENCES khuyen_mai(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE imei (
  id UNIQUEIDENTIFIER PRIMARY KEY  DEFAULT NEWID() NOT NULL,
  id_chi_tiet_san_pham UNIQUEIDENTIFIER NULL,
  ma VARCHAR(30) NULL,
  so_imei VARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang INT DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL,
  FOREIGN KEY (id_chi_tiet_san_pham) REFERENCES chi_tiet_san_pham(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE chuc_vu (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ten NVARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE nhan_vien (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ho_ten NVARCHAR(50) NULL,
  gioi_tinh BIT DEFAULT 1,
  url_anh VARCHAR(255) NULL,
  email VARCHAR(255) NULL,
  sdt VARCHAR(30) null,
  que_quan NVARCHAR(255) NULL,
  ngay_sinh DATE NULL,
  can_cuoc_con_dan VARCHAR(30) null,
  tai_khoan VARCHAR(50) NOT NULL,
  mat_khau VARCHAR(255) NOT NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang INT DEFAULT 0,
  id_chuc_vu UNIQUEIDENTIFIER NULL,
  FOREIGN KEY (id_chuc_vu) REFERENCES chuc_vu(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE hang_khach_hang (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ten NVARCHAR(50) NULL,
  diem_toi_thieu int DEFAULT 0,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE khach_hang (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  ho_ten NVARCHAR(50) NULL,
  gioi_tinh BIT DEFAULT 1,
  email VARCHAR(255) NULL,
  sdt VARCHAR(30) null,
  ngay_sinh DATE NULL,
  tai_khoan VARCHAR(50) NOT NULL,
  mat_khau VARCHAR(255) NOT NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang INT DEFAULT 0,
  diem int DEFAULT 0,
  id_hang_khach_hang UNIQUEIDENTIFIER NULL,
  FOREIGN KEY (id_hang_khach_hang) REFERENCES hang_khach_hang(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE dia_chi (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  dia_chi NVARCHAR(50) NULL,
  quan NVARCHAR(55) NULL,
  huyen NVARCHAR(50) null,
  thanh_pho NVARCHAR(50) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang INT DEFAULT 0,
  id_khach_hang UNIQUEIDENTIFIER NULL,
  mo_ta NVARCHAR(MAX) NULL,
  FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE muc_quy_doi (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  so_diem int DEFAULT 0,
  so_tien decimal(20, 0) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  ghi_chu NVARCHAR(MAX) NULL
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE quy_doi (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  diem_quy_doi int DEFAULT 0,
  so_tien_quy_doi decimal(20, 0) NULL,
  id_khach_hang UNIQUEIDENTIFIER NULL,
  id_muc_quy_doi UNIQUEIDENTIFIER NULL,
  tinh_trang int DEFAULT 0,
  ghi_chu NVARCHAR(MAX) NULL,
  FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
  FOREIGN KEY (id_muc_quy_doi) REFERENCES muc_quy_doi(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE hoa_don (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  ma VARCHAR(30) NULL,
  id_khach_hang UNIQUEIDENTIFIER NULL,
  id_nhan_vien UNIQUEIDENTIFIER NULL,
  id_dia_chi UNIQUEIDENTIFIER NULL,
  id_quy_doi UNIQUEIDENTIFIER NULL,
  sdt VARCHAR(30) null,
  tinh_trang int DEFAULT 0,
  tong_tien decimal(20, 0) NULL,
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  ngay_nhan DATE NULL,
  ngay_ship DATE NULL,
  ghi_chu NVARCHAR(MAX) NULL,
  FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
  FOREIGN KEY (id_nhan_vien) REFERENCES Nhan_vien(id),
  FOREIGN KEY (id_dia_chi) REFERENCES dia_chi(id),
  FOREIGN KEY (id_quy_doi) REFERENCES quy_doi(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE hoa_don_chi_tiet (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  id_hoa_don UNIQUEIDENTIFIER NULL,
  id_imei UNIQUEIDENTIFIER NULL,
  so_luong int DEFAULT 0,
  tinh_trang int DEFAULT 0,
  don_gia decimal(20, 0) NULL,
  FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id),
  FOREIGN KEY (id_imei) REFERENCES imei(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE nhat_ky (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  diem_da_dung int DEFAULT 0,
  diem_cong_them int DEFAULT 0,
  diem_hien_co int DEFAULT 0,
  ngay_dung DATE NULL,
  id_khach_hang UNIQUEIDENTIFIER NULL,
  id_quy_doi UNIQUEIDENTIFIER NULL,
  id_hoa_don UNIQUEIDENTIFIER NULL,
  tinh_trang int DEFAULT 0,
  FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
  FOREIGN KEY (id_quy_doi) REFERENCES quy_doi(id),
  FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE phieu_bao_hanh(
 id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
 ma VARCHAR(30) NULL,
 id_khach_hang UNIQUEIDENTIFIER NULL,
 id_imei UNIQUEIDENTIFIER NULL,
 id_nhan_vien UNIQUEIDENTIFIER NULL,
 ngay_bao_hanh Date NOT NULL,
 noi_dung NVARCHAR(MAX) NULL,
 FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
 FOREIGN KEY (id_imei) REFERENCES imei(id),
 FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE doi_tra(
 id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
 ma VARCHAR(30) NULL,
 id_khach_hang UNIQUEIDENTIFIER NULL,
 id_hoa_don UNIQUEIDENTIFIER NULL,
 id_nhan_vien UNIQUEIDENTIFIER NULL,
 ngay_doi_tra Date DEFAULT GETDATE(),
 ngay_hoan_tra Date NULL,
 ly_do_doi_tra NVARCHAR(MAX) NULL,
 tien_doi_tra decimal(20, 0) NULL,
 tinh_trang int DEFAULT 0,
 FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
 FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id),
 FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE gio_hang(
id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
ma VARCHAR(30) NULL,
ngay_tao DATE DEFAULT GETDATE(),
tinh_trang int DEFAULT 0,
id_khach_hang UNIQUEIDENTIFIER NULL,
 FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE gio_hang_chi_tiet (
  id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
  id_gio_hang UNIQUEIDENTIFIER NULL,
  id_chi_tiet_san_pham UNIQUEIDENTIFIER null,
  so_luong int DEFAULT 0,
  tinh_trang int DEFAULT 0,
  don_gia decimal(20, 0) NULL,
  don_gia_khi_giam decimal(20, 0) NULL,
  FOREIGN KEY (id_gio_hang) REFERENCES gio_hang(id),
  FOREIGN KEY (id_chi_tiet_san_pham) REFERENCES chi_tiet_san_pham(id)
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE danh_gia(
id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
id_chi_tiet_san_pham UNIQUEIDENTIFIER null,
id_khach_hang UNIQUEIDENTIFIER NULL,
ghi_chu NVARCHAR(MAX) NULL,
FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
FOREIGN KEY (id_chi_tiet_san_pham) REFERENCES chi_tiet_san_pham(id)
);
INSERT INTO anh (ma, ten, url_anh1, url_anh2, url_anh3, tinh_trang, mo_ta)
VALUES 
('A001', 'Imagem 1', 'url_da_imagem1', 'url_da_imagem2', 'url_da_imagem3', 0, 'Descrição da imagem 1'),
('A002', 'Imagem 2', 'url_da_imagem4', 'url_da_imagem5', 'url_da_imagem6', 0, 'Descrição da imagem 2'),
('A003', 'Imagem 3', 'url_da_imagem7', 'url_da_imagem8', 'url_da_imagem9', 0, 'Descrição da imagem 3'),
('A004', 'Imagem 4', 'url_da_imagem10', 'url_da_imagem11', 'url_da_imagem12', 0, 'Descrição da imagem 4'),
('A005', 'Imagem 5', 'url_da_imagem13', 'url_da_imagem14', 'url_da_imagem15', 0, 'Descrição da imagem 5');

  INSERT INTO hang_dien_thoai (ma, ten, ngay_cap_nhat, tinh_trang, mo_ta)
VALUES 
  ('HD001', 'Samsung', '2022-01-01', 1, N'Hãng điện thoại Samsung'),
  ('HD002', 'Apple', '2022-01-02', 1, N'Hãng điện thoại Apple'),
  ('HD003', 'Xiaomi', '2022-01-03', 1, N'Hãng điện thoại Xiaomi'),
  ('HD004', 'OPPO', '2022-01-04', 1, N'Hãng điện thoại OPPO'),
  ('HD005', 'Huawei', '2022-01-05', 1, N'Hãng điện thoại Huawei');



  INSERT INTO mau_sac (ma, ten, ngay_cap_nhat, tinh_trang, mo_ta)
VALUES 
  ('M001', 'Đen', '2022-01-01', 1, N'Màu đen'),
  ('M002', 'Trắng', '2022-01-02', 1, N'Màu trắng'),
  ('M003', 'Xanh', '2022-01-03', 1, N'Màu xanh'),
  ('M004', 'Đỏ', '2022-01-04', 1, N'Màu đỏ'),
  ('M005', 'Vàng', '2022-01-05', 1, N'Màu vàng');

  INSERT INTO hang_khach_hang (ma, ten, diem_toi_thieu, ngay_cap_nhat, tinh_trang, mo_ta)
VALUES 
  ('KH001', 'Khách hàng A', 100, '2022-01-01', 1, N'Khách hàng loại A'),
  ('KH002', 'Khách hàng B', 200, '2022-01-02', 1, N'Khách hàng loại B'),
  ('KH003', 'Khách hàng C', 300, '2022-01-03', 1, N'Khách hàng loại C'),
  ('KH004', 'Khách hàng D', 400, '2022-01-04', 1, N'Khách hàng loại D'),
  ('KH005', 'Khách hàng E', 500, '2022-01-05', 1, N'Khách hàng loại E');


  INSERT INTO chuc_vu (ma, ten, ngay_cap_nhat, mo_ta)
VALUES 
('CV001', 'Nhân viên', '2022-01-01', 'Mô tả chức vụ nhân viên'),
('CV002', 'Trưởng phòng', '2022-02-15', 'Mô tả chức vụ trưởng phòng'),
('CV003', 'Giám đốc', '2022-03-10', 'Mô tả chức vụ giám đốc'),
('CV004', 'Kế toán', '2022-04-20', 'Mô tả chức vụ kế toán'),
('CV005', 'Quản lý dự án', '2022-05-05', 'Mô tả chức vụ quản lý dự án');


INSERT INTO muc_quy_doi (so_diem, so_tien, ghi_chu)
VALUES 
(100, 500000, N'Mức quy đổi số điểm thành số tiền 1'),
(200, 800000, N'Mức quy đổi số điểm thành số tiền 2'),
(300, 1200000, N'Mức quy đổi số điểm thành số tiền 3'),
(400, 1500000, N'Mức quy đổi số điểm thành số tiền 4'),
(500, 2000000, N'Mức quy đổi số điểm thành số tiền 5');


INSERT INTO ram (ma, dung_luong, ngay_cap_nhat, tinh_trang, mo_ta)
VALUES
('RAM001', '8GB', '2021-10-10', 1, N'Ram 8GB'),
('RAM002', '16GB', '2021-10-12', 1, N'Ram 16GB'),
('RAM003', '32GB', NULL, 0, N'Ram 32GB không có ngày cập nhật'),
('RAM004', '8GB', '2021-10-15', 1, NULL),
('RAM005', '64GB', '2021-10-20', 1, N'Ram 64GB');



INSERT INTO dung_luong_pin (ma, thong_so, ngay_cap_nhat, tinh_trang, mo_ta)
VALUES
('DL001', '5000mAh', '2021-10-10', 1, N'Dung lượng pin 5000mAh'),
('DL002', '4000mAh', '2021-10-12', 1, N'Dung lượng pin 4000mAh'),
('DL003', '6000mAh', NULL, 0, N'Dung lượng pin 6000mAh không có ngày cập nhật'),
('DL004', '4500mAh', '2021-10-15', 1, NULL),
('DL005', '5500mAh', '2021-10-20', 1, N'Dung lượng pin 5500mAh');


INSERT INTO chip (ma, ten, ngay_tao, ngay_cap_nhat, tinh_trang, mo_ta) VALUES

 ('CP001', 'Chip A', '2022-01-01', NULL, 0, N'Đang chờ cập nhật thông tin.'),
 ('CP002', 'Chip B', '2022-02-15', '2022-02-17', 1, N'Chip B đã được cập nhật vào ngày 17/02/2022.'),
 ('CP003', 'Chip C', '2022-03-10', '2022-03-12', 1, N'Chip C đã được cập nhật lần cuối vào ngày 12/03/2022.'),
 ('CP004', 'Chip D', '2022-04-20', '2022-04-22', 1, N'Chip D đã được cập nhật vào ngày 22/04/2022.'),
('CP005', 'Chip E', '2022-05-01', NULL, 0, N'Đang chờ cập nhật thông tin.');


INSERT INTO rom (ma, dung_luong, ngay_cap_nhat, tinh_trang, mo_ta)
VALUES 
  ('ROM001', '16GB', '2022-01-01', 1, N'Romeo và Juliet'),
  ('ROM002', '32GB', '2022-02-02', 0, N'Giai điệu bất tử'),
  ('ROM003', '64GB', '2022-03-03', 1, N'Đắc nhân tâm'),
  ('ROM004', '128GB', '2022-04-04', 1, N'Tôi thấy hoa vàng trên cỏ xanh'),
  ('ROM005', '256GB', '2022-05-05', 0, N'Sherlock Holmes');

INSERT INTO khuyen_mai (ma, ten, ngay_bat_dau, ngay_ket_thuc, loai_giam_gia,hinh_thuc_giam_gia, so_tien_giam, tinh_trang, mo_ta)
VALUES 
('KM001', 'Khuyến mãi 1', '2022-01-01', '2022-01-31', 'Phần trăm', N'Giảm giá phần trăm', 10, 0, 'Giảm giá 10% cho tất cả sản phẩm'),
('KM002', 'Khuyến mãi 2', '2022-02-01', '2022-02-28', 'Số tiền', N'Giảm giá cố định', 50000, 0, 'Giảm giá 50,000 VND cho sản phẩm A'),
('KM003', 'Khuyến mãi 3', '2022-03-01', '2022-03-31', 'Phần trăm', N'Giảm giá  phần trăm', 20, 0, 'Giảm giá 20% cho sản phẩm B'),
('KM004', 'Khuyến mãi 4', '2022-04-01', '2022-04-30', 'Số tiền', N'Giảm giá   cố định 1', 100000, 0, 'Giảm giá 100,000 VND cho sản phẩm C'),
('KM005', 'Khuyến mãi 5', '2022-05-01', '2022-05-31', 'Số tiền', N'Giảm giá cố định', 200000, 0, 'Giảm giá 200,000 VND cho sản phẩm D');

INSERT INTO camera (ma, thong_so, tinh_trang, mo_ta)
VALUES 
('C001', 'Thông số camera 1', 0, 'Mô tả camera 1'),
('C002', 'Thông số camera 2', 0, 'Mô tả camera 2'),
('C003', 'Thông số camera 3', 0, 'Mô tả camera 3'),
('C004', 'Thông số camera 4', 0, 'Mô tả camera 4'),
('C005', 'Thông số camera 5', 0, 'Mô tả camera 5');


INSERT INTO man_hinh (ma, thong_so, ngay_cap_nhat, mo_ta)
VALUES 
  ('MH001', N'Độ phân giải Full HD', '2022-01-10', N'Màn hình có độ phân giải Full HD.'),
  ('MH002', N'Độ phân giải 4K', '2022-02-15', N'Màn hình có độ phân giải 4K.'),
  ('MH003', N'Độ phân giải QHD', '2022-03-20', N'Màn hình có độ phân giải QHD.'),
  ('MH004', N'Độ phân giải HD', '2022-04-25', N'Màn hình có độ phân giải HD.'),
  ('MH005', N'Độ phân giải 8K', '2022-05-30', N'Màn hình có độ phân giải 8K.');