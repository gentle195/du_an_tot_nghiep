package com.example.demo.repository;

import com.example.demo.Model.HangKhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface HangKhachHangRepository extends JpaRepository<HangKhachHang, UUID> {
}