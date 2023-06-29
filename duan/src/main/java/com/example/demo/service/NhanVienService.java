package com.example.demo.Service;

import com.example.demo.Model.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface NhanVienService {
    public Page<NhanVien> getAll(Pageable pageable);

    public List<NhanVien> findAll();

    public NhanVien findById(UUID id);

    public NhanVien add(NhanVien nhanVien);

    public NhanVien update(UUID id, NhanVien nhanVien);

    public Boolean delete(UUID id);
}


