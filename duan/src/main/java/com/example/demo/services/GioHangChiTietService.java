package com.example.demo.services;

import com.example.demo.models.GioHangChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface GioHangChiTietService {
    public Page<GioHangChiTiet> getAll(Pageable pageable);

    public List<GioHangChiTiet> findAll();

    public GioHangChiTiet findById(UUID id);

    public GioHangChiTiet add(GioHangChiTiet gioHangChiTiet);

    public GioHangChiTiet update(UUID id, GioHangChiTiet gioHangChiTiet);

    public Boolean delete(UUID id);
}


