package com.example.demo.repositories;

import com.example.demo.models.ChiTietSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChiTietSanPhamRepository extends JpaRepository<ChiTietSanPham, UUID> {
    @Query("select ct from ChiTietSanPham ct left join SanPham sp on ct.sanPham.id=sp.id " +
            "left join HangSanPham hang on sp.hangSanPham.id=hang.id left join Ram ram on ct.ram.id=ram.id" +
            " left join Rom rom on ct.rom.id=rom.id left join Pin pin on ct.pin.id=pin.id left join MauSac ms on ct.mauSac.id=ms.id " +
            "left join Chip chip on ct.chip.id=chip.id where" +
            " sp.ten like %:ten% or hang.ten like %:ten% or ram.dungLuong like %:ten% or rom.dungLuong like %:ten% " +
            "or pin.loaiPin like %:ten% or ms.ten like %:ten% or chip.ten like %:ten%")
    List<ChiTietSanPham> search(String ten);

    @Query("select ct from ChiTietSanPham ct left join SanPham sp on ct.sanPham.id=sp.id " +
            "left join HangSanPham hang on sp.hangSanPham.id=hang.id left join Ram ram on ct.ram.id=ram.id " +
            "left join Rom rom on ct.rom.id=rom.id left join Pin pin on ct.pin.id=pin.id " +
            "left join MauSac ms on ct.mauSac.id=ms.id left join Chip chip on ct.chip.id=chip.id " +
            "left join DungLuongPin dungLuong on pin.dungLuongPin.id=dungLuong.id " +
            "left  join ManHinh manHinh on sp.manHinh.id=manHinh.id " +
            "left join Camera  cam on sp.camera.id=cam.id " +
            "where" +
            " (:idHang is null or hang.id =:idHang) " +
            "and (:idRam is null or ram.id=: idRam) " +
            "and (:idRom is null or rom.id=: idRom) " +
            "and (:idDLPin is null or dungLuong.id=: idDLPin) " +
            "and (:idChip is null or chip.id=: idChip) " +
            "and (:moTaMan is null or manHinh.id =:moTaMan) " +
            "and (:moTaCam is null or cam.id =:moTaCam) "
//            +"and (:giaBanMin is null and :giaBanMax is null or ct.giaBan between :giaBanMin and :giaBanMax)"
    )
    List<ChiTietSanPham> loc(UUID idHang, UUID idRam, UUID idRom, UUID idDLPin, UUID idChip, UUID moTaMan, UUID moTaCam);

    @Query("select ct from ChiTietSanPham ct left join IMEI  i on ct.id=i.chiTietSanPham.id where i.id=:id")
    ChiTietSanPham getChiTiet(UUID id);

    @Query("select ct from ChiTietSanPham ct left join IMEI  i on ct.id=i.chiTietSanPham.id left join HoaDonChiTiet hd on i.id=hd.imei.id where i.id=:id")
    ChiTietSanPham getChiTiet2(UUID id);
}
