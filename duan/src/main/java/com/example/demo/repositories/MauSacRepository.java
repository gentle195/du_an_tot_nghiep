package com.example.demo.repositories;

import com.example.demo.models.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface MauSacRepository extends JpaRepository<MauSac, UUID> {
    @Query("select ms from MauSac ms  where ms.tinhTrang=0")
    List<MauSac> getAll0();
}
