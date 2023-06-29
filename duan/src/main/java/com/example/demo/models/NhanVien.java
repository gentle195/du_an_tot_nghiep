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
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "nhan_vien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id")
    private UUID id;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ho_ten")
    private String hoTen;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "url_anh")
    private String urlAnh;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "gioi_tinh")
    private Boolean gioiTinh;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "email")
    private String email;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "sdt")
    private String sdt;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ngay_sinh")
    private Date ngaySinh;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "can_cuoc_con_dan")
    private String canCuoc;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "tai_khoan")
    private String taiKhoan;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "mat_khau")
    private String matKhau;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ngay_tao")
    private Date ngayTao;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "tinh_trang")
    private int tinhTrang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_chuc_vu")
    private ChucVu chucVu;
}
