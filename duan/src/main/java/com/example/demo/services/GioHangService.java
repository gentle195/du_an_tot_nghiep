package com.example.demo.services;

import com.example.demo.models.GioHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface GioHangService {
    public Page<GioHang> getAll(Pageable pageable);

    public List<GioHang> findAll();

    public GioHang findById(UUID id);

    public GioHang add(GioHang gioHang);

    public GioHang update(UUID id, GioHang gioHang);

    public Boolean delete(UUID id);
}


