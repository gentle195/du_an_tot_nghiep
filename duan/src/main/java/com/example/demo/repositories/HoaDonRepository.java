package com.example.demo.repositories;

import com.example.demo.models.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, UUID> {
//    @Query("select hd.ma,hd.khachHang.hoTen from HoaDon hd left join HoaDonChiTiet hdct on ")
//    List<HoaDon> find();
}
