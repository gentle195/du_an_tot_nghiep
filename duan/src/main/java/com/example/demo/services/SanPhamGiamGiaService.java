package com.example.demo.services;

import com.example.demo.models.SanPhamGiamGia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface SanPhamGiamGiaService {
    public Page<SanPhamGiamGia> getAll(Pageable pageable);

    public List<SanPhamGiamGia> findAll();

    public SanPhamGiamGia findById(UUID id);

    public SanPhamGiamGia add(SanPhamGiamGia sanPhamGiamGia);

    public SanPhamGiamGia update(UUID id, SanPhamGiamGia sanPhamGiamGia);

    public Boolean delete(UUID id);
}


