package com.example.demo.service;

import com.example.demo.Model.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface SanPhamService {
    public List<SanPham> getAlll();
    public Page<SanPham> getAll(Pageable pageable);
    public SanPham getOne(UUID id);
    public void addvsupdate(SanPham sp);
    public void delete(UUID id);
}
