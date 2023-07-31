package com.example.demo.repositories;

import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.IMEI;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, UUID> {
    @Query("select i from HoaDonChiTiet hdct left join HoaDon hd on hdct.hoaDon.id=hd.id left join IMEI i on hdct.imei.id=i.id " +
            "left join ChiTietSanPham ct on i.chiTietSanPham.id=ct.id where ct.id=: id or hd.id=: id")
    Page<HoaDonChiTiet> getHoaDonChiTiet(Pageable pageable, UUID id);

    @Query("select hdct from HoaDonChiTiet hdct left join HoaDon hd on hdct.hoaDon.id=hd.id where hd.id=:id")
    List<HoaDonChiTiet> getHoaDonChiTiet(UUID id);
}
