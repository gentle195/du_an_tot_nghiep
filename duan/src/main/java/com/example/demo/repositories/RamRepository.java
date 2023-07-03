package com.example.demo.repositories;

import com.example.demo.models.Ram;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface RamRepository extends JpaRepository<Ram, UUID> {
    @Query("select r from Ram r where r.tinhTrang=0")
    List<Ram> getAll0();
}
