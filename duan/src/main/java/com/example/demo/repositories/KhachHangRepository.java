package com.example.demo.repositories;

import com.example.demo.models.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, UUID> {
    @Query("select kh from KhachHang kh  where kh.tinhTrang=0")
    List<KhachHang> getall0();
}
