package com.example.demo.service;

import com.example.demo.Model.ChiTietSanPham;
import com.example.demo.Model.ChucVu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.UUID;

public interface ChucVuService {

    Page<ChucVu> getAll(Pageable pageable);

    void add(ChucVu chucVu);

    void update(ChucVu chucVu);

    void delete(UUID id);

    ChucVu getById(UUID id);
}
