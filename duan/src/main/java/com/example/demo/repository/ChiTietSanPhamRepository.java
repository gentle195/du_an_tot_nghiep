package com.example.demo.repository;

import com.example.demo.Model.ChiTietSanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ChiTietSanPhamRepository extends JpaRepository<ChiTietSanPham,UUID> {
}
