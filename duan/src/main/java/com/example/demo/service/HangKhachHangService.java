package com.example.demo.Service;

import com.example.demo.Model.HangKhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface HangKhachHangService {
    public Page<HangKhachHang> getAll(Pageable pageable);

    public List<HangKhachHang> findAll();

    public HangKhachHang findById(UUID id);

    public HangKhachHang add(HangKhachHang hangKhachHang);

    public HangKhachHang update(UUID id, HangKhachHang hangKhachHang);

    public Boolean delete(UUID id);
}


