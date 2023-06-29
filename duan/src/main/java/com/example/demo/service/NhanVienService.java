package com.example.demo.service;

import com.example.demo.Model.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.UUID;

public interface NhanVienService {

    Page<NhanVien> getAll(Pageable pageable);

    void add(NhanVien nhanVien);

    void update(NhanVien nhanVien);

    void delete(UUID id);

    NhanVien getById(UUID id);
}
