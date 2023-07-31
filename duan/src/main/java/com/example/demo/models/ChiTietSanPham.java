package com.example.demo.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "chi_tiet_san_pham")
public class ChiTietSanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id")
    private UUID id;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "url_anh")
    private String urlAnh;

    @NotNull(message = "Không để trống thông tin")
    @Column(name = "gia_nhap")
    private BigDecimal giaNhap;

    @NotNull(message = "Không để trống thông tin")
    @Column(name = "gia_ban")
    private BigDecimal giaBan;

    @CreationTimestamp
    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @Column(name = "tinh_trang")
    private int tinhTrang;

    @NotNull(message = "Không để trống thông tin")
    @Column(name = "nam_bao_hanh")
    private int namBaoHanh;

    @NotNull(message = "Không để trống thông tin")
    @Column(name = "so_luong_ton")
    private int soLuong;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "mo_ta")
    private String moTa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_chip")
    private Chip chip;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_ram")
    private Ram ram;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_rom")
    private Rom rom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_pin")
    private Pin pin;

}
