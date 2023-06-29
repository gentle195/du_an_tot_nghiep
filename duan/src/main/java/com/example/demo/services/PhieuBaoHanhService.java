package com.example.demo.services;

import com.example.demo.models.PhieuBaoHanh;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface PhieuBaoHanhService {
    public Page<PhieuBaoHanh> getAll(Pageable pageable);

    public List<PhieuBaoHanh> findAll();

    public PhieuBaoHanh findById(UUID id);

    public PhieuBaoHanh add(PhieuBaoHanh phieuBaoHanh);

    public PhieuBaoHanh update(UUID id, PhieuBaoHanh phieuBaoHanh);

    public Boolean delete(UUID id);
}


