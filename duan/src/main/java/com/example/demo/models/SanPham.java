package com.example.demo.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "san_pham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id")
    private UUID id;

    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "Không để trống thông tin")
    @Size(min = 4, message = "Tên phải lớn hơn hoặc bằng 6 kí tự")
    @Column(name = "ten")
    private String ten;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "he_dieu_hanh")
    private String heDieuHanh;

    @NotNull(message = "Không để trống thông tin")
    @Column(name = "so_sim")
    private int soSim;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "bluetooth")
    private String bluetooth;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ho_tro_mang")
    private String hoTroMang;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "cong_giao_tiep")
    private String congGiaoTiep;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "thong_so_wifi")
    private String thongSoWifi;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "kich_thuoc")
    private String kichThuoc;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "trong_luong")
    private String trongLuong;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "chat_lieu")
    private String chatLieu;

    @CreationTimestamp
    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @Column(name = "tinh_trang")
    private int tinhTrang;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "mo_ta")
    private String moTa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_hang")
    private HangSanPham hangSanPham;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "id_anh")
//    private Anh anh;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_man_hinh")
    private ManHinh manHinh;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_camera")
    private Camera camera;
}

