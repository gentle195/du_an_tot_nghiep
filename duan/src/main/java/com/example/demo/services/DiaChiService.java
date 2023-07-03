package com.example.demo.services;

import com.example.demo.models.DiaChi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface DiaChiService {
    public Page<DiaChi> getAll(Pageable pageable);

    public List<DiaChi> findAll();
    public List<DiaChi> getAll0();

    public DiaChi findById(UUID id);

    public DiaChi add(DiaChi diaChi);

    public DiaChi update(UUID id, DiaChi diaChi);

    public Boolean delete(UUID id);
}


