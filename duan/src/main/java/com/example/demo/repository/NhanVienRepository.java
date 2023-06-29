package com.example.demo.repository;

import com.example.demo.Model.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface NhanVienRepository extends JpaRepository<NhanVien, UUID> {
}
