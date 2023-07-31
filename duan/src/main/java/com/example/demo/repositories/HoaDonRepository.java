package com.example.demo.repositories;

import com.example.demo.models.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, UUID> {
    @Query("select hd from HoaDon hd where hd.tinhTrang=0")
    List<HoaDon> find();

    @Transactional
    @Modifying
    @Query("update HoaDon hd set hd.tinhTrang=:tinhTrang,hd.ngayCapNhat =:ngayCapNhat where hd.id=:id")
    void update(UUID id, int tinhTrang, Date ngayCapNhat);

}
