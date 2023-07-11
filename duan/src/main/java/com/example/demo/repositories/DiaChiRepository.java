package com.example.demo.repositories;

import com.example.demo.models.DiaChi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DiaChiRepository extends JpaRepository<DiaChi, UUID> {
    @Query("select dc from DiaChi dc  where dc.tinhTrang=0")
    List<DiaChi> getall0();
}
