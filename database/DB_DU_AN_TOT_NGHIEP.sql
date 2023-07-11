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
  ngay_tao DATE DEFAULT GETDATE(),
  ngay_cap_nhat DATE NULL,
  tinh_trang int DEFAULT 0,
  mo_ta NVARCHAR(MAX) NULL
);

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
  FOREIGN KEY (id_dia_chi) REFERENCES quy_doi(id),
  FOREIGN KEY (id_quy_doi) REFERENCES dia_chi(id)
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
