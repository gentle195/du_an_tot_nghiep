package com.example.demo.services;

import com.example.demo.models.DanhGia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface DanhGiaService {
    public Page<DanhGia> getAll(Pageable pageable);

    public List<DanhGia> findAll();

    public DanhGia findById(UUID id);

    public DanhGia add(DanhGia danhGia);

    public DanhGia update(UUID id, DanhGia danhGia);

    public Boolean delete(UUID id);
}


