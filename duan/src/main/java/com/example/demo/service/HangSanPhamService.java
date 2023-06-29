package com.example.demo.service;

import com.example.demo.Model.HangSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface HangSanPhamService {
    public List<HangSanPham> getAlll();
    public Page<HangSanPham> getAll(Pageable pageable);
    public HangSanPham getOne(UUID id);
    public void  AddandUpdate(HangSanPham hangSanPham);
    public void delete(UUID id);
}
