package com.example.demo.repositories;

import com.example.demo.models.HangKhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HangKhachHangRepository extends JpaRepository<HangKhachHang, UUID> {
    @Query("select hkh from HangKhachHang hkh  where hkh.tinhTrang=0")
    List<HangKhachHang> getall0();
}
