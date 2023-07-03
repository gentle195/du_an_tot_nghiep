package com.example.demo.services;

import com.example.demo.models.HangKhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface HangKhachHangService {
    public Page<HangKhachHang> getAll(Pageable pageable);

    public List<HangKhachHang> findAll();

    public List<HangKhachHang> getALL0();
    public HangKhachHang findById(UUID id);

    public HangKhachHang add(HangKhachHang hangKhachHang);

    public HangKhachHang update(UUID id, HangKhachHang hangKhachHang);

    public Boolean delete(UUID id);
}


