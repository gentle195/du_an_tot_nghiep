package com.example.demo.service;

import com.example.demo.Model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface KhachHangService {
    Page<KhachHang> getAllByPages(Pageable pageable);
    List<KhachHang> getAllKH();
    KhachHang getOne(UUID id);
    void addOrUpdate(KhachHang khachHang);
    void remove(UUID id);
}
