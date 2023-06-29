package com.example.demo.service;


import com.example.demo.Model.KhuyenMai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface KhuyenMaiService {
    Page<KhuyenMai> getAllByPages(Pageable pageable);
    List<KhuyenMai> getAllKhuyenMai();
   KhuyenMai getOne(UUID id);
    void addOrUpdate(KhuyenMai khuyenMai);
    void remove(UUID id);
}
