package com.example.demo.repositories;

import com.example.demo.models.KhuyenMai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface KhuyenMaiRepository extends JpaRepository<KhuyenMai, UUID> {
    @Query("select km from KhuyenMai km  where km.tinhTrang=0")
    List<KhuyenMai> getAll0();
}
