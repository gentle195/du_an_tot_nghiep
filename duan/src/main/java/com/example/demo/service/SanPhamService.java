package com.example.demo.Service;

import com.example.demo.Model.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface SanPhamService {
    public Page<SanPham> getAll(Pageable pageable);

    public List<SanPham> findAll();

    public SanPham findById(UUID id);

    public SanPham add(SanPham sanPham);

    public SanPham update(UUID id, SanPham sanPham);

    public Boolean delete(UUID id);
}


