package com.example.demo.service;

import com.example.demo.Model.DiaChi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface DiaChiService {
    Page<DiaChi> getAllByPages(Pageable pageable);
    List<DiaChi> getAllDC();
    DiaChi getOne(UUID id);
    void addOrUpdate(DiaChi diaChi);
    void remove(UUID id);
}
