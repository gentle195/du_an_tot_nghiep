package com.example.demo.Service;

import com.example.demo.Model.ChiTietSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ChiTietSanPhamService {
    public Page<ChiTietSanPham> getAll(Pageable pageable);

    public List<ChiTietSanPham> findAll();

    public ChiTietSanPham findById(UUID id);

    public ChiTietSanPham add(ChiTietSanPham chiTietSanPham);

    public ChiTietSanPham update(UUID id, ChiTietSanPham chiTietSanPham);

    public Boolean delete(UUID id);
}


