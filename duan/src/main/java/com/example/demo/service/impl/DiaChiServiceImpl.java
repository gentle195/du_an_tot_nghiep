package com.example.demo.service.impl;

import com.example.demo.Model.DiaChi;
import com.example.demo.repository.DiaChiRepository;
import com.example.demo.repository.DiaChiRepository;
import com.example.demo.service.DiaChiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DiaChiServiceImpl implements DiaChiService {
    @Autowired
    DiaChiRepository diaChi;


    @Override
    public Page<DiaChi> getAllByPages(Pageable pageable) {
        return diaChi.findAll(pageable);
    }

    @Override
    public List<DiaChi> getAllDC() {
        return diaChi.findAll();
    }

    @Override
    public DiaChi getOne(UUID id) {
        return diaChi.findById(id).get();
    }

    @Override
    public void addOrUpdate(DiaChi hangKhachHang) {
        diaChi.save(hangKhachHang);
    }

    @Override
    public void remove(UUID id) {
        diaChi.deleteById(id);
    }
}
