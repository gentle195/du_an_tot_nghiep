package com.example.demo.repositories;

import com.example.demo.models.PhieuBaoHanh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface PhieuBaoHanhRepository extends JpaRepository<PhieuBaoHanh, UUID> {
}
