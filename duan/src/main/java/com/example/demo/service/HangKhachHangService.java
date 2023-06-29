package com.example.demo.service;

import com.example.demo.Model.HangKhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface HangKhachHangService {
    Page<HangKhachHang> getAllByPages(Pageable pageable);
    List<HangKhachHang> getAllHKH();
    HangKhachHang getOne(UUID id);
    void addOrUpdate(HangKhachHang hangKhachHang);
    void remove(UUID id);
}
