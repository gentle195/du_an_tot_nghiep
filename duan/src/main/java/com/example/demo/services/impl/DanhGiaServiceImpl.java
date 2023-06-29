package com.example.demo.services.impl;

import com.example.demo.models.DanhGia;
import com.example.demo.repositories.DanhGiaRepository;
import com.example.demo.services.DanhGiaService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class DanhGiaServiceImpl implements DanhGiaService {

    @Autowired
    DanhGiaRepository danhGiaRepository;


    @Override
    public Page<DanhGia> getAll(Pageable pageable) {
        return danhGiaRepository.findAll(pageable);
    }

    @Override
    public List<DanhGia> findAll() {
        return danhGiaRepository.findAll();
    }

    @Override
    public DanhGia findById(UUID id) {
        return danhGiaRepository.findById(id).orElse(null);
    }

    @Override
    public DanhGia add(DanhGia danhGia) {
        return danhGiaRepository.save(danhGia);
    }

    @Override
    public DanhGia update(UUID id, DanhGia danhGia) {
        if (id != null) {
            DanhGia danhGiaUpdate = danhGiaRepository.findById(id).orElse(null);
            if (danhGiaUpdate != null) {
                BeanUtils.copyProperties(danhGia, danhGiaUpdate);
                danhGiaRepository.save(danhGiaUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            DanhGia danhGia = danhGiaRepository.findById(id).orElse(null);
            if (danhGia != null) {
                danhGiaRepository.delete(danhGia);
                return true;
            }
        }
        return false;
    }
}
