package com.example.demo.repositories;

import com.example.demo.models.IMEI;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface IMEIRepository extends JpaRepository<IMEI, UUID> {
    @Query("select i from IMEI i left join ChiTietSanPham ct on i.chiTietSanPham.id=ct.id where ct.id=: id")
    List<IMEI> getIMEI(UUID id);
}
