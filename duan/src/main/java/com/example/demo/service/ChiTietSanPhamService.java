package com.example.demo.service;

import com.example.demo.Model.ChiTietSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ChiTietSanPhamService {
    Page<ChiTietSanPham> getAllByPages(Pageable pageable);
    List<ChiTietSanPham> getAllCTSP();
    ChiTietSanPham getOne(UUID id);
    void addOrUpdate(ChiTietSanPham chiTietSanPham);
    void remove(UUID id);

}
